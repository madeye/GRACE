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
#include "stage_three_kernel.cu"

///////////////////////////////////////////////
// Test Functions 

/*#define COMPILE_TO_BINARY*/
#ifdef COMPILE_TO_BINARY

static void module_filter_store_record(
        struct global_page_filter *pfilter,
        struct trace_content *content) 
{
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    pfilter->thread[tid].entry[index].store = 1;
}

static void module_filter_load_record(
        struct global_page_filter *pfilter,
        struct trace_content *content) 
{
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    pfilter->thread[tid].entry[index].load = 1;
}

static void tool_global_page_filter_init(
        struct global_page_filter *pfilter,
        struct global_history_queue *history, int size)
{
    int t, h, i;

    /*for (t = 0; t < 2; t++)*/
        /*for (h = 0; h < MAX_HASH_NUM; h++)*/
            /*for (i = 0; i < size; i++)*/
            /*{*/
                /*module_filter_load_record(pfilter,*/
                        /*&history->thread[t].hash[h].load_entry[i].content);*/
            /*}*/
    for (t = 0; t < 2; t++)
        for (h = 0; h < MAX_HASH_NUM; h++)
        {
            pfilter->thread[t].entry[h].load = 1;
            printf("thread: %d, entry: %d, status: %d \n", 
                    t, h, pfilter->thread[t].entry[h].load);
        }
    

}

__host__ static void tool_global_timestamp_queue_init(
        struct timestamp_queue *gts_queue)
{
    gts_queue[0].entry[0].scalar[0] = 0;
    gts_queue[0].entry[0].scalar[1] = 0;
    gts_queue[0].entry[1].scalar[0] = 1;
    gts_queue[0].entry[1].scalar[1] = 1;
    gts_queue[0].entry[2].scalar[0] = 2;
    gts_queue[0].entry[2].scalar[1] = 1;
    gts_queue[0].entry[3].scalar[0] = 3;
    gts_queue[0].entry[3].scalar[1] = 3;
    gts_queue[0].entry[4].scalar[0] = 4;
    gts_queue[0].entry[4].scalar[1] = 4;

    gts_queue[1].entry[0].scalar[0] = 0;
    gts_queue[1].entry[0].scalar[1] = 0;
    gts_queue[1].entry[1].scalar[0] = 0;
    gts_queue[1].entry[1].scalar[1] = 1;
    gts_queue[1].entry[2].scalar[0] = 2;
    gts_queue[1].entry[2].scalar[1] = 2;
    gts_queue[1].entry[3].scalar[0] = 3;
    gts_queue[1].entry[3].scalar[1] = 3;
    gts_queue[1].entry[4].scalar[0] = 4;
    gts_queue[1].entry[4].scalar[1] = 4;
}

#define STRIDE 4

__host__ static void tool_global_history_queue_init(
        struct global_history_queue *history, int size)
{
    int t, h, i;

    printf("\nHistory Queue Entry :\n");
    printf("No\tAddress\tTid\tType\tSize\tIndex\tPC\n");

