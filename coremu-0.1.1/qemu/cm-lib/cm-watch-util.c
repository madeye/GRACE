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
#include <assert.h>
#include "cm-watch-util.h"

enum {
    REGISTER_WTRIGGER = 0,
    PRINT_WPARA,
    TRIGGER_UTIL_NUM,
};

uint64_t trigger_util_pa[TRIGGER_UTIL_NUM];
void cm_register_wtrigger_util(uint64_t func_id, uint64_t func_p)
{
    //assert(func_id >= 0);
    //assert(func_id < TRIGGER_UTIL_NUM);
    trigger_util_pa[func_id] = func_p;
}

void cm_register_wtrigger_func(CMTriggerID id, CMWatch_Trigger tfunc)
{
    //assert(trigger_util_pa[REGISTER_WTRIGGER]);
    ((void (*)(CMTriggerID, CMWatch_Trigger))trigger_util_pa[REGISTER_WTRIGGER])(id, tfunc);
}

void print_wpara(CMWParams *wpara)
{
    //assert(trigger_util_pa[PRINT_WPARA]);
    ((void (*)(CMWParams *))trigger_util_pa[PRINT_WPARA])(wpara);
}