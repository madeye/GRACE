/*
 * COREMU Parallel Emulator Framework
 *
 * Concurrent queue interface.
 *
 * Two implementations are provided, based on the paper "Simple, Fast, and
 * Practical Non-Blocking and Blocking Concurrent Queue Algorithms".
 *
 *  ms-queue: lock free version
 *  lock-queue: using spinlock
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

#ifndef _QUEUE_H
#define _QUEUE_H

#include <stdint.h>
#include <stdbool.h>

typedef unsigned long data_type;
typedef struct queue_t queue_t;

queue_t *new_queue(void);
void enqueue(queue_t *Q, data_type value);
bool dequeue(queue_t *Q, data_type *value_p);
int64_t queue_get_size(queue_t *Q);
char *queue_version(void);

#endif
