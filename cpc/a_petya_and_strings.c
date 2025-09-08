#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
    char s1[105], s2[105];
    scanf("%s", s1);
    scanf("%s", s2);

    for (int i = 0; s1[i]; i++) s1[i] = tolower(s1[i]);
    for (int i = 0; s2[i]; i++) s2[i] = tolower(s2[i]);

    int cmp = strcmp(s1, s2);

    if (cmp < 0) printf("-1");
    else if (cmp > 0) printf("1");
    else printf("0");

    return 0;
}
