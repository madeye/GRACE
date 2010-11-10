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

#ifndef _CM_MMU_H
#define _CM_MMU_H

/* Given the guest virtual address, get the corresponding host address.
 * This macro resembles ldxxx in softmmu_template.h
 * NOTE: This must be inlined since the use of GETPC needs to get the
 * return address. Using always inline also works, we use macro here to be more
 * explicit. */
#define CM_GET_QEMU_ADDR(q_addr, v_addr) \
do {                                                                        \
    int __mmu_idx, __index;                                                 \
    CPUState *__env1 = cpu_single_env;                                      \
    void *__retaddr;                                                        \
    __index = (v_addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);            \
    /* get the CPL, hence determine the MMU mode */                         \
    __mmu_idx = cpu_mmu_index(__env1);                                      \
    /* We use this function in the implementation of atomic instructions */ \
    /* and we are going to modify these memory. So we use addr_write. */    \
    if (unlikely(__env1->tlb_table[__mmu_idx][__index].addr_write           \
                != (v_addr & TARGET_PAGE_MASK))) {                          \
        __retaddr = GETPC();                                                \
        tlb_fill(v_addr, 1, __mmu_idx, __retaddr);                          \
    }                                                                       \
    q_addr = v_addr + __env1->tlb_table[__mmu_idx][__index].addend;         \
} while(0)


#endif /* _CM_MMU_H */
