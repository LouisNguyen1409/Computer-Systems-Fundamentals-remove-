#include <stdio.h>
#include <stdlib.h>

#define SERIES_MAX 30

int fibonacci(int n);
int main(void) {
    int n;
    while (scanf("%d", &n) == 1) printf("%d\n", fibonacci(n));
    return EXIT_SUCCESS;
}

int fibonacci(int n) {
    if (n <= 0 || n > SERIES_MAX) return 0;
    if (n == 1 || n == 2) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2);
}