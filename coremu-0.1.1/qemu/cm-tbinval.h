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

#ifndef _CM_TBINVAL_H
#define _CM_TBINVAL_H

typedef struct {
    /* List of TBs of this cpu intersecting this ram page */
    TranslationBlock *first_tb;
    /* This lock is used to guarantee the other read and self modify conflict */
    CMSpinLock tb_list_lock;

    /* Use a bitmap to optimize the self modify code */
    uint8_t *code_bitmap;
    CMSpinLock bitmap_lock;
} CMPageDesc;

void cm_init_tb_cnt(ram_addr_t ram_offset, ram_addr_t size);
void cm_phys_add_tb(ram_addr_t addr);
void cm_phys_del_tb(ram_addr_t addr);
uint16_t cm_phys_page_tb_p(ram_addr_t addr);

void cm_invalidate_bitmap(CMPageDesc *p);
void cm_invalidate_tb(target_phys_addr_t start, int len);

void cm_tlb_reset_dirty_range(CPUTLBEntry *tlb_entry, unsigned long start,
                              unsigned long length);

#endif
