#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

/*#define PPI_THREE_STAGE*/

#ifdef PPI_THREE_STAGE
#include <unistd.h>
#include <pthread.h>
#include <sys/syscall.h>


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

inline void fill_index(uint32_t *dest, uint32_t *src) {
    int i;
    for (i = 1; i <= MAX_THREAD_NUM; i++)
        dest[i] = src[i];
}

static inline void module_detector_stage_two(uint8_t tid, 
        uint32_t size, struct trace_content *buf)
{
    uint32_t i;
    struct trace_content *content;

    info.tid = tid;

    if (!info.exist[tid]) {
        printf("\tnew tid: %d\n", tid);

        if (info.max_tid_num < (tid + 1)) {
            info.max_tid_num = (tid + 1);
        }

        info.exist[tid] = 1;
    }

    for (i = 0; i < size; i++) {
        content = &buf[i];

        // content->tid = tid;

        /*assert(content->tid == tid);*/
        if (global_tunnc) {
            global_index[content->size] = content->address;
            assert(global_index[content->size] < 1 << 20);
            global_tunnc = 0;
            continue;
        } 
        if (!content->size) {
            i++;
            if (i < size) {
                global_index[buf[i].size] = buf[i].address;
                assert(global_index[buf[i].size] < 1 << 20);
            } else {
                global_tunnc == 1;
            }
        } else {
            /*assert(content->tid == tid);*/
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
}

static inline void module_detector_stage_three(uint8_t tid, 
        uint32_t size, struct trace_content *buf)
{
    uint32_t i;
    struct trace_content *content;

    info.tid = tid;

    if (!info.exist[tid]) {
        printf("\tnew tid: %d\n", tid);

        if (info.max_tid_num < (tid + 1)) {
            info.max_tid_num = (tid + 1);
        }

        info.exist[tid] = 1;
    }

    for (i = 0; i < size; i++) {
        content = &buf[i];

        if (!content->size) {
            i++;
            global_match_index[info.core_id][buf[i].size] = buf[i].address;
            assert(global_match_index[info.core_id][buf[i].size] < 1 << 20);
        } else {
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
}

void *module_pthread_stage_two(void *args)
{
    uint8_t i, j;
#if 1
    uint8_t cid, kid;
#endif
    volatile uint8_t tid;
    volatile uint32_t size;
    struct shared_trace_chunk *temp_chunk, *new_chunk;

    i = ((int *)args)[0];
    fprintf(stderr, "stage two : core %d start!\n", i);

    info.core_id = i;
    ppi_set_cpu_thread(STAGE_TWO_BASE_CPU_ID + i);

#if 1
    cid = 0;
    kid = 0;
#endif

    j = 0;

    while(1) {
        temp_chunk = &shared_buf.stage[0].core[i].chunk[j];

        if (temp_chunk->info->is_buf_full) {
            tid = temp_chunk->info->thread_id;
            size = temp_chunk->info->buf_size;

            new_chunk = &shared_buf.stage[1].core[cid].chunk[kid];
            while (new_chunk->info->is_buf_full);
            fill_index(new_chunk->global_index, global_index);
            new_chunk->global_tunnc = global_tunnc;

            module_detector_stage_two(tid, size, temp_chunk->buf);		

#if 1
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

    while(1) {
        temp_chunk = &shared_buf.stage[1].core[i].chunk[j];

        if (temp_chunk->info->is_buf_full) {
            tid = temp_chunk->info->thread_id;
            size = temp_chunk->info->buf_size;

            /*printf("stage 3 chunk: %d\n", j);*/
            fill_index(global_match_index[info.core_id], temp_chunk->global_index);
            if (temp_chunk->global_tunnc){
                temp_chunk->global_tunnc = 0;
                global_match_index[info.core_id][temp_chunk->buf->size] = temp_chunk->buf->address;
                module_detector_stage_three(tid, size, temp_chunk->buf + 1);		
            } else {
                module_detector_stage_three(tid, size, temp_chunk->buf);		
            }

            temp_chunk->info->thread_id = 0;
            temp_chunk->info->buf_size = 0;				

            temp_chunk->info->is_buf_full = 0;	

            j = (j + 1) % MAX_CHUNK_NUM;
        }
    }    
}

pthread_t pid[MAX_CORE_NUM];
int cid[MAX_CORE_NUM];

static inline void data_race_detector_stage()
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

    info.tid = tid;

    if (!info.exist[tid]) {
        printf("\tnew tid: %d\n", tid);

        if (info.max_tid_num < (tid + 1)) {
            info.max_tid_num = (tid + 1);
        }

        info.exist[tid] = 1;
    }

    for (i = 0; i < size; i++) {
        content = &buf[i];

        // content->tid = tid;

        if (!content->size) {
            i++;
            global_index[buf[i].size] = buf[i].address;
            global_match_index[buf[i].size] = global_index[buf[i].size];
            /*printf("timestamp tid: %d, index: %d\n", content->tid, global_index[content->tid]);*/
            assert(global_index[buf[i].size] < 1 << 20);
        } else {
            if (content->type == TRACE_MEM_LOAD) {
                module_history_load_record(content);
                module_filter_load_record(content);
                module_filter_load_match(content);
            } else if (content->type == TRACE_MEM_STORE) {
                module_history_store_record(content);
                module_filter_store_record(content);
                module_filter_store_match(content);
            } else {
                fprintf(stderr, "unknown type : %d\n", content->type);
                assert(0);
            }
        }
    }
}
#endif

void data_race_detector_init() 
{
    fprintf(stderr, "trace buf size : %d\n", TRACE_BUF_SIZE);
    fprintf(stderr, "trace content size : %d\n", sizeof(struct trace_content));
    module_race_init();
    module_info_init();
    module_filter_init();
    module_history_init();
#ifdef PPI_THREE_STAGE
    module_shared_buf_init(); 
    data_race_detector_stage();
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

void data_race_detector_report() 
{
#ifdef PPI_THREE_STAGE
    module_shared_buf_all_empty();
#endif
    module_race_print();
}

