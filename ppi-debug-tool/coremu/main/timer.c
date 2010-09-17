/*
 * COREMU Parallel Emulator Framework
 *
 * Timer abstraction in COREMU system.
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

#define _GNU_SOURCE

/*#define DEBUG_COREMU*/
#define VERBOSE_COREMU
#define TIMER_PERIODIC_SLEEP      /* sleep sometime instead of busy loop? */

#include "utils.h"
#include "coremu-timer.h"
#include "coremu-malloc.h"

#define sigev_notify_thread_id _sigev_un._tid
#define TIMER_WAIT_TIME    (10)
#define handle_error_en(en, msg)   \
    do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)

int coremu_timer_create(int signo, timer_t *host_timer_ptr)
{
    /* create alarm timer using 'timer_create' */
    struct sigevent ev;
    memset(&ev, 0, sizeof(ev));

    ev.sigev_notify = SIGEV_THREAD_ID;
    ev.sigev_signo = signo;
    ev.sigev_notify_thread_id = coremu_gettid();

    return timer_create(CLOCK_REALTIME, &ev, host_timer_ptr);
}

