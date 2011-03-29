////////////////////////////////////////////////////////////////////////////////
// Stage Three Kernel 
// include filter / match stage 
// Author: Max
// Revision: 0.1
////////////////////////////////////////////////////////////////////////////////

#include "structs.h"

#define NUM_THREADS 32

__device__ struct global_history_queue *ghq;
__device__ struct global_timestamp_queue * gtq;
__device__ struct global_page_filter *pfilter;
__constant__ int d_max_tid_num;


///////////////////////////////////////////////
// Match Stage Device Functions 

__device__ inline int module_timestamp_order(uint8_t tid1, uint32_t index1, 
        uint8_t tid2, uint32_t index2) 
{
    struct timestamp *ts1, *ts2;

    ts1 = &gtq->thread[tid1].entry[index1];
    ts2 = &gtq->thread[tid2].entry[index2];

    if ( ( (ts1->scalar[tid1] < ts2->scalar[tid1])
        && (ts1->scalar[tid2] < ts2->scalar[tid2]) ) || 
         ( (ts1->scalar[tid1] > ts2->scalar[tid1]) 
         &&(ts1->scalar[tid2] > ts2->scalar[tid2]) ) ) {
        return 1;
    }

    return 0;
}

__device__ inline void module_match_with_load(struct trace_content *content, uint8_t other_tid) 
{
    uint8_t tid;
    uint64_t address, other_address;
    uint32_t index, other_index, last_index;
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address = content->address;
    index = content->index;

    temp_queue = &(ghq->thread[other_tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM]);

    tail = temp_queue->load_tail;
    head = tail + 1;
    if (head == MAX_LOAD_QUEUE_SIZE) {
        head = 0;
    }

    last_index = gtq->thread[other_tid].count;

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_LOAD_QUEUE_SIZE;
        }
        tail--;

        temp_entry= &temp_queue->load_entry[tail];

        other_index = temp_entry->content.index;

        if (last_index != other_index) {
            if (module_timestamp_order(other_tid, other_index, tid, index)) {
                break;
            }

            last_index = other_index;
        }

        other_address = temp_entry->content.address;

        if (address == other_address) {
            /*module_race_collection(&temp_entry->content, content);*/

            break;
        }
    }
}

__device__ inline void module_match_with_store(struct trace_content *content, uint8_t other_tid) 
{
    uint8_t tid;
    uint64_t address, other_address;
    uint32_t index, other_index, last_index;
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address = content->address;
    index = content->index;

    temp_queue = &(ghq->thread[other_tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM]);

    tail = temp_queue->store_tail;
    head = tail + 1;
    if (head == MAX_STORE_QUEUE_SIZE) {
        head = 0;
    }

    last_index = gtq->thread[other_tid].count;

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_STORE_QUEUE_SIZE;
        }
        tail--;

        temp_entry = &temp_queue->store_entry[tail];

        other_index = temp_entry->content.index;  

        if (last_index != other_index) {
            if (module_timestamp_order(other_tid, other_index, tid, index)) {   
                break;
            }

            last_index = other_index;
        }

        other_address = temp_entry->content.address;

        if (address == other_address) {
            /*module_race_collection(&temp_entry->content, content);*/

            break;
        } 
    }
}

///////////////////////////////////////////////
// Filter Stage Device Functions 

__device__ inline void module_filter_load_match(struct trace_content *content) 
{
    uint8_t i;
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    for (i = 0; i < d_max_tid_num; i++) {
        if (i != tid) {
            if (pfilter->thread[i].entry[index].store) {
                module_match_with_store(content, i);
            }
        }
    }
}

__device__ inline void module_filter_store_match(struct trace_content *content) 
{
    uint8_t i;
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    for (i = 0; i < d_max_tid_num; i++) {
        if (i != tid) {
            if (pfilter->thread[i].entry[index].load) {
                module_match_with_load(content, i);
            }

            if (pfilter->thread[i].entry[index].store) {
                module_match_with_store(content, i);
            }
        }
    }
}


///////////////////////////////////////////////
// Stage Three Kernel 

__global__ void module_cuda_stage_three_kernel( 
        int size,
        struct global_timestamp_queue *d_gtq,
        struct global_history_queue *d_ghq,
        struct global_page_filter *d_pfilter,
        struct trace_content *buf,
        int *d_result_queue)
{
    struct trace_content *content;
    const int i = blockIdx.x * NUM_THREADS + threadIdx.x;
    if (i >= size)
        return;

    ghq = d_ghq;
    gtq = d_gtq;
    pfilter = d_pfilter;

    /*for (i = 0; i < size; i++) {*/
    content = &buf[i];

    if (content->type == TRACE_MEM_LOAD) {
        module_filter_load_match(content);
    } else if (content->type == TRACE_MEM_STORE) {
        module_filter_store_match(content);
    } else {
        /*fprintf(stderr, "unknown type : %d\n", content->type);*/
        /*assert(0);*/
    }
    /*}*/
}

