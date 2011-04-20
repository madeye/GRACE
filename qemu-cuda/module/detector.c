#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

#define PPI_THREE_STAGE

#include <unistd.h>
#include <pthread.h>
#include <sys/syscall.h>

extern int cuda_thread_num;

pthread_mutex_t det_lock = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t  det_cond = PTHREAD_COND_INITIALIZER;
volatile uint8_t stage_three_stop = 0;
extern volatile uint8_t is_detect_start;

#ifdef PPI_THREE_STAGE
static inline void ppi_set_cpu_thread(int cpu_no)
{
    unsigned long int cpumask;

    cpumask = (1 << cpu_no);

    sched_setaffinity(syscall(SYS_gettid), 
            sizeof(unsigned long int), (cpu_set_t *)(&cpumask));
}
#endif

#include "interface.h"

#include "info.c"

#include "race.c"

#include "timestamp.c"

#define MOD_HISTORY
#define MOD_MATCH

#include "history.c"

#define MOD_FILTER

#include "filter.c"

#define MOD_PROFILER

/* interface */

#ifdef PPI_THREE_STAGE
static inline void module_detector_stage_two(uint8_t tid, 
        uint32_t size, struct trace_content *buf)
{
    uint32_t i;
    struct trace_content *content;

    if (!info.exist[tid]) {
        printf("\tnew tid: %d\n", tid);

        if (info.max_tid_num < (tid + 1)) {
            info.max_tid_num = (tid + 1);
        }

        info.exist[tid] = 1;
    }

    for (i = 0; i < size; i++) {
        content = &buf[i];

        if (content->type == TRACE_MEM_LOAD) {
            module_history_load_record(content);
            module_filter_load_record(content);
        } else if (content->type == TRACE_MEM_STORE) {
            module_history_store_record(content);
            module_filter_store_record(content);
        } else {
            fprintf(stderr, "unknown type : %d\n", content->type);
            assert(0);
        }
    }
}

static inline void module_detector_stage_three(uint8_t tid, 
        uint32_t size, struct trace_content *buf)
{
    uint32_t i;
    struct trace_content *content;

    if (!info.exist[tid]) {
        printf("\tnew tid: %d\n", tid);

        if (info.max_tid_num < (tid + 1)) {
            info.max_tid_num = (tid + 1);
        }

        info.exist[tid] = 1;
    }

    for (i = 0; i < size; i++) {
        content = &buf[i];

        if (content->type == TRACE_MEM_LOAD) {
            module_filter_load_match(content);
        } else if (content->type == TRACE_MEM_STORE) {
            module_filter_store_match(content);
        } else {
            fprintf(stderr, "unknown type : %d\n", content->type);
            assert(0);
        }
    }
}

void *module_pthread_stage_two(void *args)
{
    uint8_t i, j;
#if 0
    uint8_t cid, kid;
#endif
#if 1
    uint8_t cid, kid[MAX_CORE_NUM];
#endif
    volatile uint8_t tid;
    volatile uint32_t size;
    struct shared_trace_chunk *temp_chunk;
#if 1
    struct shared_trace_chunk *next_chunk;
#endif

    i = ((int *)args)[0];
    fprintf(stderr, "stage two : core %d start!\n", i);

    info.core_id = i;
    ppi_set_cpu_thread(STAGE_TWO_BASE_CPU_ID + i);

#if 0
    cid = 0;
    kid = 0;
#endif
#if 1
    cid = 0;
    memset(kid, 0, MAX_CORE_NUM * sizeof(uint8_t));
#endif

    j = 0;

    while(1) {

        pthread_mutex_lock(&det_lock);
        if (!is_detect_start)
            pthread_cond_wait(&det_cond, &det_lock);
        pthread_mutex_unlock(&det_lock);

        temp_chunk = &shared_buf.stage[0].core[i].chunk[j];

        if (temp_chunk->info->is_buf_full) {
            tid = temp_chunk->info->thread_id;
            size = temp_chunk->info->buf_size;

            module_detector_stage_two(tid, size, temp_chunk->buf);

#if 1
#if 1
            next_chunk = &shared_buf.stage[1].core[cid].chunk[kid[cid]];

            while (next_chunk->info->is_buf_full) {
                cid = (cid + 1) % MAX_CORE_NUM;

                next_chunk = &shared_buf.stage[1].core[cid].chunk[kid[cid]];
            }
#endif

            module_shared_buf_copy(1, cid, kid[cid], tid, size, temp_chunk->buf);

            kid[cid] = (kid[cid] + 1) % MAX_CHUNK_NUM;
            cid = (cid + 1) % MAX_CORE_NUM;
#endif
#if 0
            module_shared_buf_copy(1, cid, kid, tid, size, temp_chunk->buf);

            cid = (cid + 1) % MAX_CORE_NUM;
            if (cid == 0) {
                kid = (kid + 1) % MAX_CHUNK_NUM;
            }
#endif

            temp_chunk->info->thread_id = 0;
            temp_chunk->info->buf_size = 0;				

            temp_chunk->info->is_buf_full = 0;	

            j = (j + 1) % MAX_CHUNK_NUM;
        }
    }    
}

