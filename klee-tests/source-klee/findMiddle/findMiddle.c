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
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&c, sizeof(c), "c");
    printf("%d\n", findMiddle(a, b, c));
}

