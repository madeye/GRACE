/*
 * COREMU Parallel Emulator Framework
 *
 * Common states for hw emulation in COREMU
 *
 * Copyright (C) 2010 Parallel Processing Institute (PPI), Fudan Univ.
 *  <http://ppi.fudan.edu.cn/system_research_group>
 *
 * Authors:
 *  Zhaoguo Wang    <zgwang@fudan.edu.cn>
 *  Yufei Chen      <chenyufei@fudan.edu.cn>
 *  Ran Liu         <naruilone@gmail.com>
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

/*#define DEBUG_COREMU*/
#define VERBOSE_COREMU
#define _GNU_SOURCE

#include "utils.h"
#include "coremu-hw.h"
#include "coremu-atomic.h"

static volatile int ioreq_exit = 0; /* flag to exit the ioreq wait */
static hw_thr_t hw_thrid;
static void register_hw_thr(void);

/*  === common tools === */
void coremu_init_hw(int smp_cpus)
{
    register_hw_thr();
}

void coremu_signal_hw_thr(int signo)
{
    pthread_kill(hw_thrid, signo);
}

hw_thr_t coremu_get_hw_id()
{
    return hw_thrid;
}

int coremu_hw_thr_p()
{
    return ((hw_thr_t) pthread_self()
            == hw_thrid);
}

void coremu_assert_hw_thr(const char *msg)
{
    hw_thr_t cur = (hw_thr_t) pthread_self();

    if (hw_thrid != cur) {
        if (msg != NULL)
            printf("[fatal] %s\n", msg);
        assert(0);
    }
}

void coremu_assert_not_hw_thr(const char *msg)
{
    hw_thr_t cur = (hw_thr_t) pthread_self();

    if (hw_thrid == cur) {
        if (msg != NULL)
            printf("[fatal] %s\n", msg);
        assert(0);
    }
}

/* === ioreq_exit flag manipulation === */
int coremu_ioreq_exit_p()
{
    return ioreq_exit;
}

/* -- add one exit request -- */
void coremu_inc_ioreq_exit()
{
    atomic_incl((uint32_t *) &ioreq_exit);
}

/* -- del one exit request -- */
void coremu_dec_ioreq_exit()
{
    atomic_decl((uint32_t *) &ioreq_exit);
}

static void register_hw_thr()
{
    hw_thrid = (hw_thr_t) pthread_self();
}
