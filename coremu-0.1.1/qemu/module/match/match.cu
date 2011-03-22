#include <stdint.h>

#include <cutil_inline.h>

#include "data.h"
#include "match.h"
#include "match_kernel.cu"

#define TRACE_BUF_SIZE 1
#define HISTORY_QUEUE_SIZE 128

#define NUM_BLOCKS  1
#define NUM_THREADS HISTORY_QUEUE_SIZE

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

struct history_entry *d_history_queue;
struct trace_content *d_trace_buf;
int *d_result_queue;

__host__ void module_cuda_init_interface()
{
    cutilSafeCall(cudaMalloc((void **)&d_history_queue, 
                sizeof(struct history_entry) * HISTORY_QUEUE_SIZE));
    cutilSafeCall(cudaMalloc((void **)&d_trace_buf, 
                sizeof(struct trace_content)));
    cutilSafeCall(cudaMalloc((void **)&d_result_queue,
                sizeof(int) * HISTORY_QUEUE_SIZE));

    cudaSetDevice(cutGetMaxGflopsDeviceId());

    printf("\nglobal timestamp queue size : 0x%lx\n", 
            sizeof(struct global_timestamp_queue));
}

__host__ void module_cuda_free_interface()
{
    cutilSafeCall(cudaFree(d_history_queue));
    cutilSafeCall(cudaFree(d_trace_buf));
    cutilSafeCall(cudaFree(d_result_queue));
}

__host__ void module_cuda_timestamp_update_interface(
        struct global_timestamp_queue *h_gts_queue)
{
    cutilSafeCall(cudaMemcpyToSymbol(gts, h_gts_queue, 
                sizeof(struct global_timestamp_queue)));
}

__host__ void module_cuda_match_interface(
        struct history_entry *h_history_queue,
        struct trace_content *h_trace_buf,
        int *h_result_queue)
{
    cutilSafeCall(cudaMemcpy(d_history_queue, h_history_queue, 
                sizeof(struct history_entry) * HISTORY_QUEUE_SIZE, 
                cudaMemcpyHostToDevice));
    cutilSafeCall(cudaMemcpy(d_trace_buf, h_trace_buf, 
                sizeof(struct trace_content), 
                cudaMemcpyHostToDevice));

    module_match_on_cuda<<<NUM_BLOCKS, NUM_THREADS>>>(
            d_history_queue, d_trace_buf, d_result_queue);

    cutilSafeCall(cudaMemcpy(h_result_queue, d_result_queue, 
                sizeof(int) * HISTORY_QUEUE_SIZE, 
                cudaMemcpyDeviceToHost));
}

#ifdef COMPILE_TO_BINARY
int main(int argc, char** argv)  
{
    struct global_timestamp_queue *h_gts_queue;
    struct history_entry *h_history_queue;
    struct trace_content *h_trace_buf;
    int *h_result_queue;

    h_gts_queue = (struct global_timestamp_queue *)malloc(
            sizeof(struct global_timestamp_queue));
    memset(h_gts_queue, 0, sizeof(struct global_timestamp_queue));
    tool_global_timestamp_queue_init(h_gts_queue);

    h_history_queue = (struct history_entry *)malloc(
            sizeof(struct history_entry) * HISTORY_QUEUE_SIZE);
    memset(h_history_queue, 0, 
            sizeof(struct history_entry) * HISTORY_QUEUE_SIZE);
    tool_history_queue_init(h_history_queue, HISTORY_QUEUE_SIZE);

    h_trace_buf = (struct trace_content *)malloc(
            sizeof(struct trace_content));
    memset(h_trace_buf, 0, sizeof(struct trace_content));
    tool_trace_buf_init(h_trace_buf, TRACE_BUF_SIZE);

    h_result_queue = (int *)malloc(sizeof(int) * HISTORY_QUEUE_SIZE);
    memset(h_result_queue, 0, sizeof(int) * HISTORY_QUEUE_SIZE);

    module_cuda_init_interface();
    module_cuda_timestamp_update_interface(h_gts_queue);
    module_cuda_match_interface(h_history_queue, h_trace_buf, h_result_queue);
    module_cuda_free_interface();

    tool_result_queue_print(h_result_queue, HISTORY_QUEUE_SIZE);

    free(h_history_queue);
    free(h_trace_buf);
    free(h_result_queue);

    cudaThreadExit();
    //cutilExit(argc, argv);
}
#endif

