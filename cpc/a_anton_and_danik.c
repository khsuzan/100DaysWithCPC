#include <stdio.h>

int main()
{
    int game;
    scanf("%d", &game);
    char result[game + 1];
    scanf("%s", result);

    int antonWin = 0, danikWin = 0;

    for (int i = 0; i < game; i++)
    {
        if (result[i] == 'A')
            antonWin++;
        else if (result[i] == 'D')
            danikWin++;
    }

    if (antonWin > danikWin)
        printf("Anton");
    else if (danikWin > antonWin)
        printf("Danik");
    else
        printf("Friendship");

    return 0;
}