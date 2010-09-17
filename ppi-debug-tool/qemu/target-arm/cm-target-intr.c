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
#include <stdio.h>
#include <stdlib.h>
#include "cpu.h"
#include "../hw/arm-misc.h"
#include "coremu-intr.h"
#include "coremu-malloc.h"
#include "coremu-atomic.h"
#include "coremu-spinlock.h"
#include "cm-intr.h"
#include "cm-target-intr.h"

CMSpinLock cm_hw_lock;
static void cm_gic_intr_handler(void *opaque)
{
    CMGICIntr *gic_intr = (CMGICIntr *) opaque;
    switch (gic_intr->irq_num) {
    case ARM_PIC_CPU_IRQ:
        if (gic_intr->level)
            cpu_interrupt(cpu_single_env, CPU_INTERRUPT_HARD);
        else
            cpu_reset_interrupt(cpu_single_env, CPU_INTERRUPT_HARD);
        break;
    case ARM_PIC_CPU_FIQ:
        if (gic_intr->level)
            cpu_interrupt(cpu_single_env, CPU_INTERRUPT_FIQ);
        else
            cpu_reset_interrupt(cpu_single_env, CPU_INTERRUPT_FIQ);
        break;
    default:
        hw_error("arm_pic_cpu_handler: Bad interrput line %d\n",
                 gic_intr->irq_num);
    }

}

static CMIntr *cm_gic_intr_init(int irq, int level)
{
    CMGICIntr *intr = coremu_mallocz(sizeof(*intr));
    ((CMIntr *)intr)->handler = cm_gic_intr_handler;
    intr->irq_num = irq;
    intr->level = level;
    return (CMIntr *)intr;
}

void cm_arm_pic_cpu_handler(void *opaque, int irq, int level)
{
    CPUState *env = (CPUState *)opaque;
    coremu_send_intr(cm_gic_intr_init(irq, level), env->cpu_index);
}
