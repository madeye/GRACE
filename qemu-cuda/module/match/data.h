#ifndef _DATA_H_
#define _DATA_H_

/* thread */

#define MAX_PROCESS_NUM 16

/* history */

struct history_entry {
    struct trace_content_no_addr content;
};

#define HISTORY_QUEUE_SIZE ((1 <<3))
#define MAX_LOAD_QUEUE_SIZE HISTORY_QUEUE_SIZE
#define MAX_STORE_QUEUE_SIZE HISTORY_QUEUE_SIZE

struct history_queue {
    struct history_entry load_entry[MAX_LOAD_QUEUE_SIZE];
    uint32_t address_ld[MAX_LOAD_QUEUE_SIZE/2];
    struct history_entry store_entry[MAX_STORE_QUEUE_SIZE];
    uint32_t address_st[MAX_STORE_QUEUE_SIZE/2];
    uint32_t load_tail;
    uint32_t store_tail;
};


#define MAX_HASH_NUM 16384
#define HASH_BASE_BIT 2

struct history_hash_queue {
    struct history_queue hash[MAX_HASH_NUM];
};

struct global_history_queue {
    struct history_hash_queue thread[MAX_PROCESS_NUM];
};

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

/* filter */

#define MAX_ENTRY_NUM (1 << 20)
#define FILTER_BASE_BIT 12
#define FILTER_ENTRY_MASK 0xfffff

struct filter_entry {
    uint8_t load:1, store:1;
};

struct page_filter {
    struct filter_entry entry[MAX_ENTRY_NUM];
};

struct global_page_filter {
    struct page_filter thread[MAX_PROCESS_NUM];
};

/* race */

struct race_entry {
    struct trace_content_no_addr content1;
    struct trace_content content2;
    uint32_t instance;
};

#define MAX_RACE_NUM (1 << 16)

struct race_queue {
    struct race_entry entry[MAX_RACE_NUM];
    uint32_t count;
};

#define MAX_CUDA_THREAD_NUM (1 << 4)

struct global_race_queue {
    struct race_queue thread[MAX_CUDA_THREAD_NUM];
    uint32_t sum;
};

#endif /* _DATA_H_ */
