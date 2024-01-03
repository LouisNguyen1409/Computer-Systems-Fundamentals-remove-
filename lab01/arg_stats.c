#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	if (argc == 1) {
		printf("Usage: %s NUMBER [NUMBER ...]\n", argv[0]);
		return 1;
	}

	int max = atoi(argv[1]);
	int min = atoi(argv[1]);
	int sum = 0;
	int product = 1;
	for (int i = 1; i < argc; i++) {
		int num = atoi(argv[i]);
		if (num > max) {
			max = num;
		}
		if (num < min) {
			min = num;
		}
		sum += num;
		product *= num;
	}
	int mean = sum / (argc - 1);
	printf("MIN:  %d\n", min);
	printf("MAX:  %d\n", max);
	printf("SUM:  %d\n", sum);
	printf("PROD: %d\n", product);
	printf("MEAN: %d\n", mean);
	return 0;
}
