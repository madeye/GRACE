/*
 * COREMU Parallel Emulator Framework
 * Defines qemu related structure and interface for hardware interrupt
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
#ifndef CM_INTR_H
#define CM_INTR_H

/* This is the call back function used to handle different type interrupts */
typedef void (*CMIntr_handler)(void *opaque);

/* Base type for all types of interrupt. Subtype of CMIntr should have an
 * object of this struct as its first member. */
typedef struct CMIntr {
    CMIntr_handler handler;
} CMIntr;

void cm_common_intr_handler(CMIntr *opaque);
void cm_notify_event(void);
#endif
