#include <stdio.h>
void main()
{
    int n;
    scanf("%d", &n);
    while (n--)
    {
        char word[100];
        scanf("%s", word);
        int len = 0;
        while (word[len] != '\0')
        {
            len++;
        }
        if (len > 10)
        {
            printf("%c%d%c\n", word[0], len - 2, word[len - 1]);
        }
        else
        {
            printf("%s\n", word);
        }
    }
}