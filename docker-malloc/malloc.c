#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, const char *argv[])
{
	if (argc != 3 ) {
		printf("usage: %s size(unit is MB) sleep(unit is second)\n", argv[0]);
		exit(1);
	}
	
	int size = atoi(argv[1]);
	int second = atoi(argv[2]);
	
	void *ptr;
	
	printf("alloc %d MB\n", size);
	ptr = malloc(size * 1024 * 1024);
	if(ptr==NULL){
		printf("alloc fail!\n");
	}else{
		memset(ptr, '1', size*1024*1024);
	}
	sleep(second);
	return 0;
}
