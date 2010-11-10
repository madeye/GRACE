/*
 * COREMU Parallel Emulator Framework
 *
 * Thread abstraction for COREMU
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

#ifndef _CM_THREAD_H
#define _CM_THREAD_H

#include <sys/time.h>
#include <sys/resource.h>
#include <pthread.h>
#include <stdbool.h>

/* error-checking lock for static lock */
#define COREMU_LOCK_INITIALIZER  PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP
#define COREMU_COND_INITIALIZER PTHREAD_COND_INITIALIZER

//extern __thread sigset_t cm_blk_sigset;

/* mutex related interfaces */
static inline void coremu_mutex_lock(pthread_mutex_t *mutex, const char *errmsg)
{
    int err = pthread_mutex_lock(mutex);
    if (err) {
        printf("%s\n", errmsg);
        assert(0);
    }
}

static inline void
coremu_mutex_unlock(pthread_mutex_t *mutex, const char *errmsg)
{
    int err = pthread_mutex_unlock(mutex);
    if (err) {
        printf("%s\n", errmsg);
        assert(0);
    }
}

static inline void
coremu_mutex_destroy(pthread_mutex_t *mutex, const char *errmsg)
{
    int err = pthread_mutex_destroy(mutex);
    if (err) {
        printf("%s\n", errmsg);
        assert(0);
    }
}

/* conditional related interfaces */
static inline int coremu_cond_wait(pthread_cond_t *cond, pthread_mutex_t *lock)
{
    return pthread_cond_wait(cond, lock);
}

static inline int coremu_cond_signal(pthread_cond_t *cond)
{
    return pthread_cond_signal(cond);
}

static inline int coremu_cond_broadcast(pthread_cond_t *cond)
{
    return pthread_cond_broadcast(cond);
}

static inline void coremu_cond_destroy(pthread_cond_t *cond, const char *errmsg)
{
    int err = pthread_cond_destroy(cond);
    if (err) {
        printf("%s\n", errmsg);
        assert(0);
    }
}

/* ******** Pthread signal functionalities ******** */

static inline void coremu_sigmask_blk(sigset_t *oldset, const char *errmsg)
{
    sigset_t set;
    sigfillset(&set);
    int err = pthread_sigmask(SIG_BLOCK, &set, oldset);

    if (err) {
        printf("%s\n", errmsg);
        assert(0);
    }
}

/* restore the signals from SET */
static inline void coremu_sigmask_res(sigset_t *set, const char *errmsg)
{
    int err = pthread_sigmask(SIG_SETMASK, set, NULL);

    if (err) {
        printf("%s\n", errmsg);
        assert(0);
    }
}

/* Thread scheduling */
static inline int coremu_thread_setpriority(int which, int who, int prio)
{
    int err = setpriority(which, who, prio);
    assert(!err);
    return true;
}

static inline int coremu_thread_getpriority(int which, int who)
{
    return getpriority(which, who);
}

#endif /* _CM_THREAD_H */
