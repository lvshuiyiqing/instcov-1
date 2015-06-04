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
  int a, b, c, d, e;
  klee_make_symbolic(&a, sizeof(a), "a");
  klee_make_symbolic(&b, sizeof(b), "b");
  klee_make_symbolic(&c, sizeof(c), "c");
  klee_make_symbolic(&d, sizeof(d), "d");
  klee_make_symbolic(&e, sizeof(e), "e");
  printf("%d\n", complex_check(a, b, c, d, e));
  return 0;
}
