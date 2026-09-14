# Comparative Analysis of Fuzzing and Symbolic Execution
> Performance Evaluation of AFL++ and KLEE Using Common Benchmarks
> 공통 벤치마크 기반 AFL++와 KLEE의 한계점 및 테스팅 효율성 비교 분석

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Linux](https://img.shields.io/badge/Platform-Ubuntu%2020.04%20LTS-orange.svg)]()
[![Engine: AFL++](https://img.shields.io/badge/Fuzzing-AFL++%20v4.x-red.svg)](https://github.com/AFLplusplus/AFLplusplus)
[![Engine: KLEE](https://img.shields.io/badge/Symbolic_Execution-KLEE%20v3.x-brightgreen.svg)](https://klee-se.org/)

---

## 1. Project Overview
현대 소프트웨어 취약점 탐지 자동화 기술의 양대 축인 커버리지 기반 퍼징(Coverage-guided Fuzzing)과 기호 실행(Symbolic Execution)의 성능 및 한계를 실증적으로 비교 분석하는 프로젝트입니다.

동일한 타겟 벤치마크 프로그램 환경에서 무작위 변이 기반의 AFL++와 수학적 제약 조건 분석 기반의 KLEE를 교차 구동하여, 커버리지 도달 속도, 경로 폭발(Path Explosion), 특정 조건 분기 돌파 능력 등을 다각도로 계측하고 평가합니다.

### Key Objectives
* Coverage Progression: 실행 시간 경과에 따른 분기(Branch) 및 라인(Line) 커버리지 확장 추이 비교
* Bug & Crash Detection: 고유 크래시(Unique Crash) 도달 시간 및 탐지 개수 측정
* Path Explosion vs. Coverage Wall: 복잡한 분기 조건문, 반복문, 매직 넘버 등 특정 코드 패턴에서의 두 기술 간 실증적 한계 분석

---

## 2. System Architecture & Setup

동일한 컴퓨팅 자원 및 독립된 실험 환경을 보장하기 위해 Docker 컨테이너 기반으로 통제된 환경에서 실행됩니다.

```text
+-------------------------------------------------------------+
|                      Host (Linux Environment)               |
+-------------------------------------------------------------+
                              |
       +----------------------+----------------------+
       |                                             |
       v                                             v
+-----------------------------+               +-----------------------------+
|    Docker: AFL++ Engine     |               |     Docker: KLEE Engine     |
|                             |               |                             |
|  - LLVM Mode Instrumentation|               |  - LLVM Bitcode (.bc)       |
|  - afl-fuzz driver          |               |  - STP / Z3 Solver          |
|  - Coverage Feedback Map    |               |  - Constraint Solving Engine|
+-----------------------------+               +-----------------------------+
       |                                             |
       +----------------------+----------------------+
                              |
                              v
                +----------------------------+
                |    Common Benchmarks       |
                |   (e.g., GNU Coreutils)    |
                +----------------------------+
                              |
                              v
                +----------------------------+
                | Evaluation & Metrics       |
                | - gcov / lcov Coverage     |
                | - Unique Crash Reports     |
                +----------------------------+
