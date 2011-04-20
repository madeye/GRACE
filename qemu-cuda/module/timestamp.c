
/* timestamp */

#include "timestamp.h"

extern struct global_timestamp_queue gts;
extern struct current_timestamp_array cts;

static inline int module_timestamp_order(uint8_t tid1, uint32_t index1, 
        uint8_t tid2, uint32_t index2) 
{
    struct timestamp *ts1, *ts2;

    ts1 = &gts.thread[tid1].entry[index1];
    ts2 = &gts.thread[tid2].entry[index2];

    if (((ts1->scalar[tid1] < ts2->scalar[tid1]) 
                && (ts1->scalar[tid2] < ts2->scalar[tid2])) 
            || ((ts1->scalar[tid1] > ts2->scalar[tid1]) 
                && (ts1->scalar[tid2] > ts2->scalar[tid2]))) {
        return 1;
    }

    return 0;
}

