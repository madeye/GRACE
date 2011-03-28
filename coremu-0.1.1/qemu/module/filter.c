
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

struct global_page_filter pfilter;

/*static inline void module_filter_init()*/
/*{*/
    /*int i;*/

    /*pfilter = (struct global_page_filter *)malloc(sizeof(struct global_page_filter));*/
    /*memset(pfilter, 0, sizeof(struct global_page_filter));*/

    /*for (i = 0; i < MAX_PROCESS_NUM; i++) {*/
        /*pfilter->thread[i] = (struct page_filter *)malloc(sizeof(struct page_filter));	*/
        /*memset(pfilter->thread[i], 0, sizeof(struct page_filter));*/
    /*}*/
/*}*/

static inline void module_filter_load_record(struct trace_content *content) 
{
#ifdef MOD_FILTER
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    pfilter.thread[tid].entry[index].load = 1;
#endif
}

static inline void module_filter_load_match(struct trace_content *content) 
{
#ifdef MOD_FILTER
    uint8_t i;
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    for (i = 0; i < info.max_tid_num; i++) {
        if (i != tid) {
            if (pfilter.thread[i].entry[index].store) {
                module_match_with_store(content, i);
            }
        }
    }
#endif
}

static inline void module_filter_store_record(struct trace_content *content) 
{
#ifdef MOD_FILTER
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    pfilter.thread[tid].entry[index].store = 1;
#endif
}

static inline void module_filter_store_match(struct trace_content *content) 
{
#ifdef MOD_FILTER
    uint8_t i;
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    for (i = 0; i < info.max_tid_num; i++) {
        if (i != tid) {
            if (pfilter.thread[i].entry[index].load) {
                module_match_with_load(content, i);
            }

            if (pfilter.thread[i].entry[index].store) {
                module_match_with_store(content, i);
            }
        }
    }
#endif
}

