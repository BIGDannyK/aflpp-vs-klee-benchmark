# Comparative Analysis of Fuzzing and Symbolic Execution
> **Performance Evaluation and Exploration Mechanism Comparison: AFL++ vs. KLEE**  
> 공통 마이크로 벤치마크 기반 커버리지 퍼징(AFL++)과 기호 실행(KLEE)의 탐색 메커니즘 및 취약점 탐지 성능 실증 연구

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Linux](https://img.shields.io/badge/Platform-Docker%20linux%2Famd64-orange.svg)]()
[![Engine: AFL++](https://img.shields.io/badge/Fuzzing-AFL++%20v4.x-red.svg)](https://github.com/AFLplusplus/AFLplusplus)
[![Engine: KLEE](https://img.shields.io/badge/Symbolic_Execution-KLEE%20v3.x-brightgreen.svg)](https://klee-se.org/)

---

## 1. Project Overview

본 프로젝트는 현대 소프트웨어 자동 취약점 탐지 기술의 양대 축인 **커버리지 기반 그레이박스 퍼징(Coverage-guided Greybox Fuzzing, AFL++)**과 **화이트박스 기호 실행(Whitebox Symbolic Execution, KLEE)**의 탐색 메커니즘 차이와 트레이드오프를 격리된 Docker 환경에서 실증적으로 비교·규명한 연구입니다.

동일한 C 소스코드 기반 마이크로 벤치마크 타깃 3종(`base64`, `md5sum`, `uniq`)을 대상으로 두 엔진을 교차 구동하여 실행 처리량(Throughput), 제어 흐름 분기 개척 능력, 결함(Crash) 도달 시간, 그리고 **'커버리지 장벽(Coverage Wall)'**과 **'경로 완전 검증(Exhaustive Search)'** 현상을 정량적으로 증명하였습니다.

---

## 2. Key Empirical Findings (실증 벤치마크 핵심 결과)

Docker 컨테이너 환경에서 각 타깃당 30분(1,800초) 동안 통제 벤치마크를 수행하여 도출된 실측 집계 데이터입니다.

<table>
  <thead>
    <tr>
      <th align="center">Target</th>
      <th align="center">Tool (Engine)</th>
      <th align="center">Executions / Instructions</th>
      <th align="center">Speed / Time</th>
      <th align="center">Crash Result</th>
      <th align="left">Key Findings</th>
    </tr>
  </thead>
  <tbody>
    <!-- base64 -->
    <tr>
      <td rowspan="2" align="center"><b>base64</b></td>
      <td align="center"><b>AFL++</b></td>
      <td align="center">1,196,737 execs</td>
      <td align="center">664.89 exec/s (1,799s)</td>
      <td align="center">✅ <b>Found</b> (253.7s)</td>
      <td rowspan="2" align="left">양 엔진 모두 4바이트 매직 넘버("B64!") 돌파 성공.<br>• AFL++: 초당 665회의 높은 처리량<br>• KLEE: 12초 만에 유한 경로 전수 검증 완료</td>
    </tr>
    <tr>
      <td align="center"><b>KLEE</b></td>
      <td align="center">4,440 insts</td>
      <td align="center">~12s (조기 종료)</td>
      <td align="center">✅ <b>Found</b> (1 test)</td>
    </tr>
    <!-- md5sum -->
    <tr>
      <td rowspan="2" align="center"><b>md5sum</b></td>
      <td align="center"><b>AFL++</b></td>
      <td align="center">1,180,000+ execs</td>
      <td align="center">~670 exec/s (1,800s)</td>
      <td align="center">✅ <b>Found</b> (10.5s)</td>
      <td rowspan="2" align="left">AFL++ 변이 엔진이 10초(7,261회) 만에 "MD5\n" 우연 적중.<br>KLEE 역시 14초 만에 제약식 역산으로 결함 케이스 도출.</td>
    </tr>
    <tr>
      <td align="center"><b>KLEE</b></td>
      <td align="center">4,440 insts</td>
      <td align="center">~14s (조기 종료)</td>
      <td align="center">✅ <b>Found</b> (1 test)</td>
    </tr>
    <!-- uniq -->
    <tr>
      <td rowspan="2" align="center"><b>uniq</b></td>
      <td align="center"><b>AFL++</b></td>
      <td align="center">1,210,000+ execs</td>
      <td align="center">~670 exec/s (1,800s)</td>
      <td align="center">❌ <b>NOT Found (0건)</b></td>
      <td rowspan="2" align="left"><b>AFL++ 커버리지 장벽(Coverage Wall) 실증:</b><br>120만 회 변이에도 "UNIQ" 키워드 미도달.<br>반면 KLEE는 13초 만에 SMT 솔버로 완전 검증 성공.</td>
    </tr>
    <tr>
      <td align="center"><b>KLEE</b></td>
      <td align="center">4,436 insts</td>
      <td align="center">~13s (조기 종료)</td>
      <td align="center">✅ <b>Found</b> (1 test)</td>
    </tr>
  </tbody>
</table>
---

## 3. System Architecture & Methodology

```text
+-------------------------------------------------------------------+
|                        Host (macOS ARM64)                         |
|  - Caffeinate Background Daemon (Power Management)                |
+-------------------------------------------------------------------+
                                  |
              +-------------------+-------------------+
              | Docker Engine (--platform linux/amd64)|
              v                                       v
+---------------------------+       +-------------------------------+
| Container: AFL++ Node     |       | Container: KLEE Node          |
| (charming_ptolemy)        |       | (lucid_saha)                  |
| - afl-clang-fast (LLVM)   |       | - clang -emit-llvm (.bc)      |
| - 64KB Shared Memory Map  |       | - KLEE Virtual Machine        |
| - MOPT / Havoc Mutator    |       | - STP / MiniSat Solver        |
+---------------------------+       +-------------------------------+
              |                                       |
              +-------------------+-------------------+
                                  v
             [Shared Workspace Volume: /workspace]
             - Standalone Micro-benchmarks (read syscall)
             - Real-time Output Logs & Crash Artifacts
```

* **시스템 콜 정규화:** C 표준 `fgets()` 라이브러리가 유발하는 파일 입출력 심볼릭 블로킹(Hang) 문제를 해결하기 위해 저수준 `read(0, buf, sizeof(buf)-1)` 시스템 콜 기반의 독립 타깃으로 설계.
* **통제 변인:** 타깃당 30분(1,800s) 타임아웃, KLEE 메모리 2,048MB 제한(`--max-memory=2048`), 단일 제약식 솔버 시간 30초 제한(`--max-solver-time=30s`).

---

## 4. Repository Structure

```plaintext
.
├── benchmarks/
│   └── targets/             # read() 시스템 콜 기반 독립 벤치마크 C 소스코드
│       ├── base64.c         # 4바이트 매직 넘버("B64!") 검증 타깃
│       ├── md5sum.c         # 해시 포맷("MD5\n") 검증 타깃
│       └── uniq.c           # 문자열 일치("UNIQ") 검증 타깃
├── aflpp/
│   ├── in/                  # 초기 시드 파일 (seed.txt)
│   ├── targets/             # afl-clang-fast로 계측 빌드된 x86_64 바이너리
│   └── out/                 # 벤치마크 실측 산출물
│       ├── base64/          # 1.19M 실행 로그, fuzzer_stats, Crash(1건)
│       ├── md5sum/          # 1.18M 실행 로그, fuzzer_stats, Crash(1건)
│       └── uniq/            # 1.21M 실행 로그, fuzzer_stats, Crash(0건 - 장벽 실증)
├── klee/
│   ├── targets/             # LLVM Bitcode (.bc) 컴파일 산출물
│   ├── out/                 # KLEE SMT 솔버 제약식 및 .ktest 결과 파일
│   └── *_exec.log           # 타깃별 탐색 완료 터미널 원시 로그 (Completed paths=1)
├── scripts/
│   ├── run_aflpp_coreutils.sh   # AFL++ 30분 자동화 배치 구동 스크립트
│   └── run_klee_coreutils.sh    # KLEE SMT 제약 해결 자동화 구동 스크립트
└── README.md
```

---

## 5. How to Reproduce

### 1) Run AFL++ Benchmark (Docker)
```bash
# AFL++ Container 내부 실행 (30분 고정)
bash scripts/run_aflpp_coreutils.sh 1800
```

### 2) Run KLEE Benchmark (Docker)
```bash
# KLEE Container 내부 실행 (LLVM Bitcode 추출 및 SMT 탐색)
bash scripts/run_klee_coreutils.sh 1800
```
