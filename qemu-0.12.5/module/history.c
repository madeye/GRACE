
/* history */

struct history_entry {
    struct trace_content content;
};

#define MAX_STORE_QUEUE_SIZE 128
#define MAX_LOAD_QUEUE_SIZE (MAX_STORE_QUEUE_SIZE * 1)

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
    struct history_hash_queue *thread[MAX_PROCESS_NUM];
};

#ifdef PPI_TWO_STAGE
__thread struct global_history_queue *history;
#else
struct global_history_queue *history;
#endif

long long int match_count[MAX_CORE_NUM] = {0};

static inline void module_history_init()
{
    int i;

    history = (struct global_history_queue *)malloc(sizeof(struct global_history_queue));
    memset(history, 0, sizeof(struct global_history_queue));

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        history->thread[i] = (struct history_hash_queue *)malloc(sizeof(struct history_hash_queue));		
        memset(history->thread[i], 0, sizeof(struct history_hash_queue));
    }
}

static inline void module_history_load_record(struct trace_content *content) 
{
#ifdef MOD_HISTORY
    uint8_t tid;
    uint64_t address;
    struct history_queue *temp_queue;
    uint32_t tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address = content->address;

    temp_queue = &history->thread[tid]->hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->load_tail;	
    temp_entry = &temp_queue->load_entry[tail];

    // memcpy(&temp_entry->content, content, sizeof(struct trace_content));
    temp_entry->content.tid = content->tid;
    temp_entry->content.type = content->type;
    temp_entry->content.size = content->size;
    temp_entry->content.address = content->address;
    temp_entry->content.index = content->index;
    /*temp_entry->content.pc = content->pc;*/

    //tail++;
    //if (tail >= MAX_LOAD_QUEUE_SIZE) {
    //    tail = 0;
    //}
    //temp_queue->load_tail = tail;
    temp_queue->load_tail = (tail + 1) % MAX_LOAD_QUEUE_SIZE;
#endif
}

static inline void module_history_store_record(struct trace_content *content) 
{
#ifdef MOD_HISTORY
    uint8_t tid;
    uint64_t address;
    struct history_queue *temp_queue;
    uint32_t tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address = content->address;

    temp_queue = &history->thread[tid]->hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->store_tail;
    temp_entry = &temp_queue->store_entry[tail];

    // memcpy(&temp_entry->content, content, sizeof(struct trace_content));
    temp_entry->content.tid = content->tid;
    temp_entry->content.type = content->type;
    temp_entry->content.size = content->size;
    temp_entry->content.address = content->address;
    temp_entry->content.index = content->index;
    /*temp_entry->content.pc = content->pc;*/

    //tail++;
    //if (tail >= MAX_STORE_QUEUE_SIZE) {
    //    tail = 0;
    //}
    //temp_queue->store_tail = tail;
    temp_queue->store_tail = (tail + 1) % MAX_STORE_QUEUE_SIZE;
#endif
}

/* match */

static inline void module_match_with_load(struct trace_content *content, uint8_t other_tid) 
{
#ifdef MOD_MATCH
    uint8_t tid;
    uint64_t address, other_address;
    uint32_t index, other_index, last_index;
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address = content->address;
    index = content->index;

    temp_queue = &history->thread[other_tid]->hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->load_tail;
    head = tail + 1;
    if (head == MAX_LOAD_QUEUE_SIZE) {
        head = 0;
    }

    last_index = ts.thread[other_tid]->count;

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_LOAD_QUEUE_SIZE;
        }
        tail--;

        match_count[info.core_id]++;

        temp_entry= &temp_queue->load_entry[tail];

        other_index = temp_entry->content.index;

        if (last_index != other_index) {
            if (module_timestamp_order(other_tid, other_index, tid, index)) {
                break;
            }

            last_index = other_index;
        }

        other_address = temp_entry->content.address;

        if (address == other_address) {
            module_race_collection(&temp_entry->content, content);

            break;
        }
    }
#endif
}

static inline void module_match_with_store(struct trace_content *content, uint8_t other_tid) 
{
#ifdef MOD_MATCH
    uint8_t tid;
    uint64_t address, other_address;
    uint32_t index, other_index, last_index;
    struct history_queue *temp_queue;
    uint32_t head, tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address = content->address;
    index = content->index;

    temp_queue = &history->thread[other_tid]->hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->store_tail;
    head = tail + 1;
    if (head == MAX_STORE_QUEUE_SIZE) {
        head = 0;
    }

    last_index = ts.thread[other_tid]->count;

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_STORE_QUEUE_SIZE;
        }
        tail--;

        match_count[info.core_id]++;

        temp_entry = &temp_queue->store_entry[tail];

        other_index = temp_entry->content.index;  

        if (last_index != other_index) {
            if (module_timestamp_order(other_tid, other_index, tid, index)) {   
                break;
            }

            last_index = other_index;
        }

        other_address = temp_entry->content.address;

        if (address == other_address) {
            module_race_collection(&temp_entry->content, content);

            break;
        } 
    }
#endif
}

