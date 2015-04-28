#include <stdint.h>

void f1() {}
void f2() {}
void f3() {}
int main(int argc, char *argv[]) {
  switch (char i = 2) {
    case 0:
    case 1:
      f1();
    case 2:
      f2();
      f3();
      break;
    default:
      break;
  }
  return 0;
}

