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

#ifndef _COREMU_INTR_H
#define _COREMU_INTR_H

/* Send interrupt to the core. */
void coremu_send_intr(void *e, int coreid);

/* event handler will be called by coremu_receive_intr */
typedef void (*event_handler_t)(void *);
void coremu_register_event_handler(event_handler_t fn);
/* Handle all the pending interrupt. */
void coremu_receive_intr(void);

/* event notifer will be called in coremu_cpu_signal_handler */
typedef void (*event_notifier_t)(void);
void coremu_register_event_notifier(event_notifier_t fn);

#endif /* _COREMU_INTR_H */
