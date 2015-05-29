#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  for (int i = 0; i < 10; ++i) {
    if (1 || 0) {
    }
  }
  int *p = 0;
  *p = 1;
  return 0;
}

