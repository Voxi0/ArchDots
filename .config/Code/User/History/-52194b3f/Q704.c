// Standard Headers
#include<stdio.h>
#include<stdlib.h>

// Main
int main() {
	// Variables
	int test_arr[5] = {1, 5, 8, 7, 4};
	int test_ptr = &test_arr[0];

	// Program
	for(int i = 0; i < sizeof(test_arr) / sizeof(test_arr[0]); i++) {
		printf("%d ", *test_ptr);
	}

	// Terminate Program
	return EXIT_SUCCESS;
}