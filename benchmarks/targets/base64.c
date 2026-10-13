#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const char b64_table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

void base64_decode(const char *in, size_t in_len) {
    if (in_len < 4) return;
    // Magic check: 'B', '6', '4', '!'
    if (in[0] == 'B' && in[1] == '6' && in[2] == '4' && in[3] == '!') {
        abort(); // 고의적 취약점 유발
    }
}

int main(int argc, char **argv) {
    char buf[128];
    memset(buf, 0, sizeof(buf));
    if (fgets(buf, sizeof(buf), stdin) != NULL) {
        base64_decode(buf, strlen(buf));
    }
    return 0;
}