void *module_pthread_stage_three(void *args)
{
    uint8_t i, j;
    volatile uint8_t tid;
    volatile uint32_t size;
    struct shared_trace_chunk *temp_chunk;

    i = ((int *)args)[0];
    fprintf(stderr, "stage three : core %d start!\n", i);

    info.core_id = i;
    ppi_set_cpu_thread(STAGE_THREE_BASE_CPU_ID + i);

    j = 0;

#ifdef CUDA
    printf("CUDA Init.\n");
    module_cuda_config_register(cuda_thread_num);
    module_cuda_init_interface();

    /* module_cuda_init();*/
    /* ts.thread = h_gtq;*/
#endif

    while(1) {

        if (stage_three_stop) 
            break;

        pthread_mutex_lock(&det_lock);
        if (!is_detect_start)
            pthread_cond_wait(&det_cond, &det_lock);
        pthread_mutex_unlock(&det_lock);

        temp_chunk = &shared_buf.stage[1].core[i].chunk[j];

        if (temp_chunk->info->is_buf_full) {
            tid = temp_chunk->info->thread_id;
            size = temp_chunk->info->buf_size;

#ifndef CUDA
            module_detector_stage_three(tid, size, temp_chunk->buf);            
#else
            if (!info.exist[tid]) {
                printf("\tnew tid: %d\n", tid);

                if (info.max_tid_num < (tid + 1)) {
                    info.max_tid_num = (tid + 1);
                }

                printf("max tid num: %d\n", info.max_tid_num);

                info.exist[tid] = 1;
            }

            if (info.max_tid_num > 2) {

                if (info.last_tid != tid) {
                    module_cuda_history_hash_queue_update_interface(
                            info.last_tid, &history->thread[info.last_tid]);
                    module_cuda_page_filter_update_interface(
                            info.last_tid, &pfilter->thread[info.last_tid]);
                    module_cuda_tid_update_interface(info.max_tid_num);
                    info.last_tid = tid;
                }

                /*module_cuda_timestamp_entry_update_interface(info.max_tid_num, ts.current_ts_index, ts.thread); */

                module_cuda_match_with_trace_buf_interface(tid, size, temp_chunk->buf);

            }
#endif

            temp_chunk->info->thread_id = 0;
            temp_chunk->info->buf_size = 0;				

            temp_chunk->info->is_buf_full = 0;	

            j = (j + 1) % MAX_CHUNK_NUM;
        }
    }    
#ifdef CUDA
    module_cuda_global_race_queue_fetch_interface(race);
    module_cuda_free_interface();                       
    module_race_print();
#endif
}

pthread_t pid[MAX_CORE_NUM];
int cid[MAX_CORE_NUM];

