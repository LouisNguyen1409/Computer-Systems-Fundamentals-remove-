#include <stdio.h>
#include <stdlib.h>

void collatz(int n);
int main(int argc, char *argv[])
{
	// 	if (argc == 1) {
	// 	printf("Usage: %s NUMBER\n", argv[0]);
	// 	return EXIT_FAILURE;
	// }

	// collatz(atoi(argv[1]));
	(void) argc, (void) argv; // keep the compiler quiet, should be removed
	return EXIT_SUCCESS;
}

// void collatz(int n) {
// 	printf("%d\n", n);
// 	if (n == 1) {
// 		return;
// 	} else if (n % 2 == 0) {
// 		collatz(n / 2);
// 	} else {
// 		collatz(3 * n + 1);
// 	}
// }