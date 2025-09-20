#include <stdio.h>

int main()
{
    char s[101], t[101];
    scanf("%s", &s);
    scanf("%s", &t);

    int sLength = 0;
    while (s[sLength] != '\0')
    {
        sLength++;
    }

    int tLength = 0;
    while (t[tLength] != '\0')
    {
        tLength++;
    }

    int output = 0;

    if (sLength == tLength)
    {
        for (int i = 0; i < sLength; i++)
        {
            int tLastIndex = sLength - 1 - i;
            char tChar = t[tLastIndex];
            if (s[i] != tChar)
            {
                output = -1;
            }
        }
    }
    else
    {
        output = -1;
    }
    printf("%s", output == 0 ? "YES" : "NO");

    return 0;
}