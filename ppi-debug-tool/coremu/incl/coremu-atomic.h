/*
 * COREMU Parallel Emulator Framework
 *
 * Atomic support for COREMU system.
 * XXX: Now only support x86-64 architecture.
 *
 * Copyright (C) 2010 Parallel Processing Institute (PPI), Fudan Univ.
 *  <http://ppi.fudan.edu.cn/system_research_group>
 *
 * Authors:
 *  Zhaoguo Wang    <zgwang@fudan.edu.cn>
 *  Yufei Chen      <chenyufei@fudan.edu.cn>
 *  Ran Liu         <naruilone@gmail.com>
 *  Xi Wu           <wuxi@fudan.edu.cn>
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

#ifndef _COREMU_ATOMIC_H
#define _COREMU_ATOMIC_H

#include <stdint.h>

#define DATA_b uint8_t
#define DATA_w uint16_t
#define DATA_l uint32_t
#define DATA_q uint64_t

/************************
 * bit test and set
 ************************/

static inline uint8_t bit_testandset(int *base, int off)
{
    uint8_t readval = 0;

    /* CF <-- Bit(BitBase, BitOffset). */
    __asm__ __volatile__ (
            "lock; btsl %2,%0\n\t"
            "setb %1\n\t"
            : "=m" (*base),"=a" (readval)
            : "Ir" (off)
            : "cc");

    return readval;
}

static inline uint8_t bit_testandreset(int *base, int off)
{
    uint8_t readval = 0;

    /* CF <-- Bit(BitBase, BitOffset). */
    __asm__ __volatile__ (
            "lock; btrl %2,%0\n\t"
            "setb %1\n\t"
            : "=m" (*base),"=a" (readval)
            : "Ir" (off)
            : "cc");

    return readval;
}

static inline uint8_t bit_test(int *base, int off)
{
    uint8_t readval = 0;

    /* CF <-- Bit(BitBase, BitOffset). */
    __asm__ __volatile__ (
            "lock; bt %2,%0\n\t"
            "setb %1\n\t"
            : "=m" (*base),"=a" (readval)
            : "Ir" (off)
            : "cc");

    return readval;
}

/************************
 * exchange
 ************************/

/* swap the value VAL and *p.
 * Return the value swapped out from memory. */

#define GEN_EXCHANGE(type) \
static inline DATA_##type atomic_exchange##type(                \
        DATA_##type *p, DATA_##type val)                        \
{                                                               \
    DATA_##type out;                                            \
    __asm __volatile(                                           \
            "lock; xchg"#type" %1,%2 \n\t"                      \
            : "=a" (out), "+m" (*p)                             \
            : "a" (val)                                         \
            );                                                  \
    return out;                                                 \
}

GEN_EXCHANGE(b);
GEN_EXCHANGE(w);
GEN_EXCHANGE(l);
GEN_EXCHANGE(q);

/************************
 * compare and exchange
 ************************/

/* Atomically compare the value in "p" with "old", and set "p" to "newv"
 * if equal.
 *
 * Return value is the previous value of "p".  So if return value is same
 * as "old", the swap occurred, otherwise it did not. */

#define GEN_CMPEXCHANGE(type) \
static inline DATA_##type atomic_compare_exchange##type(              \
        DATA_##type *p, DATA_##type old, DATA_##type newv)            \
{                                                                     \
    DATA_##type out;                                                  \
    __asm__ __volatile__ (                                            \
            "lock; cmpxchg"#type" %2,%1"                              \
            : "=a" (out), "+m" (*p)                                   \
            : "q" (newv), "0" (old)                                   \
            : "cc");                                                  \
    return out;                                                       \
}

GEN_CMPEXCHANGE(b);
GEN_CMPEXCHANGE(w);
GEN_CMPEXCHANGE(l);
GEN_CMPEXCHANGE(q);

static inline uint8_t atomic_compare_exchange16b(uint64_t *memp,
                                                 uint64_t rax, uint64_t rdx,
                                                 uint64_t rbx, uint64_t rcx)
{
    uint8_t z;
    __asm __volatile__ ( "lock; cmpxchg16b %3\n\t"
                         "setz %2\n\t"
                         : "=a" (rax), "=d" (rdx), "=r" (z), "+m" (*memp)
                         : "a" (rax), "d" (rdx), "b" (rbx), "c" (rcx)
                         : "memory", "cc" );
    return z;
}


/************************
 * atomic inc
 ************************/

#define GEN_INC(type) \
static inline void atomic_inc##type(DATA_##type *p)     \
{                                                       \
    __asm__ __volatile__(                               \
            "lock; inc"#type" %0"                       \
            : "+m" (*p)                                 \
            :                                           \
            : "cc");                                    \
}

GEN_INC(b);
GEN_INC(w);
GEN_INC(l);
GEN_INC(q);

/************************
 * atomic dec
 ************************/

#define GEN_DEC(type) \
static inline void atomic_dec##type(DATA_##type *p)     \
{                                                       \
    __asm__ __volatile__(                               \
            "lock; dec"#type" %0"                       \
            : "+m" (*p)                                 \
            :                                           \
            : "cc");                                    \
}

GEN_DEC(b);
GEN_DEC(w);
GEN_DEC(l);
GEN_DEC(q);

/* Memory Barriers: x86-64 ONLY now */
#define mb()    asm volatile("mfence":::"memory")
#define rmb()   asm volatile("lfence":::"memory")
#define wmb()   asm volatile("sfence" ::: "memory")

#endif /* _COREMU_ATOMIC_H */

