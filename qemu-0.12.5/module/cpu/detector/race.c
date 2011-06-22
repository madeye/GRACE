
/* race */

struct race_entry {
    struct trace_content content1;
    struct trace_content content2;
    uint32_t instance;
};

#define MAX_RACE_NUM (1 << 16)

struct race_queue {
    struct race_entry entry[MAX_RACE_NUM];
    uint32_t count;
};

#define MAX_MATCH_NUM (1 << 4)

struct global_race_queue {
    struct race_queue thread[MAX_MATCH_NUM];
    uint32_t sum;
    struct race_queue remain;
};

#ifdef PPI_GPU_MODULE
__device__
#endif
struct global_race_queue gr;

#ifndef PPI_GPU_MODULE
static inline void module_race_init(void) 
{
    memset(&gr, 0, sizeof(struct global_race_queue));

#if 1
    fprintf(stderr, "global race queue size : 0x%lx\n", 
            sizeof(struct global_race_queue));
#endif
}

static inline int module_race_equal(
        struct race_entry *race1, struct race_entry *race2)
{
    return ((race1->content2.type == race2->content2.type) && 
            (race1->content2.size == race2->content2.size) && 
            (race1->content2.pc == race2->content2.pc));
}

static inline void module_race_filter(
        struct race_queue *remain, struct race_entry *race) 
{
    uint32_t i;

    for (i = 0; i < remain->count; i++) {
        if (module_race_equal(&remain->entry[i], race)) {
            break;
        }
    }

    if (i >= remain->count) {
        memcpy(&remain->entry[i], race, sizeof(struct race_entry));

        remain->count++;

        if (remain->count >= MAX_RACE_NUM) {
            fprintf(stderr, "race queue overflow!\n");
            assert(0);
        }
    } 
}

static inline void module_race_print(void)
{
    uint32_t i, j;
    struct race_queue *remain;

    remain = &gr.remain;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        for (j = 0; j < gr.thread[i].count; j++) {
            module_race_filter(remain, &gr.thread[i].entry[j]);
        }
    }

#if 0
    for (i = 0; i < remain->count; i++) {
        fprintf(stderr, "No. %d : address : 0x%lx ; same count : %d\n", 
                i, remain->entry[i].content2.address, remain->entry[i].instance);
        fprintf(stderr, "tid1 : %d ; type1 : %d ; size1 : %d ; pc1 : 0x%x ; index : %d\n", 
                remain->entry[i].content1.tid, remain->entry[i].content1.type, 
                remain->entry[i].content1.size, remain->entry[i].content1.pc, 
                remain->entry[i].content1.index);
        fprintf(stderr, "tid2 : %d ; type2 : %d ; size2 : %d ; pc2 : 0x%x ; index : %d\n\n", 
                remain->entry[i].content2.tid, remain->entry[i].content2.type, 
                remain->entry[i].content2.size, remain->entry[i].content2.pc, 
                remain->entry[i].content2.index);
    }
#endif
    
    fprintf(stderr, "race sum count : %d\n", gr.sum);
    fprintf(stderr, "race number count : %d\n", gr.thread[0].count);
    fprintf(stderr, "race remain count : %d\n\n", remain->count);
}
#endif

#ifdef PPI_GPU_MODULE
__device__
#endif
static inline int module_race_content_equal(
        struct trace_content *content1, struct trace_content *content2)
{
    return ((content1->type == content2->type) && 
            (content1->size == content2->size) && 
            (content1->pc == content2->pc));
}

#ifdef PPI_GPU_MODULE
__device__
#endif
static inline void module_race_collection(
        struct trace_content *content1, struct trace_content *content2) 
{
    uint32_t i;
    struct race_queue *temp_queue;

#ifdef PPI_GPU_MODULE
    const int core_id = (blockIdx.x * blockDim.x + threadIdx.x) % MAX_MATCH_NUM;
#else
    const int core_id = info.core_id % MAX_MATCH_NUM;
#endif

    temp_queue = &gr.thread[core_id];

    for (i = 0; i < temp_queue->count; i++) {
        if (module_race_content_equal(content2, 
                    &temp_queue->entry[i].content2)) {
            temp_queue->entry[i].instance++;

            break;
        }
    }

    if (i >= temp_queue->count) {
        memcpy(&temp_queue->entry[i].content1, 
                content1, sizeof(struct trace_content));
        memcpy(&temp_queue->entry[i].content2, 
                content2, sizeof(struct trace_content));
        temp_queue->entry[i].instance++;

        temp_queue->count++;

#ifndef PPI_GPU_MODULE
        if (temp_queue->count >= MAX_RACE_NUM) {
            fprintf(stderr, "race queue overflow!\n");
            assert(0);
        }
#endif
    }

    gr.sum++;
}

