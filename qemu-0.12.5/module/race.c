
/* race */

struct race_entry {
    struct trace_full_content content1;
    struct trace_full_content content2;
    uint32_t instance;
};

#define MAX_RACE_NUM (1 << 20)

struct race_queue {
    struct race_entry entry[MAX_RACE_NUM];
    uint32_t count;
};

struct global_race_queue {
    struct race_queue *thread[MAX_PROCESS_NUM];
    struct race_queue *remain;
};

struct global_race_queue *race;

static inline void module_race_init() 
{
    int i;

    race = (struct global_race_queue *)malloc(sizeof(struct global_race_queue));
    memset(race, 0, sizeof(struct global_race_queue));

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        race->thread[i] = (struct race_queue *)malloc(sizeof(struct race_queue));		
        memset(race->thread[i], 0, sizeof(struct race_queue));
    }

    race->remain = (struct race_queue *)malloc(sizeof(struct race_queue));
    memset(race->remain, 0, sizeof(struct race_queue));
}

static inline int module_race_equal(struct race_entry *race1, struct race_entry *race2)
{
    if ((race1->content2.type == race2->content2.type)
            && (race1->content2.size == race2->content2.size)
            /*&& (race1->content2.pc == race2->content2.pc)) {*/
        ) {
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

static inline void module_race_print() 
{
    int i, j;
    struct race_queue *remain;

    remain = race->remain;

    for (i = 0; i < MAX_PROCESS_NUM; i++) {
        for (j = 0; j < race->thread[i]->count; j++) {
            module_race_filter(remain, &race->thread[i]->entry[j]);
        }
    }

    for (i = 0; i < remain->count; i++) {
        fprintf(stderr, "No. %d : address : 0x%lx ; same count : %d\n", 
                i, remain->entry[i].content2.address, remain->entry[i].instance);
        fprintf(stderr, "tid1 : %d ; type1 : %d ; size1 : %d\n", 
                remain->entry[i].content1.tid,
                remain->entry[i].content1.type, 
                remain->entry[i].content1.size);
        fprintf(stderr, "tid2 : %d ; type2 : %d ; size2 : %d\n\n", 
                remain->entry[i].content2.tid,
                remain->entry[i].content2.type, 
                remain->entry[i].content2.size);
        /*fprintf(stderr, "tid1 : %d ; type1 : %d ; size1 : %d ; pc1 : 0x%lx\n", */
                /*remain->entry[i].content1.tid, remain->entry[i].content1.type, */
                /*remain->entry[i].content1.size, remain->entry[i].content1.pc);*/
        /*fprintf(stderr, "tid2 : %d ; type2 : %d ; size2 : %d ; pc2 : 0x%lx\n\n", */
                /*remain->entry[i].content2.tid, remain->entry[i].content2.type, */
                /*remain->entry[i].content2.size, remain->entry[i].content2.pc);*/
    }

    fprintf(stderr, "race remain count : %d\n\n", remain->count);
}

static inline int module_race_content_equal(struct trace_full_content *content1, struct trace_full_content *content2)
{
    if ((content1->tid == content2->tid) 
            && (content1->type == content2->type) 
            && (content1->size == content2->size) 
            && (content1->address == content2->address) 
            /*&& (content1->pc == content2->pc)) {*/
        ){
        return 1;
    }

    return 0;
}

static inline void module_race_collection(struct trace_full_content *content1, struct trace_content *content2) 
{
    int i;
    struct race_queue *temp_queue;
    struct trace_full_content temp_content;

    temp_content.tid = info.tid;
    temp_content.type = content2->type;
    temp_content.size = content2->size;
    temp_content.address = content2->address;

#ifdef PPI_THREE_STAGE
    temp_queue = race->thread[info.tid];
#else
    temp_queue = race->thread[info.tid];
#endif

    for (i = 0; i < temp_queue->count; i++) {
        if (module_race_content_equal(content1, &temp_queue->entry[i].content1)
                && module_race_content_equal(&temp_content, &temp_queue->entry[i].content2)) {
            temp_queue->entry[i].instance++;
            break;
        }
    }

    if (i >= temp_queue->count) {
        memcpy(&temp_queue->entry[i].content1, content1, sizeof(struct trace_full_content));
        memcpy(&temp_queue->entry[i].content2, &temp_content, sizeof(struct trace_full_content));
        temp_queue->entry[i].instance++;

        temp_queue->count++;
        if (temp_queue->count >= MAX_RACE_NUM) {
            fprintf(stderr, "race queue overflow!\n");
            assert(0);
        }
    }
}

