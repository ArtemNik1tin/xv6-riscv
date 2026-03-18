#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[]) {
  printf("Hello, world (printf)\n");
  char msg[] = "Hello, world (write)\n";
  int len = sizeof(msg) - 1;
  int ret = write(1, msg, len);

  if (ret == len) {
    exit(0);
  }
  else {
    write(2, "Write failure (stdout)\n", 23);
    exit (1);
  }
}
