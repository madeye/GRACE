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

/* Include coremu-config.h before including this file to choose the
 * implementation of the queue. */

#include <stdint.h>
#include <stdbool.h>

typedef unsigned long data_type;
typedef struct queue_t queue_t;

queue_t *new_queue(void);
void destroy_queue(queue_t *Q);
void enqueue(queue_t *Q, data_type value);
bool dequeue(queue_t *Q, data_type *value_p);
int64_t queue_get_size(queue_t *Q);
char *queue_version(void);

/* In order to provide iteration abstraction for queue, move the struct
 * definition here.  This is abstraction leakage, but I can't find other way to
 * do this if I want to use macro. (Function pointers are slow.) */

/* Note that dequeue an element which is being iterated will cause problem,
 * because dequeue will free the element. */

#ifdef COREMU_LOCKFREE

struct node_t;
typedef struct pointer_s {
    struct node_t *ptr;      /* lower order: (node_t *) */
    uint64_t count;          /* higher order: unsigned integer */
} pointer_t;

typedef struct node_t {
    pointer_t next;          /* the next node, together with the tag */
    data_type value;         /* an integer which can hold a pointer */
} node_t;

struct queue_t {
    pointer_t Head;          /* head of the queue */
    pointer_t Tail;          /* tail of the queue */
    int64_t count;           /* count the number of elements */
};

#define QUEUE_FOREACH(queue, val, command) \
    do { \
        node_t *_p; \
        data_type *val; \
        for (_p = queue->Head.ptr->next.ptr; _p != NULL; _p = _p->next.ptr) { \
            val = &(_p->value); \
            { command; }; \
        } \
    } while (0)

#else /* COREMU_LOCKFREE */

#include "coremu-spinlock.h"

typedef struct node_t {
    struct node_t *next;     /* the next node, together with the tag */
    data_type value;         /* an integer which can hold a pointer */
} node_t;

struct queue_t {
    node_t *Head;            /* head of the queue */
    node_t *Tail;            /* tail of the queue */
    uint64_t count;
    CMSpinLock t_lock;
};

#define QUEUE_FOREACH(queue, val, command) \
    do { \
        node_t *_p; \
        data_type *val; \
        for (_p = queue->Head->next; _p != NULL; _p = _p->next) { \
            val = &_p->value; \
            { command; }; \
        } \
    } while (0)

#endif /* COREMU_LOCKFREE */

#endif
