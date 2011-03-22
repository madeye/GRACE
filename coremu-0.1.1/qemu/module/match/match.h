#ifndef _MATCH_H_
#define _MATCH_H_

extern "C" void module_cuda_init_interface(void);
extern "C" void module_cuda_free_interface(void);
extern "C" void module_cuda_timestamp_update_interface(
        struct global_timestamp_queue *h_gts_queue);
extern "C" void module_cuda_match_interface(
        struct history_entry *h_history_queue,
        struct trace_content *h_trace_buf,
        int *h_result_queue);

#endif /* _MATCH_H_ */
