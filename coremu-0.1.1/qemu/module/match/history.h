#ifndef _HISTORY_H_
#define _HISTORY_H_

/* history */

struct trace_content {
    uint64_t address;
    uint32_t tid:8, type:2, size:4, index:18;
    uint32_t pc;
};

struct history_entry {
    struct trace_content content;
};

/* Constant Memory Size : 64KB */

/* timestamp */

#define MAX_PROCESS_NUM 4

struct timestamp {
    uint32_t scalar[MAX_PROCESS_NUM];
};

#define MAX_TIMESTAMP_NUM (1 << 10)

struct timestamp_queue {
    struct timestamp entry[MAX_TIMESTAMP_NUM];
    // uint32_t count;
};

struct global_timestamp_queue {
    struct timestamp_queue thread[MAX_PROCESS_NUM];
};

#endif /* _HISTORY_H_ */
