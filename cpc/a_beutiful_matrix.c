#include <stdio.h>
#include <stdlib.h>

int main() {
    int x, r = -1, c = -1;
    for (int i = 1; i <= 5; i++) {
        for (int j = 1; j <= 5; j++) {
            scanf("%d", &x);
            if (x == 1) { r = i; c = j; }
        }
    }
    printf("%d\n", abs(r - 3) + abs(c - 3));
    return 0;
}