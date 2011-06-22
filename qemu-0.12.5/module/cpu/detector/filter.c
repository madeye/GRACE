
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

#ifdef PPI_GPU_MODULE
__device__
#endif
struct global_page_filter gpf;

#ifndef PPI_GPU_MODULE
static inline void module_filter_init(void)
{
    memset(&gpf, 0, sizeof(struct global_page_filter));

#if 1
    fprintf(stderr, "global page filter size : 0x%lx\n", 
            sizeof(struct global_page_filter));
#endif
}

#if 0
static inline void module_filter_print_entry(
        struct filter_entry *entry)
{
    fprintf(stderr, "\t%d\t%d\n", entry->load, entry->store);
}
#endif

static inline void module_filter_load_record(
        struct trace_content *content) 
{
#ifdef MOD_FILTER
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    gpf.thread[tid].entry[index].load = 1;
#endif
}

static inline void module_filter_store_record(
        struct trace_content *content) 
{
#ifdef MOD_FILTER
    uint8_t tid;
    uint64_t address;
    uint32_t index;

    tid = content->tid;
    address = content->address;

    index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

    gpf.thread[tid].entry[index].store = 1;
#endif
}
#endif

#ifdef PPI_GPU_MODULE
__device__
#endif
static inline void module_filter_load_match(
        struct trace_content *content)
{
    uint8_t i;

    const uint8_t tid = content->tid;
    const uint64_t address = content->address;
    const uint32_t index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

#ifdef PPI_GPU_MODULE
    const uint8_t max_tid_num = d_max_tid_num;
#else
    const uint8_t max_tid_num = info.max_tid_num;
#endif

    for (i = 0; i < max_tid_num; i++) {
        if (i != tid) {
            if (gpf.thread[i].entry[index].store) {
                module_match_with_store(content, i);
            }
        }
    }
}

#ifdef PPI_GPU_MODULE
__device__
#endif
static inline void module_filter_store_match(
        struct trace_content *content)
{
    uint8_t i;

    const uint8_t tid = content->tid;
    const uint64_t address = content->address;
    const uint32_t index = (address >> FILTER_BASE_BIT) & FILTER_ENTRY_MASK;

#ifdef PPI_GPU_MODULE
    const uint8_t max_tid_num = d_max_tid_num;
#else
    const uint8_t max_tid_num = info.max_tid_num;
#endif

    for (i = 0; i < max_tid_num; i++) {
        if (i != tid) {
            if (gpf.thread[i].entry[index].load) {
                module_match_with_load(content, i);
            }

            if (gpf.thread[i].entry[index].store) {
                module_match_with_store(content, i);
            }
        }
    }
}

