#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void check_duplicate(char *line) {
    if (strlen(line) >= 4 && strncmp(line, "UNIQ", 4) == 0) {
        abort();
    }
}

int main(int argc, char **argv) {
    char buf[128];
    memset(buf, 0, sizeof(buf));
    if (fgets(buf, sizeof(buf), stdin) != NULL) {
        check_duplicate(buf);
    }
    return 0;
}
