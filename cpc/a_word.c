#include <stdio.h>

int main() {
    char s[105];
    int i = 0, upper = 0, lower = 0;

    scanf("%s", s);

    while (s[i] != '\0') {
        if (s[i] >= 'A' && s[i] <= 'Z') upper++;
        else lower++;
        i++;
    }

    i = 0;
    if (upper > lower) {
        while (s[i] != '\0') {
            if (s[i] >= 'a' && s[i] <= 'z') putchar(s[i] - 32);
            else putchar(s[i]);
            i++;
        }
    } else {
        while (s[i] != '\0') {
            if (s[i] >= 'A' && s[i] <= 'Z') putchar(s[i] + 32);
            else putchar(s[i]);
            i++;
        }
    }

    return 0;
}