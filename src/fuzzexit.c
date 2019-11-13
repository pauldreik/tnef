#include "fuzzexit.h"
#include <stdlib.h>
void fuzzexit(int status) {
exit(0);
}
void fuzzabort() {
  exit(0);
}
