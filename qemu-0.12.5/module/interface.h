#ifndef INTERFACE_H
#define INTERFACE_H

#define PPI_PRINT_INFO
#define PPI_PROCESS_INFO
#define PPI_SYN_INFO

#define TRACE_PRIVATE_BUF_SIZE (16 * 1024 * 1024)

#define TRACE_MEM_INT
#define TRACE_MEM_FLOAT

#define TRACE_PC_BASE 0x8000000
#define TRACE_PC_LIMIT 0x10000000

#define MAX_PROCESS_NUM 16

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
    uint8_t tid;
    uint8_t type;
    uint8_t size;
    uint32_t pc;
    union {
        struct {	
            uint64_t address;
            uint64_t index;
        } mem;
        struct {
            uint64_t args[2];
        } syn;
    } value;
};

typedef struct DEBUGInfo {
    /* memory trace for data race detector  */
    struct trace_content trace_mem_buf[TRACE_PRIVATE_BUF_SIZE];
    //struct trace_content *env->trace_mem_ptr, *trace_mem_end;
    /* uint8_t current_thread_id; */
} DEBUGInfo;

    //fprintf(stderr, "mem_trace: %d, %d, 0x%llx, 0x%llx \n", type1, size1, arg1, pc1); 
//}

#define trace_mem_collection(type1, size1, pc1, arg1) { \
        env->trace_mem_ptr->type = (type1); \
        env->trace_mem_ptr->size = (size1); \
        env->trace_mem_ptr->value.mem.address = (arg1); \
        env->trace_mem_ptr->pc = (pc1); \
        env->trace_mem_ptr++; \
}

    //fprintf(stderr, "syn_trace: %d, 0x%llx, 0x%llx \n", type1, arg1, pc1); 
//}

#define trace_syn_collection(type1, size1, arg1, arg2, pc1) { \
        env->trace_mem_ptr->type = (type1); \
        env->trace_mem_ptr->size = (size1); \
        env->trace_mem_ptr->value.syn.args[0] = (arg1); \
        env->trace_mem_ptr->value.syn.args[1] = (arg2); \
        env->trace_mem_ptr->pc = (pc1); \
        env->trace_mem_ptr++; \
}

void data_race_detector_init(void);
void data_race_detector(uint8_t tid, uint32_t size, struct trace_content *buf);
void data_race_detector_report(void);

#endif  /* INTERFACE_H */
