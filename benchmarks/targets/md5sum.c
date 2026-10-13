#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void check_hash(const char *in, size_t len) {
    if (len < 4) return;
    if (in[0] == 'M' && in[1] == 'D' && in[2] == '5' && in[3] == '\n') {
        abort();
    }
}

int main(int argc, char **argv) {
    char buf[128];
    memset(buf, 0, sizeof(buf));
    if (fgets(buf, sizeof(buf), stdin) != NULL) {
        check_hash(buf, strlen(buf));
    }
    return 0;
}
