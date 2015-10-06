#include <cstdlib>
#include <iostream>

int foo(void) {
  return (true || false);
}

int main(int argc, char *argv[]) {
  if (argc != 5) {
    std::cerr << "need exactly 4 arguments" << std::endl;
    return 1;
  }
  int v1 = atoi(argv[1]);
  int v2 = atoi(argv[2]);
  int v3 = atoi(argv[3]);
  int v4 = atoi(argv[4]);
  if (v1 && v2) {
  } else {
    if (v3);
  }
  if ((v1 && v2) || (v3 && v4)) {
  }

  for (int i = 0; i < 3; ++i) {
  }

  int tmp = 3;
  while (tmp) {
    --tmp;
  }
  do {
    ++tmp;
  } while (tmp < 3);

  switch (v1) {
    case 0:
    case 1:
      break;
    default:
      break;
  }
  if (true && foo()) {
  }
  return 0;
}
