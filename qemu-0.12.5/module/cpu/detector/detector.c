#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

#include <unistd.h>
#include <pthread.h>
#include <sys/syscall.h>

extern int cuda_thread_num;

pthread_mutex_t det_lock = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t  det_cond = PTHREAD_COND_INITIALIZER;
volatile uint8_t stage_three_stop = 0;
volatile uint8_t stage_three_finish = 0;
extern volatile uint8_t is_detect_start;
extern uint32_t max_thread_num;

#include "interface.h"

#include "info.c"
#include "race.c"
#include "timestamp.c"
#include "history.c"
#include "filter.c"

#ifdef CUDA
#include "../../gpu/match/match.h"
#endif

#ifdef PPI_THREE_STAGE
static inline void ppi_set_cpu_thread(int cpu_no)
{
    unsigned long int cpumask;

    cpumask = (1 << cpu_no);

    sched_setaffinity(syscall(SYS_gettid), 
            sizeof(unsigned long int), (cpu_set_t *)(&cpumask));
}
#endif

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

#if 1
    cid = 0;
    memset(kid, 0, MAX_CORE_NUM * sizeof(uint8_t));
#endif

    j = 0;
    int flag=1;    
    
    while(1) {

        pthread_mutex_lock(&det_lock);
        if (!is_detect_start)
            pthread_cond_wait(&det_cond, &det_lock);
        pthread_mutex_unlock(&det_lock);

        temp_chunk = &shared_buf.stage[0].core[i].chunk[j];
        if (temp_chunk->info->is_buf_full) {

	     gettimeofday(&s1t2, NULL);
	     if(flag==0&&isStarts1==1)  WaitTime_s1+=tsub(s1t2, s1t1);
            doTime_s1 += 1.0f;

            tid = temp_chunk->info->thread_id;
            size = temp_chunk->info->buf_size;

            module_detector_stage_two(tid, size, temp_chunk->buf);

#if 1
            next_chunk = &shared_buf.stage[1].core[cid].chunk[kid[cid]];

            while (next_chunk->info->is_buf_full) {
                cid = (cid + 1) % MAX_CORE_NUM;

                next_chunk = &shared_buf.stage[1].core[cid].chunk[kid[cid]];
            }

            module_shared_buf_copy(1, cid, kid[cid], tid, size, temp_chunk->buf);

            kid[cid] = (kid[cid] + 1) % MAX_CHUNK_MATCH_NUM;
            cid = (cid + 1) % MAX_CORE_NUM;
#endif

            temp_chunk->info->thread_id = 0;
            temp_chunk->info->buf_size = 0;				

            temp_chunk->info->is_buf_full = 0;	

            j = (j + 1) % MAX_CHUNK_HISTORY_NUM;            
            flag = 1;
            isStarts1=1;
            gettimeofday(&s1t1, NULL);
        }
        else
        {
            flag = 0;
        }
    }    
}

