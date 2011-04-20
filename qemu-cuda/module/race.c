
/* race */

struct race_entry {
    struct trace_content content1;
    struct trace_content content2;
    uint32_t instance;
};

#define MAX_RACE_NUM (1 << 10)

struct race_queue {
    struct race_entry entry[MAX_RACE_NUM];
    uint32_t count;
};

#define MAX_CUDA_THREAD_NUM (1 << 10)

struct global_race_queue {
    struct race_queue thread[MAX_CUDA_THREAD_NUM];
    uint32_t sum;
    struct race_queue remain;
};

struct global_race_queue *race;

static inline void module_race_init(void) 
{
    //int i;

    race = (struct global_race_queue *)malloc(sizeof(struct global_race_queue));
    memset(race, 0, sizeof(struct global_race_queue));

#if 0
    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        race->thread[i] = (struct race_queue *)malloc(sizeof(struct race_queue));		
        memset(race->thread[i], 0, sizeof(struct race_queue));
    }

    race->remain = (struct race_queue *)malloc(sizeof(struct race_queue));
    memset(race->remain, 0, sizeof(struct race_queue));
#endif

    fprintf(stderr, "global race queue size : 0x%lx\n", 
            sizeof(struct global_race_queue));
}

static inline int module_race_equal(struct race_entry *race1, struct race_entry *race2)
{
    if ((race1->content2.type == race2->content2.type)
            && (race1->content2.size == race2->content2.size)
            && (race1->content2.pc == race2->content2.pc)) {
        return 1;
    }

    return 0;
}

static inline void module_race_filter(struct race_queue *remain, struct race_entry *race) 
{
    int i;

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
    int i, j;
    struct race_queue *remain;

    remain = &race->remain;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        for (j = 0; j < race->thread[i].count; j++) {
            module_race_filter(remain, &race->thread[i].entry[j]);
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
    fprintf(stderr, "race sum count : %d\n", race->sum);
    fprintf(stderr, "race number count : %d\n", race->thread[0].count);
    fprintf(stderr, "race remain count : %d\n\n", remain->count);
}

static inline int module_race_content_equal(struct trace_content *content1, struct trace_content *content2)
{
    if ((content1->type == content2->type) 
            && (content1->size == content2->size) 
            && (content1->pc == content2->pc)
            /* && (content1->tid == content2->tid) */ 
            /* && (content1->address == content2->address) */ ) {
        return 1;
    }

    return 0;
}

static inline void module_race_collection(struct trace_content *content1, struct trace_content *content2) 
{
    int i;
    struct race_queue *temp_queue;

    temp_queue = &race->thread[info.core_id];

    for (i = 0; i < temp_queue->count; i++) {
        if (module_race_content_equal(content1, &temp_queue->entry[i].content1) 
                && module_race_content_equal(content2, &temp_queue->entry[i].content2)) {
            temp_queue->entry[i].instance++;

            break;
        }
    }

    if (i >= temp_queue->count) {
        memcpy(&temp_queue->entry[i].content1, content1, sizeof(struct trace_content));
        memcpy(&temp_queue->entry[i].content2, content2, sizeof(struct trace_content));
        temp_queue->entry[i].instance++;

        temp_queue->count++;
        if (temp_queue->count >= MAX_RACE_NUM) {
            fprintf(stderr, "race queue overflow!\n");
            assert(0);
        }
    }

    race->sum++;
}

