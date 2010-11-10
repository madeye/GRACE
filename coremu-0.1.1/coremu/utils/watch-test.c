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
#include <stdio.h>
#include "watch-client.h"
int main(void)
{
    int var = 0;
    cm_start_watch();
    printf("&var : 0x%p\n", &var);
    printf("Insert watch point\n");
    cm_insert_watch_point(10, (unsigned long)&var, 100);
    var = 1;
    printf("after write : 0x%x\n", var);
    printf("REMOVE watch point\n");
    cm_remove_watch_point(10, (unsigned long)&var, 100);
    var = 2;
    printf("after write : 0x%x\n", var);
    cm_stop_watch();
    return 0;
}
