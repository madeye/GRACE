/*
 * COREMU Parallel Emulator Framework
 * The definition of core thread function
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

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "cpu.h"
#include "cpus.h"

#include "coremu-intr.h"
#include "coremu-debug.h"
#include "coremu-sched.h"
#include "coremu-types.h"
#include "cm-loop.h"
#include "cm-timer.h"
#include "cm-init.h"

static bool cm_tcg_cpu_exec(void);
static bool cm_tcg_cpu_exec(void)
{
    int ret = 0;
    CPUState *env = cpu_single_env;
    struct timespec halt_interval;
    halt_interval.tv_sec = 0;
    halt_interval.tv_nsec = 10000;

    for (;;) {
        if (cm_local_alarm_pending())
            cm_run_all_local_timers();

        coremu_receive_intr();
        if (cm_cpu_can_run(env))
            ret = cpu_exec(env);
        else if (env->stop)
            break;

        if (!cm_vm_can_run())
            break;

        if (ret == EXCP_DEBUG) {
            cm_assert(0, "debug support hasn't been finished\n");
            break;
        }
        if (ret == EXCP_HALTED || ret == EXCP_HLT) {
            coremu_cpu_sched(CM_EVENT_HALTED);
        }
    }
    return ret;
}

void *cm_cpu_loop(void *args)
{
    int ret;

    /* Must initialize cpu_single_env before initializing core thread. */
    assert(args);
    cpu_single_env = (CPUState *)args;

    /* Setup dynamic translator */
    cm_cpu_exec_init_core();

#ifdef PPI_DEBUG_TOOL
    if (!cpu_single_env->trace_mem_ptr) {
        cpu_single_env->debug_info.trace_mem_buf 
            = (struct trace_content *) qemu_malloc (sizeof(struct trace_content) * TRACE_PRIVATE_BUF_SIZE);
        cpu_single_env->trace_mem_ptr = cpu_single_env->debug_info.trace_mem_buf;
        assert(cpu_single_env);
        printf("buffer init: %d\n", sizeof(cpu_single_env->debug_info.trace_mem_buf));
    }
#endif

    for (;;) {
        ret = cm_tcg_cpu_exec();
        if (test_reset_request()) {
            coremu_pause_core();
            continue;
        }
        break;
    }
    cm_stop_local_timer();
#ifdef PPI_DEBUG_TOOL
    if (cpu_single_env->trace_mem_ptr) {
        free(cpu_single_env->debug_info.trace_mem_buf);
        cpu_single_env->trace_mem_ptr = NULL;
        printf("buffer freed\n");
    }
#endif
    coremu_core_exit(NULL);
    assert(0);
}
