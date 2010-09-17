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

#ifndef _CORE_H
#define _CORE_H

#include "coremu-core.h"
#include "coremu-hw.h"

extern int cm_smp_cpus;
extern CMCore *cm_cores;
extern COREMU_THREAD CMCore *cm_core_self;

/* Return the specified core object. */
static inline CMCore *coremu_get_core(int coreid)
{
    return &cm_cores[coreid];
}

/* Return the core data for the core itself. */
static inline CMCore *coremu_get_core_self(void)
{
    coremu_assert_core_thr();
    if (cm_core_self == NULL) {
        CMCore *core;
        for (core = cm_cores; core < cm_cores + cm_smp_cpus; core++) {
            if (core->thread == pthread_self()) {
                cm_core_self = core;
                break;
            }
        }
    }
    return cm_core_self;
}

#endif /* _CORE_H */
