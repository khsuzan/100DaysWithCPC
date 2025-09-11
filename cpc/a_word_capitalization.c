#include <stdio.h>
#include <ctype.h>

int main() {
    char word[1100];
    scanf("%s", word);
    word[0] = toupper(word[0]);
    printf("%s\n", word);
    return 0;
}