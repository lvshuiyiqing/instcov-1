#include <stdio.h>
#include <stdlib.h>

int isLeapYear(int year) {
    if(year < 0)
        return -1;
    if(((year % 4 == 0) && !(year % 100 == 0)) || (year % 400 == 0))
    	return 1;
    else
    	return 0;
}

int main(int argc, char *argv[]) {
    int year;
    klee_make_symbolic(&year, sizeof(year), "year");
    printf("%d\n", isLeapYear(year));
    return 0;
}
