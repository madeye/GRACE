/*
 * COREMU Parallel Emulator Framework
 * The definition of interrupt related interface for i386
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
#ifndef CM_ARM_INTR_H
#define CM_ARM_INTR_H
#include "cm-intr.h"
#include "coremu-spinlock.h"

typedef struct CMGICIntr {
    CMIntr *base;
    int irq_num;
    int level;
} CMGICIntr;

extern CMSpinLock cm_hw_lock;
void cm_arm_pic_cpu_handler(void *opaque, int irq, int level);

#endif
