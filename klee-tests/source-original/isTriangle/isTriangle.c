#include <stdio.h>
#include <stdlib.h>

int isTriangle(int a, int b, int c) {
    if(a <= 0 || b <= 0 || c <= 0)
	return 0;
    if(a + b <= c || a + c <= b || b + c <= a)	
        return 1;
    if(a == b && a == c)
	return 4;
    if(a == b) 
        return 3;
    else if(a == c)
        return 3;
    else if(b == c)
	return 3;
    return 2;
}

int main(int argc, char *argv[]) {
    int a, b, c;
    a = atoi(argv[1]);
    b = atoi(argv[2]);
    c = atoi(argv[3]);
    printf("%d\n", isTriangle(a, b, c));
    return 0;
}
