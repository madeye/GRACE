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
#ifndef _CM_WATCH_H
#define _CM_WATCH_H

#include <stdint.h>
#include <stdio.h>
#include "cpu.h"
#include "queue.h"
#include "cm-intr.h"
#include "cm-features/watch-util.h"

typedef struct CMWatchAddrRange {
    ram_addr_t   ram_addr_offset;
    target_ulong vaddr;
    target_ulong len;
} CMWatchAddrRange;

typedef struct CMWatchEntry {
    CMWatchAddrRange cm_wrange;
    CMWatch_Trigger cm_wtrigger;
    uint8_t cm_invalidate_flag;
} CMWatchEntry;

typedef struct CMWatchPage {
    queue_t *cm_watch_q;
    target_ulong cnt;
} CMWatchPage;

typedef struct CMWatchReq {
    CMIntr *base;
    CMWatchAddrRange cm_wrange;
    int flag;                   // 1: watch 0 unwatch
} CMWatchReq;

typedef struct CMWatchEndReq {
    CMIntr *base;
} CMWatchEndReq;

enum {
    WATCH_START = 0,
    WATCH_STOP,
    WATCH_INSERT,
    WATCH_REMOVE,
    WATCH_STOP_ALL,
};

void cm_watch_init(ram_addr_t ram_offset, ram_addr_t size);
bool cm_is_watch_addr_p(ram_addr_t addr);
int cm_get_watch_index(void);
void cm_wtrigger_init(void);
void cm_wtrigger_buf_init(void);
void cm_wtrigger_buf_flush(void);
#endif
