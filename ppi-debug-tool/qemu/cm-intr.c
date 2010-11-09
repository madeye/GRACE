/*
 * COREMU Parallel Emulator Framework
 *
 * The common interface for hardware interrupt sending and handling.
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

#include <stdlib.h>
#include <stdio.h>
#include "cpu.h"

#include "coremu-intr.h"
#include "coremu-core.h"
#include "coremu-malloc.h"
#include "cm-intr.h"

/* The common interface to handle the interrupt, this function should to
   be registered to coremu */
void cm_common_intr_handler(CMIntr *intr)
{
    coremu_assert_core_thr();
    if (!intr)
        return;
    intr->handler(intr);
    coremu_free(intr);
}

/* To notify there is an event coming, what qemu need to do is
   just exit current cpu loop */
void cm_notify_event(void)
{
    if (cpu_single_env)
        cpu_exit(cpu_single_env);
}
