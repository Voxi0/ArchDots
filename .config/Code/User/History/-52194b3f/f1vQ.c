// Standard Headers
#include<stdio.h>
#include<stdlib.h>

// Custom Memocopy
void *custom_memcopy(void *dst, void *src, int num_bytes) {
	char *s = src, *d = dst;
	while(num_bytes--) {
		*d++ = *s++;
	}
	return dst;
}

// Main
int main() {
	// Variables

	// Program

	// Terminate Program
	return EXIT_SUCCESS;
}