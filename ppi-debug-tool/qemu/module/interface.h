#ifndef INTERFACE_H
#define INTERFACE_H

#define PPI_PRINT_INFO
#define PPI_PROCESS_INFO
#define PPI_SYN_INFO

#define TRACE_PRIVATE_BUF_SIZE (16 * 1024)

#define TRACE_MEM_INT
#define TRACE_MEM_FLOAT

#define TRACE_PC_BASE 0x8000000
#define TRACE_PC_LIMIT 0x10000000

#define MAX_PROCESS_NUM 8
#define MAX_THREAD_NUM 4

#define TRACE_BUF_SIZE (1 * 1024)

enum {
    TRACE_TYPE_BASE,
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
    TRACE_MEM_SIZE_BYTE = 1,
    TRACE_MEM_SIZE_WORD = 2,
    TRACE_MEM_SIZE_LONG = 4,
    TRACE_MEM_SIZE_QUAD = 8,
};


struct trace_content {
    uint64_t type;
    uint64_t size;
    union {
        struct {	
            uint64_t address;
            uint64_t index;
        } mem;
        struct {
            uint64_t args[2];
        } syn;
    } value;
    uint64_t pc;
};

typedef struct DEBUGInfo {
    /* memory trace for data race detector  */
    struct trace_content trace_mem_buf[TRACE_PRIVATE_BUF_SIZE];
} DEBUGInfo;

//void data_race_detector_init();
//void data_race_detector(uint8_t tid, uint32_t size, struct trace_content *buf);
//void data_race_detector_report();

#endif  /* INTERFACE_H */
