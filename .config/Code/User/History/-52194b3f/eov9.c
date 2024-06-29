// Standard Headers
#include<stdio.h>
#include<stdlib.h>

typedef struct Car {
	char *manufacturer, *model;
	float price;
} Car;

// Main
int main() {
	// Variables
	Car car = {
		.manufacturer = "Nissan",
		.model = "Nismo R35 GTR",
		.price = 125000.0;
	};

	// Program

	// Terminate Program
	return EXIT_SUCCESS;
}