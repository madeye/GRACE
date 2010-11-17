#ifndef COPY_H
#define COPY_H

#include <assert.h>
//static spinlock_t detect_lock = SPIN_LOCK_UNLOCKED;
static inline void trace_mem_buf_clear(uint8_t id) 
{
#ifdef PPI_DETECTOR_MODULE
    uint8_t tid;
    uint32_t size;
    struct trace_content *buf;

    if ((id > 0) && (env->trace_mem_ptr - env->debug_info.trace_mem_buf > 0)) {
        tid = id;
        size = env->trace_mem_ptr - env->debug_info.trace_mem_buf;
        buf = env->debug_info.trace_mem_buf;
        //spin_lock(&detect_lock);
        data_race_detector(tid, size, buf);
        //spin_unlock(&detect_lock);
    }
#endif

    env->trace_mem_ptr = env->debug_info.trace_mem_buf;
}

#endif /* COPY_H */