#ifdef CUDA
#ifdef PPI_THREE_STAGE
volatile int last_tid = 0;
extern struct trace_content *cuda_buf;
int cuda_buf_size = 0;
#endif
#endif

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
#endif
    int flag=1;	  
    while(1) {

        if (stage_three_stop) 
            break;

        pthread_mutex_lock(&det_lock);
        if (!is_detect_start)
            pthread_cond_wait(&det_cond, &det_lock);
        pthread_mutex_unlock(&det_lock);

        temp_chunk = &shared_buf.stage[1].core[i].chunk[j];
        

        if (temp_chunk->info->is_buf_full) {
	 gettimeofday(&s2t2, NULL);
	 if(flag==0&&isStarts2==1) WaitTime_s2+=tsub(s2t2, s2t1);
	 doTime_s2 += 1.0f;
            
            tid = temp_chunk->info->thread_id;
            size = temp_chunk->info->buf_size;

#ifndef CUDA
            module_detector_stage_three(tid, size, temp_chunk->buf);            
#else
#if 1
            if (!info.exist[tid]) {
                printf("\tnew tid: %d\n", tid);

                if (info.max_tid_num < (tid + 1)) {
                    info.max_tid_num = (tid + 1);
                    module_cuda_tid_update_interface(info.max_tid_num);
                }

                printf("max tid num: %d\n", info.max_tid_num);

                info.exist[tid] = 1;

            }

            if (info.max_tid_num > 2) {
                if (last_tid != tid) {
                    module_cuda_history_hash_queue_update_interface(
                            last_tid, &gh.thread[last_tid]);
                    module_cuda_page_filter_update_interface(
                            last_tid, &gpf.thread[last_tid]);

                    if (cuda_buf_size > 0) {
                        module_cuda_timestamp_entry_update_interface(
                                info.max_tid_num, cts.index, gts.thread); 
                        module_cuda_match_with_trace_buf_interface(
                                tid, cuda_buf_size, cuda_buf);

                        cuda_buf_size = 0;
                    }

                    last_tid = tid;
                }

                memcpy(cuda_buf + cuda_buf_size, temp_chunk->buf, 
                        size * sizeof(struct trace_content));
                cuda_buf_size += size;

                if (cuda_buf_size >= TRACE_BUF_CUDA_SIZE) {
                    module_cuda_timestamp_entry_update_interface(
                            info.max_tid_num, cts.index, gts.thread); 
                    module_cuda_match_with_trace_buf_interface(
                            tid, cuda_buf_size, cuda_buf);

                    cuda_buf_size = 0;
                }
            }
#endif
#endif

            temp_chunk->info->thread_id = 0;
            temp_chunk->info->buf_size = 0;				

            temp_chunk->info->is_buf_full = 0;	

            j = (j + 1) % MAX_CHUNK_MATCH_NUM;
            flag = 1.0f;
            isStarts2=1;
            gettimeofday(&s2t1, NULL);
        }
        else
        {
            flag = 0;
        }
    }    
    fprintf(stderr, "WatTime:: %f %f %f %f\n", doTime_s1, WaitTime_s1, doTime_s2, WaitTime_s2);
#ifdef CUDA
    module_cuda_global_race_queue_fetch_interface(&gr);
    module_cuda_free_interface(); 
#endif
    stage_three_finish = 1;
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
    if (info.last_tid != tid) {
        module_cuda_history_hash_queue_update_interface(
                info.last_tid, &gh.thread[info.last_tid]);
        module_cuda_page_filter_update_interface(
                info.last_tid, &gpf.thread[info.last_tid]);

        info.last_tid = tid;
    }

    struct trace_content *buf_ptr;
    uint32_t size_ptr;

    buf_ptr = buf;
    size_ptr = size;

#define TRACE_CUDA_BUF_SIZE (1 << 24)

    while (size_ptr > TRACE_CUDA_BUF_SIZE) {
        module_cuda_timestamp_entry_update_interface(
                info.max_tid_num, cts.index, gts.thread); 
        module_cuda_match_with_trace_buf_interface(
                tid, TRACE_CUDA_BUF_SIZE, buf_ptr);

        size_ptr -= TRACE_CUDA_BUF_SIZE;
        buf_ptr += TRACE_CUDA_BUF_SIZE;
    }

    module_cuda_timestamp_entry_update_interface(
            info.max_tid_num, cts.index, gts.thread); 
    module_cuda_match_with_trace_buf_interface(
            tid, size_ptr, buf_ptr);
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
    module_timestamp_init();
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
    uint32_t buf_size;

    if (info.last_tid != tid) {
        module_shared_buf_all_empty();

        info.last_tid = tid;
    }

    buf_ptr = buf;
    buf_size = size;

    while (buf_size > TRACE_SHARED_BUF_SIZE) {
        module_shared_buf_copy(0, 0, info.chunk_id, tid, TRACE_SHARED_BUF_SIZE, buf_ptr);
        info.chunk_id = (info.chunk_id + 1) % MAX_CHUNK_HISTORY_NUM;

        buf_size -= TRACE_SHARED_BUF_SIZE;
        buf_ptr += TRACE_SHARED_BUF_SIZE;
    }

    module_shared_buf_copy(0, 0, info.chunk_id, tid, buf_size, buf_ptr);
    info.chunk_id = (info.chunk_id + 1) % MAX_CHUNK_HISTORY_NUM;
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
    module_cuda_global_race_queue_fetch_interface(&gr);
    module_cuda_free_interface();
#endif
#endif
#ifdef PPI_THREE_STAGE
    stage_three_stop = 1;
    while (!stage_three_finish){};
#endif
    module_timestamp_print(max_thread_num);
    module_race_print();
}

