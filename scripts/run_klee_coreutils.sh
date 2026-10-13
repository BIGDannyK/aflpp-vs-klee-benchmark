#!/bin/bash
set -e

MAX_TIME=${1:-1800}
TARGET_DIR="/workspace/benchmarks/targets"
mkdir -p "$TARGET_DIR" /workspace/klee/targets /workspace/klee/out

# KLEE가 심볼릭 stdin을 정상 인식하도록 read() 기반 소스로 갱신
cat << 'EOF' > "$TARGET_DIR/base64_klee.c"
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
EOF

cat << 'EOF' > "$TARGET_DIR/md5sum_klee.c"
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
EOF

cat << 'EOF' > "$TARGET_DIR/uniq_klee.c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void check_duplicate(char *line) {
    if (strlen(line) >= 4 && strncmp(line, "UNIQ", 4) == 0) {
        abort();
    }
}

int main(int argc, char **argv) {
    char buf[128];
    memset(buf, 0, sizeof(buf));
    if (read(0, buf, sizeof(buf) - 1) > 0) {
        check_duplicate(buf);
    }
    return 0;
}
EOF

TARGETS=("base64" "md5sum" "uniq")

echo "[*] Compiling targets to LLVM bitcode for KLEE..."
for t in "${TARGETS[@]}"; do
    clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone \
          "$TARGET_DIR/${t}_klee.c" -o "/workspace/klee/targets/${t}.bc"
done

echo "[*] Starting KLEE Benchmark (Max ${MAX_TIME}s per target)..."
for t in "${TARGETS[@]}"; do
    echo "=========================================="
    echo "[*] Running KLEE on ${t} (Timeout: ${MAX_TIME}s)..."
    echo "=========================================="
    OUT_DIR="/workspace/klee/out/${t}"
    rm -rf "$OUT_DIR"
    
    klee \
        --output-dir="$OUT_DIR" \
        --max-time=${MAX_TIME}s \
        --max-memory=2048 \
        --max-solver-time=30s \
        --posix-runtime \
        "/workspace/klee/targets/${t}.bc" --sym-stdin 8 2>&1 | tee "/workspace/klee/${t}_exec.log" || true
    echo "[+] Finished KLEE on ${t}."
done
echo "[+] All KLEE benchmarks completed!"