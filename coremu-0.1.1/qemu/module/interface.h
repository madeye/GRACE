#ifndef INTERFACE_H
#define INTERFACE_H

#define PPI_PRINT_INFO
#define PPI_PROCESS_INFO
#define PPI_SYN_INFO

#define TRACE_PRIVATE_BUF_SIZE (16 * 1024 * 1024)

#define TRACE_MEM_INT
#define TRACE_MEM_FLOAT

// #define TRACE_PC_BASE 0x8000000
// #define TRACE_PC_LIMIT 0x10000000


#define TRACE_BUF_SIZE (64 * 1024)

enum {
    TRACE_MEM_BASE,
    TRACE_MEM_LOAD,
    TRACE_MEM_STORE,
    TRACE_SYN_LOCK,
    TRACE_SYN_UNLOCK,
    TRACE_SYN_BARRIER,
    TRACE_SYN_CREATE,
    TRACE_SYN_JOIN,
    TRACE_SYN_COND_WAIT,
    TRACE_SYN_COND_BROADCAST,
    TRACE_TYPE_LIMIT,
};

enum {
    TRACE_MEM_SIZE_BYTE = 0,
    TRACE_MEM_SIZE_WORD = 1,
    TRACE_MEM_SIZE_LONG = 2,
    TRACE_MEM_SIZE_QUAD = 3,
};

struct trace_content {
    //uint32_t tid:8, type:2, size:2, index:20;
    uint8_t tid;
    uint8_t type;
    uint8_t size;
    uint32_t index;
    uint32_t pc;
    uint64_t address;
};

typedef struct DEBUGInfo {
    /* memory trace for data race detector  */
    struct trace_content *trace_mem_buf;
    //struct trace_content *env->trace_mem_ptr, *trace_mem_end;
    /* uint8_t current_thread_id; */
} DEBUGInfo;

void data_race_detector_init(void);
void data_race_detector(uint8_t tid, uint32_t size, struct trace_content *buf);
void data_race_detector_report(void);

#endif  /* INTERFACE_H */
