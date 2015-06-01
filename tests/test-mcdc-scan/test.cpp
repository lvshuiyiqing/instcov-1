#include <cstdlib>

int main(int argc, char *argv[]) {
  if (argc < 5) {
    return 1;
  }
  int v1 = atoi(argv[1]);
  int v2 = atoi(argv[2]);
  int v3 = atoi(argv[3]);
  int v4 = atoi(argv[4]);
  if (v1 == 1 && v2 == 1) {
  }
  if (v3 == 1 || v4 == 1) {
  }
  return 0;
}

