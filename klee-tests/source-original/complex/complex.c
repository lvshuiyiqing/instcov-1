#include <stdio.h>
#include <stdlib.h>

int complex_check(int a, int b, int c, int d, int e) {
    if(a < 10 && b > 1000 && c > 999) {
        return 0;
    } else if(a > 10 && b > 1000 && c > 999 && d > 999 && d < 1001) {
        if(c + b < 2003 && a + b < 1400 && a > 390) {
            if( d + e > 2001 && d + e < 2003) {
                return 1;
            }
            return 2;
        }
        return 3;
    } else {
        return 4;
    }
}

int main(int argc, char *argv[]) {
    int a = atoi(argv[1]);
    int b = atoi(argv[2]);
    int c = atoi(argv[3]);
    int d = atoi(argv[4]);
    int e = atoi(argv[5]);
    printf("%d\n", complex_check(a, b, c, d, e));
    return 0;
}
