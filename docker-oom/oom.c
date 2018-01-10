#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, const char *argv[])
{
	sleep(10);
	void *ptr;
	int i = 0;
	int size = 5*1024*1024;
	while(1){
		printf("alloc %d * 5MB\n", i);
		ptr = malloc(size);
		if(ptr==NULL){
			printf("alloc fail!\n");
		}else{
			i++;
			memset(ptr, '\0', size);
		}
	}
	return 0;
}
