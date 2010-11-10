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

/*
 * This file is an example to assist to fix a bug in linux-2.6.20
 * Trigger functions can be defined by programmer and will be invoked
 * when the memory location watched by programmer is accessed.
 */

/*
 * The declaration of log entry type
 */
#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include "cm-instrument.h"
#include "cm-logbuffer.h"
#include "cm-watch-util.h"

typedef struct kernel_bug_info {
    uint64_t vnum;      /* The infomation number */
    uint64_t eip;       /* The eip of the memory access instruction */
    uint64_t stack;     /* The page address of the current stack */
    uint64_t vaddr;     /* The virtual address of the accessed memory location */
    int write;          /* The memory location is accessed by read or write */
    int cpu;            /* The cpu accessed the memory location */
} kernel_bug_info;

/*
 * A buffer need to be defined which is used to log the information.
 * Every vcpu has its own buffer, so it need to be thread local.
 */
static __thread CMLogbuf *kernel_log_buf;

/* The trigger function ID */
#define TRIGGER_FUNC_ID 0 

static inline void atomic_xaddq(uint64_t *inc, uint64_t *dist)
{
    __asm__ __volatile__(
            "lock; xaddq %0, %1"
            : "+Q"(*inc), "+m"(*dist)
            :
            : "memory","cc");
}

/*
 * The log recoding function.
 * This function type must be void XXX(FILE *log_file, void *opaque)
 * log_file: the file discriptor of the current cpu's log file.
 * opaque: the infomation recorded in the buffer.
 */
static void kernel_record_log(FILE *log_file, void *opaque)
{
    kernel_bug_info *info = (kernel_bug_info *)opaque;
    fprintf(log_file, "[%016ld] WRITE[%d] VADDR[0x%lx] EIP[0x%lx] Process[0x%lx] CPU[%d]\n",
            info->vnum, info->write , info->vaddr, info->eip, info->stack, info->cpu);
}


/*
 * The trigger function provided by the user.
 * This function will be called by COREMU when any watched memory location
 * is accessed. 
 * The access infomation will be passed by COREMU.
 */
static void kernel_trigger_function(void *opaque)
{
    /* Get the currrent access sequence number */
    static target_ulong inc = 0;
    target_ulong version_num = 1;
    atomic_xaddq((uint64_t *)&version_num, (uint64_t *)&inc);
    
    CMWParams *wpara = (CMWParams *)opaque;
    
    if (wpara->value == 0) {
        CM_LOGBUF_LOG(kernel_log_buf, record, {
            kernel_bug_info * info = (kernel_bug_info *)record;
            info->vnum = version_num;
            info->eip = cm_get_cpu_eip();
            info->cpu = cm_get_cpu_idx();
            info->stack = cm_get_stack_page_addr();
            info->vaddr = wpara->vaddr;
            info->write = wpara->is_write;
        });
    }
    
}

/*
 * Three interfaces need to be provided by the user which will be invoked
 * by COREMU in the debug mode.
 * The three interfaces are: 
 *     trigger_init
 *     log_buffer_init
 *     log_buffer_flush
 */

/*
 * Do the basic initialization.
 * This function will be call by COREMU.
 * For example: register the trigger function with a trigger function ID.
 */  
void trigger_init(void)
{
    cm_register_wtrigger_func(TRIGGER_FUNC_ID, kernel_trigger_function);
}

/*
 * Initial the kernel_log_buf for every CPU.
 * A log file and record function need to be binded with this buffer.
 * COREMU will call the record function when the buffer is full.
 */
void log_buffer_init(void)
{
    /* XXX: initail the log buffer here */
    char cpu_log_name[100];
    sprintf(cpu_log_name, "kernel_bug_log%d", cm_get_cpu_idx());
    FILE *file = fopen(cpu_log_name,"w");
    kernel_log_buf = cm_logbuf_new(100, sizeof(kernel_bug_info),
                                        kernel_record_log, file);
}

/*
 * Flush the kernel_log_buf.
 * This function will be called when the debug mode is turned off.
 */
void log_buffer_flush(void)
{
   /* XXX: Flush the log buffer here */
   cm_logbuf_flush(kernel_log_buf);
   cm_logbuf_wait_flush(kernel_log_buf);
   fflush(kernel_log_buf->file);
} 
