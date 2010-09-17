/*
 * COREMU Parallel Emulator Framework
 *
 * Scheduling support for COREMU parallel emulation library
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

#ifndef _COREMU_SCHED_H
#define _COREMU_SCHED_H

/* system headers */
#include <sys/time.h>
#include <sys/resource.h>
#include <sched.h>

#include "coremu-types.h"

#define CM_ENABLE_BIND_CORE

/* bind the vcpu to physical cpu */
/*#define CM_BIND_SAME_CORE*/

/* bind the near vcpus to the same physcal cpu */
/*#define CM_BIND_SAME_CORE2*/

/*#define CM_BIND_SOCKET*/

/* halt method: nanosleep, sched_yield or hybrid */
#define HALT_NANOSLEEP
/*#define HALT_YIELD*/
/*#define HALT_HYBRID*/

/* scheduling states */
#define STATE_CPU        0
#define STATE_IO         1
#define STATE_HALTED     2
#define STATE_CNT        3

/* policies */
#define CM_SCHED_POLICY  (SCHED_OTHER)
#define CM_SCHED_INHERIT (PTHREAD_INHERIT_SCHED)

/* thresholds */
#define CM_NO_IO_LIMIT  5
#define CM_BONUS_IO_CNT 100     /* give bonus for 100 times in STATE_IO */
#define CM_PRIO_CPU_CNT 100
#define CM_HW_IO_CNT    1000    /* give hw high prio if performed many io reqs */

extern int min_prio, max_prio;
extern int low_prio, avg_prio, high_prio;

/* init the scheduling support */
void coremu_init_sched_all(void);
void coremu_init_sched_core(void);

int coremu_get_hostcpu(void);
int coremu_get_targetcpu(void);
int coremu_get_thrs_per_core(void);
int coremu_physical_core_enough_p(void);
int coremu_get_maxprio(void);
int coremu_get_minprio(void);

/* schedule core threads according the core state */
void coremu_cpu_sched(CMSchedEvent e);
#endif /* _COREMU_SCHED_H */

