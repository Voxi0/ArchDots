// Standard Headers
#include<stdio.h>
#include<stdlib.h>

// Custom Strlen Using Pointer Subtraction
size_t custom_strlen(char* s) {
	char *pointer = s;
	while(*pointer != '\0')
		pointer++;
}

// Main
int main() {
	// Variables
	int test_arr[5] = {1, 5, 8, 7, 4};
	int *test_ptr = &test_arr[0];

	// Program
	for(unsigned int i = 0; i < sizeof(test_arr) / sizeof(test_arr[0]); i++, test_ptr++)
		printf("%d ", *test_ptr);
	printf("\n");

	// Terminate Program
	return EXIT_SUCCESS;
}