#!/bin/bash
set -e

COREUTILS_VER="8.32"
COREUTILS_DIR="benchmarks/coreutils-${COREUTILS_VER}"

echo "[*] 1. Downloading GNU Coreutils ${COREUTILS_VER}..."
mkdir -p benchmarks
cd benchmarks
if [ ! -d "coreutils-${COREUTILS_VER}" ]; then
    wget -q https://ftp.gnu.org/gnu/coreutils/coreutils-${COREUTILS_VER}.tar.xz || curl -sO https://ftp.gnu.org/gnu/coreutils/coreutils-${COREUTILS_VER}.tar.xz
    tar -xf coreutils-${COREUTILS_VER}.tar.xz
fi
cd ..

echo "[+] Coreutils source ready at ${COREUTILS_DIR}"