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
#ifndef CM_TIMER_H
#define CM_TIMER_H

#include "qemu-common.h"
int cm_init_local_timer_alarm(void);
void cm_mod_local_timer(QEMUTimer * ts, int64_t expire_time);
void cm_del_local_timer(QEMUTimer * ts);
void cm_run_all_local_timers(void);
void cm_local_host_alarm_handler(int host_signum);
int cm_local_alarm_pending(void);
void cm_init_pit_freq(void);
void cm_stop_local_timer(void);
#endif
