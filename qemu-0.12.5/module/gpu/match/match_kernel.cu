#ifndef _HISTORY_KERNEL_H_
#define _HISTORY_KERNEL_H_

__constant__ uint8_t d_max_tid_num;

#include "../../cpu/detector/race.c"
#include "../../cpu/detector/timestamp.c"
#include "../../cpu/detector/history.c"
#include "../../cpu/detector/filter.c"

__global__ static void module_match_with_trace_buf_on_cuda(
        uint32_t size, struct trace_content *trace_buf)
{
    const uint32_t i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i >= size)
        return;

    struct trace_content *content = &trace_buf[i];

    if (content->type == TRACE_MEM_LOAD) {
        module_filter_load_match(content);
    } else if (content->type == TRACE_MEM_STORE) {
        module_filter_store_match(content);
    }
}

#endif /* _HISTORY_KERNEL_H_ */
