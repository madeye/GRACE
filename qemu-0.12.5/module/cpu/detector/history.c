
/* history */

struct history_content {
    uint64_t address;
    uint16_t index;
};

struct history_entry {
    struct history_content content;
};

#define HISTORY_QUEUE_SIZE (1 << 4)
#define MAX_STORE_QUEUE_SIZE HISTORY_QUEUE_SIZE
#define MAX_LOAD_QUEUE_SIZE HISTORY_QUEUE_SIZE

struct history_queue {
    struct history_entry load_entry[MAX_LOAD_QUEUE_SIZE];
    struct history_entry store_entry[MAX_STORE_QUEUE_SIZE];
    uint32_t load_tail;
    uint32_t store_tail;
};

#define MAX_HASH_NUM 1024
#define HASH_BASE_BIT 2

struct history_hash_queue {
    struct history_queue hash[MAX_HASH_NUM];
};

struct global_history_queue {
    struct history_hash_queue thread[MAX_PROCESS_NUM];
};

#ifdef PPI_GPU_MODULE
__device__
#endif
struct global_history_queue gh;

#ifndef PPI_GPU_MODULE
static inline void module_history_init(void)
{
    memset(&gh, 0, sizeof(struct global_history_queue));

#if 1
    fprintf(stderr, "global history queue size : 0x%lx\n", 
            sizeof(struct global_history_queue));
#endif
}

#if 0
static inline void module_history_print_entry(
        struct history_entry *entry)
{
    fprintf(stderr, "\t%d\t%d\t%d\t0x%lx\t%d\t0x%x\n", 
            entry->content.tid, entry->content.type, entry->content.size, 
            entry->content.address, entry->content.index, entry->content.pc);
}
#endif

static inline void module_history_load_record(
        struct trace_content *content) 
{
#ifdef MOD_HISTORY
    uint8_t tid;
    uint64_t address;
    struct history_queue *temp_queue;
    uint32_t tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address = content->address;

    temp_queue = &gh.thread[tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];
    tail = temp_queue->load_tail;	
    temp_entry = &temp_queue->load_entry[tail];

#if 0
    //memcpy(&temp_entry->content, content, sizeof(struct trace_content));
#else
    //temp_entry->content.tid = content->tid;
    //temp_entry->content.type = content->type;
    //temp_entry->content.size = content->size;
    temp_entry->content.address = content->address;
    temp_entry->content.index = content->index;
    //temp_entry->content.pc = content->pc;
#endif

    temp_queue->load_tail = (tail + 1) % MAX_LOAD_QUEUE_SIZE;
#endif
}

static inline void module_history_store_record(
        struct trace_content *content) 
{
#ifdef MOD_HISTORY
    uint8_t tid;
    uint64_t address;
    struct history_queue *temp_queue;
    uint32_t tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address = content->address;

    temp_queue = &gh.thread[tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];
    tail = temp_queue->store_tail;
    temp_entry = &temp_queue->store_entry[tail];

#if 0
    //memcpy(&temp_entry->content, content, sizeof(struct trace_content));
#else
    //temp_entry->content.tid = content->tid;
    //temp_entry->content.type = content->type;
    //temp_entry->content.size = content->size;
    temp_entry->content.address = content->address;
    temp_entry->content.index = content->index;
    //temp_entry->content.pc = content->pc;
#endif

    temp_queue->store_tail = (tail + 1) % MAX_STORE_QUEUE_SIZE;
#endif
}
#endif

/* match */

#ifdef PPI_GPU_MODULE
__device__
#endif
static inline void module_match_with_load(
        struct trace_content *content, const uint8_t other_tid)
{
#ifdef MOD_MATCH
    uint64_t other_address;
    uint32_t other_index;       
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;

    const uint8_t tid = content->tid;
    const uint64_t address = content->address;
    const uint32_t index = content->index;

    temp_queue = &gh.thread[other_tid].hash[(
            address >> HASH_BASE_BIT) % MAX_HASH_NUM];
    tail = temp_queue->load_tail;
    head = (tail + 1) % HISTORY_QUEUE_SIZE;

    while (tail != head) {
        tail = (tail + HISTORY_QUEUE_SIZE - 1) % HISTORY_QUEUE_SIZE;
        temp_entry = &temp_queue->load_entry[tail];

        other_address = temp_entry->content.address;

        if (address == other_address) {
            other_index = temp_entry->content.index;

            if (!module_timestamp_order(
                        other_tid, other_index, tid, index)) {
                module_race_collection(
                        &temp_entry->content, content);
            }

            break;
        }
    }
#endif
}

#ifdef PPI_GPU_MODULE
__device__
#endif
static inline void module_match_with_store(
        struct trace_content *content, const uint8_t other_tid)
{
#ifdef MOD_MATCH
    uint64_t other_address;
    uint32_t other_index;
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;

    const uint8_t tid = content->tid;
    const uint64_t address = content->address;
    const uint32_t index = content->index;

    temp_queue = &gh.thread[other_tid].hash[(
            address >> HASH_BASE_BIT) % MAX_HASH_NUM];
    tail = temp_queue->store_tail;
    head = (tail + 1) % HISTORY_QUEUE_SIZE;

    while (tail != head) {
        tail = (tail + HISTORY_QUEUE_SIZE - 1) % HISTORY_QUEUE_SIZE;
        temp_entry = &temp_queue->store_entry[tail];

        other_address = temp_entry->content.address;

        if (address == other_address) {
            other_index = temp_entry->content.index;
        
            if (!module_timestamp_order(
                        other_tid, other_index, tid, index)) {
                module_race_collection(
                        &temp_entry->content, content);
            }

            break;
        }
    }
#endif
}

