/*
 * COREMU Parallel Emulator Framework
 *
 * This file defines necessary data structures to implement a lock-free FIFO
 * queue using an optimistic approach.
 *
 * Which is described in Michael and Scott's excellent paper appeared in PODC
 * '96: "Simple, Fast, and Practical Non-Blocking and Blocking Concurrent Queue
 * Algorithms"
 *
 * Copyright (C) 2010 Parallel Processing Institute (PPI), Fudan Univ.
 *  <http://ppi.fudan.edu.cn/system_research_group>
 *
 * Authors:
 *  Xi Wu           <wuxi@fudan.edu.cn>
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

#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>
#include <stdbool.h>
#include "coremu-atomic.h"
#include "coremu-thread.h"
#define COREMU_LOCKFREE
#include "queue.h"

#if _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600
    /* this is ok */
#else
# include <malloc.h>
#endif

/* macros */
#define nil        0         /* predefined tag */
#define ALIGNMENT  16        /* all data must be aligned to 16 bytes */

static inline uint8_t cmp128(pointer_t *p1, pointer_t *p2);
static inline uint64_t CAS(pointer_t *ptr, pointer_t old, pointer_t new);

/* Sematics of this function, comparing two 128 bits objects:
   if(p1 == p2)
      return 1;
   else
      return 0;
*/
static inline uint8_t cmp128(pointer_t *p1, pointer_t *p2)
{
    if (CAS(p1, *p2, *p1)) {
        return 1;
    } else {
        return 0;
    }
}

/* Atomic compare and swap for the pointer_t structure.
   Semantics of this function:
   (rdx : rax) <- old;
   (rcx : rbx) <- new;
   if((rdx : rax) == *ptr) {
      *ptr <- (rcx : rbx);
      ZF <- 1;
   } else {
      (rdx :rax) <- *ptr;
      ZF <- 0;
   }
*/
static inline uint64_t CAS(pointer_t *ptr, pointer_t old, pointer_t new)
{
    volatile uint64_t rdx, rax;
    volatile uint64_t rcx, rbx;

    rax = (uint64_t) old.ptr;   /* lower  order 64 bits */
    rdx = old.count;            /* higher order 64 bits */

    rbx = (uint64_t) new.ptr;   /* lower  order 64 bits */
    rcx = new.count;            /* higher order 64 bits */

    assert(((uint64_t)ptr & 0xf) == 0);

    return atomic_compare_exchange16b((uint64_t *)ptr, rax, rdx, rbx, rcx);
}

/* Allocate memory aligned to 16 bytes, (see ALIGNMENT
   defined in ms_queue.h) */
static void *ms_allocaligned(size_t size);
static void ms_free(void *ptr);
static void initialize(queue_t *Q);

static node_t *new_node(void)
{
    /* COREMU XXX: care about qemu_malloc */
    node_t *node = ms_allocaligned(sizeof(node_t)); /* just allocate the node */
    return node;
}

queue_t *new_queue(void)
{
    /* COREMU XXX: care about qemu_malloc ??? */
    queue_t *Q = ms_allocaligned(sizeof(queue_t));
    initialize(Q);           /* Initialize the queue */

    assert(Q->Head.ptr != NULL);
    assert(Q->Tail.ptr != NULL);
    assert(Q->Head.ptr == Q->Tail.ptr);

    return Q;
}

void destroy_queue(queue_t *Q)
{
    free(Q);
}

