#include <stdio.h>

int main()
{
    char s[100];
    int freq[26] = {0};
    int distinc = 0;

    scanf("%s", s);

    for (int i = 0; s[i] != '\0'; i++)
    {
        int index = s[i] - 'a';
        if (freq[index] == 0)
        {
            freq[index] = 1;
            distinc++;
        }
    }

    if (distinc % 2 == 0)
    {
        printf("CHAT WITH HER!\n");
    }
    else
    {
        printf("IGNORE HIM!\n");
    }

    return 0;
}