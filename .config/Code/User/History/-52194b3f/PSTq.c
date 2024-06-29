// Standard Headers
#include<stdio.h>
#include<stdlib.h>

// Main
int main() {
	// Variables
	int *test_ptr;
	if((test_ptr = malloc(sizeof(int))) == NULL) {
		printf("Failed to Allocate Memory!\n");
	}

	// Program
	*test_ptr = 2;
	printf("%d\n", *test_ptr);
	free(test_ptr);

	// Terminate Program
	return EXIT_SUCCESS;
}