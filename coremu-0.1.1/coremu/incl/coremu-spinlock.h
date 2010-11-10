/*
 * COREMU Parallel Emulator Framework
 *
 * This spinlock implementation is from qemu.
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

#ifndef _COREMU_SPINLOCK_H
#define _COREMU_SPINLOCK_H

typedef struct {
    volatile int lock;
} CMSpinLock;

#define SPINLOCK_ATTR static __inline __attribute__((always_inline, no_instrument_function))

SPINLOCK_ATTR int __testandset(CMSpinLock *p)
{
    int readval = 0;

    __asm__ __volatile__ (
			"lock; cmpxchgl %2, %0"
			: "+m" (p->lock), "+a" (readval)
			: "r" (1)
			: "cc");
    return readval;
}

SPINLOCK_ATTR void coremu_spin_lock(CMSpinLock *lock)
{
    while (__testandset(lock));
}

SPINLOCK_ATTR void coremu_spin_unlock(CMSpinLock *s)
{
    s->lock = 0;
}

#define CM_SPIN_LOCK_INIT(l) coremu_spin_unlock(l)

#endif /* _COREMU_SPINLOCK_H */
