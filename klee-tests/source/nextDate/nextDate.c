#include <stdio.h>

void nextDate(int year, int month, int day) {
    int next_year;
    int next_month;
    int next_day;
    int dim;
    int leap;
    if(month == 1 || month == 3 || month == 5 ||
       month == 7 || month == 8 || month == 10 ||
       month == 12) {
        dim = 31;
    } else if(month == 4 || month == 6 || month == 9 ||
              month == 11) {
        dim = 30;
    }
    next_day = day;
    next_month = month;
    next_year = year;

//check month
    if(month <= 0 || month >= 13) {
	printf("month is wrong\n");
        return;
    }
//check year
    if(year <= 1799 || year >= 2012) {
	printf("year is wrong\n");
        return;
    }
//check day
    if(month == 2) {
	if(year % 400 == 0 || ((year % 4 == 0) && (year % 100 != 0)))
	    leap = 1;
 	else leap = 0;
	if(leap == 1)
	    dim = 29;
        else dim = 28;
    }

    if(day <= 0 || day > dim) {
	printf("day is wrong\n");
        return;
    }

    if(day < dim)
	next_day = next_day + 1;
    else if(month != 12) {
	next_day = 1;
	next_month = next_month + 1;
    } else {
	next_day = 1;
	next_month = 1;
	next_year = next_year + 1;
    }
    printf("%d, %d, %d\n", next_year, next_month, next_day);
}

int main(int argc, char *argv[]) {
    int year, month, day;
    klee_make_symbolic(&year, sizeof(year), "year");
    klee_make_symbolic(&month, sizeof(month), "month");
    klee_make_symbolic(&day, sizeof(day), "day");
    nextDate(year, month, day);
}		
