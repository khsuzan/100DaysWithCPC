#include <stdio.h>

int main(void) {
    int x;
    if (scanf("%d", &x) != 1) return 0;
    int steps = x / 5 + (x % 5 != 0);
    printf("%d\n", steps);
    return 0;
}