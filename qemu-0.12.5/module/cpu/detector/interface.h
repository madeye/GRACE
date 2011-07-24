#ifndef INTERFACE_H
#define INTERFACE_H

#define PPI_PRINT_INFO
#define PPI_PROCESS_INFO
#define PPI_SYN_INFO

#define TRACE_PRIVATE_BUF_SIZE (16 * 1024 * 1024)

//#define DATA_CACHE_SIZE_HALF 0x800000

#define TRACE_MEM_INT
#define TRACE_MEM_FLOAT

#define MAX_PROCESS_NUM 8

#define CUDA
#define PPI_THREE_STAGE

#ifdef CUDA
#ifdef PPI_THREE_STAGE
/* cuda + 3-stage */
#define TRACE_BUF_SIZE (1024)
#define TRACE_BUF_CUDA_SIZE (256 * 1024)
#else
/* cuda + 1-stage */
#define TRACE_BUF_SIZE (256 * 1024)
#endif
#else
/* 1-stage / 3-stage */
#define TRACE_BUF_SIZE (1 * 1024)
#endif

#define MOD_PROFILER
//#define MOD_HISTORY
//#define MOD_FILTER
//#define MOD_MATCH

enum {
    //TRACE_TYPE_BASE,
    TRACE_MEM_LOAD,
    TRACE_MEM_STORE,
    TRACE_SYN_LOCK,
    TRACE_SYN_UNLOCK,
    TRACE_SYN_BARRIER,
    TRACE_SYN_CREATE,
    TRACE_SYN_JOIN,
    TRACE_SYN_COND_WAIT,
    TRACE_SYN_COND_BROADCAST,
    //TRACE_TYPE_LIMIT,
};

enum {
    TRACE_MEM_SIZE_BYTE = 1,
    TRACE_MEM_SIZE_WORD = 2,
    TRACE_MEM_SIZE_LONG = 4,
    TRACE_MEM_SIZE_QUAD = 8,
};

__attribute__ ((aligned (16)))
struct trace_content {
#if 0
    uint32_t tid:8, type:2, size:4, index:18;
    uint32_t pc;
    uint64_t address;
#endif
#if 0
    uint32_t address;
    uint16_t index;
    uint8_t tid:3, type:1, size:4;
    uint8_t pc;
#endif
#if 1
    uint64_t address;
    uint16_t index;
    uint8_t tid;
    uint8_t type;
    uint8_t size;
    uint16_t pc;
#endif
#if 0
    uint32_t address1;
    uint32_t address2;
    uint16_t index;
    uint8_t tid;
    uint8_t type1;
    uint8_t type2;
    uint8_t size;
    uint16_t pc;
#endif
#if 0
    uint32_t address;
    uint16_t index;
    uint8_t tid;
    uint8_t type;
    uint8_t size;
    uint8_t pc;
#endif
};

typedef struct DEBUGInfo {
    /* memory trace for data race detector  */
    struct trace_content trace_mem_buf[TRACE_PRIVATE_BUF_SIZE];
    //struct trace_content *env->trace_mem_ptr, *trace_mem_end;
    /* uint8_t current_thread_id; */
} DEBUGInfo;

#define prefetch(x) __asm__ __volatile__ ("prefetch %0;"::"m"(*(char *)(x)))
#define prefetchw(x) __asm__ __volatile__ ("prefetchw %0;"::"m"(*(char *)(x)))

void data_race_detector_init(void);
void data_race_detector(uint8_t tid, uint32_t size, struct trace_content *buf);
void data_race_detector_report(void);


#endif  /* INTERFACE_H */
