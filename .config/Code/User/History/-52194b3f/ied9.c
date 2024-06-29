// Standard Headers
#include<stdio.h>
#include<stdlib.h>

typedef struct {
	char *manufacturer, *model;
	float price;
} Car;

typedef int* inptr;

// Main
int main() {
	// Variables
	Car car = {
		.manufacturer = "Nissan",
		.model = "Nismo R35 GTR",
		.price = 125000.0,
	};

	// Program
	printf("%.1f\n", car.price);

	// Terminate Program
	return EXIT_SUCCESS;
}