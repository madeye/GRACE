#include <stdio.h>
#include <dirent.h>
#include <curses.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <time.h>
#include <sys/time.h>

#define BUFF_SIZE 1024

char* pfilter;

struct process_t{
	int pid;
	char comm[256];
	char state;
	long utime;
	long stime;
	int processor;
};

//Processor count
int proc_cnt;
int
count_processor(){
	FILE* status = fopen("/proc/stat", "r");
	char buffer[256];
	int procs = -1;
	do {
		procs++;
		fgets(buffer, 255, status);
	}while (buffer[0]=='c' && buffer[1]=='p' && buffer[2]=='u');
	fclose(status);
	return procs-1;
}


int open_process(char * pid, struct process_t *p)
{
    char buffer[BUFF_SIZE];
    char filename[20];

    sprintf(filename,"/proc/%s/stat",pid);

    int fd=open(filename,O_RDONLY);
    read (fd, buffer, sizeof (buffer));
    close(fd);

    long int dummy;
    int dummy2;
    long long unsigned int dummy3;

    sscanf(buffer,
        "%d %s %c %d %d"
        "%d %d %d %u %lu"
        "%lu %lu %lu %lu %lu"
        "%ld %ld %ld %ld %ld"
        "%ld %llu %lu %ld %lu"
        "%lu %lu %lu %lu %lu"
        "%lu %lu %lu %lu %lu"
        "%lu %lu %d %d",
        &p->pid,(char *)&p->comm,&p->state,&dummy2,&dummy2,
        &dummy2,&dummy2,&dummy2,&dummy2,&dummy,
        &dummy,&dummy,&dummy,&p->utime,&p->stime,
        &dummy,&dummy,&dummy,&dummy,&dummy,
        &dummy,&dummy3,&dummy,&dummy,&dummy,
        &dummy,&dummy,&dummy,&dummy,&dummy,
        &dummy,&dummy,&dummy,&dummy,&dummy,
        &dummy,&dummy,&dummy2,&p->processor);

    return 0;
}

void
print_processor(struct process_t *p){
	int i;
	attron(A_BOLD);
	addch('[');
	attroff(A_BOLD);
	for(i=0;i<proc_cnt;i++){
		if(i==p->processor){
			if(p->state=='R'){
				attrset(COLOR_PAIR(2));
			}else{
				attrset(COLOR_PAIR(3));
			}
			addch(p->state);
			attrset(COLOR_PAIR(1));
		}else{
			addch('|');
		}

	}
	attron(A_BOLD);
	addch(']');
	attroff(A_BOLD);
}

void
print_process(struct process_t *p){
	printw("%d\t",p->pid);
	print_processor(p);
	addch('\t');
}

void
refresh_list(){
	//List all the process
	DIR  *p;
	struct dirent *dirp;
	DIR  *p2;
	struct dirent *dirp2;
  	if ((p = opendir("/proc")) == NULL)
  	{
		printf("cannot open proc");
		return;
  	}

	int th=0;

	int x,y;

  	while( (dirp = readdir(p)) != NULL)
		if(dirp -> d_name[0] >='0' && dirp -> d_name[0] <='9'){
			//if(++th>32)break;

			struct process_t pp;
			open_process(dirp -> d_name,&pp);

			if(strstr(pp.comm+1,pfilter)!=pp.comm+1)continue;

			char buf[30];
			sprintf(buf,"/proc/%s/task",dirp -> d_name);
			if ((p2 = opendir(buf)) != NULL)
  			{
				while( (dirp2= readdir(p2)) != NULL){
					struct process_t p;

					p.processor=-1;
					open_process(dirp2 -> d_name,&p);
					if(p.processor==-1)continue;

					x=th%48;
					y=(th/48)*32;
					move(x+1,y);

					print_process(&p);
					th++;
				}
  			}


		}

  	closedir(p);
}

void
init(){
	proc_cnt=count_processor();
	initscr();
	if(has_colors())
		start_color();
    init_pair(1, COLOR_WHITE, COLOR_BLACK);
	init_pair(2, COLOR_WHITE, COLOR_GREEN);
	init_pair(3, COLOR_WHITE, COLOR_RED);

}

void Sleep(int iSec,int iUsec){
	struct timeval tv;
	tv.tv_sec=iSec;
	tv.tv_usec=iUsec;
	select(0,NULL,NULL,NULL,&tv);
}

int
main (int argc,char**argv){
	if(argc==1){
		printf("Please specify the task you want to monitor.\n");
		return 0;
	}
	pfilter=argv[1];

	init();
	int count=0;
	while(1){
		erase();
		move(0,0);
		count++;
		printw("Refresh %d",count);
		refresh_list();
		refresh();
		Sleep(0,100000);
	}
	endwin();
	return 0;

}

