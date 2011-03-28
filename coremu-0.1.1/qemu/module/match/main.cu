////////////////////////////////////////////////////////////////////////////////
// Stage Three CUDA Interface 
// include timestamp / history / filter 
// Author: Max
// Revision: 0.1
////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////
// Included Headers 

#include <stdint.h>


#include <cutil_inline.h>

#include "../interface.h"
#include "../info.c"
#include "stage_three_kernel.cu"

///////////////////////////////////////////////
// Test Functions 

//#define COMPILE_TO_BINARY
#ifdef COMPILE_TO_BINARY
__host__ static void tool_global_timestamp_queue_init(
        struct global_timestamp_queue *gts_queue)
{
    gts_queue->thread[0].entry[0].scalar[0] = 0;
    gts_queue->thread[0].entry[0].scalar[1] = 0;
    gts_queue->thread[0].entry[1].scalar[0] = 1;
    gts_queue->thread[0].entry[1].scalar[1] = 1;
    gts_queue->thread[0].entry[2].scalar[0] = 2;
    gts_queue->thread[0].entry[2].scalar[1] = 1;
    gts_queue->thread[0].entry[3].scalar[0] = 3;
    gts_queue->thread[0].entry[3].scalar[1] = 3;
    gts_queue->thread[0].entry[4].scalar[0] = 4;
    gts_queue->thread[0].entry[4].scalar[1] = 4;

    gts_queue->thread[1].entry[0].scalar[0] = 0;
    gts_queue->thread[1].entry[0].scalar[1] = 0;
    gts_queue->thread[1].entry[1].scalar[0] = 0;
    gts_queue->thread[1].entry[1].scalar[1] = 1;
    gts_queue->thread[1].entry[2].scalar[0] = 2;
    gts_queue->thread[1].entry[2].scalar[1] = 2;
    gts_queue->thread[1].entry[3].scalar[0] = 3;
    gts_queue->thread[1].entry[3].scalar[1] = 3;
    gts_queue->thread[1].entry[4].scalar[0] = 4;
    gts_queue->thread[1].entry[4].scalar[1] = 4;
}

#define STRIDE 4

__host__ static void tool_history_queue_init(
        struct history_entry *history_queue, int size)
{
    int i;

    printf("\nHistory Queue Entry :\n");
    printf("No\tAddress\tTid\tType\tSize\tIndex\tPC\n");

    for (i = 0; i < size; i++)
    {
        history_queue[i].content.address = (i % STRIDE) << 2;
        history_queue[i].content.tid = 1;
        history_queue[i].content.type = 2;
        history_queue[i].content.size = 4;
        history_queue[i].content.index = (i / STRIDE);
        history_queue[i].content.pc = 0xf;

        printf("%d\t0x%llx\t%d\t%d\t%d\t%d\t0x%x\n", i, 
                history_queue[i].content.address, history_queue[i].content.tid,
                history_queue[i].content.type, history_queue[i].content.size,
                history_queue[i].content.index, history_queue[i].content.pc);
    }
}

__host__ static void tool_trace_buf_init(
        struct trace_content *trace_buf, int size)
{
    int i;

    printf("\nTrace Queue Content :\n");
    printf("No\tAddress\tTid\tType\tSize\tIndex\tPC\n");

    for (i = 0; i < size; i++)
    {
        trace_buf[i].address = (STRIDE >> 1) << 2;
        trace_buf[i].tid = 0;
        trace_buf[i].type = 1;
        trace_buf[i].size = 4;
        trace_buf[i].index = 1;
        trace_buf[i].pc = 0x4;

        printf("%d\t0x%llx\t%d\t%d\t%d\t%d\t0x%x\n", i, 
                trace_buf[i].address, trace_buf[i].tid, 
                trace_buf[i].type, trace_buf[i].size, 
                trace_buf[i].index, trace_buf[i].pc);
    }
}

__host__ static void tool_result_queue_print(
        int *result_queue, int size)
{
    int i;

    printf("\nResult Queue Entry :\n");
    printf("No\tResult\n");

    for (i = 0; i < size; i++)
    {
        printf("%d\t%d\n", i, result_queue[i]);
    }
}
#endif

///////////////////////////////////////////////
// Global Device Data Structure 

struct trace_content *d_buf;
struct global_timestamp_queue *d_timestamp;  
struct global_history_queue *d_history;

extern "C" void module_detector_stage_three_cuda(uint8_t tid, 
        uint32_t size, struct trace_content *buf);

void module_detector_stage_three_cuda(uint8_t tid, 
        uint32_t size, struct trace_content *buf)
{
    uint32_t i;

    CUDA_SAFE_CALL(cudaMalloc((void **) &d_buf,
                size * sizeof(struct trace_content)));
    CUDA_SAFE_CALL(cudaMemcpy(d_buf, buf,
                size * sizeof(struct trace_content),
                cudaMemcpyHostToDevice))
    
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

extern "C" void module_detector_init_cuda(); 

void module_detector_init_cuda() {

    cutilSafeCall(cudaMalloc((void **)&d_history_queue, 
                sizeof(struct global_history_queue)));
    cutilSafeCall(cudaMalloc((void **)&d_trace_buf, 
                TRACE_BUF_SIZE * sizeof(struct trace_content)));
    /*cutilSafeCall(cudaMalloc((void **)&d_result_queue,*/
                /*sizeof(int) * HISTORY_QUEUE_SIZE));*/

    cudaSetDevice(cutGetMaxGflopsDeviceId());

    printf("\nglobal timestamp queue size : 0x%lx\n", 
            sizeof(struct global_timestamp_queue));

}

extern "C" void module_detector_update_cuda(uint8_t tid, 
        uint32_t size, struct trace_content *buf);

void module_detector_update_cuda(
        struct global_history_queue *h_hq 
        struct global_timestamp_queue *h_tq) {


}
