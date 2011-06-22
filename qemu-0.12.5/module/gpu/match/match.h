#ifndef _MATCH_H_
#define _MATCH_H_

#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_config_register(int _numThreads);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_init_interface(void);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_free_interface(void);

#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_tid_update_interface(uint8_t h_max_tid_num);

/* timestamp */

#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_global_timestamp_queue_update_interface(
        struct global_timestamp_queue *h_gts_queue);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_global_timestamp_queue_fetch_interface(
        struct global_timestamp_queue *h_gts_queue);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_timestamp_queue_update_interface(
        uint8_t tid, struct timestamp_queue *h_ts_queue);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_timestamp_queue_fetch_interface(
        uint8_t tid, struct timestamp_queue *h_ts_queue);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_timestamp_entry_update_interface_old(
        uint8_t tid, uint32_t index, struct timestamp *h_ts_entry);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_timestamp_entry_update_interface(
        uint8_t max_tid_num, uint32_t *ctx, struct timestamp_queue *h_ts_queue);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_timestamp_entry_fetch_interface(
        uint8_t tid, uint32_t index, struct timestamp *h_ts_entry);

/* history */

#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_global_history_queue_update_interface(
        struct global_history_queue *h_history_queue);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_global_history_queue_fetch_interface(
        struct global_history_queue *h_history_queue);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_history_hash_queue_update_interface(
        uint8_t tid, struct history_hash_queue *h_hh_queue);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_history_hash_queue_fetch_interface(
        uint8_t tid, struct history_hash_queue *h_hh_queue);

/* filter */

#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_global_page_filter_update_interface(
        struct global_page_filter *h_gpf);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_global_page_filter_fetch_interface(
        struct global_page_filter *h_gpf);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_page_filter_update_interface(
        uint8_t tid, struct page_filter *h_pf);
#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_page_filter_fetch_interface(
        uint8_t tid, struct page_filter *h_pf);

/* race */

#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_global_race_queue_fetch_interface(
        struct global_race_queue *h_gr);

/* trace */

#ifdef PPI_GPU_MODULE
extern "C" 
#endif
void module_cuda_match_with_trace_buf_interface(
        uint8_t tid, uint32_t size, struct trace_content *h_trace_buf);

#endif /* _MATCH_H_ */
