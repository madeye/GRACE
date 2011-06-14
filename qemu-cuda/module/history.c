
/* history */

struct history_entry {
    struct trace_content_no_addr content;
};

#define HISTORY_QUEUE_SIZE ((1 << 1))
#define MAX_STORE_QUEUE_SIZE HISTORY_QUEUE_SIZE
#define MAX_LOAD_QUEUE_SIZE HISTORY_QUEUE_SIZE

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

struct global_history_queue *history;

static inline void module_history_init(void)
{
    //int i;

    history = (struct global_history_queue *)malloc(sizeof(struct global_history_queue));
    memset(history, 0, sizeof(struct global_history_queue));

#if 0
    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        history->thread[i] = (struct history_hash_queue *)malloc(sizeof(struct history_hash_queue));		
        memset(history->thread[i], 0, sizeof(struct history_hash_queue));
    }
#endif

    fprintf(stderr, "global history queue size : 0x%lx\n", 
            sizeof(struct global_history_queue));
}

static inline void module_history_print_entry(struct history_entry *entry)
{
    //fprintf(stderr, "\t%d\t%d\t%d\t0x%lx\t%d\t0x%x\n", 
            //entry->content.tid, entry->content.type, entry->content.size, 
            //entry->content.address, entry->content.index, entry->content.pc);
}

static inline void module_history_load_record(struct trace_content *content) 
{
#ifdef MOD_HISTORY
    uint8_t tid;
    uint32_t address;
    struct history_queue *temp_queue;
    uint32_t tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address =(uint32_t) (content->address);

    temp_queue = &history->thread[tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->load_tail;	
    temp_entry = &temp_queue->load_entry[tail];

    //memcpy(&temp_entry->content, content, sizeof(struct trace_content));
    temp_entry->content.tid = content->tid;
    temp_entry->content.type = content->type;
    temp_entry->content.size = content->size;
    uint32_t subTail=tail/2;
    //temp_queue->address_ld[subTail]= tail%2==0? (temp_queue->address_ld[subTail]&0xffff0000)|( address>>16):(temp_queue->address_ld[subTail]&0xffff)|( address&0xffff0000);
    if(tail%2==0)
    {
    	temp_queue->address_ld[subTail]=(temp_queue->address_ld[subTail]&0xffff0000)+ ((address>>16)&0xffff);
    }
    else
    {
    	temp_queue->address_ld[subTail]=(temp_queue->address_ld[subTail]&0xffff)+( address&0xffff0000);
    }
    //temp_queue->address_ld[tail]= address;
    //temp_entry->content.address = content->address;
    temp_entry->content.index = content->index;
    temp_entry->content.pc = content->pc;

    temp_queue->load_tail = (tail + 1) % MAX_LOAD_QUEUE_SIZE;
#endif
}

static inline void module_history_store_record(struct trace_content *content) 
{
#ifdef MOD_HISTORY
    uint8_t tid;
    uint32_t address;
    struct history_queue *temp_queue;
    uint32_t tail;
    struct history_entry *temp_entry;

    tid = content->tid;
    address = (uint32_t)(content->address);

    temp_queue = &history->thread[tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->store_tail;
    temp_entry = &temp_queue->store_entry[tail];

    //memcpy(&temp_entry->content, content, sizeof(struct trace_content));
    temp_entry->content.tid = content->tid;
    temp_entry->content.type = content->type;
    temp_entry->content.size = content->size;
    uint32_t subTail=tail/2;
    if(tail%2==0)
    {
    	temp_queue->address_st[subTail]=(temp_queue->address_st[subTail]&0xffff0000)+ ((address>>16)&0xffff);
    }
    else
    {
    	temp_queue->address_st[subTail]=(temp_queue->address_st[subTail]&0xffff)+( address&0xffff0000);
    }

    //temp_queue->address_st[subTail]= tail%2==0? (temp_queue->address_st[subTail]&0xffff0000)|( address>>16):(temp_queue->address_st[subTail]&0x0000ffff)|( address&0xffff0000);
    //temp_queue->address_st[tail]= address;
    //temp_entry->content.address = content->address;
    temp_entry->content.index = content->index;
    temp_entry->content.pc = content->pc;

    temp_queue->store_tail = (tail + 1) % MAX_STORE_QUEUE_SIZE;
#endif
}


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

    temp_queue = &history->thread[other_tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->load_tail;
    head = tail + 1;
    if (head == MAX_LOAD_QUEUE_SIZE) {
        head = 0;
    }

    last_index = gts.thread[other_tid].count;

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_LOAD_QUEUE_SIZE;
        }
        tail--;

        temp_entry= &temp_queue->load_entry[tail];

        other_index = temp_entry->content.index;

        if (last_index != other_index) {
            if (module_timestamp_order(other_tid, other_index, tid, index)) {
                break;
            }

            last_index = other_index;
        }

        other_address = temp_queue->address_ld[tail];

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
    address = (content->address);
    index = content->index;

    temp_queue = &history->thread[other_tid].hash[(address >> HASH_BASE_BIT) % MAX_HASH_NUM];

    tail = temp_queue->store_tail;
    head = tail + 1;
    if (head == MAX_STORE_QUEUE_SIZE) {
        head = 0;
    }

    last_index = gts.thread[other_tid].count;

    while (tail != head) {
        if (tail == 0) {
            tail = MAX_STORE_QUEUE_SIZE;
        }
        tail--;

        temp_entry = &temp_queue->store_entry[tail];

        other_index = temp_entry->content.index;  

        if (last_index != other_index) {
            if (module_timestamp_order(other_tid, other_index, tid, index)) {   
                break;
            }

            last_index = other_index;
        }

        other_address = temp_queue->address_st[tail];

        if (address == other_address) {
            module_race_collection(&temp_entry->content, content);

            break;
        } 
    }
#endif
}

