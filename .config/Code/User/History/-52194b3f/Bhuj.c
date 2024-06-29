// Standard Headers
#include<stdio.h>
#include<stdlib.h>

// Custom Strlen Using Pointer Subtraction
size_t custom_strlen(char* s) {
	// Create A Pointer to The String
	char *pointer = s;

	// Calculate The Memory Location of The Last Byte in The String
	while(*pointer != '\0')
		pointer++;

	// Subtract The Location of The Start of The String From The End of The String
	return pointer - s;
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