#include <stdio.h>
#include <limits.h>

int my_abs(int a) {
    if(a >= 0)
        return a;
    else return 0 - a;
}

int main(int args, char **argv) {
    int a;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_assume(a!=INT_MIN);
    printf("%d\n", my_abs(a));
    return 0;
}
