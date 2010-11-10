/*
 * COREMU Parallel Emulator Framework
 *
 * Copyright (C) 2010 Parallel Processing Institute, Fudan Univ.
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

#include "watch-client.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void help_info()
{
    printf("usage: watch-control [COMMAND]\n" \
           "commands:\n" \
           "  -b               turn on the debug mode \n" \
           "  -e               stop the debug mode for current program\n" \
           "  -s               turn off the debug mode and flush the report\n");
    exit(1);
}

int main(int argc, char *argv[])
{
    int c;

    if(argc != 2)
    {
        printf("Usage: profile #command, -h for help info\n");

        return 1;
    }

    while((c = getopt(argc, argv, "bseh")) != -1)
    {
        switch(c) {
        case 'b':
            cm_start_watch();
            break;
        case 'e':
            cm_stop_watch();
            break;
        case 's':
            cm_stop_all_watch();
            break;
        case 'h':
            help_info();
            break;
        default :
            printf("error option : %c\n", c);
            help_info();
        }
    }

    return 1;
}

