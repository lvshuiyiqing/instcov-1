int f() {
  return 0;
}

int main(int argc, char *argv[]) {
  if (bool tmp = true)
    if (true)
      f() ;
    else
      f() ;

  if (true)
    ;
  
  return 0;
}

