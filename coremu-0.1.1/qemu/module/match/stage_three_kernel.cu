////////////////////////////////////////////////////////////////////////////////
// Stage Three Kernel 
// include filter / match stage 
// Author: Max
// Revision: 0.1
////////////////////////////////////////////////////////////////////////////////

#include "structs.h"

#define NUM_THREADS 32

#define SHARED_MEMORY

__constant__ int d_max_tid_num;
__device__ int d_race_counter;

#define cudaAssert(condition) \
    if (!(condition)) { asm("trap;"); }

///////////////////////////////////////////////
// Race Collection Device Functions 

/*__device__ inline void module_race_collection(struct trace_content *content1, struct trace_content *content2, ) */
/*{*/
/*int i;*/
/*struct race_queue *temp_queue;*/

/*if (i >= temp_queue->count) {*/
/*memcpy(&temp_queue->entry[i].content1, content1, sizeof(struct trace_content));*/
/*memcpy(&temp_queue->entry[i].content2, content2, sizeof(struct trace_content));*/
/*temp_queue->entry[i].instance++;*/

/*temp_queue->count++;*/
/*if (temp_queue->count >= MAX_RACE_NUM) {*/
/*fprintf(stderr, "race queue overflow!\n");*/
/*assert(0);*/
/*}*/
/*}*/
/*}*/

///////////////////////////////////////////////
// History Stage Device Functions 

/*__device__ inline void module_history_load_record(struct trace_content *content) */
/*{*/
/*uint8_t tid;*/
/*uint64_t address;*/
/*struct history_queue *temp_queue;*/
/*uint32_t tail;*/
/*struct history_entry *temp_entry;*/

/*tid = content->tid;*/
/*address = content->address;*/

/*temp_queue = &(history.thread[tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM]);*/

/*tail = temp_queue->load_tail;	*/
/*temp_entry = &temp_queue->load_entry[tail];*/

/*// memcpy(&temp_entry->content, content, sizeof(struct trace_content));*/
/*temp_entry->content.tid = content->tid;*/
/*temp_entry->content.type = content->type;*/
/*temp_entry->content.size = content->size;*/
/*temp_entry->content.address = content->address;*/
/*temp_entry->content.index = content->index;*/
/*temp_entry->content.pc = content->pc;*/

/*//tail++;*/
/*//if (tail >= MAX_LOAD_QUEUE_SIZE) {*/
/*//    tail = 0;*/
/*//}*/
/*//temp_queue->load_tail = tail;*/
/*temp_queue->load_tail = (tail + 1) % MAX_LOAD_QUEUE_SIZE;*/
/*}*/

/*__device__ inline void module_history_store_record(struct trace_content *content) */
/*{*/
/*uint8_t tid;*/
/*uint64_t address;*/
/*struct history_queue *temp_queue;*/
/*uint32_t tail;*/
/*struct history_entry *temp_entry;*/

/*tid = content->tid;*/
/*address = content->address;*/

/*temp_queue = &(d_ghq->thread[tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM]);*/

/*tail = temp_queue->store_tail;*/
/*temp_entry = &temp_queue->store_entry[tail];*/

/*// memcpy(&temp_entry->content, content, sizeof(struct trace_content));*/
/*temp_entry->content.tid = content->tid;*/
/*temp_entry->content.type = content->type;*/
/*temp_entry->content.size = content->size;*/
/*temp_entry->content.address = content->address;*/
/*temp_entry->content.index = content->index;*/
/*temp_entry->content.pc = content->pc;*/

/*//tail++;*/
/*//if (tail >= MAX_STORE_QUEUE_SIZE) {*/
/*//    tail = 0;*/
/*//}*/
/*//temp_queue->store_tail = tail;*/
/*temp_queue->store_tail = (tail + 1) % MAX_STORE_QUEUE_SIZE;*/
/*}*/

///////////////////////////////////////////////
// Match Stage Device Functions 

__device__ inline int module_timestamp_order(
        struct timestamp_queue *d_gtq,
        uint8_t tid1, uint32_t index1, 
        uint8_t tid2, uint32_t index2) 
{
    struct timestamp *ts1, *ts2;

    ts1 = &d_gtq[tid1].entry[index1];
    ts2 = &d_gtq[tid2].entry[index2];

    return  ( (ts1->scalar[tid1] < ts2->scalar[tid1])
                && (ts1->scalar[tid2] < ts2->scalar[tid2]) ) || 
            ( (ts1->scalar[tid1] > ts2->scalar[tid1]) 
              &&(ts1->scalar[tid2] > ts2->scalar[tid2]) ); 

}

__device__ inline void module_match_with_load(
        struct timestamp_queue *d_gtq,
        struct global_history_queue *d_ghq,
        struct trace_content *content,
        uint8_t other_tid, 
        struct race_entry *d_result_queue)
{
    uint8_t tid;
    uint64_t address, other_address;
    uint32_t index, other_index;
    /*uint32_t last_index;*/
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;
    /*const int i = blockIdx.x * NUM_THREADS + threadIdx.x;*/

    tid = content->tid;
    address = content->address;
    index = content->index;

    temp_queue = &(d_ghq->thread[other_tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM]);

    tail = temp_queue->load_tail;
    head = tail + 1;
    if (head == MAX_LOAD_QUEUE_SIZE) {
        head = 0;
    }

