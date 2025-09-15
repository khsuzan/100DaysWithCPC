#include<stdio.h>

int main(){
    int k, n, w;
    scanf("%d %d %d", &k, &n, &w);
    int lend = k * ((w * (w+1))/2) - n;
    printf("%d", lend < 0 ? 0 : lend);
    return 0;
}