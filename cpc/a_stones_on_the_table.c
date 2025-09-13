#include<stdio.h>

int main(){
    int n;
    char s[52];
    scanf("%d", &n); 
    scanf("%s", s);
    int counter = 0;
    for(int i=0; i < n - 1; i++){
        if(s[i] == s[i+1]){
            counter++;
        }
    }
    printf("%d", counter);
    return 0;
}