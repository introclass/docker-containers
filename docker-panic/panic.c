#include <stdio.h>
#include <unistd.h>
int main(int argc, const char *argv[])
{
	printf("Running...\n");
	sleep(10);
	int *ptr= 0x0;
	*ptr = 1;
	return 0;
}
