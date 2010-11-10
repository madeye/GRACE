/*
 * COREMU Parallel Emulator Framework
 *
 * Utils for cwatcher.
 *
 * Copyright (C) 2010 Parallel Processing Institute, Fudan Univ.
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

#include <dlfcn.h>
#include "exec.h"
#include "coremu-core.h"
#include "cm-mmu.h"
#include "cm-features/logbuffer.h"
#include "cm-features/instrument.h"
#include "cm-features/watch-util.h"

#define DEBUG_COREMU
#include "coremu-debug.h"

enum {
    GETCPUEIP = 0,
    GETCPUIDX,
    GETSTACKPAGEADDR,
    DUMPSTACK,
    RECORDDUMPSTACK,
    INSTRUMENT_FUNC_NUM,
};

static void(* cm_register_instrument_func_p)(uint64_t, uint64_t);

void cm_record_dumpstack(FILE *file, void *paddr)
{
    static int state = 1;
    long addr = *(long *)paddr;

    /* state 1 means the start of a new backtrace*/
    if (addr == -1) {
        state = 1;
        return;
    }

    switch (state) {
    case 0:
        fprintf(file, "\t%p\n", (void *)addr);
        break;
    case 1:
        fprintf(file, "%p\n", (void *)addr);
        state = 0;
        break;
    }
}

/* TODO: what information is needed in each util function. */

#define USER_TOP 0x00007fffffffffff
void cm_dump_stack(int level, CMLogbuf *buf)
{
    target_ulong ebp = EBP;
    target_ulong qaddr; /* Address in qemu. */
    target_ulong retaddr;
    int i;

    /* Use -1 to mark the start of a backtrace. */
    CM_LOGBUF_LOG(buf, pos, *(long *) pos = -1);
    CM_LOGBUF_LOG(buf, pos, *(long *) pos = EIP);
    /*coremu_core_log("Backtrace at rip: %p\n", (void *)env->eip);*/
    for (i = 0; i < level && ebp; i++) {
        /* XXX Are we calling this in helper function? If so, this function
         * needs to be inlined. */
        CM_GET_QEMU_ADDR(qaddr, ebp); /* Get the address pointed by ebp. */

        retaddr = *((target_ulong *)(qaddr) + 1);

        CM_LOGBUF_LOG(buf, pos, {
            *(target_ulong *) pos = retaddr;
        });
        ebp = *(target_ulong *)qaddr;
        /* XXX Just handle kernel backtrace now. */
        if (ebp > USER_TOP)
            return;
    }
}

target_ulong cm_get_cpu_eip(void)
{
    if (cpu_single_env->current_tb)
        return cpu_single_env->current_tb->pc;
    return cpu_single_env->eip;
}

int cm_get_cpu_idx(void)
{
    return cpu_single_env->cpu_index;
}

target_ulong cm_get_stack_page_addr(void)
{
    return (ESP & (TARGET_PAGE_MASK));
}

void cm_instrument_init(void *handle)
{
    //cm_trigger_handle = dlopen("./usertrigger.so", RTLD_LAZY);
    cm_register_instrument_func_p = dlsym(handle, "cm_register_instrument_func");
    cm_register_instrument_func_p(GETCPUEIP, (uint64_t)cm_get_cpu_eip);
    cm_register_instrument_func_p(GETCPUIDX, (uint64_t)cm_get_cpu_idx);
    cm_register_instrument_func_p(GETSTACKPAGEADDR, (uint64_t)cm_get_stack_page_addr);
    cm_register_instrument_func_p(DUMPSTACK, (uint64_t)cm_dump_stack);
    cm_register_instrument_func_p(RECORDDUMPSTACK, (uint64_t)cm_record_dumpstack);

}

