#include <stdint.h>

#include <cutil_inline.h>

#include "../interface.h"
#include "data.h"
#include "match.h"
#include "match_kernel.cu"

int numThreads = 256;
int numBlocks = 1024;

struct trace_content *d_trace_buf;
#ifdef PPI_THREE_STAGE
struct trace_content *cuda_buf;
#endif

uint32_t old_index[MAX_PROCESS_NUM];

__host__ void module_cuda_tid_update_interface(int h_max_tid_num) {

    CUDA_SAFE_CALL(cudaMemcpyToSymbol(d_max_tid_num, &h_max_tid_num, 
                sizeof(int)));

}

__host__ void module_cuda_config_register(int _numThreads)
{
    numThreads = _numThreads;
#if 1
    printf("\ncuda : thread number for each block : %d\n", numThreads);
#endif
}

#ifdef KERNEL_TIME
    cudaEvent_t start;
    cudaEvent_t stop;
    float cuda_time = 0.f;
#endif

__host__ void module_cuda_init_interface()
{
    cudaSetDevice(cutGetMaxGflopsDeviceId());

#ifdef KERNEL_TIME
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
#endif

    memset (old_index, 0, MAX_PROCESS_NUM * sizeof(uint32_t));

#define TRACE_CUDA_BUF_SIZE (16 * 1024 * 1024)

    cutilSafeCall(cudaMalloc((void **)&d_trace_buf, 
                sizeof(struct trace_content) * TRACE_CUDA_BUF_SIZE));

#ifdef PPI_THREE_STAGE
    cutilSafeCall(cudaHostAlloc((void **)&cuda_buf, sizeof(struct trace_content) * TRACE_BUF_CUDA_SIZE * 2, cudaHostAllocDefault));
#else
    cuda_buf = (struct trace_content *) malloc (sizeof(struct trace_content) *
            TRACE_BUF_SIZE * 2);
#endif

#if 1
    printf("\ncuda : global timestamp queue size : 0x%lx\n", 
            sizeof(struct global_timestamp_queue));
    printf("cuda : global history queue size : 0x%lx\n", 
            sizeof(struct global_history_queue));
    printf("cuda : global page filter size : 0x%lx\n", 
            sizeof(struct global_page_filter));
    printf("cuda : global race queue size : 0x%lx\n", 
            sizeof(struct global_race_queue));
#endif
}

__host__ void module_cuda_free_interface()
{
    cutilSafeCall(cudaFree(d_trace_buf));
    cutilSafeCall(cudaFreeHost(cuda_buf));

    printf("CUDA Time: %.2fs\n", cuda_time / 1000.0);
}

__host__ void module_cuda_global_timestamp_queue_update_interface(
        struct global_timestamp_queue *h_gts_queue)
{
    cutilSafeCall(cudaMemcpyToSymbol(gts, h_gts_queue, 
                sizeof(struct global_timestamp_queue)));
}

__host__ void module_cuda_global_timestamp_queue_fetch_interface(
        struct global_timestamp_queue *h_gts_queue)
{
    cutilSafeCall(cudaMemcpyFromSymbol(h_gts_queue, gts, 
                sizeof(struct global_timestamp_queue)));
}

__host__ void module_cuda_timestamp_queue_update_interface(
        uint8_t tid, struct timestamp_queue *h_ts_queue)
{
    cutilSafeCall(cudaMemcpyToSymbol(gts, h_ts_queue, 
                sizeof(struct timestamp_queue), 
                tid * sizeof(struct timestamp_queue), 
                cudaMemcpyHostToDevice));
}

__host__ void module_cuda_timestamp_queue_fetch_interface(
        uint8_t tid, struct timestamp_queue *h_ts_queue)
{
    cutilSafeCall(cudaMemcpyFromSymbol(h_ts_queue, gts, 
                sizeof(struct timestamp_queue), 
                tid * sizeof(struct timestamp_queue), 
                cudaMemcpyDeviceToHost));
}

__host__ void module_cuda_timestamp_entry_update_interface_old(
        uint8_t tid, uint32_t index, struct timestamp *h_ts_entry)
{
    cutilSafeCall(cudaMemcpyToSymbol(gts, h_ts_entry, 
                sizeof(struct timestamp),
                tid * sizeof(struct timestamp_queue) +
                index * sizeof(struct timestamp),
                cudaMemcpyHostToDevice));
}

#if 1
__host__ void module_cuda_timestamp_entry_update_interface(
        uint8_t max_tid_num, uint32_t *ctx, struct timestamp_queue *h_ts_queue)
{
    int i, index;
    for (i = 1; i < max_tid_num; i++) {
        /*for (i = 0; i < MAX_PROCESS_NUM; i++) {*/

        /*cutilSafeCall(cudaMemcpyToSymbol(gts, &h_ts_queue[i].entry, */
        /*(MAX_TIMESTAMP_NUM) * sizeof(struct timestamp), */
        /*i * sizeof(struct timestamp_queue), */
        /*cudaMemcpyHostToDevice));*/

        index = ctx[i];
        if (index > old_index[i]) {
            cutilSafeCall(cudaMemcpyToSymbol(gts, &h_ts_queue[i].entry[old_index[i]], 
                        (index - old_index[i] + 1) * sizeof(struct timestamp),
                        /*(index - old_index[i]) * sizeof(struct timestamp),*/
                        i * sizeof(struct timestamp_queue) + 
                        old_index[i] * sizeof(struct timestamp), 
                        cudaMemcpyHostToDevice));
        } else if (index < old_index[i]) {
            cutilSafeCall(cudaMemcpyToSymbol(gts, &h_ts_queue[i].entry[old_index[i]], 
                        (MAX_TIMESTAMP_NUM - old_index[i] - 1) * sizeof(struct timestamp), 
                        i * sizeof(struct timestamp_queue) + 
                        old_index[i] * sizeof(struct timestamp), 
                        cudaMemcpyHostToDevice));
            cutilSafeCall(cudaMemcpyToSymbol(gts, &h_ts_queue[i].entry[0], 
                        (index - 0 + 1) * sizeof(struct timestamp), 
                        i * sizeof(struct timestamp_queue) + 
                        0,
                        cudaMemcpyHostToDevice));
        }
        old_index[i] = index;
    }

    }