    for (t = 0; t < 2; t++)
        for (h = 0; h < MAX_HASH_NUM; h++)
            for (i = 0; i < size; i++)
            {
                history->thread[t].hash[h].load_entry[i].content.address = (i % STRIDE) << 2;
                history->thread[t].hash[h].load_entry[i].content.tid = 1;
                history->thread[t].hash[h].load_entry[i].content.type = 1;
                history->thread[t].hash[h].load_entry[i].content.size = 4;
                history->thread[t].hash[h].load_entry[i].content.index = (i / STRIDE);
                history->thread[t].hash[h].load_entry[i].content.pc = 0xf;

                printf("%d\t0x%llx\t%d\t%d\t%d\t%d\t0x%x\n", i, 
                        history->thread[t].hash[h].load_entry[i].content.address, 
                        history->thread[t].hash[h].load_entry[i].content.tid,
                        history->thread[t].hash[h].load_entry[i].content.type, 
                        history->thread[t].hash[h].load_entry[i].content.size,
                        history->thread[t].hash[h].load_entry[i].content.index, 
                        history->thread[t].hash[h].load_entry[i].content.pc);
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
        trace_buf[i].type = 2;
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
struct timestamp_queue *d_gtq;  
struct global_history_queue *d_ghq;
struct global_page_filter *d_pfilter;
struct global_race *d_result_queue;

struct global_history_queue *history; 
struct timestamp_queue *h_gtq; 
struct global_page_filter *pfilter;

int h_race_counter;

extern "C" void module_cuda_stage_three(int h_max_tid_num, 
        uint32_t size, struct trace_content *buf);

void module_cuda_stage_three(int h_max_tid_num, 
        uint32_t size, struct trace_content *buf)
{
    cudaFuncSetCacheConfig(module_cuda_stage_three_kernel, cudaFuncCachePreferL1); 

    CUDA_SAFE_CALL(cudaMemcpy(d_trace_buf, buf,
                size * sizeof(struct trace_content),
                cudaMemcpyHostToDevice));

    CUDA_SAFE_CALL(cudaMemcpyToSymbol(d_max_tid_num, &h_max_tid_num, 
                sizeof(int)));

    module_cuda_stage_three_kernel
        <<<(size + NUM_THREADS - 1) / NUM_THREADS, NUM_THREADS>>>
        (size, d_gtq, d_ghq, d_pfilter, d_trace_buf, d_result_queue);

    CUDA_SAFE_CALL(cudaThreadSynchronize());
    
}

extern "C" void module_cuda_free(
        /*struct global_history_queue *history, */
        /*[>struct timestamp_queue *h_gtq, <]*/
        /*struct global_page_filter *pfilter */
        ); 

void module_cuda_free(
        /*struct global_history_queue *history, */
        /*[>struct timestamp_queue *h_gtq, <]*/
        /*struct global_page_filter *pfilter */
        ) {

    CUDA_SAFE_CALL(cudaMemcpyFromSymbol(&h_race_counter, d_race_counter, sizeof(int)));
    printf("Dynamic Race Num: %d\n", h_race_counter);
    
    CUDA_SAFE_CALL(cudaFreeHost(h_gtq));
    CUDA_SAFE_CALL(cudaFreeHost(history));
    CUDA_SAFE_CALL(cudaFreeHost(pfilter));

    /*CUDA_SAFE_CALL(cudaFree(d_gtq));*/
    /*CUDA_SAFE_CALL(cudaFree(d_ghq));*/
    CUDA_SAFE_CALL(cudaFree(d_trace_buf));
    /*CUDA_SAFE_CALL(cudaFree(d_pfilter));*/
    CUDA_SAFE_CALL(cudaFree(d_result_queue));

}

extern "C" void module_cuda_init(
        /*struct global_history_queue *ghq, */
        /*struct timestamp_queue *gtq, */
        /*struct global_page_filter *pfilter */
        ); 

void module_cuda_init(
        /*struct global_history_queue *ghq, */
        /*struct timestamp_queue *gtq, */
        /*struct global_page_filter *pfilter */
        ) {

    /*cudaSetDevice(cutGetMaxGflopsDeviceId());*/
    cudaSetDeviceFlags( cudaDeviceMapHost );

    // Allocate for mapped memory
    CUDA_SAFE_CALL(cudaHostAlloc((void **)&h_gtq, sizeof(struct
                    timestamp_queue) * MAX_PROCESS_NUM, cudaHostAllocMapped));
    CUDA_SAFE_CALL(cudaHostAlloc((void **)&history, sizeof(struct
                    global_history_queue), cudaHostAllocMapped));
    CUDA_SAFE_CALL(cudaHostAlloc((void **)&pfilter, sizeof(struct
                    global_page_filter), cudaHostAllocMapped));

    // Return the host pointer
    /*gtq = h_gtq;*/
    /*ghq = history;*/
    /*pfilter = pfilter;*/

    // Init mapped memory
    memset(h_gtq, 0, sizeof(struct timestamp_queue) * MAX_PROCESS_NUM);
    memset(history, 0, sizeof(struct global_history_queue));
    memset(pfilter, 0, sizeof(struct global_page_filter));

    CUDA_SAFE_CALL(cudaHostGetDevicePointer((void **)&d_gtq,
                (void *)h_gtq, 0));
    CUDA_SAFE_CALL(cudaHostGetDevicePointer((void **)&d_ghq,
                (void *)history, 0));
    CUDA_SAFE_CALL(cudaHostGetDevicePointer((void **)&d_pfilter,
                (void *)pfilter, 0));

    /*CUDA_SAFE_CALL(cudaMalloc((void **)&d_gtq, */
                /*MAX_PROCESS_NUM * sizeof(struct timestamp_queue)));*/
    /*CUDA_SAFE_CALL(cudaMalloc((void **)&d_ghq, */
                /*sizeof(struct global_history_queue)));*/
    CUDA_SAFE_CALL(cudaMalloc((void **)&d_trace_buf, 
                TRACE_BUF_SIZE * sizeof(struct trace_content)));
    /*CUDA_SAFE_CALL(cudaMalloc((void **)&d_pfilter, */
                /*sizeof(struct global_page_filter)));*/
    CUDA_SAFE_CALL(cudaMalloc((void **)&d_result_queue,
                sizeof(struct global_race)));

    h_race_counter = 0;

    CUDA_SAFE_CALL(cudaMemcpyToSymbol(d_race_counter, &h_race_counter, 
                sizeof(int)));
    printf("\nglobal timestamp queue size : %d\n", 
            MAX_PROCESS_NUM * sizeof(struct timestamp_queue));

}

extern "C" void module_cuda_update(
        /*struct global_history_queue *history, */
        /*struct timestamp_queue *h_gtq */
        /*struct global_page_filter *pfilter*/
        ); 

void module_cuda_update(
        /*struct global_history_queue *history, */
        /*struct timestamp_queue *h_gtq */
        /*struct global_page_filter *pfilter*/
        ) { 

    /*CUDA_SAFE_CALL(cudaMemcpy(d_ghq, history,*/
                /*sizeof(struct global_history_queue),*/
                /*cudaMemcpyHostToDevice));*/

    /*CUDA_SAFE_CALL(cudaMemcpy(d_gtq, h_gtq,*/
                /*MAX_PROCESS_NUM * sizeof(struct timestamp_queue),*/
                /*cudaMemcpyHostToDevice));*/

    /*CUDA_SAFE_CALL(cudaMemcpy(d_pfilter, pfilter,*/
                /*sizeof(struct global_page_filter),*/
                /*cudaMemcpyHostToDevice));*/

}

#ifdef COMPILE_TO_BINARY
int main(int argc, char** argv)  
{
    struct global_history_queue *ghq = NULL;
    struct global_page_filter *pfilter = NULL;

    /*struct timestamp_queue *h_gtq = NULL;*/
    struct trace_content *h_trace_buf = NULL;
    int *h_result_queue = NULL;

    module_cuda_init(ghq, pfilter);

    /*h_gtq = (struct timestamp_queue *)malloc(*/
            /*MAX_PROCESS_NUM * sizeof(struct timestamp_queue));*/
    /*memset(h_gtq, 0, MAX_PROCESS_NUM * sizeof(struct timestamp_queue));*/
    tool_global_timestamp_queue_init(h_gtq);

    /*history = (struct global_history_queue *)malloc(*/
            /*sizeof(struct global_history_queue));*/
    /*memset(history, 0, */
            /*sizeof(struct global_history_queue));*/
    tool_global_history_queue_init(ghq, MAX_LOAD_QUEUE_SIZE);

    /*pfilter = (struct global_page_filter *)malloc(*/
            /*sizeof(struct global_page_filter));*/
    /*memset(pfilter, 0, */
            /*sizeof(struct global_page_filter));*/
    tool_global_page_filter_init(pfilter, ghq, MAX_LOAD_QUEUE_SIZE);

    h_trace_buf = (struct trace_content *)malloc(
            TRACE_BUF_SIZE * sizeof(struct trace_content));
    memset(h_trace_buf, 0, TRACE_BUF_SIZE * sizeof(struct trace_content));
    tool_trace_buf_init(h_trace_buf, TRACE_BUF_SIZE);

    h_result_queue = (int *)malloc(sizeof(int) * TRACE_BUF_SIZE);
    memset(h_result_queue, 0, sizeof(int) * TRACE_BUF_SIZE);

    module_cuda_update(ghq, h_gtq, pfilter);
    module_cuda_stage_three(2, TRACE_BUF_SIZE, h_trace_buf);

    CUDA_SAFE_CALL(cudaThreadSynchronize());
    CUDA_SAFE_CALL(cudaMemcpy(h_result_queue, d_result_queue,
                sizeof(struct global_race),
                cudaMemcpyDeviceToHost));

    tool_result_queue_print(h_result_queue, TRACE_BUF_SIZE);

    module_cuda_free();

    free(h_gtq);
    /*free(history);*/
    /*free(pfilter);*/
    free(h_trace_buf);
    free(h_result_queue);

    cudaThreadExit();
    //cutilExit(argc, argv);
}
#endif

