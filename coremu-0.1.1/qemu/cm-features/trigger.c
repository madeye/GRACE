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
#include <dlfcn.h>

#include "cm-features/watch.h"
#include "cm-features/watch-util.h"
#include "cm-features/logbuffer.h"
#include "cm-features/instrument.h"
#include "coremu-atomic.h"

static const char *trigger_so_name = "./usertrigger.so";
void *cm_trigger_handle;

void cm_wtrigger_buf_init(void)
{   
    void (*log_buf_init_p) (void);

    if (!cm_trigger_handle) {
        fprintf(stderr, "%s\n", dlerror());
        printf("COREMU WARNING: No trigger dynamic link file is found.\n");
        return;
    }
    log_buf_init_p = dlsym(cm_trigger_handle, "log_buffer_init");
    log_buf_init_p();
}

void cm_wtrigger_buf_flush(void)
{
    void (*log_buf_flush_p) (void);

    if (!cm_trigger_handle) {
        fprintf(stderr, "%s\n", dlerror());
        printf("COREMU WARNING: No trigger dynamic link file is found.\n");
        return;
    }
    log_buf_flush_p = dlsym(cm_trigger_handle, "log_buffer_flush");
    assert(log_buf_flush_p);
    log_buf_flush_p();
}

void cm_wtrigger_init(void)
{
    void (*trigger_init_p) (void);
    
    /* Open the trigger lib here */
    cm_trigger_handle = dlopen(trigger_so_name, RTLD_LAZY);
    if (!cm_trigger_handle) {
        fprintf(stderr, "%s\n", dlerror());
        printf("COREMU WARNING: No trigger dynamic link file is found.\n");
        return;
    }
    dlerror();

    cm_watch_util_init(cm_trigger_handle);
    cm_instrument_init(cm_trigger_handle);
    cm_logbuf_init(cm_trigger_handle);
    trigger_init_p = dlsym(cm_trigger_handle, "trigger_init");
    if(!trigger_init_p)
        printf("trigger_init_p is NULL\n");
    trigger_init_p();
}

