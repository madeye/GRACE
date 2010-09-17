/*
 * COREMU Parallel Emulator Framework
 *
 * Copyright (C) 2010 Parallel Processing Institute (PPI), Fudan Univ.
 *  <http://ppi.fudan.edu.cn/system_research_group>
 *
 * Authors:
 *  Zhaoguo Wang    <zgwang@fudan.edu.cn>
 *  Yufei Chen      <chenyufei@fudan.edu.cn>
 *  Ran Liu         <naruilone@gmail.com>
 *  Xi Wu           <wuxi@fudan.edu.cn>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

/* We include this file in qemu-timer.c qemu_alarm_timer is defined in it, and
 * there's lots of static function there. */
#include "coremu-sched.h"
#include <math.h>
int cm_pit_freq;

static int64_t cm_local_next_deadline(void);
static uint64_t cm_local_next_deadline_dyntick(void);
static void cm_local_dynticks_rearm_timer(struct qemu_alarm_timer *t);
static void cm_qemu_run_local_timers(QEMUClock *clock);

COREMU_THREAD QEMUTimer *cm_local_active_timers;
COREMU_THREAD struct qemu_alarm_timer *cm_local_alarm_timer;
static COREMU_THREAD struct qemu_alarm_timer cm_local_alarm_timers[] = {
    {"dynticks", dynticks_start_timer,
     dynticks_stop_timer, cm_local_dynticks_rearm_timer, NULL},
    {NULL,}
};

void cm_init_pit_freq(void)
{
    double v_num = coremu_get_targetcpu();
    double p_num = coremu_get_hostcpu();
    double p_root = sqrt(p_num) / 4;
    double suggest = p_root * pow(v_num / p_num, p_root);
    int pit_freq_suggest = ceil(suggest);
    cm_pit_freq = 1193182 / pit_freq_suggest;
}

/* Called by each core thread to create a local timer. */
int cm_init_local_timer_alarm(void)
{
    coremu_assert_core_thr();
    /* core thr block the Timer Alarm signal */
    struct qemu_alarm_timer *t = NULL;
    int i, err = -1;

    for (i = 0; cm_local_alarm_timers[i].name; i++) {
        t = &cm_local_alarm_timers[i];
        if (!t)
            return 0;
        err = t->start(t);
        if (!err)
            break;
    }

    if (err) {
        err = -ENOENT;
        goto fail;
    }

    /* first event is at time 0 */
    t->pending = 1;
    cm_local_alarm_timer = t;

    return 0;

fail:
    return err;
}

/* Mode the local virtual timer for core.
   Because for x86_64, there is only one timer for every core
   so there is no need to do the link list.
*/
void cm_mod_local_timer(QEMUTimer *ts, int64_t expire_time)
{
    QEMUTimer **pt, *t;

    cm_del_local_timer(ts);

    /* add the timer in the sorted list */
    /* NOTE: this code must be signal safe because
       qemu_timer_expired() can be called from a signal. */
    pt = &cm_local_active_timers;
    for (;;) {
        t = *pt;
        if (!t)
            break;
        if (t->expire_time > expire_time)
            break;
        pt = &t->next;
    }
    ts->expire_time = expire_time;
    ts->next = *pt;
    *pt = ts;

    /* Rearm if necessary  */
    if (pt == &cm_local_active_timers) {
        if (!cm_local_alarm_timer->pending) {
            qemu_rearm_alarm_timer(cm_local_alarm_timer);
        }
    }
}

void cm_del_local_timer(QEMUTimer *ts)
{
    QEMUTimer **pt, *t;

    /* NOTE: this code must be signal safe because
       qemu_timer_expired() can be called from a signal. */
    pt = &cm_local_active_timers;
    for (;;) {
        t = *pt;
        if (!t)
            break;
        if (t == ts) {
            *pt = t->next;
            break;
        }
        pt = &t->next;
    }
}

int cm_local_alarm_pending(void)
{
    return cm_local_alarm_timer->pending;
}

void cm_run_all_local_timers(void)
{
    cm_local_alarm_timer->pending = 0;

    /* rearm timer, if not periodic */
    if (cm_local_alarm_timer->expired) {
        cm_local_alarm_timer->expired = 0;
        qemu_rearm_alarm_timer(cm_local_alarm_timer);
    }

    if (vm_running) {
        cm_qemu_run_local_timers(vm_clock);
    }
}

void cm_local_host_alarm_handler(int host_signum)
{
    coremu_assert_core_thr();

    struct qemu_alarm_timer *t = cm_local_alarm_timer;
    if (!t)
        return;

    if (alarm_has_dynticks(t) ||
        qemu_timer_expired(cm_local_active_timers, qemu_get_clock(vm_clock))) {
        t->expired = alarm_has_dynticks(t);
        t->pending = 1;
        cm_notify_event();
    }
}

static void cm_qemu_run_local_timers(QEMUClock *clock)
{
    QEMUTimer **ptimer_head, *ts;
    int64_t current_time;

    if (!clock->enabled)
        return;

    current_time = qemu_get_clock(clock);
    ptimer_head = &cm_local_active_timers;
    for (;;) {
        ts = *ptimer_head;
        if (!ts || ts->expire_time > current_time)
            break;
        /* remove timer from the list before calling the callback */
        *ptimer_head = ts->next;
        ts->next = NULL;

        /* run the callback (the timer list can be modified) */
        ts->cb(ts->opaque);
    }
}

static void cm_local_dynticks_rearm_timer(struct qemu_alarm_timer *t)
{
    timer_t host_timer = (timer_t)(long)t->priv;
    struct itimerspec timeout;
    int64_t nearest_delta_us = INT64_MAX;
    int64_t current_us;

    assert(alarm_has_dynticks(t));
    if (!cm_local_active_timers)
        return;

    nearest_delta_us = cm_local_next_deadline_dyntick();

    /* check whether a timer is already running */
    if (timer_gettime(host_timer, &timeout)) {
        perror("gettime");
        fprintf(stderr, "Internal timer error: aborting\n");
        exit(1);
    }
    current_us =
        timeout.it_value.tv_sec * 1000000 + timeout.it_value.tv_nsec / 1000;
    if (current_us && current_us <= nearest_delta_us)
        return;

    timeout.it_interval.tv_sec = 0;
    timeout.it_interval.tv_nsec = 0;    /* 0 for one-shot timer */
    timeout.it_value.tv_sec = nearest_delta_us / 1000000;
    timeout.it_value.tv_nsec = (nearest_delta_us % 1000000) * 1000;
    if (timer_settime(host_timer, 0 /* RELATIVE */, &timeout, NULL)) {
        perror("settime");
        fprintf(stderr, "Internal timer error: aborting\n");
        exit(1);
    }
}

static uint64_t cm_local_next_deadline_dyntick(void)
{
    int64_t delta;

    delta = (cm_local_next_deadline() + 999) / 1000;

    if (delta < MIN_TIMER_REARM_US)
        delta = MIN_TIMER_REARM_US;

    return delta;
}

static int64_t cm_local_next_deadline(void)
{
    /* To avoid problems with overflow limit this to 2^32.  */
    int64_t delta = INT32_MAX;

    if (cm_local_active_timers) {
        delta = cm_local_active_timers->expire_time - qemu_get_clock(vm_clock);
    }

    if (delta < 0)
        delta = 0;

    return delta;
}

void cm_stop_local_timer(void)
{
    cm_local_alarm_timer->stop(cm_local_alarm_timer);
}
