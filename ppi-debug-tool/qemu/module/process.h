#ifndef PROCESS_H
#define PROCESS_H

struct process_identify {
    unsigned long cr3;
    unsigned long kernel_esp;
    unsigned int id;
};

struct process_queue {
    struct process_identify process[MAX_PROCESS_NUM]; 
    unsigned int count;
};

#ifdef PPI_PROCESS_INIT
static inline void process_queue_init(struct process_queue *processQueue)
{
    memset(processQueue, 0, sizeof(struct process_queue));
}
#else
static inline int isEmpty(struct process_queue *queue) 
{
    return (queue->count == 0);
}

static inline int processEnqueue(struct process_queue *queue, unsigned long cr3, unsigned long esp, unsigned int id) 
{
    unsigned int count;

    count = queue->count;

    if (count >= MAX_PROCESS_NUM) {
        return -1;
    }

    queue->process[count].cr3 = cr3;
    queue->process[count].kernel_esp = esp;
    queue->process[count].id = id;

    queue->count++;

    return count;
}

static inline int processDequeue(struct process_queue *queue, unsigned long cr3, unsigned long esp) 
{
    int i, count;
    int index = 0;
    int find = 0;

    for (i = 0; i < queue->count; i++) {
        if (find) {
            queue->process[i - 1].cr3 = queue->process[i].cr3;
            queue->process[i - 1].kernel_esp = queue->process[i].kernel_esp;
            queue->process[i - 1].id = queue->process[i].id;
        } else if ((queue->process[i].cr3 == cr3) && (queue->process[i].kernel_esp == esp)) {
            find = 1;
            index = i;	
        }
    }

    if (!find) {
        return -1;
    }

    queue->count--;

    count = queue->count;

    queue->process[count].cr3 = 0;
    queue->process[count].kernel_esp = 0;
    queue->process[count].id = 0;

    return index;
}

static inline int isProcessInQueue(struct process_queue *queue, unsigned long cr3) 
{
    int i;

    for (i = 0; i < queue->count; i++) {
        if (queue->process[i].cr3 == cr3) {
            return i;
        }
    }

    return -1;
}

static inline int isThreadInQueue(struct process_queue *queue, unsigned long cr3, unsigned long esp) 
{
    int i;

    for (i = 0; i < queue->count; i++) {
        if ((queue->process[i].cr3 == cr3) && (queue->process[i].kernel_esp == esp)) {
            return i;
        }
    }

    return -1;
}

static inline unsigned int getThreadID(struct process_queue *queue, int index) 
{
    return queue->process[index].id;
}
#endif

#endif /* PROCESS_H */
