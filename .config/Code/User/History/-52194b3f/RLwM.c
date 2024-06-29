// Standard Headers
#include<stdio.h>
#include<stdlib.h>

typedef struct {
	char *manufacturer, *model;
	float price;
} Car;

typedef int* intptr;

// Main
int main() {
	// Variables
	int test_num = 2;
	intptr test_ptr = &test_num;

	// Program
	printf("%.d\n", *test_ptr);

	// Terminate Program
	return EXIT_SUCCESS;
}