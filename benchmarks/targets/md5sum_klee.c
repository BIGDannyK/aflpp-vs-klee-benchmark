#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void check_hash(const char *in, size_t len) {
    if (len < 4) return;
    if (in[0] == 'M' && in[1] == 'D' && in[2] == '5' && in[3] == '!') {
        abort();
    }
}

int main(int argc, char **argv) {
    char buf[128];
    memset(buf, 0, sizeof(buf));
    if (read(0, buf, sizeof(buf) - 1) > 0) {
        check_hash(buf, strlen(buf));
    }
    return 0;
}
