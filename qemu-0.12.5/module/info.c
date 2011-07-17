
/* thread info */

struct global_info {
    uint8_t max_tid_num;
    uint8_t exist[MAX_PROCESS_NUM];
};

struct global_info info;

static inline void module_info_init()
{
    memset(&info, 0, sizeof(struct global_info));
}

