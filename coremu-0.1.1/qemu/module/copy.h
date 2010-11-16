#ifndef COPY_H
#define COPY_H

#include <assert.h>

struct map_entry {
    uint8_t id;
};

struct map_queue {
    struct map_entry entry[MAX_PROCESS_NUM];
    uint8_t count;
};

#ifdef PPI_COPY_INIT
static inline void map_queue_init(volatile struct map_queue *map)
{
    memset(map, 0, sizeof(struct map_queue));
}
#else
static inline uint8_t trace_thread_id_map(volatile struct map_queue *map, uint8_t id)
{
    uint8_t i;

    for (i = 0; i < map->count; i++) {
        if (id == map->entry[i].id) {
            break;
        }
    }

    if (i >= map->count) {
        map->entry[i].id = id;

        map->count++;
        if (map->count >= MAX_PROCESS_NUM) {
            printf("thread map queue overflow!\n");
            assert(0);
        }

#ifdef PPI_PRINT_INFO
        printf("\tnew id : %d ; tid : %d\n", id, i);
#endif
    }

    return i;
}

static inline void trace_mem_buf_clear(volatile struct map_queue *map, uint8_t id) 
{

#ifdef PPI_DETECTOR_MODULE
    uint8_t tid;
    uint32_t size;
    struct trace_content *buf;

    if ((id > 0) && (env->trace_mem_ptr - env->debug_info.trace_mem_buf > 0)) {
        tid = trace_thread_id_map(map, id);
        size = env->trace_mem_ptr - env->debug_info.trace_mem_buf;
        buf = env->debug_info.trace_mem_buf;
        data_race_detector(tid, size, buf);
    }
#endif

    env->trace_mem_ptr = env->debug_info.trace_mem_buf;
}
#endif

#endif /* COPY_H */
