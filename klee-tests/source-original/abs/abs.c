#include <stdio.h>

int my_abs(int a) {
    if(a >= 0)
        return a;
    else return 0 - a;
}

int main(int args, char **argv) {
    int a = atoi(argv[1]);
    printf("%d\n", my_abs(a));
    return 0;
}
