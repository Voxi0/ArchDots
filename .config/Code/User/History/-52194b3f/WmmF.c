// Standard Headers
#include<stdio.h>
#include<stdlib.h>

// Main
int main(void) {
	// Variables
	FILE *test_file = fopen("../src/test.txt", "w");

	// Program
	fprintf(test_file, "Hello World!\n");

	// Terminate Program
	fclose(test_file);
	return EXIT_SUCCESS;
}