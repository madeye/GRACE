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

#include <stdlib.h>
#include <string.h>
#include <sys/types.h>

#include "coremu-malloc.h"
#include "coremu-atomic.h"

static inline void *oom_check(void *ptr)
{
    if (ptr == NULL) {
        abort();
    }
    return ptr;
}

void *coremu_malloc(size_t size)
{
    return oom_check(malloc(size));
}

void *coremu_mallocz(size_t size)
{
    void *p = coremu_malloc(size);
    memset(p, 0, size);
    return p;
}

void *coremu_realloc(void *ptr, size_t size)
{
    return oom_check(realloc(ptr, size ? size : 1));
}

void coremu_free(void *ptr)
{
    free(ptr);
}

int coremu_atomic_mallocz(void **pp, size_t size)
{
    uint64_t res;
    void *p = coremu_mallocz(size);
    res = atomic_compare_exchangeq((uint64_t *)pp, (uint64_t)0, (uint64_t)p);
    if (res != (uint64_t)NULL)
        coremu_free(p);

    return res == 0;
}