    /*last_index = d_gtq[other_tid].count;*/
    /*last_index = 0;*/

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_LOAD_QUEUE_SIZE;
        }
        tail--;

        temp_entry= &temp_queue->load_entry[tail];

        other_index = temp_entry->content.index;

        /*if (last_index != other_index) {*/
            if (module_timestamp_order(d_gtq, other_tid, other_index, tid, index)) {
                break;
            }

            /*last_index = other_index;*/
        /*}*/

        other_address = temp_entry->content.address;

        if (address == other_address) {
            /*module_race_collection(&temp_entry->content, content);*/
            int index = atomicAdd(&d_race_counter, 1);
            /*d_result_queue[index].ts1 = d_gtq[tid].entry[temp_entry->content.index];*/
            /*d_result_queue[index].ts2 = d_gtq[tid].entry[content->index];*/
            d_result_queue[index].pc1 = temp_entry->content.pc;
            d_result_queue[index].pc2 = content->pc;
            d_result_queue[index].address = address;
            break;
        }
    }
}

__device__ inline void module_match_with_store(
        struct timestamp_queue *d_gtq,
        struct global_history_queue *d_ghq,
        struct trace_content *content,
        uint8_t other_tid, 
        struct race_entry *d_result_queue)
{
    uint8_t tid;
    uint64_t address, other_address;
    uint32_t index, other_index;
    /*uint32_t last_index;*/
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;
    /*const int i = blockIdx.x * NUM_THREADS + threadIdx.x;*/

    tid = content->tid;
    address = content->address;
    index = content->index;

    temp_queue = &(d_ghq->thread[other_tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM]);
    cudaAssert((address >> HASH_BASE_BIT) % MAX_HASH_NUM < MAX_HASH_NUM);
    /*temp_queue = &(d_ghq->thread[other_tid].hash[0]);*/

    tail = temp_queue->store_tail;
    head = tail + 1;
    if (head == MAX_STORE_QUEUE_SIZE) {
        head = 0;
    }

    /*last_index = d_gtq[other_tid].count;*/
    /*last_index = 0;*/

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_STORE_QUEUE_SIZE;
        }
        tail--;

        temp_entry = &temp_queue->store_entry[tail];

        other_index = temp_entry->content.index;  

        /*if (last_index != other_index) {*/
            if (module_timestamp_order(d_gtq, other_tid, other_index, tid, index)) {
                break;
            }

            /*last_index = other_index;*/
        /*}*/

        other_address = temp_entry->content.address;

        if (address == other_address) {
            /*module_race_collection(&temp_entry->content, content);*/
            /*d_result_queue[i] = 1;*/
            int index = atomicAdd(&d_race_counter, 1);
            /*d_result_queue[index].ts1 = d_gtq[tid].entry[temp_entry->content.index];*/
            /*d_result_queue[index].ts2 = d_gtq[tid].entry[content->index];*/
            d_result_queue[index].pc1 = temp_entry->content.pc;
            d_result_queue[index].pc2 = content->pc;
            d_result_queue[index].address = address;
            break;
        } 
    }
}

///////////////////////////////////////////////
// Filter Stage Device Functions 

__device__ inline void module_filter_load_match(
        struct timestamp_queue *d_gtq,
        struct global_history_queue *d_ghq,
        struct global_page_filter *d_pfilter,
        struct trace_content *content, 
        struct race_entry *d_result_queue)
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
            if (d_pfilter->thread[i].entry[index].store) {
                module_match_with_store(d_gtq, d_ghq, content, i, d_result_queue);
            }
        }
    }
}

__device__ inline void module_filter_store_match(
        struct timestamp_queue *d_gtq,
        struct global_history_queue *d_ghq,
        struct global_page_filter *d_pfilter,
        struct trace_content *content, 
        struct race_entry *d_result_queue)
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
            if (d_pfilter->thread[i].entry[index].load) {
                module_match_with_load(d_gtq, d_ghq, content, i, d_result_queue);
            }

            if (d_pfilter->thread[i].entry[index].store) {
                module_match_with_store(d_gtq, d_ghq, content, i, d_result_queue);
            }
        }
    }
}


///////////////////////////////////////////////
// Stage Three Kernel 

__global__ void module_cuda_stage_three_kernel( 
        int size,
        struct timestamp_queue *d_gtq,
        struct global_history_queue *d_ghq,
        struct global_page_filter *d_pfilter,
        struct trace_content *buf,
        struct race_entry *d_result_queue)
{
#ifdef SHARED_MEMORY
    __shared__ struct trace_content content [NUM_THREADS];
#else
    struct trace_content *content;
#endif
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;
    /*int i = threadIdx.x;*/
    if (i >= size)
        return;

#ifdef SHARED_MEMORY

    content[tid] = buf[i];

    if (content[tid].type == TRACE_MEM_LOAD) {
        module_filter_load_match(d_gtq, d_ghq, d_pfilter, &content[tid],
                d_result_queue);
    } else if (content[tid].type == TRACE_MEM_STORE) {
        module_filter_store_match(d_gtq, d_ghq, d_pfilter, &content[tid],
                d_result_queue);
    } else {
    }
#else
    content = &buf[i];

    if (content->type == TRACE_MEM_LOAD) {
        module_filter_load_match(d_gtq, d_ghq, d_pfilter, content,
                d_result_queue);
    } else if (content->type == TRACE_MEM_STORE) {
        module_filter_store_match(d_gtq, d_ghq, d_pfilter, content,
                d_result_queue);
    } else {
    }
#endif

}

