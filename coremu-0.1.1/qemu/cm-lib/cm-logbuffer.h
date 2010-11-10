/*
 * COREMU Parallel Emulator Framework
 *
 * Logging facility for COREMU.
 * Note that the order of log message is not reserved.
 *
 * Copyright (C) 2010 Parallel Processing Institute, Fudan Univ.
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

#ifndef _COREMU_LOGBUFFER_H
#define _COREMU_LOGBUFFER_H

#include <stdbool.h>
#include <string.h>
#include <stdio.h>
#include <pthread.h>

struct queue_t;

typedef void (*cm_log_func)(FILE *, void *);

/* Each record in the buffer should be of equal size. */
typedef struct {
    char *buf;
    char *cur;      /* Current position in the buffer. */
    char *end;      /* end - buf = bufsize */

    int size;
    int ele_size;   /* Size of each element. */
    cm_log_func func;

    struct queue_t *queue;  /* Holding all the allocated buffer. */
    bool thread_running; /* Whether log thread is running. */
    pthread_t thread;

    FILE *file;
} CMLogbuf;

CMLogbuf *cm_logbuf_new(int n, int ele_size, cm_log_func func, FILE *file);
/* Must call this function to write all the content in buffer out. */
void cm_logbuf_free(CMLogbuf *buf);

/* Flush the buffer content in a thread. */
void cm_logbuf_flush(CMLogbuf *buf);

/* Wait the flush thread to finish */
void cm_logbuf_wait_flush(CMLogbuf *buf);

/* Assmue that the buffer contains space for at least size space.
 * Use this macro to directly write the content into the buffer, so we can avoid
 * calling memcpy to copy the content. */
#define CM_LOGBUF_LOG(buf, pos, command) \
    do { \
        char *pos = buf->cur; \
        { command; }; \
        buf->cur += buf->ele_size; \
        if (buf->cur + buf->ele_size > buf->end) \
            cm_logbuf_flush(buf); \
    } while (0)

static inline void cm_logbuf_log(CMLogbuf *buf, void *cont)
{
    CM_LOGBUF_LOG(buf, pos, {
        memcpy(pos, cont, buf->ele_size);
    });
}

#endif /* _COREMU_LOGBUFFER_H */
