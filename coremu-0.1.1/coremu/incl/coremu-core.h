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

#ifndef _COREMU_CORE_H
#define _COREMU_CORE_H

#define COREMU_HLT_TICK   100     /* virtual core sleeps 1 second if HLT executed */

#include "coremu-types.h"

/* Init a core in COREMU. Basically, coremu core contains
 * a emulator specific data opaque. */
void coremu_core_init(int id, void *opaque);

/* Run all cores with THR_FN as the start function.
 * The thread function will be passed the opaque object when calling
 * coremu_core_init. */
void coremu_run_all_cores(thr_start_routine thr_fn);

/* assert the cur thr is a core thr
 * i.e. its  coremu core object is not nil */
void coremu_assert_core_thr(void);

/* Exit current core with return value pointer VALUE_PTR.
 * NOTE: the calling thread must NOT be hw thread...  */
void coremu_core_exit(void *value_ptr);

void coremu_pause_core(void);

void coremu_restart_all_cores(void);

void coremu_wait_pause(CMCore *core);

void coremu_wait_all_cores_pause(void);

/* Wait on a specfic core until it exits... */
int coremu_wait_tid(CMCore *coreid, void **val_ptr);

#endif /* _COREMU_CORE_H */
