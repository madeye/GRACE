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
        struct global_history_queue *h_ghq, int size)
{
    int t, h, i;

    printf("\nHistory Queue Entry :\n");
    printf("No\tAddress\tTid\tType\tSize\tIndex\tPC\n");

    for (t = 0; t < 2; t++)
        for (h = 0; h < MAX_HASH_NUM; h++)
            for (i = 0; i < size; i++)
            {
                h_ghq->thread[t].hash[h].load_entry[i].content.address = (i % STRIDE) << 2;
                h_ghq->thread[t].hash[h].load_entry[i].content.tid = 1;
                h_ghq->thread[t].hash[h].load_entry[i].content.type = 2;
                h_ghq->thread[t].hash[h].load_entry[i].content.size = 4;
                h_ghq->thread[t].hash[h].load_entry[i].content.index = (i / STRIDE);
                h_ghq->thread[t].hash[h].load_entry[i].content.pc = 0xf;

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

struct trace_content *d_trace_buf;
struct global_timestamp_queue *d_gtq;  
struct global_history_queue *d_ghq;

extern "C" void module_cuda_stage_three(int h_max_tid_num, 
        uint32_t size, struct trace_content *buf, int *result_queue);

void module_cuda_stage_three(int h_max_tid_num, 
        uint32_t size, struct trace_content *buf, int *result_queue)
{
    uint32_t i;

    CUDA_SAFE_CALL(cudaMemcpy(d_trace_buf, buf,
                size * sizeof(struct trace_content),
                cudaMemcpyHostToDevice));

    CUDA_SAFE_CALL(cudaMemcpyToSymbol(d_max_tid_num, h_max_tid_num, 
                sizeof(int)));

    module_cuda_stage_three_kernel
        <<<(size + NUM_THREADS - 1) / NUM_THREADS, NUM_THREADS>>>
        (size, d_gtq, d_ghq, d_trace_buf, d_result_queue);
    
}

extern "C" void module_cuda_free(); 

void module_cuda_free() {

    cutilSafeCall(cudaFree(d_gtq));
    cutilSafeCall(cudaFree(d_ghq));
    cutilSafeCall(cudaMalloc(d_trace_buf));
    /*cutilSafeCall(cudaMalloc((void **)&d_result_queue,*/
                /*sizeof(int) * HISTORY_QUEUE_SIZE));*/

}

extern "C" void module_cuda_init(); 

void module_cuda_init() {

    cutilSafeCall(cudaMalloc((void **)&d_gtq, 
                sizeof(struct global_timestamp_queue)));
    cutilSafeCall(cudaMalloc((void **)&d_ghq, 
                sizeof(struct global_history_queue)));
    cutilSafeCall(cudaMalloc((void **)&d_trace_buf, 
                TRACE_BUF_SIZE * sizeof(struct trace_content)));
    /*cutilSafeCall(cudaMalloc((void **)&d_result_queue,*/
                /*sizeof(int) * HISTORY_QUEUE_SIZE));*/

    cudaSetDevice(cutGetMaxGflopsDeviceId());

    printf("\nglobal timestamp queue size : 0x%lx\n", 
            sizeof(struct global_timestamp_queue));

}

extern "C" void module_cuda_update(
        struct global_history_queue *h_ghq 
        struct global_timestamp_queue *h_gtq); 

void module_cuda_update(
        struct global_history_queue *h_ghq 
        struct global_timestamp_queue *h_gtq) {

    CUDA_SAFE_CALL(cudaMemcpy(d_ghq, h_ghq,
                sizeof(struct global_history_queue),
                cudaMemcpyHostToDevice))

    CUDA_SAFE_CALL(cudaMemcpy(d_gtq, h_gtq,
                sizeof(struct global_timestamp_queue),
                cudaMemcpyHostToDevice))

}

#ifdef COMPILE_TO_BINARY
int main(int argc, char** argv)  
{
    struct global_timestamp_queue *h_gtq;
    struct global_history_queue *h_ghq;
    struct trace_content *h_trace_buf;
    int *h_result_queue;

    h_gtq = (struct global_timestamp_queue *)malloc(
            sizeof(struct global_timestamp_queue));
    memset(h_gts_queue, 0, sizeof(struct global_timestamp_queue));
    tool_global_timestamp_queue_init(h_gtq);

    h_ghq = (struct history_entry *)malloc(
            sizeof(struct global_history_queue));
    memset(h_history_queue, 0, 
            sizeof(struct global_history_queue));
    tool_history_queue_init(h_ghq, sizeof(struct global_history_queue));

    h_trace_buf = (struct trace_content *)malloc(
            TRACE_BUF_SIZE * sizeof(struct trace_content));
    memset(h_trace_buf, 0, TRACE_BUF_SIZE * sizeof(struct trace_content));
    tool_trace_buf_init(h_trace_buf, TRACE_BUF_SIZE);

    h_result_queue = (int *)malloc(sizeof(int) * TRACE_BUF_SIZE);
    memset(h_result_queue, 0, sizeof(int) * TRACE_BUF_SIZE);

    module_cuda_init();
    module_cuda_update(h_ghq, h_gtq);
    module_cuda_stage_three(0, TRACE_BUF_SIZE, h_trace_buf, h_result_queue);
    module_cuda_free();

    tool_result_queue_print(h_result_queue, TRACE_BUF_SIZE);

    free(h_history_queue);
    free(h_trace_buf);
    free(h_result_queue);

    cudaThreadExit();
    //cutilExit(argc, argv);
}
#endif

