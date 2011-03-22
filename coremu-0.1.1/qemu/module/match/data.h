#ifndef _DATA_H_
#define _DATA_H_

/* Constant Memory Size : 64KB */

/* trace */

struct trace_content {
    uint64_t address;
    uint32_t tid:8, type:2, size:4, index:18;
    uint32_t pc;
};

/* history */

struct history_entry {
    struct trace_content content;
};


/* timestamp */

#define MAX_PROCESS_NUM 4

struct timestamp {
    uint32_t scalar[MAX_PROCESS_NUM];
};

#define MAX_TIMESTAMP_NUM ((1 << 10) - 1)

struct timestamp_queue {
    struct timestamp entry[MAX_TIMESTAMP_NUM];
    uint32_t count;
};

struct global_timestamp_queue {
    struct timestamp_queue thread[MAX_PROCESS_NUM];
};

#endif /* _DATA_H_ */