void enqueue(queue_t *Q, data_type value)
{
    sigset_t save_sig_set;
    coremu_sigmask_blk(&save_sig_set, NULL);
    node_t *node = new_node();  /* Allocate a new node from the free list */
    node->value = value;        /* Copy the enqueued value into node */
    node->next.ptr = NULL;      /* Set the next pointer of node to NULL */

    pointer_t tail, next, new_ptr;
    for (;;) {                  /* Keep trying until Enqueue is done */
        tail = Q->Tail;
        next = tail.ptr->next;

        if (cmp128(&Q->Tail, &tail)) {
            /* Are tail and next consistent? */
            if (next.ptr == NULL) {     /* Was Tail pointing to the last node */
                new_ptr.ptr = node;     /* Set the new pointer_t */
                new_ptr.count = next.count + 1;

                if (CAS(&(tail.ptr->next), next, new_ptr)) {    /* Try to link the node at the end of the linked list */
                    break;
                }
            } else {                    /* Tail was not pointing to the last node */
                new_ptr.ptr = next.ptr; /* Set the new pointer_t */
                new_ptr.count = tail.count + 1;
                CAS(&Q->Tail, tail, new_ptr);
            }
        }
    }

    new_ptr.ptr = node;
    new_ptr.count = tail.count + 1;
    CAS(&Q->Tail, tail, new_ptr);       /* Enqueue is done. Try to swing Tail to the inserted node */
    atomic_incq((uint64_t *) & Q->count);
    coremu_sigmask_res(&save_sig_set, NULL);
}

bool dequeue(queue_t *Q, data_type *pvalue)
{
    sigset_t save_sig_set;
    coremu_sigmask_blk(&save_sig_set, NULL);
    pointer_t head, tail, next, new_ptr;
    for (;;) {               /* Keep trying until Dequeue is done */
        head = Q->Head;      /* Read Head */
        tail = Q->Tail;      /* Read Tail */
        next = head.ptr->next;          /* Read head.ptr->next */
        if (cmp128(&Q->Head, &head)) {  /* Are head, tail, next consistent */
            if (head.ptr == tail.ptr) { /* Is queue empty or Tail falling behind? */
                if (next.ptr == NULL) {
                    return false;       /* Queue is empty, couldn't dequeue */
                    coremu_sigmask_res(&save_sig_set, NULL);
                }

                new_ptr.ptr = next.ptr; /* Set new_ptr */
                new_ptr.count = tail.count + 1;
                CAS(&Q->Tail, tail, new_ptr);   /* Tail is falling behind. Try to advance it */
            } else {                    /* No need to deal with Tail */
                /* Read value before CAS, otherwise another dequeue might free
				 * the next node */
                if (pvalue)
                    *pvalue = next.ptr->value;
                new_ptr.ptr = next.ptr;
                new_ptr.count = head.count + 1;
                if (CAS(&Q->Head, head, new_ptr)) { /* Try to swing Head to the next node */
                    break;
                }
            }
        }
    }

    ms_free(head.ptr);       /* It is safe to free the old dummy node */
    atomic_decq((uint64_t *) &Q->count);
    coremu_sigmask_res(&save_sig_set, NULL);
    return true;             /* Queue was not empty, dequeue successed */
}

/* Iterate this queue, and print all values of the nodes */
void print_queue(queue_t *Q);
void print_queue(queue_t *Q)
{
    /* elements of the queue */
    fprintf(stderr, ">>> print queue[%lu] <<<\n", Q->count);
    node_t *cur = Q->Head.ptr;
    while (cur != NULL) {
        fprintf(stderr, "cur.value = %lu\n", cur->value);
        cur = cur->next.ptr;
    }
}

int64_t queue_get_size(queue_t *Q)
{
    return Q->count;
}

/* private functions */
static void *ms_allocaligned(size_t size)
{
    void *ptr;
#if _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600
    /* use posix_memalign */
    posix_memalign(&ptr, ALIGNMENT, size);
#else
    /* use obsolete memalign */
    ptr = memalign(ALIGNMENT, size);
#endif

    return ptr;
}

static void ms_free(void *ptr)
{
    free(ptr);
}

static void initialize(queue_t *Q)
{
    node_t *node = new_node();  /* Allocate a free node */
    node->next.ptr = NULL;   /* Make it the only node in the linked list */

    Q->Head.ptr = node;      /* Both Head and Tail point to it */
    Q->Head.count = nil;

    Q->Tail.ptr = node;
    Q->Tail.count = nil;

    Q->count = 0;            /* no elements initially */
}

char *queue_version()
{
    return "lock free concurrent queue";
}
