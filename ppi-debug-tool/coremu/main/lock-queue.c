/*
 * COREMU Parallel Emulator Framework
 *
 * Interfaces for manipulating interrupts in COREMU. (e.g. interrupt from
 * device to core, and IPI between cores).
 *
 * This implementation uses lock to protect multiple thread doing enqueue.
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

#include <malloc.h>
#include <stdbool.h>
#include <signal.h>
#include <assert.h>

#include "queue.h"
#include "coremu-atomic.h"
#include "coremu-malloc.h"
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

static node_t *new_node(void)
{
    return coremu_mallocz(sizeof(node_t));
}

static void initialize(queue_t *Q)
{
    node_t *node = new_node();  /* Allocate a free node */

    node->next = NULL;

    Q->Head = node;          /* Both Head and Tail point to it */
    Q->Tail = node;
    Q->count = 0;
    CM_SPIN_LOCK_INIT(&Q->t_lock);
}

queue_t *new_queue(void)
{
    queue_t *Q = coremu_mallocz(sizeof(queue_t));

    initialize(Q);

    assert(Q->Head != NULL);
    assert(Q->Tail != NULL);
    assert(Q->Head == Q->Tail);

    return Q;
}

/* The interface for queue with lock */
void enqueue(queue_t *Q, data_type value)
{
    node_t *node = new_node();

    node->value = value;
    node->next = NULL;

    coremu_spin_lock(&Q->t_lock);
    Q->Tail->next = node;
    Q->Tail = node;
    atomic_incq(&Q->count);
    coremu_spin_unlock(&Q->t_lock);
}

bool dequeue(queue_t *Q, data_type *value_p)
{
    node_t *node = Q->Head;
    node_t *new_head = node->next;

    if (!new_head)
        return false;

    *value_p = new_head->value;
    Q->Head = new_head;
    coremu_free(node);
    atomic_decq(&Q->count);
    return true;
}

int64_t queue_get_size(queue_t *Q)
{
    return Q->count;
}

char *queue_version()
{
    return "spinlock based concurrent queue";
}
