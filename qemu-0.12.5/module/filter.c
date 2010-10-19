
/* filter */

#define MAX_ENTRY_NUM (1 << 20)
#define FILTER_BASE_BIT 12
#define FILTER_ENTRY_MASK 0xfffff

struct filter_entry {
    uint8_t load_access;
    uint8_t store_access;
};

struct page_filter {
    struct filter_entry entry[MAX_ENTRY_NUM];
};

struct global_page_filter {
    struct page_filter *thread[MAX_PROCESS_NUM];
};

struct global_page_filter filter;

static inline void module_filter_init()
{
    uint32_t i;

    memset(&filter, 0, sizeof(struct global_page_filter));

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        filter.thread[i] = (struct page_filter *)malloc(sizeof(struct page_filter));	
        memset(filter.thread[i], 0, sizeof(struct page_filter));
    }
}

static inline void module_filter_load(struct trace_content *content) 
{
#ifdef MOD_FILTER
    uint8_t i;
    uint8_t tid;
    uint32_t address;
    uint32_t temp_index;

    tid = content->tid;
    address = content->value.mem.address;

    temp_index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    filter.thread[tid]->entry[temp_index].load_access = 1;

    for (i = 0; i < info.max_tid_num; i++) {
        if (i != tid) {
            if (filter.thread[i]->entry[temp_index].store_access) {
                module_match_with_store(content, i);
            }
        }
    }
#endif
}

static inline void module_filter_store(struct trace_content *content) 
{
#ifdef MOD_FILTER
    uint8_t i;
    uint8_t tid;
    uint32_t address;
    uint32_t temp_index;

    tid = content->tid;
    address = content->value.mem.address;

    temp_index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    filter.thread[tid]->entry[temp_index].store_access = 1;

    for (i = 0; i < info.max_tid_num; i++) {
        if (i != tid) {
            if (filter.thread[i]->entry[temp_index].load_access) {
                module_match_with_load(content, i);
            }
			
            if (filter.thread[i]->entry[temp_index].store_access) {
                module_match_with_store(content, i);
            }
        }
    }
#endif
}

