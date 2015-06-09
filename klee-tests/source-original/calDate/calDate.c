#include <stdlib.h>
#include <stdio.h>

int calDate(int year, int month, int day) {
    int julianYear, julianMonth;
    int result;
    if(year < 0)
	julianYear = year + 1;
    else julianYear = year;
    if(month <= 0 || month > 12 || day <= 0 || day > 31)
	return -1;
    if(month > 2)
	julianMonth = month + 1;
    else {
	julianMonth = month + 13;
	julianYear = julianYear - 1;
    }

    result = julianYear * 100 + julianMonth * 3;
    if(year == 1582) {
        if(month < 10)
	    result = julianYear * 3 + julianMonth * 3;
        else if(month == 10 && day < 15) {
	    result = julianYear * 5 + julianMonth * 5;
        }
    } else {
	result = julianYear * 10 + julianMonth * 3;
    }

    return result;
}

int main(int argc, char *argv[]) {
    int year = atoi(argv[1]);
    int month = atoi(argv[2]);
    int day = atoi(argv[3]);
    printf("%d\n", calDate(year, month, day));
    return 0;
}
