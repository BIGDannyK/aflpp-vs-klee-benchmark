#!/bin/bash
echo "[*] Compiling target with afl-clang-fast..."
afl-clang-fast /workspace/benchmarks/target.c -o /workspace/aflpp/target_afl

echo "[*] Starting AFL++ Fuzzing..."
afl-fuzz -i /workspace/aflpp/in -o /workspace/aflpp/out -- /workspace/aflpp/target_afl
