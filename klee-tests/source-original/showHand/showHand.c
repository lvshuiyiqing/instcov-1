#include <stdlib.h>
#include <stdio.h>

int showhand(int a1, int b1, int c1, int d1, int a2, int b2, int c2, int d2) {
    if(a1 < 1 || b1 < 1 || c1 < 1 || d1 < 1)
        return -1;
    if(a2 < 1 || b2 < 1 || c2 < 1 || d2 < 1)
	return -2;
    if(a1 > b1 || b1 > c1 || c1 > d1)
        return -3;
    if(a2 < 4 || b2 < 4 || c2 < 4 || d2 < 4)
        return -4;

    if(a2 == b2 && b2 == c2 && c2 == d2) {
        if(d1 - c1 == 1 && c1 - b1 == 1 && b1 - a1 == 1)
            return 1;
        else return 4;
    } else {
        if(d1 - c1 == 1 && c1 - b1 == 1 && b1 - a1 == 1)
            return 2;
   }

    if(a1 == b1 && b1 == c1 && c1 == d1)
        return 3;

    if(a1 == b1 && b1 == c1)
        return 5;

    if(b1 == c1 && c1 == d1)
        return 6;

    if(a1 == b1 && c1 == d1)
        return 7;

    if(a1 == b1 || b1 == c1 || c1 == d1)
        return 8;
    return 9;
}

int main(int argc, char *argv[]) {
    int a1 = atoi(argv[1]);
    int b1 = atoi(argv[2]);
    int c1 = atoi(argv[3]);
    int d1 = atoi(argv[4]);
    int a2 = atoi(argv[5]);
    int b2 = atoi(argv[6]);
    int c2 = atoi(argv[7]);
    int d2 = atoi(argv[8]);
    printf("%d\n", showhand(a1, b1, c1, d1, a2, b2, c2, d2));
    return 0;
}
