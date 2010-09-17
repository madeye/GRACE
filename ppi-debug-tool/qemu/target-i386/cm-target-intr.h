/*
 * COREMU Parallel Emulator Framework
 * Defines qemu related structure and interface for i386 architecture.
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

 /* Interrupt types for i386 architecture */
#ifndef CM_I386_INTR_H
#define CM_I386_INTR_H

#include "cm-intr.h"

enum cm_i386_intr_type {
    PIC_INTR,                   /* Interrupt from i8259 pic */
    APICBUS_INTR,               /* Interrupt from APIC BUS
                                   can be issued by other core or ioapic */
    IPI_INTR,                   /* Interrupt from other core
                                   Only for de-assert INIT and SIPI */
    DIRECT_INTR,                /* Direct interrupt (SMI) */
    SHUTDOWN_REQ,               /* Shut down request */
    TLB_FLUSH_REQ,              /* This kind of request does not exist in real world, 
                                   we do this is just to confirm to Qemu framework */
};


/* Interrupt infomation for i8259 pic */
typedef struct CMPICIntr {
    CMIntr *base;
    int level;                  /* the level of interrupt */
} CMPICIntr;


/* Interrupt information for IOAPIC */
typedef struct CMAPICBusIntr {
    CMIntr *base;
    int mask;                   /* Qemu will use this to check which
                                   kind of interrupt is issued */
    int vector_num;             /* The interrupt vector number
                                   If the vector number is -1, it indicates
                                   the vector information is ignored (SMI, NMI, INIT) */
    int trigger_mode;           /* The trigger mode of interrupt */
} CMAPICBusIntr;


typedef struct CMIPIIntr {
    CMIntr *base;
    int vector_num;             /* The interrupt vector number */
    int deliver_mode;           /* The deliver mode of interrupt 
                                   0: INIT Level De-assert 
                                   1: Start up IPI */
} CMIPIIntr;

typedef struct CMTLBFlushReq {
    CMIntr *base;
} CMTLBFlushReq;

/* The declaration for apic wrapper function */
void cm_apic_set_irq(struct APICState *s, int vector_num, int trigger_mode);
void cm_apic_startup(struct APICState *s, int vector_num);
void cm_apic_setup_arbid(struct APICState *s);

/* The declaration for pic wrapper function */
void cm_pic_irq_request(void *opaque, int irq, int level);

/* The common declaration */
void cm_send_pic_intr(int target, int level);
void cm_send_apicbus_intr(int target, int mask, int vector_num, int
						  trigger_mode);
void cm_send_ipi_intr(int target, int vector_num, int deliver_mode);
void cm_send_tlb_flush_req(int target);
    
void cm_pic_intr_handler(void *opaque);
void cm_apicbus_intr_handler(void *opaque);
void cm_ipi_intr_handler(void *opaque);
void cm_tlb_flush_req_handler(void *opaque);
#endif
