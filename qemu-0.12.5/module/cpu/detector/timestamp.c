#include "timestamp.h"

#ifdef PPI_GPU_MODULE
__device__
#endif
struct global_timestamp_queue gts;

#ifndef PPI_GPU_MODULE
struct current_timestamp_array cts;

static inline void module_timestamp_init(void)
{
    uint8_t i;

    memset(&gts, 0, sizeof(struct global_timestamp_queue));
    memset(&cts, 0, sizeof(struct current_timestamp_array));

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        /* 0th entry for scalar of all 0s */
        gts.thread[i].count = 1;
    }

#if 1
    fprintf(stderr, "global timestamp queue size : 0x%lx\n", 
            sizeof(struct global_timestamp_queue));
#endif
}

#if 0
static inline void module_timestamp_print_entry(
        struct timestamp *ts)
{
    uint8_t i;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        fprintf(stderr, "\t%d", ts->scalar[i]);
    }

    fprintf(stderr, "\n");
}
#endif

static inline void module_timestamp_print(
        uint8_t max_thread_num)
{
    uint8_t i;
    uint8_t wrong;

    wrong = 0;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        fprintf(stderr, "tid : %d ; timestamp count : %d\n", 
                i, gts.thread[i].count);

        if ((i < 1) || (i > max_thread_num)) {
            if (gts.thread[i].count > 1) {
                wrong = 1;
            }
        }
    }

    if (wrong) {
        fprintf(stderr, "\n*** The result is wrong! ***\n");
    }

    fprintf(stderr, "\n");
}
#endif

#ifdef PPI_GPU_MODULE
__device__
#endif
static inline int module_timestamp_order(
        uint8_t tid1, uint32_t index1, uint8_t tid2, uint32_t index2) 
{
    const struct timestamp *ts1 = &gts.thread[tid1].entry[index1];
    const struct timestamp *ts2 = &gts.thread[tid2].entry[index2];

    return (((ts1->scalar[tid1] < ts2->scalar[tid1]) && 
                (ts1->scalar[tid2] < ts2->scalar[tid2])) || 
            ((ts1->scalar[tid1] > ts2->scalar[tid1]) && 
             (ts1->scalar[tid2] > ts2->scalar[tid2])));
}

