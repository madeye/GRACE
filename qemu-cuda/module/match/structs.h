////////////////////////////////////////////////////////////////////////////////
// Device Structures 
// include timestamp / history / filter 
// Author: Max
// Revision: 0.1
////////////////////////////////////////////////////////////////////////////////

#define MAX_PROCESS_NUM 8

///////////////////////////////////////////////
// Timestamp Data Structure 

#define MAX_TIMESTAMP_NUM (1 << 18)

struct timestamp {
    uint32_t scalar[MAX_PROCESS_NUM];
};

struct timestamp_queue {
    uint32_t count;
    struct timestamp entry[MAX_TIMESTAMP_NUM];
};

//struct global_timestamp_queue {
    //struct timestamp_queue thread[MAX_PROCESS_NUM];
    //struct timestamp current_ts[MAX_PROCESS_NUM];
    //uint32_t current_ts_index[MAX_PROCESS_NUM];
//};

///////////////////////////////////////////////
// History Data Structure 

#define MAX_STORE_QUEUE_SIZE 128
#define MAX_LOAD_QUEUE_SIZE (MAX_STORE_QUEUE_SIZE * 1)

#define MAX_HASH_NUM 1024
#define HASH_BASE_BIT 2

struct history_entry {
    struct trace_content content;
};

struct history_queue {
    struct history_entry load_entry[MAX_LOAD_QUEUE_SIZE];
    struct history_entry store_entry[MAX_STORE_QUEUE_SIZE];
    uint32_t load_tail;
    uint32_t store_tail;
};

struct history_hash_queue {
    struct history_queue hash[MAX_HASH_NUM];
};

struct global_history_queue {
    struct history_hash_queue thread[MAX_PROCESS_NUM];
};

///////////////////////////////////////////////
// Filter Data Structure 

#define MAX_ENTRY_NUM (1 << 20)
#define FILTER_BASE_BIT 12
#define FILTER_ENTRY_MASK 0xfffff

struct filter_entry {
    uint8_t load;
    uint8_t store;
};

struct page_filter {
    struct filter_entry entry[MAX_ENTRY_NUM];
};

struct global_page_filter {
    struct page_filter thread[MAX_PROCESS_NUM];
};

///////////////////////////////////////////////
// Device Race Data Structure 

#define MAX_RACE_NUM (1 << 24)

struct race_entry {
    uint32_t pc1;
    uint32_t pc2;
    uint64_t address;
    //timestamp ts1;
    //timestamp ts2;
};

