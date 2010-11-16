
/* timestamp */

#include "timestamp.h"

extern struct global_timestamp_queue ts;

static inline uint8_t module_timestamp_order(uint8_t tid1, uint32_t index1, 
        uint8_t tid2, uint32_t index2) 
{
    struct timestamp *ts1, *ts2;

    ts1 = &ts.thread[tid1]->entry[index1];
    ts2 = &ts.thread[tid2]->entry[index2];

    if ((ts1->scalar[tid1] < ts2->scalar[tid1]) 
            && (ts1->scalar[tid2] < ts2->scalar[tid2])) {
        return 1;
    }

    return 0;
}

