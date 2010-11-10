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
#include <stdint.h>
#include <assert.h>

#include "cm-instrument.h"
enum {
    GETCPUEIP = 0,
    GETCPUIDX,
    GETSTACKPAGEADDR,
    DUMPSTACK,
    RECORDDUMPSTACK,
    INSTRUMENT_FUNC_NUM,
};

uint64_t instr_func_pa[INSTRUMENT_FUNC_NUM];
void cm_register_instrument_func(uint32_t func_id, uint64_t func_p)
{
   //assert(func_id >= 0);
   //assert(func_id < INSTRUMENT_FUNC_NUM);
   instr_func_pa[func_id] = func_p;
}

uint64_t cm_get_cpu_eip(void)
{
    //assert(instr_func_pa[GETCPUEIP]);
    return ((uint64_t (*) (void))instr_func_pa[GETCPUEIP])();
}

int cm_get_cpu_idx(void)
{
    //assert(instr_func_pa[GETCPUIDX]);
    return ((int (*) (void))instr_func_pa[GETCPUIDX])();
}

uint64_t cm_get_stack_page_addr(void)
{
    //assert(instr_func_pa[GETSTACKPAGEADDR]);
    return ((uint64_t (*) (void))instr_func_pa[GETSTACKPAGEADDR])();
}

void cm_record_dumpstack(FILE *logfile, void *paddr)
{
    //assert(instr_func_pa[RECORDDUMPSTACK]);
    ((void (*) (FILE *, void *))instr_func_pa[RECORDDUMPSTACK])(logfile, paddr);
}

void cm_dump_stack(int level, CMLogbuf *buf)
{
    //assert(instr_func_pa[DUMPSTACK]);
    ((void (*) (int, CMLogbuf*))instr_func_pa[DUMPSTACK])(level, buf);
}

