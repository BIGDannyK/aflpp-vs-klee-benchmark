#!/bin/bash
echo "[*] Compiling target to LLVM bitcode..."
clang -emit-llvm -c -g /workspace/benchmarks/target.c -o /workspace/klee/target.bc

echo "[*] Starting KLEE Symbolic Execution..."
mkdir -p /workspace/klee/out
cd /workspace/klee/out
klee --posix-runtime /workspace/klee/target.bc --sym-stdin 8
