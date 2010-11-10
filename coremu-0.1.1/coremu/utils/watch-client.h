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
#ifndef __WATCH_CLIENT
#define __WATCH_CLIENT

#define inline __attribute__ (( always_inline )) __inline__

typedef long CMWatchID;
enum {
    WATCH_START = 0,
    WATCH_STOP,
    WATCH_INSERT,
    WATCH_REMOVE,
    WATCH_STOP_ALL,
};

void inline cm_insert_watch_point(CMWatchID id, unsigned long addr, unsigned long len)
{
    __asm__ __volatile__( "int $0x86"
                          :
                          : "a"(WATCH_INSERT), "D"(id), "S"(addr), "d"(len)
                          : "cc");
}

void inline cm_remove_watch_point(CMWatchID id, unsigned long addr, unsigned long len)
{
    __asm__ __volatile__( "int $0x86"
                          :
                          : "a"(WATCH_REMOVE), "D"(id), "S"(addr), "d"(len)
                          : "cc");
}

void inline cm_start_watch(void)
{
    __asm__ __volatile__( "int $0x86"
                          :
                          : "a"(WATCH_START)
                          : "cc");
}

void inline cm_stop_watch(void)
{
    __asm__ __volatile__( "int $0x86"
                          :
                          : "a"(WATCH_STOP)
                          : "cc");
}

void inline cm_stop_all_watch(void)
{
    __asm__ __volatile__( "int $0x86"
                          :
                          : "a"(WATCH_STOP_ALL)
                          : "cc");
}
#endif
