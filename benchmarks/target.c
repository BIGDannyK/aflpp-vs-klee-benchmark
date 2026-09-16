#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void test_func(char *str) {
    if (str[0] == 'B') {
        if (str[1] == 'U') {
            if (str[2] == 'G') {
                if (str[3] == '!') {
                    abort(); 
                }
            }
        }
    }
}

int main(int argc, char *argv[]) {
    char buf[16] = {0};
    if (read(0, buf, sizeof(buf) - 1) > 0) {
        test_func(buf);
    }
    return 0;
}
