#include <stdio.h>

int isLucky(int x) {
    if (x == 0) return 0;
    while (x > 0) {
        int d = x % 10;
        if (d != 4 && d != 7) return 0;
        x /= 10;
    }
    return 1;
}

int main() {
    char n[25];
    int count = 0;
    scanf("%s", n);
    for (int i = 0; n[i] != '\0'; i++) {
        if (n[i] == '4' || n[i] == '7')
            count++;
    }
    if (isLucky(count))
        printf("YES");
    else
        printf("NO");
    return 0;
}