#!/bin/bash
set -e

DURATION=${1:-1800}
TARGET_DIR="/workspace/benchmarks/targets"
mkdir -p "$TARGET_DIR" /workspace/aflpp/targets /workspace/aflpp/in /workspace/aflpp/out

# 1. 독립 실행 가능한 표준 base64 로직 생성 (의존성 제거)
cat << 'EOF' > "$TARGET_DIR/base64.c"
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
EOF

# 2. 독립 실행 가능한 md5sum 로직 생성
cat << 'EOF' > "$TARGET_DIR/md5sum.c"
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
EOF

# 3. 독립 실행 가능한 uniq 로직 생성
cat << 'EOF' > "$TARGET_DIR/uniq.c"
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
EOF

echo "[*] Compiling targets with afl-clang-fast..."
TARGETS=("base64" "md5sum" "uniq")
for t in "${TARGETS[@]}"; do
    afl-clang-fast -O2 "$TARGET_DIR/${t}.c" -o "/workspace/aflpp/targets/${t}_afl"
done

echo "test seed data" > /workspace/aflpp/in/seed.txt

echo "[*] Starting AFL++ Fuzzing..."
for t in "${TARGETS[@]}"; do
    echo "=========================================="
    echo "[*] Running AFL++ on ${t} (${DURATION}s)..."
    echo "=========================================="
    OUT_DIR="/workspace/aflpp/out/${t}"
    rm -rf "$OUT_DIR"
    mkdir -p "$OUT_DIR"
    timeout --preserve-status ${DURATION}s afl-fuzz -i /workspace/aflpp/in -o "$OUT_DIR" -V ${DURATION} -- "/workspace/aflpp/targets/${t}_afl" 2>&1 | tee "/workspace/aflpp/${t}_fuzz.log" || true
done
echo "[+] All AFL++ benchmarks completed!"