static inline void data_race_detector_stage(void)
{
    int i;

    for (i = 0; i < MAX_CORE_NUM; i++) {
        cid[i] = i;
    }

    /* STAGE ONE */
    ppi_set_cpu_thread(STAGE_ONE_BASE_CPU_ID);

    /* STAGE TWO */
    pthread_create(&pid[0], NULL, module_pthread_stage_two, (void *)&cid[0]);

    /* STAGE THREE */
    for (i = 0; i < MAX_CORE_NUM; i++) {
        pthread_create(&pid[i], NULL, module_pthread_stage_three, (void *)&cid[i]);
    }
}
#else
static inline void module_detector_start(uint8_t tid, 
        uint32_t size, struct trace_content *buf)
{
    uint32_t i;
    struct trace_content *content;

    if (!info.exist[tid]) {
        printf("\tnew tid: %d\n", tid);

        if (info.max_tid_num < (tid + 1)) {
            info.max_tid_num = (tid + 1);
#ifdef CUDA
            module_cuda_tid_update_interface(info.max_tid_num);
#endif
        }

        info.exist[tid] = 1;
    }
#ifdef CUDA
#if 1
    if (info.last_tid != tid) {
        module_cuda_history_hash_queue_update_interface(
                info.last_tid, &history->thread[info.last_tid]);
        module_cuda_page_filter_update_interface(
                info.last_tid, &pfilter->thread[info.last_tid]);
        //module_cuda_global_history_queue_update_interface(history);
        //module_cuda_global_page_filter_update_interface(pfilter);
        info.last_tid = tid;
    }
#endif
#if 1
    struct trace_content *buf_ptr;
    uint32_t size_ptr;

    buf_ptr = buf;
    size_ptr = size;

#define TRACE_CUDA_BUF_SIZE (1 << 24)

    while (size_ptr > TRACE_CUDA_BUF_SIZE) {
        module_cuda_match_with_trace_buf_interface(tid, TRACE_CUDA_BUF_SIZE, buf_ptr);
        size_ptr -= TRACE_CUDA_BUF_SIZE;
        buf_ptr += TRACE_CUDA_BUF_SIZE;
    }

    module_cuda_match_with_trace_buf_interface(tid, size_ptr, buf_ptr);
#endif
#endif
    for (i = 0; i < size; i++) {
        content = &buf[i];

        if (content->type == TRACE_MEM_LOAD) {
            module_history_load_record(content);
            module_filter_load_record(content);
#ifndef CUDA
            module_filter_load_match(content);
#endif
        } else if (content->type == TRACE_MEM_STORE) {
            module_history_store_record(content);
            module_filter_store_record(content);
#ifndef CUDA
            module_filter_store_match(content);
#endif
        } else {
            fprintf(stderr, "unknown type : %d\n", content->type);
            assert(0);
        }
    }
}
#endif

void data_race_detector_init(void) 
{
    module_info_init();
    module_history_init();
    module_filter_init();
    module_race_init();
#ifdef PPI_THREE_STAGE
    module_shared_buf_init(); 
    data_race_detector_stage();
#endif
#ifndef PPI_THREE_STAGE
#ifdef CUDA
    module_cuda_config_register(cuda_thread_num);
    module_cuda_init_interface();
#endif
#endif
#if 1
    fprintf(stderr, "\ntrace buf size : %d\n", TRACE_BUF_SIZE);
    fprintf(stderr, "trace content size : %ld\n", sizeof(struct trace_content));
#endif
}

void data_race_detector(uint8_t tid, uint32_t size, struct trace_content *buf) 
{
#ifdef MOD_PROFILER
#ifdef PPI_THREE_STAGE
    struct trace_content *buf_ptr;

#if 1
    if (info.last_tid != tid) {
        module_shared_buf_all_empty();

        info.last_tid = tid;
    }
#endif

    buf_ptr = buf;

    while (size > TRACE_SHARED_BUF_SIZE) {
        // printf("\twarning : trace is too long! size : 0x%x\n", size);

        module_shared_buf_copy(0, 0, info.chunk_id, tid, TRACE_SHARED_BUF_SIZE, buf_ptr);
        info.chunk_id = (info.chunk_id + 1) % MAX_CHUNK_NUM;

        size -= TRACE_SHARED_BUF_SIZE;
        buf_ptr += TRACE_SHARED_BUF_SIZE;
    }

    module_shared_buf_copy(0, 0, info.chunk_id, tid, size, buf_ptr);
    info.chunk_id = (info.chunk_id + 1) % MAX_CHUNK_NUM;
#else
    module_detector_start(tid, size, buf);
#endif
#endif
}

void data_race_detector_report(void) 
{
#ifdef PPI_THREE_STAGE
    module_shared_buf_all_empty();
#endif
#ifdef CUDA
#ifndef PPI_THREE_STAGE
    module_cuda_global_race_queue_fetch_interface(race);
    module_cuda_free_interface();
#endif
#endif
    stage_three_stop = 1;
    module_race_print();
}

