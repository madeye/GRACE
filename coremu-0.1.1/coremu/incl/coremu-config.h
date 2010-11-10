/*
 * COREMU Parallel Emulator Framework
 *
 * This file configures various aspects of COREMU system.
 * Read the comment carefully for each control group.
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

#ifndef _CM_CONFIG_H
#define _CM_CONFIG_H

#define CONFIG_COREMU                   /* whether adapt to coremu */

#define COREMU_MAX_CPU 255              /* the max cpu supported by coremu */

/* Signals used in COREMU */
#define TIMERRTSIG              SIGRTMIN          /* Timer thread implicit signal */
#define COREMU_CORE_ALARM       (SIGRTMIN + 1)    /* CORE alarm signal */
#define COREMU_HARDWARE_ALARM   (SIGRTMIN + 2)    /* Hardware alarm signal */
#define COREMU_SIGNAL           (SIGRTMIN + 3)    /* COREMU Interrupts */
#define COREMU_AIO_SIG          (SIGRTMIN + 4)    /* Aynchrous I/O (e.g. DMA) */

#ifdef CONFIG_COREMU
# define COREMU_THREAD __thread         /* coremu per-core struct */
#else
# define COREMU_THREAD
#endif

/* Enable lock free queue */
//#define COREMU_LOCKFREE

//#define COREMU_DEBUG_MODE                /* The debug mode for coremu */
//#define COREMU_CACHESIM_MODE             /* Cache simulation mode */

/* enable lazy invalidate tb */
//#define COREMU_CMC_SUPPORT
//#define COREMU_FLUSH_TLB               /* enable broadcast flush tlb request */

//#define COREMU_PROFILE_MODE              /* enable profiling for COREMU */
//#define COREMU_RETRY_PROFILE           /* enable profiling the conflict retry number */

#endif /* _CM_CONFIG_H */

