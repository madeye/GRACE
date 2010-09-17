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

#ifndef _COREMU_INIT_H
#define _COREMU_INIT_H

extern __thread unsigned long int cm_retry_num;
/**
 * Init the whole COREMU library for multicore
 * system emulation.
 *
 * @smp_cpus: number of cores.
 * @msg_fn: COREMU signal handler in guest
 *          system emulator. */
void coremu_init(int smp_cpus);

/**
 * Whether COREMU has started all the cores to run. */
int coremu_init_done_p(void);

/**
 * Core threads wait until the COREMU intialization
 * has done...  */
void coremu_wait_init(void);

#endif /* _COREMU_INIT_H */

