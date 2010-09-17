/*
 * COREMU Parallel Emulator Framework
 *
 * Scheduling support for COREMU parallel emulation library
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

/*#define DEBUG_COREMU*/
/*#define VERBOSE_COREMU*/
/*#define DEBUG_CM_SCHED*/

#define _GNU_SOURCE

#include "utils.h"
#include "core.h"
#include "coremu-sched.h"

int min_prio, max_prio;
int low_prio, avg_prio, high_prio;
int host_cpu_avail = 0;

topo_topology_t topology;
struct topo_topology_info topoinfo;
static unsigned int depth;
static unsigned int cores;

__thread unsigned long int halt_cnt = 0;
#define HALT_THRESHHOLD     10
#define HALT_SLEEP_MIN_TIME 10000   // 1000ns = 10us
#define HALT_SLEEP_MAX_TIME 5000000 // 5000,000ns = 5ms this is the smallest quantum

__thread unsigned long int pause_cnt = 0;
#define PAUSE_THRESHOLD     100
#define PAUSE_SLEEP_TIME    100000  // 100,000 ns = 100us

static inline void sched_halted(void);
static inline void sched_pause(void);
static void display_thread_sched_attr(char *msg);
static void topology_init(void);
static void print_children(topo_topology_t topology, topo_obj_t obj, int depth);

static void print_children(topo_topology_t topology, topo_obj_t obj, int depth)
{
    char string[128];
    int i;

    topo_obj_snprintf(string, sizeof(string), topology, obj, "#", 0);
    printf("%*s%s\n", 2 * depth, "", string);
    for (i = 0; i < obj->arity; i++)
        print_children(topology, obj->children[i], depth + 1);
}

static void topology_init()
{
    topo_topology_init(&topology);
    topo_topology_load(topology);

    topo_topology_get_info(topology, &topoinfo);
    depth = topo_get_type_or_below_depth(topology, TOPO_OBJ_CORE);
    cores = topo_get_depth_nbobjs(topology, depth);

    fprintf(stderr,
            "----------------- Dump toplogy[%ud] info -----------------\n",
            cores);
    /* Dump the toplogy info */
    print_children(topology, topo_get_system_obj(topology), 0);
    fprintf(stderr,
            "----------------------------------------------------------\n");
}


static void topology_bind_core()
{
    topo_obj_t obj;
    topo_cpuset_t cpuset;
    CMCore *self = coremu_get_core_self();
    int index;

    index = (self->serial % cores);

    obj = topo_get_obj_by_depth(topology, depth, index);
    cpuset = obj->cpuset;
    topo_cpuset_singlify(&cpuset);

    if (topo_set_cpubind(topology, &cpuset, TOPO_CPUBIND_THREAD)) {
        char s[TOPO_CPUSET_STRING_LENGTH + 1];
        topo_cpuset_snprintf(s, sizeof(s), &obj->cpuset);
        printf("Couldn't bind to cpuset %s\n", s);
        exit(-1);
    }

    fprintf(stderr, "core [%u] binds to %d\n", self->serial, index);

}

void coremu_init_sched_all()
{
    /* Get the available processors */
    host_cpu_avail = sysconf(_SC_NPROCESSORS_ONLN);

    /* HIGH numeric value indicates LOW priority,
       and vice versa */
    max_prio = -21;
    min_prio = 19;
    avg_prio = (max_prio + min_prio) / 2;
    low_prio = (avg_prio + min_prio) / 2;
    high_prio = (max_prio + avg_prio) / 2;

    cm_print("[priority]: max[%d], min[%d], "
             "low[%d], avg[%d], high[%d]",
             max_prio, min_prio, low_prio, avg_prio, high_prio);

    /* set priority for main thread
       NOTE: now it is HW thread. */
    //assert(! setpriority(PRIO_PROCESS, 0, high_prio));
    //assert(! sched_setscheduler(0, SCHED_RR, NULL));
    display_thread_sched_attr("MAIN thread scheduling settings:");
    coremu_thread_setpriority(PRIO_PROCESS, 0, high_prio);
    topology_init();

    /* bind hardware thread to the fisrt core */
    //topology_bind_hw();
}

int coremu_get_hostcpu()
{
    return host_cpu_avail;
}

int coremu_get_targetcpu()
{
    return cm_smp_cpus;
}

int coremu_get_thrs_per_core()
{
    return (host_cpu_avail + cm_smp_cpus - 1) / host_cpu_avail;
}

int coremu_physical_core_enough_p()
{
    return host_cpu_avail >= cm_smp_cpus;
}

int coremu_get_maxprio()
{
    return high_prio;
}

int coremu_get_minprio()
{
    return low_prio;
}


void coremu_init_sched_core()
{
    int policy;
    CMCore *self;
    struct sched_param param;
    assert(!pthread_getschedparam(pthread_self(), &policy, &param));
    assert(policy == CM_SCHED_POLICY);

    coremu_thread_setpriority(PRIO_PROCESS, 0, avg_prio);
    self = coremu_get_core_self();
    self->tid = coremu_gettid();

    /* display the scheduling info */
    display_thread_sched_attr("CORE thread scheduler settings:");

#ifdef CM_ENABLE_BIND_CORE
    /* bind thread to a specific core */
    topology_bind_core();
#endif

}



void coremu_cpu_sched(CMSchedEvent e)
{
    switch (e) {
    case CM_EVENT_HALTED:
        sched_halted();
        break;
    case CM_EVENT_PAUSE:
        sched_pause();
        break;
    default:
        assert(0);
    }
}


/* handle the halted event */
static inline void sched_halted()
{
    struct timespec halt_interval;
    CMCore *self = coremu_get_core_self();

    self->state = CM_STATE_HALT;
    halt_interval.tv_sec = 0;
    halt_interval.tv_nsec = HALT_SLEEP_MAX_TIME;
    nanosleep(&halt_interval, NULL);
    self->state = CM_STATE_RUN;

}

/* handle the pause event */
static inline void sched_pause()
{
    struct timespec pause_interval;
    CMCore *self = coremu_get_core_self();

    pause_interval.tv_sec = 0;
    pause_interval.tv_nsec = PAUSE_SLEEP_TIME;

    if (pause_cnt < PAUSE_THRESHOLD) {
        pause_cnt++;
    } else if (pause_cnt <= PAUSE_THRESHOLD + 1) {
        pause_cnt++;
        pthread_yield();
    } else {
        self->state = CM_STATE_PAUSE;
        nanosleep(&pause_interval, NULL);
        self->state = CM_STATE_RUN;
        pause_cnt = 0;
    }
}

static void display_thread_sched_attr(char *msg)
{
    int policy, prio;
    struct sched_param param;

    prio = getpriority(PRIO_PROCESS, 0);
    assert(!pthread_getschedparam(pthread_self(), &policy, &param));

    cm_print("-- tid[%lu] %s start --",
             (unsigned long int)coremu_gettid(), msg);

    cm_print("policy=%s, priority=%d",
             (policy == SCHED_FIFO) ?
				 "SCHED_FIFO" :
                 (policy == SCHED_RR) ?
				     "SCHED_RR" :
					 (policy == SCHED_OTHER) ?
						 "SCHED_OTHER" :
						 "???", prio);

    cm_print("-- thr[%lu] %s end --\n",
             (unsigned long int)coremu_gettid(), msg);
}
