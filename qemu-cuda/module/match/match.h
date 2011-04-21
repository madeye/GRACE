#ifndef _MATCH_H_
#define _MATCH_H_

extern "C" void module_cuda_config_register(int _numThreads);
extern "C" void module_cuda_init_interface(void);
extern "C" void module_cuda_free_interface(void);

extern "C" void module_cuda_tid_update_interface(int h_max_tid_num);

/* timestamp */

extern "C" void module_cuda_global_timestamp_queue_update_interface(
        struct global_timestamp_queue *h_gts_queue);
extern "C" void module_cuda_global_timestamp_queue_fetch_interface(
        struct global_timestamp_queue *h_gts_queue);
extern "C" void module_cuda_timestamp_queue_update_interface(
        uint8_t tid, struct timestamp_queue *h_ts_queue);
extern "C" void module_cuda_timestamp_queue_fetch_interface(
        uint8_t tid, struct timestamp_queue *h_ts_queue);
extern "C" void module_cuda_timestamp_entry_update_interface_old(
        uint8_t tid, uint32_t index, struct timestamp *h_ts_entry);
extern "C" void module_cuda_timestamp_entry_update_interface(
        uint8_t max_tid_num, uint32_t *ctx, struct timestamp_queue *h_ts_queue);
extern "C" void module_cuda_timestamp_entry_fetch_interface(
        uint8_t tid, uint32_t index, struct timestamp *h_ts_entry);

/* history */

extern "C" void module_cuda_global_history_queue_update_interface(
        struct global_history_queue *h_history_queue);
extern "C" void module_cuda_global_history_queue_fetch_interface(
        struct global_history_queue *h_history_queue);
extern "C" void module_cuda_history_hash_queue_update_interface(
        uint8_t tid, struct history_hash_queue *h_hh_queue);
extern "C" void module_cuda_history_hash_queue_fetch_interface(
        uint8_t tid, struct history_hash_queue *h_hh_queue);

/* filter */

extern "C" void module_cuda_global_page_filter_update_interface(
        struct global_page_filter *h_gpf);
extern "C" void module_cuda_global_page_filter_fetch_interface(
        struct global_page_filter *h_gpf);
extern "C" void module_cuda_page_filter_update_interface(
        uint8_t tid, struct page_filter *h_pf);
extern "C" void module_cuda_page_filter_fetch_interface(
        uint8_t tid, struct page_filter *h_pf);

/* race */

extern "C" void module_cuda_global_race_queue_fetch_interface(
        struct global_race_queue *h_gr);

/* trace */

extern "C" void module_cuda_match_with_trace_buf_interface(
        uint8_t tid, uint32_t size, struct trace_content *h_trace_buf);

#endif /* _MATCH_H_ */