#endif

    __host__ void module_cuda_timestamp_entry_fetch_interface(
            uint8_t tid, uint32_t index, struct timestamp *h_ts_entry)
    {
        cutilSafeCall(cudaMemcpyFromSymbol(h_ts_entry, gts, 
                    sizeof(struct timestamp), 
                    tid * sizeof(struct timestamp_queue) + 
                    index * sizeof(struct timestamp), 
                    cudaMemcpyDeviceToHost));
    }

    __host__ void module_cuda_global_history_queue_update_interface(
            struct global_history_queue *h_gh_queue)
    {
        cutilSafeCall(cudaMemcpyToSymbol(gh, h_gh_queue, 
                    sizeof(struct global_history_queue)));
    }

    __host__ void module_cuda_global_history_queue_fetch_interface(
            struct global_history_queue *h_gh_queue)
    {
        cutilSafeCall(cudaMemcpyFromSymbol(h_gh_queue, gh, 
                    sizeof(struct global_history_queue)));
    }

    __host__ void module_cuda_history_hash_queue_update_interface(
            uint8_t tid, struct history_hash_queue *h_hh_queue)
    {
        cutilSafeCall(cudaMemcpyToSymbol(gh, h_hh_queue, 
                    sizeof(struct history_hash_queue), 
                    tid * sizeof(struct history_hash_queue), 
                    cudaMemcpyHostToDevice));
    }

    __host__ void module_cuda_history_hash_queue_fetch_interface(
            uint8_t tid, struct history_hash_queue *h_hh_queue)
    {
        cutilSafeCall(cudaMemcpyFromSymbol(h_hh_queue, gh, 
                    sizeof(struct history_hash_queue), 
                    tid * sizeof(struct history_hash_queue), 
                    cudaMemcpyDeviceToHost));
    }

    __host__ void module_cuda_global_page_filter_update_interface(
            struct global_page_filter *h_gpf)
    {
        cutilSafeCall(cudaMemcpyToSymbol(gpf, h_gpf, 
                    sizeof(struct global_page_filter)));
    }

    __host__ void module_cuda_global_page_filter_fetch_interface(
            struct global_page_filter *h_gpf)
    {
        cutilSafeCall(cudaMemcpyFromSymbol(h_gpf, gpf, 
                    sizeof(struct global_page_filter)));
    }

    __host__ void module_cuda_page_filter_update_interface(
            uint8_t tid, struct page_filter *h_pf)
    {
        cutilSafeCall(cudaMemcpyToSymbol(gpf, h_pf, 
                    sizeof(struct page_filter), 
                    tid * sizeof(struct page_filter), 
                    cudaMemcpyHostToDevice));
    }

    __host__ void module_cuda_page_filter_fetch_interface(
            uint8_t tid, struct page_filter *h_pf)
    {
        cutilSafeCall(cudaMemcpyFromSymbol(h_pf, gpf, 
                    sizeof(struct page_filter), 
                    tid * sizeof(struct page_filter), 
                    cudaMemcpyDeviceToHost));
    }

    __host__ void module_cuda_global_race_queue_fetch_interface(
            struct global_race_queue *h_gr)
    {
        cutilSafeCall(cudaMemcpyFromSymbol(h_gr, gr, 
                    sizeof(struct global_race_queue)));
#if 1
        printf("cuda : race : %d\n", h_gr->sum);
#endif
    }

#ifndef PPI_THREE_STAGE
    __host__ void module_cuda_match_with_trace_buf_interface(
            uint8_t tid, uint32_t size, struct trace_content *h_trace_buf)
    {
        /*printf("cuda : %d, %d, 0x%lx\n", tid, size, h_trace_buf);*/
        cutilSafeCall(cudaMemcpy(d_trace_buf, h_trace_buf, 
                    sizeof(struct trace_content) * size, 
                    cudaMemcpyHostToDevice));

        numBlocks = (size + numThreads - 1) / numThreads;

        cudaFuncSetCacheConfig(module_match_with_trace_buf_on_cuda, cudaFuncCachePreferL1); 
        module_match_with_trace_buf_on_cuda<<<numBlocks, numThreads>>>(size,
                d_trace_buf);
    }

#else
    __host__ void module_cuda_match_with_trace_buf_interface(
            uint8_t tid, uint32_t size)
    {

#ifdef KERNEL_TIME
        float elapsed = 0.f;
        
        cudaEventRecord(start, 0);
#endif

        /*printf("cuda : %d, %d\n", tid, size);*/
        cutilSafeCall(cudaMemcpyAsync(d_trace_buf, cuda_buf, 
                    sizeof(struct trace_content) * size, 
                    cudaMemcpyHostToDevice, 0));

        numBlocks = (size + numThreads - 1) / numThreads;

        cudaFuncSetCacheConfig(module_match_with_trace_buf_on_cuda, cudaFuncCachePreferL1); 
        module_match_with_trace_buf_on_cuda<<<numBlocks, numThreads, 0, 0>>>(size,
                d_trace_buf);

#ifdef KERNEL_TIME
        cudaEventRecord(stop, 0);
        cudaEventSynchronize(stop);
        cudaEventElapsedTime(&elapsed, start, stop);
        cuda_time += elapsed;
#endif

    }
#endif
