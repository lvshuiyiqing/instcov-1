#include <stdio.h>
#include <stdlib.h>

int findMiddle(int a, int b, int c){
    if((a < b && b < c)|| (c < b && b < a)){
        return b;
    } else if((a < c && c < b)||(b < c && c < a )){
        return c;
    } else if((b < a && a < c) || (c < a && a < b) ){
        return a;
    } else if (b == c){
        return a;
    } else if (b == a){
        return c;
    } else {
        return b;
    }
}

int main(int argc, char *argv[]) {
    int a, b, c;
    a = atoi(argv[1]);
    b = atoi(argv[2]);
    c = atoi(argv[3]);
    printf("%d\n", findMiddle(a, b, c));
}

