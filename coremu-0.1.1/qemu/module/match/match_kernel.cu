#ifndef _HISTORY_KERNEL_H_
#define _HISTORY_KERNEL_H_

__constant__ struct global_timestamp_queue gts;

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

__global__ static void module_match_on_cuda(
        struct history_entry *history_queue, 
        struct trace_content *trace_buf, 
        int *result_queue)
{
    const int x = threadIdx.x;

    struct trace_content *temp_entry = &history_queue[x].content;
    const int other_tid = temp_entry->tid;
    const int other_index = temp_entry->index;
    const int other_address = temp_entry->address;

    struct trace_content *temp_content = &trace_buf[0];
    const int self_tid = temp_content->tid;
    const int self_index = temp_content->index;
    const int self_address = temp_content->address;

#if 0
    result_queue[x] = (self_address == other_address) &&
        !module_timestamp_order_on_cuda(other_tid, other_index, self_tid, self_index);
#else
    result_queue[x] = 1;
#endif
}

#endif /* _HISTORY_KERNEL_H_ */
