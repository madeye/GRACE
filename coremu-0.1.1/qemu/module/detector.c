#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

#define PPI_TWO_STAGE

#ifdef PPI_TWO_STAGE
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

#include "process.h"

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

static inline void module_detector_start(uint8_t tid, 
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

#ifdef PPI_TWO_STAGE
    if (info.analysis_id == info.core_id) {
        for (i = 0; i < size; i++) {
            content = &buf[i];

            // content->tid = tid;

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
    } else {
        for (i = 0; i < size; i++) {
            content = &buf[i];

            // content->tid = tid;

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
#else
    for (i = 0; i < size; i++) {
        content = &buf[i];

        // content->tid = tid;

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
#endif
}

#ifdef PPI_TWO_STAGE
void *data_race_detector_pthread(void *args)
{
    uint8_t i, j;
    volatile uint8_t tid;
    volatile uint32_t size;
    struct shared_trace_chunk *temp_chunk;

    i = ((int)args);
    fprintf(stderr, "core %d start!\n", i);

    info.core_id = i;
    ppi_set_cpu_thread(STAGE_TWO_BASE_CPU_ID + i);

    j = 0;

    module_filter_init();
    module_history_init();

    while(1) {
        temp_chunk = &shared_buf.stage[0].core[i].chunk[j];

        if (temp_chunk->info->is_buf_full) {
            tid = temp_chunk->info->thread_id;
            size = temp_chunk->info->buf_size;
            info.analysis_id = temp_chunk->info->analysis_id;

            module_detector_start(tid, size, temp_chunk->buf);		

            temp_chunk->info->thread_id = 0;
            temp_chunk->info->buf_size = 0;				
            temp_chunk->info->analysis_id = 0;

            temp_chunk->info->is_buf_full = 0;	

            j = (j + 1) % MAX_CHUNK_NUM;
        }
    }    
}

pthread_t pid[MAX_CORE_NUM];

static inline void data_race_detector_stage()
{
    int i;

    /*ppi_set_cpu_thread(STAGE_ONE_BASE_CPU_ID);*/

    for (i = 0; i < MAX_CORE_NUM; i++) {
        pthread_create(&pid[i], NULL, data_race_detector_pthread, (void *)i);
    }
}
#endif

void data_race_detector_init() 
{
    module_race_init();
    module_info_init();
#ifdef PPI_TWO_STAGE
    module_shared_buf_init(); 
    data_race_detector_stage();
#else
    module_filter_init();
    module_history_init();
#endif
}

void data_race_detector(uint8_t tid, uint32_t size, struct trace_content *buf) 
{
#ifdef MOD_PROFILER
#ifdef PPI_TWO_STAGE
    struct trace_content *buf_ptr = buf;
    while (size > TRACE_SHARED_BUF_SIZE) {
        /*printf("\twarning : trace is too long! size : 0x%x\n", size);*/

        module_shared_buf_copy(tid, TRACE_SHARED_BUF_SIZE, buf_ptr);

        size -= TRACE_SHARED_BUF_SIZE;

        buf_ptr += TRACE_SHARED_BUF_SIZE;
        /*memcpy(buf, (buf + TRACE_SHARED_BUF_SIZE), size * sizeof(struct trace_content));*/
    }

    module_shared_buf_copy(tid, size, buf_ptr);
#else
    module_detector_start(tid, size, buf);
#endif
#endif
}

void data_race_detector_report() 
{
#ifdef PPI_TWO_STAGE
    module_shared_buf_all_empty();
#endif
    module_race_print();
}

