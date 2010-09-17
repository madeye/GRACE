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
#include <assert.h>
#include "coremu-malloc.h"
#include "coremu-atomic.h"
#include "coremu-hw.h"

static uint16_t *cm_phys_tb_cnt;

extern void cm_inject_invalidate_code(TranslationBlock *tb);
static int cm_invalidate_other(int cpu_id, target_phys_addr_t start, int len);

void cm_init_tb_cnt(ram_addr_t ram_offset, ram_addr_t size)
{
    coremu_assert_hw_thr("cm_init_bt_cnt should only called by hw thr");

    cm_phys_tb_cnt = coremu_realloc(cm_phys_tb_cnt,
                                    ((ram_offset +
                                      size) >> TARGET_PAGE_BITS) *
                                    sizeof(uint16_t));
    memset(cm_phys_tb_cnt + (ram_offset >> TARGET_PAGE_BITS), 0x0,
           (size >> TARGET_PAGE_BITS) * sizeof(uint16_t));
}

void cm_phys_add_tb(ram_addr_t addr)
{
    atomic_incw(&cm_phys_tb_cnt[addr >> TARGET_PAGE_BITS]);
}

void cm_phys_del_tb(ram_addr_t addr)
{
    assert(cm_phys_tb_cnt[addr >> TARGET_PAGE_BITS]);
    atomic_decw(&cm_phys_tb_cnt[addr >> TARGET_PAGE_BITS]);
}

uint16_t cm_phys_page_tb_p(ram_addr_t addr)
{
    return cm_phys_tb_cnt[addr >> TARGET_PAGE_BITS];
}

void cm_invalidate_bitmap(CMPageDesc *p)
{
    /* Get the bitmap lock */
    coremu_spin_lock(&p->bitmap_lock);

    if (p->code_bitmap) {
        coremu_free(p->code_bitmap);
        p->code_bitmap = NULL;
    }

    /* Unlock the bitmap lock */
    coremu_spin_unlock(&p->bitmap_lock);

}

void cm_invalidate_tb(target_phys_addr_t start, int len)
{
    int count = tb_phys_invalidate_count;
    if (!coremu_hw_thr_p()) {
        tb_invalidate_phys_page_fast(start, len);
        count = tb_phys_invalidate_count - count;
    }

    if ((!cm_phys_page_tb_p(start)) || (cm_phys_page_tb_p(start) == count))
        goto done;

#ifdef COREMU_CMC_SUPPORT
    /* XXX: not finish need Lazy invalidate here! */
    int have_done = count;
    int cpu_idx = 0;
    for (cpu_idx = 0; cpu_idx < coremu_get_targetcpu(); cpu_idx++) {
        if ((!coremu_hw_thr_p()) && cpu_idx == cpu_single_env->cpuid_apic_id)
            continue;
        have_done += cm_invalidate_other(cpu_idx, start, len);
        if (have_done > cm_phys_page_tb_p(start))
            break;
    }
#endif

done:
    return;
}

void cm_tlb_reset_dirty_range(CPUTLBEntry *tlb_entry,
                              unsigned long start, unsigned long length)
{
    unsigned long addr, old, addend;
    old = tlb_entry->addr_write;
    addend = tlb_entry->addend;

    if ((old & ~TARGET_PAGE_MASK) == IO_MEM_RAM) {
        addr = (old & TARGET_PAGE_MASK) + addend;
        if ((addr - start) < length) {
            uint64_t newv = (tlb_entry->addr_write & TARGET_PAGE_MASK) |
                TLB_NOTDIRTY;
            atomic_compare_exchangeq(&tlb_entry->addr_write, old, newv);
        }
    }
}

/* Try to Lazy invalidate the TB of CPU[cpu_id]
 * return 1: successful find and invalidate TB of CPU[cpu_id]
 *        0: dosn't exist
 */
static int cm_lazy_invalidate_tb(TranslationBlock *tbs,
                                 target_phys_addr_t start, int len)
{
    int n, ret = 0;
    TranslationBlock *tb_next;
    TranslationBlock *tb = tbs;

    target_phys_addr_t end = start + len;
    target_ulong tb_start, tb_end;

    while (tb != NULL) {
        n = (long)tb & 3;
        tb = (TranslationBlock *)((long)tb & ~3);
        tb_next = tb->page_next[n];
        /* NOTE: this is subtle as a TB may span two physical pages */
        if (n == 0) {
            /* NOTE: tb_end may be after the end of the page, but
               it is not a problem */
            tb_start = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
            tb_end = tb_start + tb->size;
        } else {
            tb_start = tb->page_addr[1];
            tb_end = tb_start + ((tb->pc + tb->size) & ~TARGET_PAGE_MASK);
        }
        if (!(tb_end <= start || tb_start >= end)) {

            /* change the code cache of the tb */
            cm_inject_invalidate_code(tb);
            ret = 1;
        }
        tb = tb_next;
    }

    return ret;
}


/* Try to invalidate the TB of CPU[cpu_id]
 * return 1: successful find and invalidate TB of CPU[cpu_id]
 *        0: dosn't exist
 */
static int cm_invalidate_other(int cpu_id, target_phys_addr_t start, int len)
{
    /* Find if exit any TB intersect with start -- start+len */
    PageDesc *p = page_find(start >> TARGET_PAGE_BITS);
    if (!p)
        return 0;

    int offset, b;
    uint8_t *bit_map;
    int need_invalidate = 1;
    int ret = 0;

    coremu_spin_lock(&p->cpu_tbs[cpu_id].bitmap_lock);
    bit_map = p->cpu_tbs[cpu_id].code_bitmap;
    if (bit_map) {
        offset = start & ~TARGET_PAGE_MASK;
        b = bit_map[offset >> 3] >> (offset & 7);
        if (!(b & ((1 << len) - 1)))
            need_invalidate = 0;
    }
    coremu_spin_unlock(&p->cpu_tbs[cpu_id].bitmap_lock);

    if (need_invalidate) {
        coremu_spin_lock(&p->cpu_tbs[cpu_id].tb_list_lock);
        //find the code ptr
        ret = cm_lazy_invalidate_tb(p->cpu_tbs[cpu_id].first_tb, start, len);
        coremu_spin_unlock(&p->cpu_tbs[cpu_id].tb_list_lock);
        //change the code here
    }

    return ret;
}
