// Standard Headers
#include<stdio.h>
#include<stdlib.h>

// Main
int main() {
	// Variables
	int *test_ptr;
	if((test_ptr = calloc(1, sizeof(int))) == NULL) {
		printf("Failed to Allocate Memory!\n");
	}

	// Program
	printf("%d\n", *test_ptr);
	free(test_ptr);

	// Terminate Program
	return EXIT_SUCCESS;
}