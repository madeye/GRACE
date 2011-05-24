#ifndef _HISTORY_KERNEL_H_
#define _HISTORY_KERNEL_H_

__device__ struct global_timestamp_queue gts;
__device__ struct global_history_queue gh;
__device__ struct global_page_filter gpf;
__device__ struct global_race_queue gr;

__constant__ int d_max_tid_num;

__device__ static inline int module_timestamp_order_on_cuda(
        uint8_t tid1, uint32_t index1, uint8_t tid2, uint32_t index2) 
{
    const struct timestamp *ts1 = &gts.thread[tid1].entry[index1];
    const struct timestamp *ts2 = &gts.thread[tid2].entry[index2];

    return (((ts1->scalar[tid1] < ts2->scalar[tid1]) && 
                (ts1->scalar[tid2] < ts2->scalar[tid2])) || 
            ((ts1->scalar[tid1] > ts2->scalar[tid1]) && 
             (ts1->scalar[tid2] > ts2->scalar[tid2])));
}

__device__ static inline int module_race_content_equal(
        struct trace_content *content1, struct trace_content *content2)
{
    if ((content1->type == content2->type) && 
            (content1->size == content2->size) && 
            (content1->pc == content2->pc)) {
        return 1;
    }

    return 0;
}


__device__ static inline void module_race_collection_on_cuda(
        struct trace_content *content1, struct trace_content *content2)
{
    uint32_t i;
    struct race_queue *temp_queue;

    temp_queue = &gr.thread[0];

    for (i = 0; i < temp_queue->count; i++) {
        if (module_race_content_equal(content1, 
                    &temp_queue->entry[i].content1) && 
                module_race_content_equal(content2, 
                    &temp_queue->entry[i].content2)) {
            temp_queue->entry[i].instance++;

            break;
        }
    }

    if (i >= temp_queue->count) {
        memcpy(&temp_queue->entry[i].content1, 
                content1, sizeof(struct trace_content));
        memcpy(&temp_queue->entry[i].content2, 
                content2, sizeof(struct trace_content));
        temp_queue->entry[i].instance++;

        temp_queue->count++;
    }

    gr.sum++;
}

__device__ static inline void module_match_with_load_on_cuda(
        struct trace_content *content, const uint8_t other_tid)
{
    uint64_t other_address;
    uint32_t other_index, last_index;
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;

    const uint8_t tid = content->tid;
    const uint64_t address = content->address;
    const uint32_t index = content->index;

    temp_queue = &gh.thread[other_tid].hash[(
            address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->load_tail;
    head = tail + 1;
    if (head == MAX_LOAD_QUEUE_SIZE) {
        head = 0;
    }

    /*last_index = gts.thread[other_tid].count;*/
    last_index = MAX_TIMESTAMP_NUM;

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_LOAD_QUEUE_SIZE;
        }
        tail--;

        temp_entry= &temp_queue->load_entry[tail];
        other_index = temp_entry->content.index;

        if (last_index != other_index) {
            if (module_timestamp_order_on_cuda(
                        other_tid, other_index, tid, index)) {
                break;
            }

            last_index = other_index;
        }

        other_address = temp_entry->content.address;

        if (address == other_address) {
            module_race_collection_on_cuda(&temp_entry->content, content);

            break;
        }
    }
}

__device__ static inline void module_match_with_store_on_cuda(
        struct trace_content *content, const uint8_t other_tid)
{
    uint64_t other_address;
    uint32_t other_index, last_index;
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;

    const uint8_t tid = content->tid;
    const uint64_t address = content->address;
    const uint32_t index = content->index;

    temp_queue = &gh.thread[other_tid].hash[(
            address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->store_tail;
    head = tail + 1;
    if (head == MAX_STORE_QUEUE_SIZE) {
        head = 0;
    }

    /*last_index = gts.thread[other_tid].count;*/
    last_index = MAX_TIMESTAMP_NUM;

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_STORE_QUEUE_SIZE;
        }
        tail--;

        temp_entry = &temp_queue->store_entry[tail];
        other_index = temp_entry->content.index;

        if (last_index != other_index) {
            if (module_timestamp_order_on_cuda(
                        other_tid, other_index, tid, index)) {
                break;
            }

            last_index = other_index;
        }

        other_address = temp_entry->content.address;

        if (address == other_address) {
            module_race_collection_on_cuda(&temp_entry->content, content);

            break;
        }
    }
}

__device__ static inline void module_filter_load_before_match_on_cuda(
        struct trace_content *content)
{
    const uint8_t tid = content->tid;
    const uint64_t address = content->address;
    const uint32_t index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    for (uint8_t i = 0; i < d_max_tid_num; i++) {
        if (i != tid) {
            if (gpf.thread[i].entry[index].store) {
                module_match_with_store_on_cuda(content, i);
            }
        }
    }
}


__device__ static inline void module_filter_store_before_match_on_cuda(
        struct trace_content *content)
{
    const uint8_t tid = content->tid;
    const uint64_t address = content->address;
    const uint32_t index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    for (uint8_t i = 0; i < d_max_tid_num; i++) {
        if (i != tid) {
            if (gpf.thread[i].entry[index].load) {
                module_match_with_load_on_cuda(content, i);
            }

            if (gpf.thread[i].entry[index].store) {
                module_match_with_store_on_cuda(content, i);
            }
        }
    }
}

__global__ static void module_match_with_trace_buf_on_cuda_r(
        int size, struct trace_content *trace_buf)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= size)
        return;

    struct trace_content *content = &trace_buf[i];
	module_filter_load_before_match_on_cuda(content);
}

__global__ static void module_match_with_trace_buf_on_cuda_w(
        int size, struct trace_content *trace_buf)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= size)
        return;

    struct trace_content *content = &trace_buf[i];

    module_filter_store_before_match_on_cuda(content);

}
__global__ static void module_match_with_trace_buf_on_cuda(
        int size, struct trace_content *trace_buf)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= size)
        return;

    struct trace_content *content = &trace_buf[i];

    if (content->type == TRACE_MEM_LOAD) {
        module_filter_load_before_match_on_cuda(content);
    } else if (content->type == TRACE_MEM_STORE) {
        module_filter_store_before_match_on_cuda(content);
    }
}

#endif /* _HISTORY_KERNEL_H_ */
