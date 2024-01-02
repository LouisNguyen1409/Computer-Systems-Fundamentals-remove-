#include <stdio.h>

int main(void) {
	char c;
	while (scanf("%c", &c) != EOF) {
		if (c != 'a' && c != 'e' && c != 'i' && c != 'o' && c != 'u' && c != 'A'
			&& c != 'E' && c != 'I' && c != 'O' && c != 'U') {
			printf("%c", c);
		}
	}
	return 0;
}
