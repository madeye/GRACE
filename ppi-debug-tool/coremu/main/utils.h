/*
 * COREMU Parallel Emulator Framework
 *
 * Utilities that only used in COREMU.
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

#ifndef _UTILS_H
#define _UTILS_H

#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>
#include <errno.h>
#include <time.h>
#include <string.h>
#include <pthread.h>
#include <signal.h>
#include <sys/queue.h>

/* Debugging support */
#include <execinfo.h>

/* OS support */
#include <sys/types.h>
#include <sys/syscall.h>
#include <sys/time.h>
#include <sys/resource.h>

/* libtopology suppport */
#include <topology.h>

#include "sched.h"

#include "coremu-thread.h"
#include "coremu-atomic.h"
#include "coremu-debug.h"

/* ******** Common utilities ******** */
void maketimeout(struct timespec *tsp, long seconds);
int timeval_subtract(struct timeval *result,
                     struct timeval *x, struct timeval *y);
unsigned long read_host_tsc(void);
int coremu_random(int min, int max);
FILE *coremu_fopen(const char *filename, const char *mode);
void coremu_serialize(void);
pid_t coremu_gettid(void);
void coremu_backtrace(void);

#endif /* _UTILS_H */
