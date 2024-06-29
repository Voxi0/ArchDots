// Standard Headers
#include<stdio.h>
#include<stdlib.h>

// Main
int main(void) {
	// Variables
	FILE *test_file = fopen("../src/test.txt", "w");
	int *test_ptr = calloc(1, sizeof(int));
	if(test_ptr == NULL) {
		printf("Failed to Allocate Memory!");
		return -1;
	}

	// Program
	fprintf(test_file, "%p", (void*)&test_ptr);

	// Terminate Program
	fclose(test_file);
	return EXIT_SUCCESS;
}