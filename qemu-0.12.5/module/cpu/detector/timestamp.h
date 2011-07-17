#ifndef TIMESTAMP_H
#define TIMESTAMP_H

/* timestamp */

struct timestamp {
    uint32_t scalar[MAX_PROCESS_NUM];
};

#define MAX_TIMESTAMP_NUM (1 << 16)

struct timestamp_queue {
    struct timestamp entry[MAX_TIMESTAMP_NUM];
    uint32_t count;
};

struct global_timestamp_queue {
    struct timestamp_queue thread[MAX_PROCESS_NUM];
};

#ifndef PPI_GPU_MODULE
struct current_timestamp_array {
    struct timestamp ts[MAX_PROCESS_NUM];
    uint32_t index[MAX_PROCESS_NUM];
};
#endif

#endif /* TIMESTAMP_H */
