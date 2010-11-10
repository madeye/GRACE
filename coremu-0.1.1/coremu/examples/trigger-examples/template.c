/*
 * COREMU Parallel Emulator Framework
 *
 * Copyright (C) 2010 Parallel Processing Institute (PPI), Fudan Univ.
 *  <http://ppi.fudan.edu.cn/system_research_group>
 *
 * Authors:
 *  Zhaoguo Wang    <zgwang@fudan.edu.cn>
 *  Yufei Chen      <chenyufei@fudan.edu.cn>
 *  Ran Liu         <naruilone@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

/*
 * This file is a template about how to write trigger functions to help
 * programmer to debug.
 * Trigger functions can be defined by programmer and will be invoked
 * when the memory location watched by programmer is accessed.
 */

/*
 * The declaration of log entry type
 */
typedef struct example_info {
    unsiged long info1;
    unsiged long info1;
    /* ... */
} example_info;

/*
 * A buffer need to be defined which is used to log the information.
 * Every vcpu has its own buffer, so it need to be thread local.
 */
static __thread CMLogbuf *example_log_buf;

/*
 * The log recoding function.
 * This function type must be void XXX(FILE *log_file, void *opaque)
 * log_file: the file discriptor of the current cpu's log file.
 * opaque: the infomation recorded in the buffer.
 */
static void example_record_log(FILE *log_file, void *opaque)
{
    example_info *info = (example_info *)opaque;
    fprintf(log_file, "Example: \n", info->info1, info->info2);
}


/*
 * The trigger function provided by the user.
 * This function will be called by COREMU when any watched memory location
 * is accessed. 
 * The access infomation will be passed by COREMU.
 */
static void example_trigger_function(void *opaque)
{
    /* The access infomation is passed by COREMU. */
    CMWParams *wpara = (CMWParams *)opaque;
    
    /* XXX: Log the access infomation and current context.*/
}

/*
 * Three interfaces need to be provided by the user which will be invoked
 * by COREMU in the debug mode.
 * The three interfaces are: 
 *     trigger_init
 *     log_buffer_init
 *     log_buffer_flush
 */

/*
 * Do the basic initialization.
 * This function will be call by COREMU.
 * For example: register the trigger function with an trigger function ID.
 */  
void trigger_init(void)
{
    cm_register_wtrigger_func(1, example_trigger_function);

    /*XXX: other basic initialization*/
}

/*
 * Initial the example_log_buf for every CPU.
 * A log file and record function need to be binded with this buffer.
 * COREMU will call the record function when the buffer is full.
 */
void log_buffer_init(void)
{
    /* XXX: initail the log buffer here */
    char cpu_log_name[100];
    sprintf(cpu_log_name, "example_bug_log%d", cm_get_cpu_idx());
    FILE *file = fopen(cpu_log_name,"w");
    example_log_buf = cm_logbuf_new(100, sizeof(example_info),
                                        example_record_log, file);
}

/*
 * Flush the example_log_buf.
 * This function will be called when the debug mode is turned off.
 */
void log_buffer_flush(void)
{
   /* XXX: flush the log buffer here */
   /* ... */
} 
