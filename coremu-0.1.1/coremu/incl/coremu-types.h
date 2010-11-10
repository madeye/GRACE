/*
 * COREMU Parallel Emulator Framework
 *
 * This file defines the types in COREMU system
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

#ifndef _CM_TYPES_H
#define _CM_TYPES_H

#include "coremu-config.h"
#include "queue.h"

/* ************************* Base types ************************* */

typedef void *(thr_start_routine)(void *);
typedef pid_t tid_t;
typedef pthread_t hw_thr_t;

typedef uint64_t cm_ram_addr_t;

/* ************************* Complex types ************************* */

/* State of COREMU CORE */
typedef enum CMCoreState {
    CM_STATE_RUN,            /* NOT halt */
    CM_STATE_HALT,           /* Halted state (e.g. execute HLT insn) */
    CM_STATE_PAUSE,
} CMCoreState;

/* CORE scheduling type */
typedef enum CMSchedEvent {
    CM_EVENT_HALTED,
    CM_EVENT_PAUSE,
    CM_EVENT_CNT,
} CMSchedEvent;

/* processor type */
typedef struct CMCore {
    uint32_t serial;         /* number start from 0 */
    pthread_t thread;        /* ID of the core */
    tid_t tid;               /* kernel process id */
    queue_t *intr_queue;     /* interrupt queue for the core */

    /* adaptive signal control */
    uint64_t time_stamp;      /* recode the time of intr pending */
    int64_t intr_thresh_hold; /* the thresh hold for intr sending */
    uint8_t sig_pending;      /* if has signal not receive */

    void *opaque;            /* CPUState of QEMU */
    CMCoreState state;       /* state of the CORE */
} CMCore;

#endif /* _CM_TYPES_H */
