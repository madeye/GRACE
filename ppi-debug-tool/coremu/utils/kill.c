#include <stdio.h>
#include <dirent.h>
#include <signal.h>
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
doit(){
	//List all the process
	DIR  *p;
	struct dirent *dirp;
  	if ((p = opendir("/proc")) == NULL)
  	{
		printf("cannot open proc");
		return;
  	}

  	while( (dirp = readdir(p)) != NULL)
		if(dirp -> d_name[0] >='0' && dirp -> d_name[0] <='9'){

			struct process_t pp;
			open_process(dirp -> d_name,&pp);

			if(strstr(pp.comm+1,pfilter)!=pp.comm+1)continue;
		 	kill(pp.pid-1,9);
			kill(pp.pid,9);

		}

  	closedir(p);
}

int
main (int argc,char**argv){
	char a[5]="qemu";
	pfilter=a;
	doit();
	return 0;
}


