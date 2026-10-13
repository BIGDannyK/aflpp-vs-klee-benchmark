#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void base64_decode(const char *in, size_t in_len) {
    if (in_len < 4) return;
    if (in[0] == 'B' && in[1] == '6' && in[2] == '4' && in[3] == '!') {
        abort();
    }
}

int main(int argc, char **argv) {
    char buf[128];
    memset(buf, 0, sizeof(buf));
    if (read(0, buf, sizeof(buf) - 1) > 0) {
        base64_decode(buf, strlen(buf));
    }
    return 0;
}
