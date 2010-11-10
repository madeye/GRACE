/*
 * COREMU Parallel Emulator Framework
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

#include <unistd.h>
#include <stdint.h>
#include <stdio.h>
#include <assert.h>
#include "cm-logbuffer.h"

enum {
    LOGBUF_CREATE = 0,
    LOGBUF_FREE,
    LOGBUF_FLUSH,
    LOGBUF_WAIT_FLUSH,
    LOGBUG_FUNC_NUM,
};

uint64_t logbuf_func_pa[LOGBUG_FUNC_NUM];

void cm_register_logbuf_func(uint64_t func_id, uint64_t func_p)
{
    //assert(func_id >= 0);
    //assert(func_id < LOGBUG_FUNC_NUM);
    logbuf_func_pa[func_id] = func_p;
}

CMLogbuf *cm_logbuf_new(int n, int ele_size, cm_log_func func, FILE *file)
{
    //assert(logbuf_func_pa[LOGBUF_CREATE]);
    return ((CMLogbuf *(*)(int, int, cm_log_func, FILE*))logbuf_func_pa[LOGBUF_CREATE])(n, ele_size, func, file);
}

void cm_logbuf_free(CMLogbuf *buf)
{
    //assert(logbuf_func_pa[LOGBUF_FREE]);
    ((void(*)(CMLogbuf*))logbuf_func_pa[LOGBUF_FREE])(buf);
}

void cm_logbuf_flush(CMLogbuf *buf)
{
    //assert(logbuf_func_pa[LOGBUF_FLUSH]);
    ((void(*)(CMLogbuf*))logbuf_func_pa[LOGBUF_FLUSH])(buf);
}

void cm_logbuf_wait_flush(CMLogbuf *buf)
{
    //assert(logbuf_func_pa[LOGBUF_WAIT_FLUSH]);
    ((void(*)(CMLogbuf*))logbuf_func_pa[LOGBUF_WAIT_FLUSH])(buf);
}
