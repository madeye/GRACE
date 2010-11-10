/*
 * COREMU Parallel Emulator Framework
 *
 * Basic hardware abstractions for COREMU.
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

#ifndef _COREMU_HW_H
#define _COREMU_HW_H

#include "coremu-types.h"

void coremu_init_hw(int smp_cpus);
void coremu_signal_hw_thr(int signo);
hw_thr_t coremu_get_hw_id(void);
int coremu_hw_thr_p(void);
void coremu_assert_hw_thr(const char *msg);
void coremu_assert_not_hw_thr(const char *msg);

#endif /* _COREMU_HW_H */
