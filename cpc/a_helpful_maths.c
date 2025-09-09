#include <stdio.h>

int main() {
    int container[55];
    char input[105];
    scanf("%s", input);

    int count = 0;

    for (int i = 0; input[i] != '\0'; i++) {
        if (input[i] == '+') continue;
        container[count++] = input[i] - '0';
    }

    for (int i = 0; i < count - 1; i++) {
        for (int j = 0; j < count - i - 1; j++) {
            if (container[j] > container[j + 1]) {
                int temp = container[j];
                container[j] = container[j + 1];
                container[j + 1] = temp;
            }
        }
    }

    for (int i = 0; i < count; i++) {
        if (i > 0) printf("+");
        printf("%d", container[i]);
    }
    printf("\n");

    return 0;
}