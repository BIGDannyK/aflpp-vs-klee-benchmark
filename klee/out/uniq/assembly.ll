; ModuleID = 'klee_init_env64_Debug+Asserts.bc'
source_filename = "/tmp/klee_src/runtime/POSIX/klee_init_env.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.exe_file_t.6 = type { i32, i32, i64, ptr }
%struct.exe_file_system_t.7 = type { i32, ptr, ptr, i32, ptr, i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.stat64.9 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec.8, %struct.timespec.8, %struct.timespec.8, [3 x i64] }
%struct.timespec.8 = type { i64, i64 }
%struct.exe_disk_file_t.10 = type { i32, ptr, ptr }
%struct.exe_sym_env_t.11 = type { [32 x %struct.exe_file_t.6], i32, i32 }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.__va_list_tag = type { i32, i32, ptr, ptr }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct.winsize = type { i16, i16, i16, i16 }
%struct.flock = type { i16, i16, i64, i64, i32 }
%struct.fd_set = type { [16 x i64] }

@__const.klee_init_env.sym_arg_name = private unnamed_addr constant [6 x i8] c"arg\00\00\00", align 1
@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [964 x i8] c"klee_init_env\0A\0Ausage: (klee_init_env) [options] [program arguments]\0A  -sym-arg <N>              - Replace by a symbolic argument with length N\0A  -sym-args <MIN> <MAX> <N> - Replace by at least MIN arguments and at most\0A                              MAX arguments, each with maximum length N\0A  -sym-files <NUM> <N>      - Make NUM symbolic files ('A', 'B', 'C', etc.),\0A                              each with size N\0A  -sym-stdin <N>            - Make stdin symbolic with size N.\0A  -sym-stdout               - Make stdout symbolic.\0A  -save-all-writes          - Allow write operations to execute as expected\0A                              even if they exceed the file size. If set to 0, all\0A                              writes exceeding the initial file size are discarded.\0A                              Note: file offset is always incremented.\0A  -max-fail <N>             - Allow up to N injected failures\0A  -fd-fail                  - Shortcut for '-max-fail 1'\0A\0A\00", align 1, !dbg !8
@.str.2 = private unnamed_addr constant [10 x i8] c"--sym-arg\00", align 1, !dbg !13
@.str.3 = private unnamed_addr constant [9 x i8] c"-sym-arg\00", align 1, !dbg !18
@.str.4 = private unnamed_addr constant [48 x i8] c"--sym-arg expects an integer argument <max-len>\00", align 1, !dbg !23
@.str.5 = private unnamed_addr constant [45 x i8] c"No more than 100 symbolic arguments allowed.\00", align 1, !dbg !28
@.str.6 = private unnamed_addr constant [11 x i8] c"--sym-args\00", align 1, !dbg !33
@.str.7 = private unnamed_addr constant [10 x i8] c"-sym-args\00", align 1, !dbg !38
@.str.8 = private unnamed_addr constant [77 x i8] c"--sym-args expects three integer arguments <min-argvs> <max-argvs> <max-len>\00", align 1, !dbg !40
@.str.9 = private unnamed_addr constant [28 x i8] c"Invalid range to --sym-args\00", align 1, !dbg !45
@.str.10 = private unnamed_addr constant [7 x i8] c"n_args\00", align 1, !dbg !50
@.str.11 = private unnamed_addr constant [12 x i8] c"--sym-files\00", align 1, !dbg !52
@.str.12 = private unnamed_addr constant [11 x i8] c"-sym-files\00", align 1, !dbg !57
@.str.13 = private unnamed_addr constant [72 x i8] c"--sym-files expects two integer arguments <no-sym-files> <sym-file-len>\00", align 1, !dbg !59
@.str.14 = private unnamed_addr constant [39 x i8] c"Multiple --sym-files are not allowed.\0A\00", align 1, !dbg !64
@.str.15 = private unnamed_addr constant [65 x i8] c"The first argument to --sym-files (number of files) cannot be 0\0A\00", align 1, !dbg !69
@.str.16 = private unnamed_addr constant [60 x i8] c"The second argument to --sym-files (file size) cannot be 0\0A\00", align 1, !dbg !74
@.str.17 = private unnamed_addr constant [12 x i8] c"--sym-stdin\00", align 1, !dbg !79
@.str.18 = private unnamed_addr constant [11 x i8] c"-sym-stdin\00", align 1, !dbg !81
@.str.19 = private unnamed_addr constant [57 x i8] c"--sym-stdin expects one integer argument <sym-stdin-len>\00", align 1, !dbg !83
@.str.20 = private unnamed_addr constant [13 x i8] c"--sym-stdout\00", align 1, !dbg !88
@.str.21 = private unnamed_addr constant [12 x i8] c"-sym-stdout\00", align 1, !dbg !93
@.str.22 = private unnamed_addr constant [18 x i8] c"--save-all-writes\00", align 1, !dbg !95
@.str.23 = private unnamed_addr constant [17 x i8] c"-save-all-writes\00", align 1, !dbg !100
@.str.24 = private unnamed_addr constant [10 x i8] c"--fd-fail\00", align 1, !dbg !105
@.str.25 = private unnamed_addr constant [9 x i8] c"-fd-fail\00", align 1, !dbg !107
@.str.26 = private unnamed_addr constant [12 x i8] c"--bout-file\00", align 1, !dbg !109
@.str.27 = private unnamed_addr constant [11 x i8] c"-bout-file\00", align 1, !dbg !111
@.str.28 = private unnamed_addr constant [11 x i8] c"--max-fail\00", align 1, !dbg !113
@.str.29 = private unnamed_addr constant [10 x i8] c"-max-fail\00", align 1, !dbg !115
@.str.30 = private unnamed_addr constant [54 x i8] c"--max-fail expects an integer argument <max-failures>\00", align 1, !dbg !117
@.str.31 = private unnamed_addr constant [31 x i8] c"out of memory in klee_init_env\00", align 1, !dbg !122
@.str.32 = private unnamed_addr constant [44 x i8] c"/tmp/klee_src/runtime/POSIX/klee_init_env.c\00", align 1, !dbg !127
@.str.33 = private unnamed_addr constant [9 x i8] c"user.err\00", align 1, !dbg !132
@.str.34 = private unnamed_addr constant [37 x i8] c"too many arguments for klee_init_env\00", align 1, !dbg !134
@.str.35 = private unnamed_addr constant [5 x i8] c"UNIQ\00", align 1, !dbg !139
@__const.klee_init_fds.name = private unnamed_addr constant [7 x i8] c"?_data\00", align 1
@.str.40 = private unnamed_addr constant [2 x i8] c".\00", align 1, !dbg !145
@.str.1.41 = private unnamed_addr constant [38 x i8] c"/tmp/klee_src/runtime/POSIX/fd_init.c\00", align 1, !dbg !151
@.str.2.42 = private unnamed_addr constant [31 x i8] c"out of memory in klee_init_env\00", align 1, !dbg !156
@.str.3.43 = private unnamed_addr constant [9 x i8] c"user.err\00", align 1, !dbg !158
@.str.4.44 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1, !dbg !160
@.str.5.45 = private unnamed_addr constant [10 x i8] c"read_fail\00", align 1, !dbg !165
@.str.6.46 = private unnamed_addr constant [11 x i8] c"write_fail\00", align 1, !dbg !167
@.str.7.47 = private unnamed_addr constant [11 x i8] c"close_fail\00", align 1, !dbg !169
@.str.8.48 = private unnamed_addr constant [15 x i8] c"ftruncate_fail\00", align 1, !dbg !171
@.str.9.49 = private unnamed_addr constant [12 x i8] c"getcwd_fail\00", align 1, !dbg !176
@.str.10.50 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1, !dbg !178
@.str.11.51 = private unnamed_addr constant [6 x i8] c"_stat\00", align 1, !dbg !180
@.str.12.52 = private unnamed_addr constant [5 x i8] c"size\00", align 1, !dbg !182
@__PRETTY_FUNCTION__.__create_new_dfile = private unnamed_addr constant [88 x i8] c"void __create_new_dfile(exe_disk_file_t *, unsigned int, const char *, struct stat64 *)\00", align 1, !dbg !185
@.str.55 = private unnamed_addr constant [45 x i8] c"/tmp/klee_src/runtime/Intrinsic/klee_range.c\00", align 1, !dbg !190
@.str.1.56 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1, !dbg !193
@.str.2.57 = private unnamed_addr constant [5 x i8] c"user\00", align 1, !dbg !198
@__exe_env = dso_local global { <{ %struct.exe_file_t.6, %struct.exe_file_t.6, %struct.exe_file_t.6, [29 x %struct.exe_file_t.6] }>, i32, i32 } { <{ %struct.exe_file_t.6, %struct.exe_file_t.6, %struct.exe_file_t.6, [29 x %struct.exe_file_t.6] }> <{ %struct.exe_file_t.6 { i32 0, i32 5, i64 0, ptr null }, %struct.exe_file_t.6 { i32 1, i32 9, i64 0, ptr null }, %struct.exe_file_t.6 { i32 2, i32 9, i64 0, ptr null }, [29 x %struct.exe_file_t.6] zeroinitializer }>, i32 18, i32 0 }, align 8, !dbg !200
@.str.58 = private unnamed_addr constant [46 x i8] c"Undefined call to open(): O_TRUNC | O_RDONLY\0A\00", align 1, !dbg !296
@.str.1.59 = private unnamed_addr constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 1, !dbg !302
@.str.2.60 = private unnamed_addr constant [44 x i8] c"symbolic file descriptor, ignoring (ENOENT)\00", align 1, !dbg !307
@close.n_calls = internal global i32 0, align 4, !dbg !309
@__exe_fs = dso_local global %struct.exe_file_system_t.7 zeroinitializer, align 8, !dbg !205
@read.n_calls = internal global i32 0, align 4, !dbg !376
@.str.3.63 = private unnamed_addr constant [12 x i8] c"f->off >= 0\00", align 1, !dbg !386
@.str.4.64 = private unnamed_addr constant [33 x i8] c"/tmp/klee_src/runtime/POSIX/fd.c\00", align 1, !dbg !388
@__PRETTY_FUNCTION__.read = private unnamed_addr constant [34 x i8] c"ssize_t read(int, void *, size_t)\00", align 1, !dbg !393
@write.n_calls = internal global i32 0, align 4, !dbg !398
@.str.5.65 = private unnamed_addr constant [7 x i8] c"r >= 0\00", align 1, !dbg !405
@__PRETTY_FUNCTION__.write = private unnamed_addr constant [41 x i8] c"ssize_t write(int, const void *, size_t)\00", align 1, !dbg !407
@.str.6.66 = private unnamed_addr constant [2 x i8] c"0\00", align 1, !dbg !412
@.str.7.67 = private unnamed_addr constant [24 x i8] c"write() ignores bytes.\0A\00", align 1, !dbg !414
@.str.8.68 = private unnamed_addr constant [18 x i8] c"new_off == f->off\00", align 1, !dbg !419
@__PRETTY_FUNCTION__.__fd_lseek = private unnamed_addr constant [38 x i8] c"off64_t __fd_lseek(int, off64_t, int)\00", align 1, !dbg !421
@.str.9.69 = private unnamed_addr constant [5 x i8] c"path\00", align 1, !dbg !423
@__PRETTY_FUNCTION__.fstatat = private unnamed_addr constant [51 x i8] c"int fstatat(int, const char *, struct stat *, int)\00", align 1, !dbg !425
@.str.10.70 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (ENOENT)\00", align 1, !dbg !430
@chmod.n_calls = internal global i32 0, align 4, !dbg !432
@fchmod.n_calls = internal global i32 0, align 4, !dbg !438
@__fd_ftruncate.n_calls = internal global i32 0, align 4, !dbg !443
@.str.11.72 = private unnamed_addr constant [30 x i8] c"symbolic file, ignoring (EIO)\00", align 1, !dbg !448
@.str.12.73 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 1, !dbg !453
@.str.13.74 = private unnamed_addr constant [18 x i8] c"s != (off64_t) -1\00", align 1, !dbg !455
@__PRETTY_FUNCTION__.__fd_getdents = private unnamed_addr constant [65 x i8] c"int __fd_getdents(unsigned int, struct dirent64 *, unsigned int)\00", align 1, !dbg !457
@.str.14.75 = private unnamed_addr constant [22 x i8] c"f->off != (off64_t)-1\00", align 1, !dbg !459
@.str.15.76 = private unnamed_addr constant [41 x i8] c"(TCGETS) symbolic file, incomplete model\00", align 1, !dbg !464
@.str.16.77 = private unnamed_addr constant [42 x i8] c"(TCSETS) symbolic file, silently ignoring\00", align 1, !dbg !466
@.str.17.78 = private unnamed_addr constant [43 x i8] c"(TCSETSW) symbolic file, silently ignoring\00", align 1, !dbg !471
@.str.18.79 = private unnamed_addr constant [43 x i8] c"(TCSETSF) symbolic file, silently ignoring\00", align 1, !dbg !476
@.str.19.80 = private unnamed_addr constant [45 x i8] c"(TIOCGWINSZ) symbolic file, incomplete model\00", align 1, !dbg !478
@.str.20.81 = private unnamed_addr constant [46 x i8] c"(TIOCSWINSZ) symbolic file, ignoring (EINVAL)\00", align 1, !dbg !480
@.str.21.82 = private unnamed_addr constant [43 x i8] c"(FIONREAD) symbolic file, incomplete model\00", align 1, !dbg !482
@.str.22.83 = private unnamed_addr constant [44 x i8] c"(MTIOCGET) symbolic file, ignoring (EINVAL)\00", align 1, !dbg !484
@.str.23.84 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EBADF)\00", align 1, !dbg !486
@.str.24.85 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1, !dbg !489
@getcwd.n_calls = internal global i32 0, align 4, !dbg !491
@.str.25.86 = private unnamed_addr constant [18 x i8] c"ignoring (ENOENT)\00", align 1, !dbg !496
@.str.26.71 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 1, !dbg !498
@.str.95 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1, !dbg !500
@.str.1.96 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1, !dbg !506
@.str.2.97 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1, !dbg !511

@__getdents64 = dso_local alias i64 (i32, ptr, i64), ptr @getdents64

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_init_env(ptr noundef %argcPtr, ptr noundef %argvPtr) #0 !dbg !573 {
entry:
  %argcPtr.addr = alloca ptr, align 8
  %argvPtr.addr = alloca ptr, align 8
  %argc = alloca i32, align 4
  %argv = alloca ptr, align 8
  %new_argc = alloca i32, align 4
  %n_args = alloca i32, align 4
  %new_argv = alloca [1024 x ptr], align 16
  %max_len = alloca i32, align 4
  %min_argvs = alloca i32, align 4
  %max_argvs = alloca i32, align 4
  %sym_files = alloca i32, align 4
  %sym_file_len = alloca i32, align 4
  %sym_stdin_len = alloca i32, align 4
  %sym_stdout_flag = alloca i32, align 4
  %save_all_writes_flag = alloca i32, align 4
  %fd_fail = alloca i32, align 4
  %final_argv = alloca ptr, align 8
  %sym_arg_name = alloca [6 x i8], align 1
  %sym_arg_num = alloca i32, align 4
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  %msg = alloca ptr, align 8
  %msg40 = alloca ptr, align 8
  %msg105 = alloca ptr, align 8
  %msg145 = alloca ptr, align 8
  %msg215 = alloca ptr, align 8
  store ptr %argcPtr, ptr %argcPtr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argcPtr.addr, metadata !577, metadata !DIExpression()), !dbg !578
  store ptr %argvPtr, ptr %argvPtr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argvPtr.addr, metadata !579, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.declare(metadata ptr %argc, metadata !581, metadata !DIExpression()), !dbg !582
  %0 = load ptr, ptr %argcPtr.addr, align 8, !dbg !583
  %1 = load i32, ptr %0, align 4, !dbg !584
  store i32 %1, ptr %argc, align 4, !dbg !582
  call void @llvm.dbg.declare(metadata ptr %argv, metadata !585, metadata !DIExpression()), !dbg !586
  %2 = load ptr, ptr %argvPtr.addr, align 8, !dbg !587
  %3 = load ptr, ptr %2, align 8, !dbg !588
  store ptr %3, ptr %argv, align 8, !dbg !586
  call void @llvm.dbg.declare(metadata ptr %new_argc, metadata !589, metadata !DIExpression()), !dbg !590
  store i32 0, ptr %new_argc, align 4, !dbg !590
  call void @llvm.dbg.declare(metadata ptr %n_args, metadata !591, metadata !DIExpression()), !dbg !592
  call void @llvm.dbg.declare(metadata ptr %new_argv, metadata !593, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.declare(metadata ptr %max_len, metadata !598, metadata !DIExpression()), !dbg !599
  call void @llvm.dbg.declare(metadata ptr %min_argvs, metadata !600, metadata !DIExpression()), !dbg !601
  call void @llvm.dbg.declare(metadata ptr %max_argvs, metadata !602, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.declare(metadata ptr %sym_files, metadata !604, metadata !DIExpression()), !dbg !605
  store i32 0, ptr %sym_files, align 4, !dbg !605
  call void @llvm.dbg.declare(metadata ptr %sym_file_len, metadata !606, metadata !DIExpression()), !dbg !607
  store i32 0, ptr %sym_file_len, align 4, !dbg !607
  call void @llvm.dbg.declare(metadata ptr %sym_stdin_len, metadata !608, metadata !DIExpression()), !dbg !609
  store i32 0, ptr %sym_stdin_len, align 4, !dbg !609
  call void @llvm.dbg.declare(metadata ptr %sym_stdout_flag, metadata !610, metadata !DIExpression()), !dbg !611
  store i32 0, ptr %sym_stdout_flag, align 4, !dbg !611
  call void @llvm.dbg.declare(metadata ptr %save_all_writes_flag, metadata !612, metadata !DIExpression()), !dbg !613
  store i32 0, ptr %save_all_writes_flag, align 4, !dbg !613
  call void @llvm.dbg.declare(metadata ptr %fd_fail, metadata !614, metadata !DIExpression()), !dbg !615
  store i32 0, ptr %fd_fail, align 4, !dbg !615
  call void @llvm.dbg.declare(metadata ptr %final_argv, metadata !616, metadata !DIExpression()), !dbg !617
  call void @llvm.dbg.declare(metadata ptr %sym_arg_name, metadata !618, metadata !DIExpression()), !dbg !620
  %4 = call ptr @memcpy(ptr %sym_arg_name, ptr @__const.klee_init_env.sym_arg_name, i64 6), !dbg !620
  call void @llvm.dbg.declare(metadata ptr %sym_arg_num, metadata !621, metadata !DIExpression()), !dbg !622
  store i32 0, ptr %sym_arg_num, align 4, !dbg !622
  call void @llvm.dbg.declare(metadata ptr %k, metadata !623, metadata !DIExpression()), !dbg !624
  store i32 0, ptr %k, align 4, !dbg !624
  call void @llvm.dbg.declare(metadata ptr %i, metadata !625, metadata !DIExpression()), !dbg !626
  %arrayidx = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 5, !dbg !627
  store i8 0, ptr %arrayidx, align 1, !dbg !628
  %5 = load i32, ptr %argc, align 4, !dbg !629
  %cmp = icmp eq i32 %5, 2, !dbg !631
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !632

land.lhs.true:                                    ; preds = %entry
  %6 = load ptr, ptr %argv, align 8, !dbg !633
  %arrayidx1 = getelementptr inbounds ptr, ptr %6, i64 1, !dbg !633
  %7 = load ptr, ptr %arrayidx1, align 8, !dbg !633
  %call = call i32 @__streq(ptr noundef %7, ptr noundef @.str), !dbg !634
  %tobool = icmp ne i32 %call, 0, !dbg !634
  br i1 %tobool, label %if.then, label %if.end, !dbg !635

if.then:                                          ; preds = %land.lhs.true
  call void @__emit_error(ptr noundef @.str.1), !dbg !636
  br label %if.end, !dbg !638

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  br label %while.cond, !dbg !639

while.cond:                                       ; preds = %if.end239, %if.end
  %8 = load i32, ptr %k, align 4, !dbg !640
  %9 = load i32, ptr %argc, align 4, !dbg !641
  %cmp2 = icmp slt i32 %8, %9, !dbg !642
  br i1 %cmp2, label %while.body, label %while.end, !dbg !639

while.body:                                       ; preds = %while.cond
  %10 = load ptr, ptr %argv, align 8, !dbg !643
  %11 = load i32, ptr %k, align 4, !dbg !646
  %idxprom = sext i32 %11 to i64, !dbg !643
  %arrayidx3 = getelementptr inbounds ptr, ptr %10, i64 %idxprom, !dbg !643
  %12 = load ptr, ptr %arrayidx3, align 8, !dbg !643
  %call4 = call i32 @__streq(ptr noundef %12, ptr noundef @.str.2), !dbg !647
  %tobool5 = icmp ne i32 %call4, 0, !dbg !647
  br i1 %tobool5, label %if.then10, label %lor.lhs.false, !dbg !648

lor.lhs.false:                                    ; preds = %while.body
  %13 = load ptr, ptr %argv, align 8, !dbg !649
  %14 = load i32, ptr %k, align 4, !dbg !650
  %idxprom6 = sext i32 %14 to i64, !dbg !649
  %arrayidx7 = getelementptr inbounds ptr, ptr %13, i64 %idxprom6, !dbg !649
  %15 = load ptr, ptr %arrayidx7, align 8, !dbg !649
  %call8 = call i32 @__streq(ptr noundef %15, ptr noundef @.str.3), !dbg !651
  %tobool9 = icmp ne i32 %call8, 0, !dbg !651
  br i1 %tobool9, label %if.then10, label %if.else, !dbg !652

if.then10:                                        ; preds = %lor.lhs.false, %while.body
  call void @llvm.dbg.declare(metadata ptr %msg, metadata !653, metadata !DIExpression()), !dbg !655
  store ptr @.str.4, ptr %msg, align 8, !dbg !655
  %16 = load i32, ptr %k, align 4, !dbg !656
  %inc = add nsw i32 %16, 1, !dbg !656
  store i32 %inc, ptr %k, align 4, !dbg !656
  %17 = load i32, ptr %argc, align 4, !dbg !658
  %cmp11 = icmp eq i32 %inc, %17, !dbg !659
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !660

if.then12:                                        ; preds = %if.then10
  %18 = load ptr, ptr %msg, align 8, !dbg !661
  call void @__emit_error(ptr noundef %18), !dbg !662
  br label %if.end13, !dbg !662

if.end13:                                         ; preds = %if.then12, %if.then10
  %19 = load ptr, ptr %argv, align 8, !dbg !663
  %20 = load i32, ptr %k, align 4, !dbg !664
  %inc14 = add nsw i32 %20, 1, !dbg !664
  store i32 %inc14, ptr %k, align 4, !dbg !664
  %idxprom15 = sext i32 %20 to i64, !dbg !663
  %arrayidx16 = getelementptr inbounds ptr, ptr %19, i64 %idxprom15, !dbg !663
  %21 = load ptr, ptr %arrayidx16, align 8, !dbg !663
  %22 = load ptr, ptr %msg, align 8, !dbg !665
  %call17 = call i64 @__str_to_int(ptr noundef %21, ptr noundef %22), !dbg !666
  %conv = trunc i64 %call17 to i32, !dbg !666
  store i32 %conv, ptr %max_len, align 4, !dbg !667
  %23 = load i32, ptr %sym_arg_num, align 4, !dbg !668
  %cmp18 = icmp ugt i32 %23, 99, !dbg !670
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !671

if.then20:                                        ; preds = %if.end13
  call void @__emit_error(ptr noundef @.str.5), !dbg !672
  br label %if.end21, !dbg !672

if.end21:                                         ; preds = %if.then20, %if.end13
  %24 = load i32, ptr %sym_arg_num, align 4, !dbg !673
  %div = udiv i32 %24, 10, !dbg !674
  %add = add i32 48, %div, !dbg !675
  %conv22 = trunc i32 %add to i8, !dbg !676
  %arrayidx23 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 3, !dbg !677
  store i8 %conv22, ptr %arrayidx23, align 1, !dbg !678
  %25 = load i32, ptr %sym_arg_num, align 4, !dbg !679
  %rem = urem i32 %25, 10, !dbg !680
  %add24 = add i32 48, %rem, !dbg !681
  %conv25 = trunc i32 %add24 to i8, !dbg !682
  %arrayidx26 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 4, !dbg !683
  store i8 %conv25, ptr %arrayidx26, align 1, !dbg !684
  %26 = load i32, ptr %sym_arg_num, align 4, !dbg !685
  %inc27 = add i32 %26, 1, !dbg !685
  store i32 %inc27, ptr %sym_arg_num, align 4, !dbg !685
  %arraydecay = getelementptr inbounds [1024 x ptr], ptr %new_argv, i64 0, i64 0, !dbg !686
  %27 = load i32, ptr %max_len, align 4, !dbg !687
  %arraydecay28 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 0, !dbg !688
  %call29 = call ptr @__get_sym_str(i32 noundef %27, ptr noundef %arraydecay28), !dbg !689
  call void @__add_arg(ptr noundef %new_argc, ptr noundef %arraydecay, ptr noundef %call29, i32 noundef 1024), !dbg !690
  br label %if.end239, !dbg !691

if.else:                                          ; preds = %lor.lhs.false
  %28 = load ptr, ptr %argv, align 8, !dbg !692
  %29 = load i32, ptr %k, align 4, !dbg !694
  %idxprom30 = sext i32 %29 to i64, !dbg !692
  %arrayidx31 = getelementptr inbounds ptr, ptr %28, i64 %idxprom30, !dbg !692
  %30 = load ptr, ptr %arrayidx31, align 8, !dbg !692
  %call32 = call i32 @__streq(ptr noundef %30, ptr noundef @.str.6), !dbg !695
  %tobool33 = icmp ne i32 %call32, 0, !dbg !695
  br i1 %tobool33, label %if.then39, label %lor.lhs.false34, !dbg !696

lor.lhs.false34:                                  ; preds = %if.else
  %31 = load ptr, ptr %argv, align 8, !dbg !697
  %32 = load i32, ptr %k, align 4, !dbg !698
  %idxprom35 = sext i32 %32 to i64, !dbg !697
  %arrayidx36 = getelementptr inbounds ptr, ptr %31, i64 %idxprom35, !dbg !697
  %33 = load ptr, ptr %arrayidx36, align 8, !dbg !697
  %call37 = call i32 @__streq(ptr noundef %33, ptr noundef @.str.7), !dbg !699
  %tobool38 = icmp ne i32 %call37, 0, !dbg !699
  br i1 %tobool38, label %if.then39, label %if.else94, !dbg !700

if.then39:                                        ; preds = %lor.lhs.false34, %if.else
  call void @llvm.dbg.declare(metadata ptr %msg40, metadata !701, metadata !DIExpression()), !dbg !703
  store ptr @.str.8, ptr %msg40, align 8, !dbg !703
  %34 = load i32, ptr %k, align 4, !dbg !704
  %add41 = add nsw i32 %34, 3, !dbg !706
  %35 = load i32, ptr %argc, align 4, !dbg !707
  %cmp42 = icmp sge i32 %add41, %35, !dbg !708
  br i1 %cmp42, label %if.then44, label %if.end45, !dbg !709

if.then44:                                        ; preds = %if.then39
  %36 = load ptr, ptr %msg40, align 8, !dbg !710
  call void @__emit_error(ptr noundef %36), !dbg !711
  br label %if.end45, !dbg !711

if.end45:                                         ; preds = %if.then44, %if.then39
  %37 = load i32, ptr %k, align 4, !dbg !712
  %inc46 = add nsw i32 %37, 1, !dbg !712
  store i32 %inc46, ptr %k, align 4, !dbg !712
  %38 = load ptr, ptr %argv, align 8, !dbg !713
  %39 = load i32, ptr %k, align 4, !dbg !714
  %inc47 = add nsw i32 %39, 1, !dbg !714
  store i32 %inc47, ptr %k, align 4, !dbg !714
  %idxprom48 = sext i32 %39 to i64, !dbg !713
  %arrayidx49 = getelementptr inbounds ptr, ptr %38, i64 %idxprom48, !dbg !713
  %40 = load ptr, ptr %arrayidx49, align 8, !dbg !713
  %41 = load ptr, ptr %msg40, align 8, !dbg !715
  %call50 = call i64 @__str_to_int(ptr noundef %40, ptr noundef %41), !dbg !716
  %conv51 = trunc i64 %call50 to i32, !dbg !716
  store i32 %conv51, ptr %min_argvs, align 4, !dbg !717
  %42 = load ptr, ptr %argv, align 8, !dbg !718
  %43 = load i32, ptr %k, align 4, !dbg !719
  %inc52 = add nsw i32 %43, 1, !dbg !719
  store i32 %inc52, ptr %k, align 4, !dbg !719
  %idxprom53 = sext i32 %43 to i64, !dbg !718
  %arrayidx54 = getelementptr inbounds ptr, ptr %42, i64 %idxprom53, !dbg !718
  %44 = load ptr, ptr %arrayidx54, align 8, !dbg !718
  %45 = load ptr, ptr %msg40, align 8, !dbg !720
  %call55 = call i64 @__str_to_int(ptr noundef %44, ptr noundef %45), !dbg !721
  %conv56 = trunc i64 %call55 to i32, !dbg !721
  store i32 %conv56, ptr %max_argvs, align 4, !dbg !722
  %46 = load ptr, ptr %argv, align 8, !dbg !723
  %47 = load i32, ptr %k, align 4, !dbg !724
  %inc57 = add nsw i32 %47, 1, !dbg !724
  store i32 %inc57, ptr %k, align 4, !dbg !724
  %idxprom58 = sext i32 %47 to i64, !dbg !723
  %arrayidx59 = getelementptr inbounds ptr, ptr %46, i64 %idxprom58, !dbg !723
  %48 = load ptr, ptr %arrayidx59, align 8, !dbg !723
  %49 = load ptr, ptr %msg40, align 8, !dbg !725
  %call60 = call i64 @__str_to_int(ptr noundef %48, ptr noundef %49), !dbg !726
  %conv61 = trunc i64 %call60 to i32, !dbg !726
  store i32 %conv61, ptr %max_len, align 4, !dbg !727
  %50 = load i32, ptr %min_argvs, align 4, !dbg !728
  %51 = load i32, ptr %max_argvs, align 4, !dbg !730
  %cmp62 = icmp ugt i32 %50, %51, !dbg !731
  br i1 %cmp62, label %if.then70, label %lor.lhs.false64, !dbg !732

lor.lhs.false64:                                  ; preds = %if.end45
  %52 = load i32, ptr %min_argvs, align 4, !dbg !733
  %cmp65 = icmp eq i32 %52, 0, !dbg !734
  %53 = load i32, ptr %max_argvs, align 4
  %cmp68 = icmp eq i32 %53, 0
  %or.cond = select i1 %cmp65, i1 %cmp68, i1 false, !dbg !735
  br i1 %or.cond, label %if.then70, label %if.end71, !dbg !735

if.then70:                                        ; preds = %lor.lhs.false64, %if.end45
  call void @__emit_error(ptr noundef @.str.9), !dbg !736
  br label %if.end71, !dbg !736

if.end71:                                         ; preds = %if.then70, %lor.lhs.false64
  %54 = load i32, ptr %min_argvs, align 4, !dbg !737
  %55 = load i32, ptr %max_argvs, align 4, !dbg !738
  %add72 = add i32 %55, 1, !dbg !739
  %call73 = call i32 @klee_range(i32 noundef %54, i32 noundef %add72, ptr noundef @.str.10), !dbg !740
  store i32 %call73, ptr %n_args, align 4, !dbg !741
  %56 = load i32, ptr %sym_arg_num, align 4, !dbg !742
  %57 = load i32, ptr %max_argvs, align 4, !dbg !744
  %add74 = add i32 %56, %57, !dbg !745
  %cmp75 = icmp ugt i32 %add74, 99, !dbg !746
  br i1 %cmp75, label %if.then77, label %if.end78, !dbg !747

if.then77:                                        ; preds = %if.end71
  call void @__emit_error(ptr noundef @.str.5), !dbg !748
  br label %if.end78, !dbg !748

if.end78:                                         ; preds = %if.then77, %if.end71
  store i32 0, ptr %i, align 4, !dbg !749
  br label %for.cond, !dbg !751

for.cond:                                         ; preds = %for.body, %if.end78
  %58 = load i32, ptr %i, align 4, !dbg !752
  %59 = load i32, ptr %n_args, align 4, !dbg !754
  %cmp79 = icmp slt i32 %58, %59, !dbg !755
  br i1 %cmp79, label %for.body, label %if.end239, !dbg !756

for.body:                                         ; preds = %for.cond
  %60 = load i32, ptr %sym_arg_num, align 4, !dbg !757
  %div81 = udiv i32 %60, 10, !dbg !759
  %add82 = add i32 48, %div81, !dbg !760
  %conv83 = trunc i32 %add82 to i8, !dbg !761
  %arrayidx84 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 3, !dbg !762
  store i8 %conv83, ptr %arrayidx84, align 1, !dbg !763
  %61 = load i32, ptr %sym_arg_num, align 4, !dbg !764
  %rem85 = urem i32 %61, 10, !dbg !765
  %add86 = add i32 48, %rem85, !dbg !766
  %conv87 = trunc i32 %add86 to i8, !dbg !767
  %arrayidx88 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 4, !dbg !768
  store i8 %conv87, ptr %arrayidx88, align 1, !dbg !769
  %62 = load i32, ptr %sym_arg_num, align 4, !dbg !770
  %inc89 = add i32 %62, 1, !dbg !770
  store i32 %inc89, ptr %sym_arg_num, align 4, !dbg !770
  %arraydecay90 = getelementptr inbounds [1024 x ptr], ptr %new_argv, i64 0, i64 0, !dbg !771
  %63 = load i32, ptr %max_len, align 4, !dbg !772
  %arraydecay91 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 0, !dbg !773
  %call92 = call ptr @__get_sym_str(i32 noundef %63, ptr noundef %arraydecay91), !dbg !774
  call void @__add_arg(ptr noundef %new_argc, ptr noundef %arraydecay90, ptr noundef %call92, i32 noundef 1024), !dbg !775
  %64 = load i32, ptr %i, align 4, !dbg !776
  %inc93 = add nsw i32 %64, 1, !dbg !776
  store i32 %inc93, ptr %i, align 4, !dbg !776
  br label %for.cond, !dbg !777, !llvm.loop !778

if.else94:                                        ; preds = %lor.lhs.false34
  %65 = load ptr, ptr %argv, align 8, !dbg !780
  %66 = load i32, ptr %k, align 4, !dbg !782
  %idxprom95 = sext i32 %66 to i64, !dbg !780
  %arrayidx96 = getelementptr inbounds ptr, ptr %65, i64 %idxprom95, !dbg !780
  %67 = load ptr, ptr %arrayidx96, align 8, !dbg !780
  %call97 = call i32 @__streq(ptr noundef %67, ptr noundef @.str.11), !dbg !783
  %tobool98 = icmp ne i32 %call97, 0, !dbg !783
  br i1 %tobool98, label %if.then104, label %lor.lhs.false99, !dbg !784

lor.lhs.false99:                                  ; preds = %if.else94
  %68 = load ptr, ptr %argv, align 8, !dbg !785
  %69 = load i32, ptr %k, align 4, !dbg !786
  %idxprom100 = sext i32 %69 to i64, !dbg !785
  %arrayidx101 = getelementptr inbounds ptr, ptr %68, i64 %idxprom100, !dbg !785
  %70 = load ptr, ptr %arrayidx101, align 8, !dbg !785
  %call102 = call i32 @__streq(ptr noundef %70, ptr noundef @.str.12), !dbg !787
  %tobool103 = icmp ne i32 %call102, 0, !dbg !787
  br i1 %tobool103, label %if.then104, label %if.else134, !dbg !788

if.then104:                                       ; preds = %lor.lhs.false99, %if.else94
  call void @llvm.dbg.declare(metadata ptr %msg105, metadata !789, metadata !DIExpression()), !dbg !791
  store ptr @.str.13, ptr %msg105, align 8, !dbg !791
  %71 = load i32, ptr %k, align 4, !dbg !792
  %add106 = add nsw i32 %71, 2, !dbg !794
  %72 = load i32, ptr %argc, align 4, !dbg !795
  %cmp107 = icmp sge i32 %add106, %72, !dbg !796
  br i1 %cmp107, label %if.then109, label %if.end110, !dbg !797

if.then109:                                       ; preds = %if.then104
  %73 = load ptr, ptr %msg105, align 8, !dbg !798
  call void @__emit_error(ptr noundef %73), !dbg !799
  br label %if.end110, !dbg !799

if.end110:                                        ; preds = %if.then109, %if.then104
  %74 = load i32, ptr %sym_files, align 4, !dbg !800
  %cmp111 = icmp ne i32 %74, 0, !dbg !802
  br i1 %cmp111, label %if.then113, label %if.end114, !dbg !803

if.then113:                                       ; preds = %if.end110
  call void @__emit_error(ptr noundef @.str.14), !dbg !804
  br label %if.end114, !dbg !804

if.end114:                                        ; preds = %if.then113, %if.end110
  %75 = load i32, ptr %k, align 4, !dbg !805
  %inc115 = add nsw i32 %75, 1, !dbg !805
  store i32 %inc115, ptr %k, align 4, !dbg !805
  %76 = load ptr, ptr %argv, align 8, !dbg !806
  %77 = load i32, ptr %k, align 4, !dbg !807
  %inc116 = add nsw i32 %77, 1, !dbg !807
  store i32 %inc116, ptr %k, align 4, !dbg !807
  %idxprom117 = sext i32 %77 to i64, !dbg !806
  %arrayidx118 = getelementptr inbounds ptr, ptr %76, i64 %idxprom117, !dbg !806
  %78 = load ptr, ptr %arrayidx118, align 8, !dbg !806
  %79 = load ptr, ptr %msg105, align 8, !dbg !808
  %call119 = call i64 @__str_to_int(ptr noundef %78, ptr noundef %79), !dbg !809
  %conv120 = trunc i64 %call119 to i32, !dbg !809
  store i32 %conv120, ptr %sym_files, align 4, !dbg !810
  %80 = load ptr, ptr %argv, align 8, !dbg !811
  %81 = load i32, ptr %k, align 4, !dbg !812
  %inc121 = add nsw i32 %81, 1, !dbg !812
  store i32 %inc121, ptr %k, align 4, !dbg !812
  %idxprom122 = sext i32 %81 to i64, !dbg !811
  %arrayidx123 = getelementptr inbounds ptr, ptr %80, i64 %idxprom122, !dbg !811
  %82 = load ptr, ptr %arrayidx123, align 8, !dbg !811
  %83 = load ptr, ptr %msg105, align 8, !dbg !813
  %call124 = call i64 @__str_to_int(ptr noundef %82, ptr noundef %83), !dbg !814
  %conv125 = trunc i64 %call124 to i32, !dbg !814
  store i32 %conv125, ptr %sym_file_len, align 4, !dbg !815
  %84 = load i32, ptr %sym_files, align 4, !dbg !816
  %cmp126 = icmp eq i32 %84, 0, !dbg !818
  br i1 %cmp126, label %if.then128, label %if.end129, !dbg !819

if.then128:                                       ; preds = %if.end114
  call void @__emit_error(ptr noundef @.str.15), !dbg !820
  br label %if.end129, !dbg !820

if.end129:                                        ; preds = %if.then128, %if.end114
  %85 = load i32, ptr %sym_file_len, align 4, !dbg !821
  %cmp130 = icmp eq i32 %85, 0, !dbg !823
  br i1 %cmp130, label %if.then132, label %if.end239, !dbg !824

if.then132:                                       ; preds = %if.end129
  call void @__emit_error(ptr noundef @.str.16), !dbg !825
  br label %if.end239, !dbg !825

if.else134:                                       ; preds = %lor.lhs.false99
  %86 = load ptr, ptr %argv, align 8, !dbg !826
  %87 = load i32, ptr %k, align 4, !dbg !828
  %idxprom135 = sext i32 %87 to i64, !dbg !826
  %arrayidx136 = getelementptr inbounds ptr, ptr %86, i64 %idxprom135, !dbg !826
  %88 = load ptr, ptr %arrayidx136, align 8, !dbg !826
  %call137 = call i32 @__streq(ptr noundef %88, ptr noundef @.str.17), !dbg !829
  %tobool138 = icmp ne i32 %call137, 0, !dbg !829
  br i1 %tobool138, label %if.then144, label %lor.lhs.false139, !dbg !830

lor.lhs.false139:                                 ; preds = %if.else134
  %89 = load ptr, ptr %argv, align 8, !dbg !831
  %90 = load i32, ptr %k, align 4, !dbg !832
  %idxprom140 = sext i32 %90 to i64, !dbg !831
  %arrayidx141 = getelementptr inbounds ptr, ptr %89, i64 %idxprom140, !dbg !831
  %91 = load ptr, ptr %arrayidx141, align 8, !dbg !831
  %call142 = call i32 @__streq(ptr noundef %91, ptr noundef @.str.18), !dbg !833
  %tobool143 = icmp ne i32 %call142, 0, !dbg !833
  br i1 %tobool143, label %if.then144, label %if.else156, !dbg !834

if.then144:                                       ; preds = %lor.lhs.false139, %if.else134
  call void @llvm.dbg.declare(metadata ptr %msg145, metadata !835, metadata !DIExpression()), !dbg !837
  store ptr @.str.19, ptr %msg145, align 8, !dbg !837
  %92 = load i32, ptr %k, align 4, !dbg !838
  %inc146 = add nsw i32 %92, 1, !dbg !838
  store i32 %inc146, ptr %k, align 4, !dbg !838
  %93 = load i32, ptr %argc, align 4, !dbg !840
  %cmp147 = icmp eq i32 %inc146, %93, !dbg !841
  br i1 %cmp147, label %if.then149, label %if.end150, !dbg !842

if.then149:                                       ; preds = %if.then144
  %94 = load ptr, ptr %msg145, align 8, !dbg !843
  call void @__emit_error(ptr noundef %94), !dbg !844
  br label %if.end150, !dbg !844

if.end150:                                        ; preds = %if.then149, %if.then144
  %95 = load ptr, ptr %argv, align 8, !dbg !845
  %96 = load i32, ptr %k, align 4, !dbg !846
  %inc151 = add nsw i32 %96, 1, !dbg !846
  store i32 %inc151, ptr %k, align 4, !dbg !846
  %idxprom152 = sext i32 %96 to i64, !dbg !845
  %arrayidx153 = getelementptr inbounds ptr, ptr %95, i64 %idxprom152, !dbg !845
  %97 = load ptr, ptr %arrayidx153, align 8, !dbg !845
  %98 = load ptr, ptr %msg145, align 8, !dbg !847
  %call154 = call i64 @__str_to_int(ptr noundef %97, ptr noundef %98), !dbg !848
  %conv155 = trunc i64 %call154 to i32, !dbg !848
  store i32 %conv155, ptr %sym_stdin_len, align 4, !dbg !849
  br label %if.end239, !dbg !850

if.else156:                                       ; preds = %lor.lhs.false139
  %99 = load ptr, ptr %argv, align 8, !dbg !851
  %100 = load i32, ptr %k, align 4, !dbg !853
  %idxprom157 = sext i32 %100 to i64, !dbg !851
  %arrayidx158 = getelementptr inbounds ptr, ptr %99, i64 %idxprom157, !dbg !851
  %101 = load ptr, ptr %arrayidx158, align 8, !dbg !851
  %call159 = call i32 @__streq(ptr noundef %101, ptr noundef @.str.20), !dbg !854
  %tobool160 = icmp ne i32 %call159, 0, !dbg !854
  br i1 %tobool160, label %if.then166, label %lor.lhs.false161, !dbg !855

lor.lhs.false161:                                 ; preds = %if.else156
  %102 = load ptr, ptr %argv, align 8, !dbg !856
  %103 = load i32, ptr %k, align 4, !dbg !857
  %idxprom162 = sext i32 %103 to i64, !dbg !856
  %arrayidx163 = getelementptr inbounds ptr, ptr %102, i64 %idxprom162, !dbg !856
  %104 = load ptr, ptr %arrayidx163, align 8, !dbg !856
  %call164 = call i32 @__streq(ptr noundef %104, ptr noundef @.str.21), !dbg !858
  %tobool165 = icmp ne i32 %call164, 0, !dbg !858
  br i1 %tobool165, label %if.then166, label %if.else168, !dbg !859

if.then166:                                       ; preds = %lor.lhs.false161, %if.else156
  store i32 1, ptr %sym_stdout_flag, align 4, !dbg !860
  %105 = load i32, ptr %k, align 4, !dbg !862
  %inc167 = add nsw i32 %105, 1, !dbg !862
  store i32 %inc167, ptr %k, align 4, !dbg !862
  br label %if.end239, !dbg !863

if.else168:                                       ; preds = %lor.lhs.false161
  %106 = load ptr, ptr %argv, align 8, !dbg !864
  %107 = load i32, ptr %k, align 4, !dbg !866
  %idxprom169 = sext i32 %107 to i64, !dbg !864
  %arrayidx170 = getelementptr inbounds ptr, ptr %106, i64 %idxprom169, !dbg !864
  %108 = load ptr, ptr %arrayidx170, align 8, !dbg !864
  %call171 = call i32 @__streq(ptr noundef %108, ptr noundef @.str.22), !dbg !867
  %tobool172 = icmp ne i32 %call171, 0, !dbg !867
  br i1 %tobool172, label %if.then178, label %lor.lhs.false173, !dbg !868

lor.lhs.false173:                                 ; preds = %if.else168
  %109 = load ptr, ptr %argv, align 8, !dbg !869
  %110 = load i32, ptr %k, align 4, !dbg !870
  %idxprom174 = sext i32 %110 to i64, !dbg !869
  %arrayidx175 = getelementptr inbounds ptr, ptr %109, i64 %idxprom174, !dbg !869
  %111 = load ptr, ptr %arrayidx175, align 8, !dbg !869
  %call176 = call i32 @__streq(ptr noundef %111, ptr noundef @.str.23), !dbg !871
  %tobool177 = icmp ne i32 %call176, 0, !dbg !871
  br i1 %tobool177, label %if.then178, label %if.else180, !dbg !872

if.then178:                                       ; preds = %lor.lhs.false173, %if.else168
  store i32 1, ptr %save_all_writes_flag, align 4, !dbg !873
  %112 = load i32, ptr %k, align 4, !dbg !875
  %inc179 = add nsw i32 %112, 1, !dbg !875
  store i32 %inc179, ptr %k, align 4, !dbg !875
  br label %if.end239, !dbg !876

if.else180:                                       ; preds = %lor.lhs.false173
  %113 = load ptr, ptr %argv, align 8, !dbg !877
  %114 = load i32, ptr %k, align 4, !dbg !879
  %idxprom181 = sext i32 %114 to i64, !dbg !877
  %arrayidx182 = getelementptr inbounds ptr, ptr %113, i64 %idxprom181, !dbg !877
  %115 = load ptr, ptr %arrayidx182, align 8, !dbg !877
  %call183 = call i32 @__streq(ptr noundef %115, ptr noundef @.str.24), !dbg !880
  %tobool184 = icmp ne i32 %call183, 0, !dbg !880
  br i1 %tobool184, label %if.then190, label %lor.lhs.false185, !dbg !881

lor.lhs.false185:                                 ; preds = %if.else180
  %116 = load ptr, ptr %argv, align 8, !dbg !882
  %117 = load i32, ptr %k, align 4, !dbg !883
  %idxprom186 = sext i32 %117 to i64, !dbg !882
  %arrayidx187 = getelementptr inbounds ptr, ptr %116, i64 %idxprom186, !dbg !882
  %118 = load ptr, ptr %arrayidx187, align 8, !dbg !882
  %call188 = call i32 @__streq(ptr noundef %118, ptr noundef @.str.25), !dbg !884
  %tobool189 = icmp ne i32 %call188, 0, !dbg !884
  br i1 %tobool189, label %if.then190, label %if.else192, !dbg !885

if.then190:                                       ; preds = %lor.lhs.false185, %if.else180
  store i32 1, ptr %fd_fail, align 4, !dbg !886
  %119 = load i32, ptr %k, align 4, !dbg !888
  %inc191 = add nsw i32 %119, 1, !dbg !888
  store i32 %inc191, ptr %k, align 4, !dbg !888
  br label %if.end239, !dbg !889

if.else192:                                       ; preds = %lor.lhs.false185
  %120 = load ptr, ptr %argv, align 8, !dbg !890
  %121 = load i32, ptr %k, align 4, !dbg !892
  %idxprom193 = sext i32 %121 to i64, !dbg !890
  %arrayidx194 = getelementptr inbounds ptr, ptr %120, i64 %idxprom193, !dbg !890
  %122 = load ptr, ptr %arrayidx194, align 8, !dbg !890
  %call195 = call i32 @__streq(ptr noundef %122, ptr noundef @.str.26), !dbg !893
  %tobool196 = icmp ne i32 %call195, 0, !dbg !893
  br i1 %tobool196, label %if.then202, label %lor.lhs.false197, !dbg !894

lor.lhs.false197:                                 ; preds = %if.else192
  %123 = load ptr, ptr %argv, align 8, !dbg !895
  %124 = load i32, ptr %k, align 4, !dbg !896
  %idxprom198 = sext i32 %124 to i64, !dbg !895
  %arrayidx199 = getelementptr inbounds ptr, ptr %123, i64 %idxprom198, !dbg !895
  %125 = load ptr, ptr %arrayidx199, align 8, !dbg !895
  %call200 = call i32 @__streq(ptr noundef %125, ptr noundef @.str.27), !dbg !897
  %tobool201 = icmp ne i32 %call200, 0, !dbg !897
  br i1 %tobool201, label %if.then202, label %if.else204, !dbg !898

if.then202:                                       ; preds = %lor.lhs.false197, %if.else192
  %126 = load i32, ptr %k, align 4, !dbg !899
  %add203 = add nsw i32 %126, 2, !dbg !899
  store i32 %add203, ptr %k, align 4, !dbg !899
  br label %if.end239, !dbg !901

if.else204:                                       ; preds = %lor.lhs.false197
  %127 = load ptr, ptr %argv, align 8, !dbg !902
  %128 = load i32, ptr %k, align 4, !dbg !904
  %idxprom205 = sext i32 %128 to i64, !dbg !902
  %arrayidx206 = getelementptr inbounds ptr, ptr %127, i64 %idxprom205, !dbg !902
  %129 = load ptr, ptr %arrayidx206, align 8, !dbg !902
  %call207 = call i32 @__streq(ptr noundef %129, ptr noundef @.str.28), !dbg !905
  %tobool208 = icmp ne i32 %call207, 0, !dbg !905
  br i1 %tobool208, label %if.then214, label %lor.lhs.false209, !dbg !906

lor.lhs.false209:                                 ; preds = %if.else204
  %130 = load ptr, ptr %argv, align 8, !dbg !907
  %131 = load i32, ptr %k, align 4, !dbg !908
  %idxprom210 = sext i32 %131 to i64, !dbg !907
  %arrayidx211 = getelementptr inbounds ptr, ptr %130, i64 %idxprom210, !dbg !907
  %132 = load ptr, ptr %arrayidx211, align 8, !dbg !907
  %call212 = call i32 @__streq(ptr noundef %132, ptr noundef @.str.29), !dbg !909
  %tobool213 = icmp ne i32 %call212, 0, !dbg !909
  br i1 %tobool213, label %if.then214, label %if.else226, !dbg !910

if.then214:                                       ; preds = %lor.lhs.false209, %if.else204
  call void @llvm.dbg.declare(metadata ptr %msg215, metadata !911, metadata !DIExpression()), !dbg !913
  store ptr @.str.30, ptr %msg215, align 8, !dbg !913
  %133 = load i32, ptr %k, align 4, !dbg !914
  %inc216 = add nsw i32 %133, 1, !dbg !914
  store i32 %inc216, ptr %k, align 4, !dbg !914
  %134 = load i32, ptr %argc, align 4, !dbg !916
  %cmp217 = icmp eq i32 %inc216, %134, !dbg !917
  br i1 %cmp217, label %if.then219, label %if.end220, !dbg !918

if.then219:                                       ; preds = %if.then214
  %135 = load ptr, ptr %msg215, align 8, !dbg !919
  call void @__emit_error(ptr noundef %135), !dbg !920
  br label %if.end220, !dbg !920

if.end220:                                        ; preds = %if.then219, %if.then214
  %136 = load ptr, ptr %argv, align 8, !dbg !921
  %137 = load i32, ptr %k, align 4, !dbg !922
  %inc221 = add nsw i32 %137, 1, !dbg !922
  store i32 %inc221, ptr %k, align 4, !dbg !922
  %idxprom222 = sext i32 %137 to i64, !dbg !921
  %arrayidx223 = getelementptr inbounds ptr, ptr %136, i64 %idxprom222, !dbg !921
  %138 = load ptr, ptr %arrayidx223, align 8, !dbg !921
  %139 = load ptr, ptr %msg215, align 8, !dbg !923
  %call224 = call i64 @__str_to_int(ptr noundef %138, ptr noundef %139), !dbg !924
  %conv225 = trunc i64 %call224 to i32, !dbg !924
  store i32 %conv225, ptr %fd_fail, align 4, !dbg !925
  br label %if.end239, !dbg !926

if.else226:                                       ; preds = %lor.lhs.false209
  %arraydecay227 = getelementptr inbounds [1024 x ptr], ptr %new_argv, i64 0, i64 0, !dbg !927
  %140 = load ptr, ptr %argv, align 8, !dbg !929
  %141 = load i32, ptr %k, align 4, !dbg !930
  %inc228 = add nsw i32 %141, 1, !dbg !930
  store i32 %inc228, ptr %k, align 4, !dbg !930
  %idxprom229 = sext i32 %141 to i64, !dbg !929
  %arrayidx230 = getelementptr inbounds ptr, ptr %140, i64 %idxprom229, !dbg !929
  %142 = load ptr, ptr %arrayidx230, align 8, !dbg !929
  call void @__add_arg(ptr noundef %new_argc, ptr noundef %arraydecay227, ptr noundef %142, i32 noundef 1024), !dbg !931
  br label %if.end239

if.end239:                                        ; preds = %for.cond, %if.end150, %if.then178, %if.then202, %if.else226, %if.end220, %if.then190, %if.then166, %if.end129, %if.then132, %if.end21
  br label %while.cond, !dbg !639, !llvm.loop !932

while.end:                                        ; preds = %while.cond
  %143 = load i32, ptr %new_argc, align 4, !dbg !934
  %add240 = add nsw i32 %143, 1, !dbg !935
  %conv241 = sext i32 %add240 to i64, !dbg !936
  %mul = mul i64 %conv241, 8, !dbg !937
  %call242 = call noalias ptr @malloc(i64 noundef %mul) #12, !dbg !938
  store ptr %call242, ptr %final_argv, align 8, !dbg !939
  %144 = load ptr, ptr %final_argv, align 8, !dbg !940
  %tobool243 = icmp ne ptr %144, null, !dbg !940
  br i1 %tobool243, label %if.end245, label %if.then244, !dbg !942

if.then244:                                       ; preds = %while.end
  call void @__emit_error(ptr noundef @.str.31), !dbg !943
  br label %if.end245, !dbg !943

if.end245:                                        ; preds = %if.then244, %while.end
  %145 = load ptr, ptr %final_argv, align 8, !dbg !944
  call void @klee_mark_global(ptr noundef %145), !dbg !945
  %146 = load ptr, ptr %final_argv, align 8, !dbg !946
  %arraydecay246 = getelementptr inbounds [1024 x ptr], ptr %new_argv, i64 0, i64 0, !dbg !947
  %147 = load i32, ptr %new_argc, align 4, !dbg !948
  %conv247 = sext i32 %147 to i64, !dbg !948
  %mul248 = mul i64 %conv247, 8, !dbg !949
  %148 = call ptr @memcpy(ptr %146, ptr %arraydecay246, i64 %mul248), !dbg !947
  %149 = load ptr, ptr %final_argv, align 8, !dbg !950
  %150 = load i32, ptr %new_argc, align 4, !dbg !951
  %idxprom249 = sext i32 %150 to i64, !dbg !950
  %arrayidx250 = getelementptr inbounds ptr, ptr %149, i64 %idxprom249, !dbg !950
  store ptr null, ptr %arrayidx250, align 8, !dbg !952
  %151 = load i32, ptr %new_argc, align 4, !dbg !953
  %152 = load ptr, ptr %argcPtr.addr, align 8, !dbg !954
  store i32 %151, ptr %152, align 4, !dbg !955
  %153 = load ptr, ptr %final_argv, align 8, !dbg !956
  %154 = load ptr, ptr %argvPtr.addr, align 8, !dbg !957
  store ptr %153, ptr %154, align 8, !dbg !958
  %155 = load i32, ptr %sym_files, align 4, !dbg !959
  %156 = load i32, ptr %sym_file_len, align 4, !dbg !960
  %157 = load i32, ptr %sym_stdin_len, align 4, !dbg !961
  %158 = load i32, ptr %sym_stdout_flag, align 4, !dbg !962
  %159 = load i32, ptr %save_all_writes_flag, align 4, !dbg !963
  %160 = load i32, ptr %fd_fail, align 4, !dbg !964
  call void @klee_init_fds(i32 noundef %155, i32 noundef %156, i32 noundef %157, i32 noundef %158, i32 noundef %159, i32 noundef %160), !dbg !965
  ret void, !dbg !966
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @__streq(ptr noundef %a, ptr noundef %b) #0 !dbg !967 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca ptr, align 8
  %b.addr = alloca ptr, align 8
  store ptr %a, ptr %a.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %a.addr, metadata !970, metadata !DIExpression()), !dbg !971
  store ptr %b, ptr %b.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %b.addr, metadata !972, metadata !DIExpression()), !dbg !973
  br label %while.cond, !dbg !974

while.cond:                                       ; preds = %if.end, %entry
  %0 = load ptr, ptr %a.addr, align 8, !dbg !975
  %1 = load i8, ptr %0, align 1, !dbg !976
  %conv = sext i8 %1 to i32, !dbg !976
  %2 = load ptr, ptr %b.addr, align 8, !dbg !977
  %3 = load i8, ptr %2, align 1, !dbg !978
  %conv1 = sext i8 %3 to i32, !dbg !978
  %cmp = icmp eq i32 %conv, %conv1, !dbg !979
  br i1 %cmp, label %while.body, label %while.end, !dbg !974

while.body:                                       ; preds = %while.cond
  %4 = load ptr, ptr %a.addr, align 8, !dbg !980
  %5 = load i8, ptr %4, align 1, !dbg !983
  %tobool = icmp ne i8 %5, 0, !dbg !983
  br i1 %tobool, label %if.end, label %if.then, !dbg !984

if.then:                                          ; preds = %while.body
  store i32 1, ptr %retval, align 4, !dbg !985
  br label %return, !dbg !985

if.end:                                           ; preds = %while.body
  %6 = load ptr, ptr %a.addr, align 8, !dbg !986
  %incdec.ptr = getelementptr inbounds i8, ptr %6, i32 1, !dbg !986
  store ptr %incdec.ptr, ptr %a.addr, align 8, !dbg !986
  %7 = load ptr, ptr %b.addr, align 8, !dbg !987
  %incdec.ptr3 = getelementptr inbounds i8, ptr %7, i32 1, !dbg !987
  store ptr %incdec.ptr3, ptr %b.addr, align 8, !dbg !987
  br label %while.cond, !dbg !974, !llvm.loop !988

while.end:                                        ; preds = %while.cond
  store i32 0, ptr %retval, align 4, !dbg !990
  br label %return, !dbg !990

return:                                           ; preds = %while.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !991
  ret i32 %8, !dbg !991
}

; Function Attrs: noinline nounwind uwtable
define internal void @__emit_error(ptr noundef %msg) #0 !dbg !992 {
entry:
  %msg.addr = alloca ptr, align 8
  store ptr %msg, ptr %msg.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %msg.addr, metadata !995, metadata !DIExpression()), !dbg !996
  %0 = load ptr, ptr %msg.addr, align 8, !dbg !997
  call void @klee_report_error(ptr noundef @.str.32, i32 noundef 20, ptr noundef %0, ptr noundef @.str.33) #13, !dbg !998
  unreachable, !dbg !998
}

; Function Attrs: noinline nounwind uwtable
define internal i64 @__str_to_int(ptr noundef %s, ptr noundef %error_msg) #0 !dbg !999 {
entry:
  %s.addr = alloca ptr, align 8
  %error_msg.addr = alloca ptr, align 8
  %res = alloca i64, align 8
  %c = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !1002, metadata !DIExpression()), !dbg !1003
  store ptr %error_msg, ptr %error_msg.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %error_msg.addr, metadata !1004, metadata !DIExpression()), !dbg !1005
  call void @llvm.dbg.declare(metadata ptr %res, metadata !1006, metadata !DIExpression()), !dbg !1007
  store i64 0, ptr %res, align 8, !dbg !1007
  call void @llvm.dbg.declare(metadata ptr %c, metadata !1008, metadata !DIExpression()), !dbg !1009
  %0 = load ptr, ptr %s.addr, align 8, !dbg !1010
  %1 = load i8, ptr %0, align 1, !dbg !1012
  %tobool = icmp ne i8 %1, 0, !dbg !1012
  br i1 %tobool, label %if.end, label %if.then, !dbg !1013

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %error_msg.addr, align 8, !dbg !1014
  call void @__emit_error(ptr noundef %2), !dbg !1015
  br label %if.end, !dbg !1015

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !1016

while.cond:                                       ; preds = %if.end9, %if.end
  %3 = load ptr, ptr %s.addr, align 8, !dbg !1017
  %incdec.ptr = getelementptr inbounds i8, ptr %3, i32 1, !dbg !1017
  store ptr %incdec.ptr, ptr %s.addr, align 8, !dbg !1017
  %4 = load i8, ptr %3, align 1, !dbg !1018
  store i8 %4, ptr %c, align 1, !dbg !1019
  %tobool1 = icmp ne i8 %4, 0, !dbg !1016
  br i1 %tobool1, label %while.body, label %while.end, !dbg !1016

while.body:                                       ; preds = %while.cond
  %5 = load i8, ptr %c, align 1, !dbg !1020
  %conv = sext i8 %5 to i32, !dbg !1020
  %cmp = icmp sge i32 %conv, 48, !dbg !1023
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !1024

land.lhs.true:                                    ; preds = %while.body
  %6 = load i8, ptr %c, align 1, !dbg !1025
  %conv3 = sext i8 %6 to i32, !dbg !1025
  %cmp4 = icmp sle i32 %conv3, 57, !dbg !1026
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1027

if.then6:                                         ; preds = %land.lhs.true
  %7 = load i64, ptr %res, align 8, !dbg !1028
  %mul = mul nsw i64 %7, 10, !dbg !1030
  %8 = load i8, ptr %c, align 1, !dbg !1031
  %conv7 = sext i8 %8 to i32, !dbg !1031
  %sub = sub nsw i32 %conv7, 48, !dbg !1032
  %conv8 = sext i32 %sub to i64, !dbg !1033
  %add = add nsw i64 %mul, %conv8, !dbg !1034
  store i64 %add, ptr %res, align 8, !dbg !1035
  br label %if.end9, !dbg !1036

if.else:                                          ; preds = %land.lhs.true, %while.body
  %9 = load ptr, ptr %error_msg.addr, align 8, !dbg !1037
  call void @__emit_error(ptr noundef %9), !dbg !1039
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then6
  br label %while.cond, !dbg !1016, !llvm.loop !1040

while.end:                                        ; preds = %while.cond
  %10 = load i64, ptr %res, align 8, !dbg !1042
  ret i64 %10, !dbg !1043
}

; Function Attrs: noinline nounwind uwtable
define internal void @__add_arg(ptr noundef %argc, ptr noundef %argv, ptr noundef %arg, i32 noundef %argcMax) #0 !dbg !1044 {
entry:
  %argc.addr = alloca ptr, align 8
  %argv.addr = alloca ptr, align 8
  %arg.addr = alloca ptr, align 8
  %argcMax.addr = alloca i32, align 4
  store ptr %argc, ptr %argc.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argc.addr, metadata !1047, metadata !DIExpression()), !dbg !1048
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argv.addr, metadata !1049, metadata !DIExpression()), !dbg !1050
  store ptr %arg, ptr %arg.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %arg.addr, metadata !1051, metadata !DIExpression()), !dbg !1052
  store i32 %argcMax, ptr %argcMax.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argcMax.addr, metadata !1053, metadata !DIExpression()), !dbg !1054
  %0 = load ptr, ptr %argc.addr, align 8, !dbg !1055
  %1 = load i32, ptr %0, align 4, !dbg !1057
  %2 = load i32, ptr %argcMax.addr, align 4, !dbg !1058
  %cmp = icmp eq i32 %1, %2, !dbg !1059
  br i1 %cmp, label %if.then, label %if.else, !dbg !1060

if.then:                                          ; preds = %entry
  call void @__emit_error(ptr noundef @.str.34), !dbg !1061
  br label %if.end, !dbg !1063

if.else:                                          ; preds = %entry
  %3 = load ptr, ptr %arg.addr, align 8, !dbg !1064
  %4 = load ptr, ptr %argv.addr, align 8, !dbg !1066
  %5 = load ptr, ptr %argc.addr, align 8, !dbg !1067
  %6 = load i32, ptr %5, align 4, !dbg !1068
  %idxprom = sext i32 %6 to i64, !dbg !1066
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 %idxprom, !dbg !1066
  store ptr %3, ptr %arrayidx, align 8, !dbg !1069
  %7 = load ptr, ptr %argc.addr, align 8, !dbg !1070
  %8 = load i32, ptr %7, align 4, !dbg !1071
  %inc = add nsw i32 %8, 1, !dbg !1071
  store i32 %inc, ptr %7, align 4, !dbg !1071
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !1072
}

; Function Attrs: noinline nounwind uwtable
define internal ptr @__get_sym_str(i32 noundef %numChars, ptr noundef %name) #0 !dbg !1073 {
entry:
  %numChars.addr = alloca i32, align 4
  %name.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  %s = alloca ptr, align 8
  store i32 %numChars, ptr %numChars.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %numChars.addr, metadata !1076, metadata !DIExpression()), !dbg !1077
  store ptr %name, ptr %name.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %name.addr, metadata !1078, metadata !DIExpression()), !dbg !1079
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1080, metadata !DIExpression()), !dbg !1081
  call void @llvm.dbg.declare(metadata ptr %s, metadata !1082, metadata !DIExpression()), !dbg !1083
  %0 = load i32, ptr %numChars.addr, align 4, !dbg !1084
  %add = add nsw i32 %0, 1, !dbg !1085
  %conv = sext i32 %add to i64, !dbg !1084
  %call = call noalias ptr @malloc(i64 noundef %conv) #12, !dbg !1086
  store ptr %call, ptr %s, align 8, !dbg !1083
  %1 = load ptr, ptr %s, align 8, !dbg !1087
  %tobool = icmp ne ptr %1, null, !dbg !1087
  br i1 %tobool, label %if.end, label %if.then, !dbg !1089

if.then:                                          ; preds = %entry
  call void @__emit_error(ptr noundef @.str.31), !dbg !1090
  br label %if.end, !dbg !1090

if.end:                                           ; preds = %if.then, %entry
  %2 = load ptr, ptr %s, align 8, !dbg !1091
  call void @klee_mark_global(ptr noundef %2), !dbg !1092
  %3 = load ptr, ptr %s, align 8, !dbg !1093
  %4 = load i32, ptr %numChars.addr, align 4, !dbg !1094
  %add1 = add nsw i32 %4, 1, !dbg !1095
  %conv2 = sext i32 %add1 to i64, !dbg !1094
  %5 = load ptr, ptr %name.addr, align 8, !dbg !1096
  call void @klee_make_symbolic(ptr noundef %3, i64 noundef %conv2, ptr noundef %5), !dbg !1097
  store i32 0, ptr %i, align 4, !dbg !1098
  br label %for.cond, !dbg !1100

for.cond:                                         ; preds = %for.body, %if.end
  %6 = load i32, ptr %i, align 4, !dbg !1101
  %7 = load i32, ptr %numChars.addr, align 4, !dbg !1103
  %cmp = icmp slt i32 %6, %7, !dbg !1104
  br i1 %cmp, label %for.body, label %for.end, !dbg !1105

for.body:                                         ; preds = %for.cond
  %8 = load ptr, ptr %s, align 8, !dbg !1106
  %9 = load ptr, ptr %s, align 8, !dbg !1107
  %10 = load i32, ptr %i, align 4, !dbg !1108
  %idxprom = sext i32 %10 to i64, !dbg !1107
  %arrayidx = getelementptr inbounds i8, ptr %9, i64 %idxprom, !dbg !1107
  %11 = load i8, ptr %arrayidx, align 1, !dbg !1107
  %call4 = call i32 @__isprint(i8 noundef signext %11), !dbg !1109
  %conv5 = sext i32 %call4 to i64, !dbg !1109
  call void @klee_posix_prefer_cex(ptr noundef %8, i64 noundef %conv5), !dbg !1110
  %12 = load i32, ptr %i, align 4, !dbg !1111
  %inc = add nsw i32 %12, 1, !dbg !1111
  store i32 %inc, ptr %i, align 4, !dbg !1111
  br label %for.cond, !dbg !1112, !llvm.loop !1113

for.end:                                          ; preds = %for.cond
  %13 = load ptr, ptr %s, align 8, !dbg !1115
  %14 = load i32, ptr %numChars.addr, align 4, !dbg !1116
  %idxprom6 = sext i32 %14 to i64, !dbg !1115
  %arrayidx7 = getelementptr inbounds i8, ptr %13, i64 %idxprom6, !dbg !1115
  store i8 0, ptr %arrayidx7, align 1, !dbg !1117
  %15 = load ptr, ptr %s, align 8, !dbg !1118
  ret ptr %15, !dbg !1119
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

declare void @klee_mark_global(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argcPtr, ptr noundef %argvPtr, ptr noundef %envp) #0 !dbg !1120 {
entry:
  %argcPtr.addr = alloca i32, align 4
  %argvPtr.addr = alloca ptr, align 8
  %envp.addr = alloca ptr, align 8
  store i32 %argcPtr, ptr %argcPtr.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argcPtr.addr, metadata !1123, metadata !DIExpression()), !dbg !1124
  store ptr %argvPtr, ptr %argvPtr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argvPtr.addr, metadata !1125, metadata !DIExpression()), !dbg !1126
  store ptr %envp, ptr %envp.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %envp.addr, metadata !1127, metadata !DIExpression()), !dbg !1128
  call void @klee_init_env(ptr noundef %argcPtr.addr, ptr noundef %argvPtr.addr), !dbg !1129
  %0 = load i32, ptr %argcPtr.addr, align 4, !dbg !1130
  %1 = load ptr, ptr %argvPtr.addr, align 8, !dbg !1131
  %2 = load ptr, ptr %envp.addr, align 8, !dbg !1132
  %call = call i32 @__klee_posix_wrapped_main(i32 noundef %0, ptr noundef %1, ptr noundef %2), !dbg !1133
  ret i32 %call, !dbg !1134
}

; Function Attrs: noreturn
declare void @klee_report_error(ptr noundef, i32 noundef, ptr noundef, ptr noundef) #5

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #4

declare void @klee_posix_prefer_cex(ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @__isprint(i8 noundef signext %c) #0 !dbg !1135 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, ptr %c.addr, align 1
  call void @llvm.dbg.declare(metadata ptr %c.addr, metadata !1138, metadata !DIExpression()), !dbg !1139
  %0 = load i8, ptr %c.addr, align 1, !dbg !1140
  %conv = sext i8 %0 to i32, !dbg !1140
  %cmp = icmp sle i32 32, %conv, !dbg !1141
  %1 = load i8, ptr %c.addr, align 1, !dbg !1142
  %conv2 = sext i8 %1 to i32, !dbg !1142
  %cmp3 = icmp sle i32 %conv2, 126, !dbg !1142
  %2 = select i1 %cmp, i1 %cmp3, i1 false, !dbg !1142
  %land.ext = zext i1 %2 to i32, !dbg !1142
  ret i32 %land.ext, !dbg !1143
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @check_duplicate(ptr noundef %line) #0 !dbg !1144 {
entry:
  %line.addr = alloca ptr, align 8
  store ptr %line, ptr %line.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %line.addr, metadata !1147, metadata !DIExpression()), !dbg !1148
  %0 = load ptr, ptr %line.addr, align 8, !dbg !1149
  %call = call i64 @strlen(ptr noundef %0) #14, !dbg !1151
  %cmp = icmp uge i64 %call, 4, !dbg !1152
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !1153

land.lhs.true:                                    ; preds = %entry
  %1 = load ptr, ptr %line.addr, align 8, !dbg !1154
  %call1 = call i32 @strncmp(ptr noundef %1, ptr noundef @.str.35, i64 noundef 4) #14, !dbg !1155
  %cmp2 = icmp eq i32 %call1, 0, !dbg !1156
  br i1 %cmp2, label %if.then, label %if.end, !dbg !1157

if.then:                                          ; preds = %land.lhs.true
  call void @abort() #15, !dbg !1158
  unreachable, !dbg !1158

if.end:                                           ; preds = %land.lhs.true, %entry
  ret void, !dbg !1160
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #6

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #6

; Function Attrs: noreturn nounwind
declare void @abort() #7

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__klee_posix_wrapped_main(i32 noundef %argc, ptr noundef %argv) #0 !dbg !1161 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %buf = alloca [128 x i8], align 16
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argc.addr, metadata !1164, metadata !DIExpression()), !dbg !1165
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argv.addr, metadata !1166, metadata !DIExpression()), !dbg !1167
  call void @llvm.dbg.declare(metadata ptr %buf, metadata !1168, metadata !DIExpression()), !dbg !1172
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i64 0, i64 0, !dbg !1173
  %0 = call ptr @memset(ptr %arraydecay, i32 0, i64 128), !dbg !1173
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i64 0, i64 0, !dbg !1174
  %call = call i64 @read(i32 noundef 0, ptr noundef %arraydecay1, i64 noundef 127), !dbg !1176
  %cmp = icmp sgt i64 %call, 0, !dbg !1177
  br i1 %cmp, label %if.then, label %if.end, !dbg !1178

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [128 x i8], ptr %buf, i64 0, i64 0, !dbg !1179
  call void @check_duplicate(ptr noundef %arraydecay2), !dbg !1181
  br label %if.end, !dbg !1182

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !1183
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #8

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_init_fds(i32 noundef %n_files, i32 noundef %file_length, i32 noundef %stdin_length, i32 noundef %sym_stdout_flag, i32 noundef %save_all_writes_flag, i32 noundef %max_failures) #0 !dbg !1184 {
entry:
  %n_files.addr = alloca i32, align 4
  %file_length.addr = alloca i32, align 4
  %stdin_length.addr = alloca i32, align 4
  %sym_stdout_flag.addr = alloca i32, align 4
  %save_all_writes_flag.addr = alloca i32, align 4
  %max_failures.addr = alloca i32, align 4
  %k = alloca i32, align 4
  %name = alloca [7 x i8], align 1
  %s = alloca %struct.stat64.9, align 8
  store i32 %n_files, ptr %n_files.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %n_files.addr, metadata !1187, metadata !DIExpression()), !dbg !1188
  store i32 %file_length, ptr %file_length.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %file_length.addr, metadata !1189, metadata !DIExpression()), !dbg !1190
  store i32 %stdin_length, ptr %stdin_length.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %stdin_length.addr, metadata !1191, metadata !DIExpression()), !dbg !1192
  store i32 %sym_stdout_flag, ptr %sym_stdout_flag.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %sym_stdout_flag.addr, metadata !1193, metadata !DIExpression()), !dbg !1194
  store i32 %save_all_writes_flag, ptr %save_all_writes_flag.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %save_all_writes_flag.addr, metadata !1195, metadata !DIExpression()), !dbg !1196
  store i32 %max_failures, ptr %max_failures.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %max_failures.addr, metadata !1197, metadata !DIExpression()), !dbg !1198
  call void @llvm.dbg.declare(metadata ptr %k, metadata !1199, metadata !DIExpression()), !dbg !1200
  call void @llvm.dbg.declare(metadata ptr %name, metadata !1201, metadata !DIExpression()), !dbg !1203
  %0 = call ptr @memcpy(ptr %name, ptr @__const.klee_init_fds.name, i64 7), !dbg !1203
  call void @llvm.dbg.declare(metadata ptr %s, metadata !1204, metadata !DIExpression()), !dbg !1205
  %call = call i32 @stat64(ptr noundef @.str.40, ptr noundef %s) #16, !dbg !1206
  %1 = load i32, ptr %n_files.addr, align 4, !dbg !1207
  store i32 %1, ptr @__exe_fs, align 8, !dbg !1208
  %2 = load i32, ptr %n_files.addr, align 4, !dbg !1209
  %conv = zext i32 %2 to i64, !dbg !1209
  %mul = mul i64 24, %conv, !dbg !1210
  %call1 = call noalias ptr @malloc(i64 noundef %mul) #12, !dbg !1211
  store ptr %call1, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8, !dbg !1212
  %3 = load i32, ptr %n_files.addr, align 4, !dbg !1213
  %tobool = icmp eq i32 %3, 0, !dbg !1213
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8
  %tobool2 = icmp ne ptr %4, null
  %or.cond = select i1 %tobool, i1 true, i1 %tobool2, !dbg !1215
  br i1 %or.cond, label %if.end, label %if.then, !dbg !1215

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.1.41, i32 noundef 117, ptr noundef @.str.2.42, ptr noundef @.str.3.43) #13, !dbg !1216
  unreachable, !dbg !1216

if.end:                                           ; preds = %entry
  store i32 0, ptr %k, align 4, !dbg !1217
  br label %for.cond, !dbg !1219

for.cond:                                         ; preds = %for.body, %if.end
  %5 = load i32, ptr %k, align 4, !dbg !1220
  %6 = load i32, ptr %n_files.addr, align 4, !dbg !1222
  %cmp = icmp ult i32 %5, %6, !dbg !1223
  br i1 %cmp, label %for.body, label %for.end, !dbg !1224

for.body:                                         ; preds = %for.cond
  %7 = load i32, ptr %k, align 4, !dbg !1225
  %add = add i32 65, %7, !dbg !1227
  %conv4 = trunc i32 %add to i8, !dbg !1228
  %arrayidx = getelementptr inbounds [7 x i8], ptr %name, i64 0, i64 0, !dbg !1229
  store i8 %conv4, ptr %arrayidx, align 1, !dbg !1230
  %8 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8, !dbg !1231
  %9 = load i32, ptr %k, align 4, !dbg !1232
  %idxprom = zext i32 %9 to i64, !dbg !1233
  %arrayidx5 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %8, i64 %idxprom, !dbg !1233
  %10 = load i32, ptr %file_length.addr, align 4, !dbg !1234
  %arraydecay = getelementptr inbounds [7 x i8], ptr %name, i64 0, i64 0, !dbg !1235
  call void @__create_new_dfile(ptr noundef %arrayidx5, i32 noundef %10, ptr noundef %arraydecay, ptr noundef %s), !dbg !1236
  %11 = load i32, ptr %k, align 4, !dbg !1237
  %inc = add i32 %11, 1, !dbg !1237
  store i32 %inc, ptr %k, align 4, !dbg !1237
  br label %for.cond, !dbg !1238, !llvm.loop !1239

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %stdin_length.addr, align 4, !dbg !1241
  %tobool6 = icmp ne i32 %12, 0, !dbg !1241
  br i1 %tobool6, label %if.then7, label %if.else, !dbg !1243

if.then7:                                         ; preds = %for.end
  %call8 = call noalias ptr @malloc(i64 noundef 24) #12, !dbg !1244
  store ptr %call8, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1246
  %13 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1247
  %tobool9 = icmp ne ptr %13, null, !dbg !1249
  br i1 %tobool9, label %if.end11, label %if.then10, !dbg !1250

if.then10:                                        ; preds = %if.then7
  call void @klee_report_error(ptr noundef @.str.1.41, i32 noundef 128, ptr noundef @.str.2.42, ptr noundef @.str.3.43) #13, !dbg !1251
  unreachable, !dbg !1251

if.end11:                                         ; preds = %if.then7
  %14 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1252
  %15 = load i32, ptr %stdin_length.addr, align 4, !dbg !1253
  call void @__create_new_dfile(ptr noundef %14, i32 noundef %15, ptr noundef @.str.4.44, ptr noundef %s), !dbg !1254
  %16 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1255
  store ptr %16, ptr getelementptr inbounds (%struct.exe_file_t.6, ptr @__exe_env, i32 0, i32 3), align 8, !dbg !1256
  br label %if.end12, !dbg !1257

if.else:                                          ; preds = %for.end
  store ptr null, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1258
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.end11
  %17 = load i32, ptr %max_failures.addr, align 4, !dbg !1259
  store i32 %17, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1260
  %18 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1261
  %tobool13 = icmp ne i32 %18, 0, !dbg !1263
  br i1 %tobool13, label %if.then14, label %if.end31, !dbg !1264

if.then14:                                        ; preds = %if.end12
  %call15 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1265
  store ptr %call15, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 6), align 8, !dbg !1267
  %call16 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1268
  store ptr %call16, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 7), align 8, !dbg !1269
  %call17 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1270
  store ptr %call17, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 8), align 8, !dbg !1271
  %call18 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1272
  store ptr %call18, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 9), align 8, !dbg !1273
  %call19 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1274
  store ptr %call19, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 10), align 8, !dbg !1275
  %19 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 6), align 8, !dbg !1276
  %tobool20 = icmp ne ptr %19, null, !dbg !1278
  %20 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 7), align 8
  %tobool22 = icmp ne ptr %20, null
  %or.cond1 = select i1 %tobool20, i1 %tobool22, i1 false, !dbg !1279
  %21 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 8), align 8
  %tobool24 = icmp ne ptr %21, null
  %or.cond2 = select i1 %or.cond1, i1 %tobool24, i1 false, !dbg !1279
  %22 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 9), align 8
  %tobool26 = icmp ne ptr %22, null
  %or.cond3 = select i1 %or.cond2, i1 %tobool26, i1 false, !dbg !1279
  %23 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 10), align 8
  %tobool28 = icmp ne ptr %23, null
  %or.cond4 = select i1 %or.cond3, i1 %tobool28, i1 false, !dbg !1279
  br i1 %or.cond4, label %if.end30, label %if.then29, !dbg !1279

if.then29:                                        ; preds = %if.then14
  call void @klee_report_error(ptr noundef @.str.1.41, i32 noundef 143, ptr noundef @.str.2.42, ptr noundef @.str.3.43) #13, !dbg !1280
  unreachable, !dbg !1280

if.end30:                                         ; preds = %if.then14
  %24 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 6), align 8, !dbg !1281
  call void @klee_make_symbolic(ptr noundef %24, i64 noundef 4, ptr noundef @.str.5.45), !dbg !1282
  %25 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 7), align 8, !dbg !1283
  call void @klee_make_symbolic(ptr noundef %25, i64 noundef 4, ptr noundef @.str.6.46), !dbg !1284
  %26 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 8), align 8, !dbg !1285
  call void @klee_make_symbolic(ptr noundef %26, i64 noundef 4, ptr noundef @.str.7.47), !dbg !1286
  %27 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 9), align 8, !dbg !1287
  call void @klee_make_symbolic(ptr noundef %27, i64 noundef 4, ptr noundef @.str.8.48), !dbg !1288
  %28 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 10), align 8, !dbg !1289
  call void @klee_make_symbolic(ptr noundef %28, i64 noundef 4, ptr noundef @.str.9.49), !dbg !1290
  br label %if.end31, !dbg !1291

if.end31:                                         ; preds = %if.end30, %if.end12
  %29 = load i32, ptr %sym_stdout_flag.addr, align 4, !dbg !1292
  %tobool32 = icmp ne i32 %29, 0, !dbg !1292
  br i1 %tobool32, label %if.then33, label %if.else38, !dbg !1294

if.then33:                                        ; preds = %if.end31
  %call34 = call noalias ptr @malloc(i64 noundef 24) #12, !dbg !1295
  store ptr %call34, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1297
  %30 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1298
  %tobool35 = icmp ne ptr %30, null, !dbg !1300
  br i1 %tobool35, label %if.end37, label %if.then36, !dbg !1301

if.then36:                                        ; preds = %if.then33
  call void @klee_report_error(ptr noundef @.str.1.41, i32 noundef 156, ptr noundef @.str.2.42, ptr noundef @.str.3.43) #13, !dbg !1302
  unreachable, !dbg !1302

if.end37:                                         ; preds = %if.then33
  %31 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1303
  call void @__create_new_dfile(ptr noundef %31, i32 noundef 1024, ptr noundef @.str.10.50, ptr noundef %s), !dbg !1304
  %32 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1305
  store ptr %32, ptr getelementptr inbounds ([32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 1, i32 3), align 8, !dbg !1306
  store i32 0, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 3), align 8, !dbg !1307
  br label %if.end39, !dbg !1308

if.else38:                                        ; preds = %if.end31
  store ptr null, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1309
  br label %if.end39

if.end39:                                         ; preds = %if.else38, %if.end37
  %33 = load i32, ptr %save_all_writes_flag.addr, align 4, !dbg !1310
  store i32 %33, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 2), align 4, !dbg !1311
  ret void, !dbg !1312
}

; Function Attrs: noinline nounwind uwtable
define internal void @__create_new_dfile(ptr noundef %dfile, i32 noundef %size, ptr noundef %name, ptr noundef %defaults) #0 !dbg !1313 {
entry:
  %dfile.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %name.addr = alloca ptr, align 8
  %defaults.addr = alloca ptr, align 8
  %s = alloca ptr, align 8
  %sp = alloca ptr, align 8
  %sname = alloca [64 x i8], align 16
  store ptr %dfile, ptr %dfile.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %dfile.addr, metadata !1316, metadata !DIExpression()), !dbg !1317
  store i32 %size, ptr %size.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !1318, metadata !DIExpression()), !dbg !1319
  store ptr %name, ptr %name.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %name.addr, metadata !1320, metadata !DIExpression()), !dbg !1321
  store ptr %defaults, ptr %defaults.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %defaults.addr, metadata !1322, metadata !DIExpression()), !dbg !1323
  call void @llvm.dbg.declare(metadata ptr %s, metadata !1324, metadata !DIExpression()), !dbg !1325
  %call = call noalias ptr @malloc(i64 noundef 144) #12, !dbg !1326
  store ptr %call, ptr %s, align 8, !dbg !1325
  %0 = load ptr, ptr %s, align 8, !dbg !1327
  %tobool = icmp ne ptr %0, null, !dbg !1327
  br i1 %tobool, label %if.end, label %if.then, !dbg !1329

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.1.41, i32 noundef 46, ptr noundef @.str.2.42, ptr noundef @.str.3.43) #13, !dbg !1330
  unreachable, !dbg !1330

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %sp, metadata !1331, metadata !DIExpression()), !dbg !1332
  call void @llvm.dbg.declare(metadata ptr %sname, metadata !1333, metadata !DIExpression()), !dbg !1337
  %1 = load ptr, ptr %name.addr, align 8, !dbg !1338
  store ptr %1, ptr %sp, align 8, !dbg !1340
  br label %for.cond, !dbg !1341

for.cond:                                         ; preds = %for.body, %if.end
  %2 = load ptr, ptr %sp, align 8, !dbg !1342
  %3 = load i8, ptr %2, align 1, !dbg !1344
  %tobool1 = icmp ne i8 %3, 0, !dbg !1345
  br i1 %tobool1, label %for.body, label %for.end, !dbg !1345

for.body:                                         ; preds = %for.cond
  %4 = load ptr, ptr %sp, align 8, !dbg !1346
  %5 = load i8, ptr %4, align 1, !dbg !1347
  %6 = load ptr, ptr %sp, align 8, !dbg !1348
  %7 = load ptr, ptr %name.addr, align 8, !dbg !1349
  %sub.ptr.lhs.cast = ptrtoint ptr %6 to i64, !dbg !1350
  %sub.ptr.rhs.cast = ptrtoint ptr %7 to i64, !dbg !1350
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !1350
  %arrayidx = getelementptr inbounds [64 x i8], ptr %sname, i64 0, i64 %sub.ptr.sub, !dbg !1351
  store i8 %5, ptr %arrayidx, align 1, !dbg !1352
  %8 = load ptr, ptr %sp, align 8, !dbg !1353
  %incdec.ptr = getelementptr inbounds i8, ptr %8, i32 1, !dbg !1353
  store ptr %incdec.ptr, ptr %sp, align 8, !dbg !1353
  br label %for.cond, !dbg !1354, !llvm.loop !1355

for.end:                                          ; preds = %for.cond
  %9 = load ptr, ptr %sp, align 8, !dbg !1357
  %10 = load ptr, ptr %name.addr, align 8, !dbg !1358
  %sub.ptr.lhs.cast2 = ptrtoint ptr %9 to i64, !dbg !1359
  %sub.ptr.rhs.cast3 = ptrtoint ptr %10 to i64, !dbg !1359
  %sub.ptr.sub4 = sub i64 %sub.ptr.lhs.cast2, %sub.ptr.rhs.cast3, !dbg !1359
  %arrayidx5 = getelementptr inbounds [64 x i8], ptr %sname, i64 0, i64 %sub.ptr.sub4, !dbg !1360
  %11 = call ptr @memcpy(ptr %arrayidx5, ptr @.str.11.51, i64 6), !dbg !1361
  %12 = load i32, ptr %size.addr, align 4, !dbg !1362
  %tobool6 = icmp ne i32 %12, 0, !dbg !1362
  br i1 %tobool6, label %if.end8, label %if.else, !dbg !1365

if.else:                                          ; preds = %for.end
  call void @__assert_fail(ptr noundef @.str.12.52, ptr noundef @.str.1.41, i32 noundef 54, ptr noundef @__PRETTY_FUNCTION__.__create_new_dfile) #15, !dbg !1362
  unreachable, !dbg !1362

if.end8:                                          ; preds = %for.end
  %13 = load i32, ptr %size.addr, align 4, !dbg !1366
  %14 = load ptr, ptr %dfile.addr, align 8, !dbg !1367
  %size9 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %14, i32 0, i32 0, !dbg !1368
  store i32 %13, ptr %size9, align 8, !dbg !1369
  %15 = load ptr, ptr %dfile.addr, align 8, !dbg !1370
  %size10 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %15, i32 0, i32 0, !dbg !1371
  %16 = load i32, ptr %size10, align 8, !dbg !1371
  %conv = zext i32 %16 to i64, !dbg !1370
  %call11 = call noalias ptr @malloc(i64 noundef %conv) #12, !dbg !1372
  %17 = load ptr, ptr %dfile.addr, align 8, !dbg !1373
  %contents = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %17, i32 0, i32 1, !dbg !1374
  store ptr %call11, ptr %contents, align 8, !dbg !1375
  %18 = load ptr, ptr %dfile.addr, align 8, !dbg !1376
  %contents12 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %18, i32 0, i32 1, !dbg !1378
  %19 = load ptr, ptr %contents12, align 8, !dbg !1378
  %tobool13 = icmp ne ptr %19, null, !dbg !1376
  br i1 %tobool13, label %if.end15, label %if.then14, !dbg !1379

if.then14:                                        ; preds = %if.end8
  call void @klee_report_error(ptr noundef @.str.1.41, i32 noundef 59, ptr noundef @.str.2.42, ptr noundef @.str.3.43) #13, !dbg !1380
  unreachable, !dbg !1380

if.end15:                                         ; preds = %if.end8
  %20 = load ptr, ptr %dfile.addr, align 8, !dbg !1381
  %contents16 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %20, i32 0, i32 1, !dbg !1382
  %21 = load ptr, ptr %contents16, align 8, !dbg !1382
  %22 = load ptr, ptr %dfile.addr, align 8, !dbg !1383
  %size17 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %22, i32 0, i32 0, !dbg !1384
  %23 = load i32, ptr %size17, align 8, !dbg !1384
  %conv18 = zext i32 %23 to i64, !dbg !1383
  %24 = load ptr, ptr %name.addr, align 8, !dbg !1385
  call void @klee_make_symbolic(ptr noundef %21, i64 noundef %conv18, ptr noundef %24), !dbg !1386
  %25 = load ptr, ptr %s, align 8, !dbg !1387
  %arraydecay = getelementptr inbounds [64 x i8], ptr %sname, i64 0, i64 0, !dbg !1388
  call void @klee_make_symbolic(ptr noundef %25, i64 noundef 144, ptr noundef %arraydecay), !dbg !1389
  %26 = load ptr, ptr %s, align 8, !dbg !1390
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %26, i32 0, i32 1, !dbg !1392
  %27 = load i64, ptr %st_ino, align 8, !dbg !1392
  %call19 = call i32 @klee_is_symbolic(i64 noundef %27), !dbg !1393
  %tobool20 = icmp ne i32 %call19, 0, !dbg !1393
  br i1 %tobool20, label %if.end26, label %land.lhs.true, !dbg !1394

land.lhs.true:                                    ; preds = %if.end15
  %28 = load ptr, ptr %s, align 8, !dbg !1395
  %st_ino21 = getelementptr inbounds %struct.stat64.9, ptr %28, i32 0, i32 1, !dbg !1396
  %29 = load i64, ptr %st_ino21, align 8, !dbg !1396
  %and = and i64 %29, 2147483647, !dbg !1397
  %cmp = icmp eq i64 %and, 0, !dbg !1398
  br i1 %cmp, label %if.then23, label %if.end26, !dbg !1399

if.then23:                                        ; preds = %land.lhs.true
  %30 = load ptr, ptr %defaults.addr, align 8, !dbg !1400
  %st_ino24 = getelementptr inbounds %struct.stat64.9, ptr %30, i32 0, i32 1, !dbg !1401
  %31 = load i64, ptr %st_ino24, align 8, !dbg !1401
  %32 = load ptr, ptr %s, align 8, !dbg !1402
  %st_ino25 = getelementptr inbounds %struct.stat64.9, ptr %32, i32 0, i32 1, !dbg !1403
  store i64 %31, ptr %st_ino25, align 8, !dbg !1404
  br label %if.end26, !dbg !1402

if.end26:                                         ; preds = %if.then23, %land.lhs.true, %if.end15
  %33 = load ptr, ptr %s, align 8, !dbg !1405
  %st_ino27 = getelementptr inbounds %struct.stat64.9, ptr %33, i32 0, i32 1, !dbg !1406
  %34 = load i64, ptr %st_ino27, align 8, !dbg !1406
  %and28 = and i64 %34, 2147483647, !dbg !1407
  %cmp29 = icmp ne i64 %and28, 0, !dbg !1408
  %conv30 = zext i1 %cmp29 to i32, !dbg !1408
  %conv31 = sext i32 %conv30 to i64, !dbg !1409
  call void @klee_assume(i64 noundef %conv31), !dbg !1410
  %35 = load ptr, ptr %s, align 8, !dbg !1411
  %st_blksize = getelementptr inbounds %struct.stat64.9, ptr %35, i32 0, i32 9, !dbg !1412
  %36 = load i64, ptr %st_blksize, align 8, !dbg !1412
  %and32 = and i64 %36, -65536, !dbg !1413
  %cmp33 = icmp eq i64 %and32, 0, !dbg !1414
  %conv34 = zext i1 %cmp33 to i32, !dbg !1414
  %conv35 = sext i32 %conv34 to i64, !dbg !1415
  call void @klee_assume(i64 noundef %conv35), !dbg !1416
  %37 = load ptr, ptr %s, align 8, !dbg !1417
  %38 = load ptr, ptr %s, align 8, !dbg !1418
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %38, i32 0, i32 3, !dbg !1419
  %39 = load i32, ptr %st_mode, align 8, !dbg !1419
  %and36 = and i32 %39, -61952, !dbg !1420
  %tobool37 = icmp ne i32 %and36, 0, !dbg !1421
  %lnot = xor i1 %tobool37, true, !dbg !1421
  %lnot.ext = zext i1 %lnot to i32, !dbg !1421
  %conv38 = sext i32 %lnot.ext to i64, !dbg !1421
  call void @klee_prefer_cex(ptr noundef %37, i64 noundef %conv38), !dbg !1422
  %40 = load ptr, ptr %s, align 8, !dbg !1423
  %41 = load ptr, ptr %s, align 8, !dbg !1424
  %st_dev = getelementptr inbounds %struct.stat64.9, ptr %41, i32 0, i32 0, !dbg !1425
  %42 = load i64, ptr %st_dev, align 8, !dbg !1425
  %43 = load ptr, ptr %defaults.addr, align 8, !dbg !1426
  %st_dev39 = getelementptr inbounds %struct.stat64.9, ptr %43, i32 0, i32 0, !dbg !1427
  %44 = load i64, ptr %st_dev39, align 8, !dbg !1427
  %cmp40 = icmp eq i64 %42, %44, !dbg !1428
  %conv41 = zext i1 %cmp40 to i32, !dbg !1428
  %conv42 = sext i32 %conv41 to i64, !dbg !1424
  call void @klee_prefer_cex(ptr noundef %40, i64 noundef %conv42), !dbg !1429
  %45 = load ptr, ptr %s, align 8, !dbg !1430
  %46 = load ptr, ptr %s, align 8, !dbg !1431
  %st_rdev = getelementptr inbounds %struct.stat64.9, ptr %46, i32 0, i32 7, !dbg !1432
  %47 = load i64, ptr %st_rdev, align 8, !dbg !1432
  %48 = load ptr, ptr %defaults.addr, align 8, !dbg !1433
  %st_rdev43 = getelementptr inbounds %struct.stat64.9, ptr %48, i32 0, i32 7, !dbg !1434
  %49 = load i64, ptr %st_rdev43, align 8, !dbg !1434
  %cmp44 = icmp eq i64 %47, %49, !dbg !1435
  %conv45 = zext i1 %cmp44 to i32, !dbg !1435
  %conv46 = sext i32 %conv45 to i64, !dbg !1431
  call void @klee_prefer_cex(ptr noundef %45, i64 noundef %conv46), !dbg !1436
  %50 = load ptr, ptr %s, align 8, !dbg !1437
  %51 = load ptr, ptr %s, align 8, !dbg !1438
  %st_mode47 = getelementptr inbounds %struct.stat64.9, ptr %51, i32 0, i32 3, !dbg !1439
  %52 = load i32, ptr %st_mode47, align 8, !dbg !1439
  %and48 = and i32 %52, 448, !dbg !1440
  %cmp49 = icmp eq i32 %and48, 384, !dbg !1441
  %conv50 = zext i1 %cmp49 to i32, !dbg !1441
  %conv51 = sext i32 %conv50 to i64, !dbg !1442
  call void @klee_prefer_cex(ptr noundef %50, i64 noundef %conv51), !dbg !1443
  %53 = load ptr, ptr %s, align 8, !dbg !1444
  %54 = load ptr, ptr %s, align 8, !dbg !1445
  %st_mode52 = getelementptr inbounds %struct.stat64.9, ptr %54, i32 0, i32 3, !dbg !1446
  %55 = load i32, ptr %st_mode52, align 8, !dbg !1446
  %and53 = and i32 %55, 56, !dbg !1447
  %cmp54 = icmp eq i32 %and53, 32, !dbg !1448
  %conv55 = zext i1 %cmp54 to i32, !dbg !1448
  %conv56 = sext i32 %conv55 to i64, !dbg !1449
  call void @klee_prefer_cex(ptr noundef %53, i64 noundef %conv56), !dbg !1450
  %56 = load ptr, ptr %s, align 8, !dbg !1451
  %57 = load ptr, ptr %s, align 8, !dbg !1452
  %st_mode57 = getelementptr inbounds %struct.stat64.9, ptr %57, i32 0, i32 3, !dbg !1453
  %58 = load i32, ptr %st_mode57, align 8, !dbg !1453
  %and58 = and i32 %58, 7, !dbg !1454
  %cmp59 = icmp eq i32 %and58, 4, !dbg !1455
  %conv60 = zext i1 %cmp59 to i32, !dbg !1455
  %conv61 = sext i32 %conv60 to i64, !dbg !1456
  call void @klee_prefer_cex(ptr noundef %56, i64 noundef %conv61), !dbg !1457
  %59 = load ptr, ptr %s, align 8, !dbg !1458
  %60 = load ptr, ptr %s, align 8, !dbg !1459
  %st_mode62 = getelementptr inbounds %struct.stat64.9, ptr %60, i32 0, i32 3, !dbg !1460
  %61 = load i32, ptr %st_mode62, align 8, !dbg !1460
  %and63 = and i32 %61, 61440, !dbg !1461
  %cmp64 = icmp eq i32 %and63, 32768, !dbg !1462
  %conv65 = zext i1 %cmp64 to i32, !dbg !1462
  %conv66 = sext i32 %conv65 to i64, !dbg !1463
  call void @klee_prefer_cex(ptr noundef %59, i64 noundef %conv66), !dbg !1464
  %62 = load ptr, ptr %s, align 8, !dbg !1465
  %63 = load ptr, ptr %s, align 8, !dbg !1466
  %st_nlink = getelementptr inbounds %struct.stat64.9, ptr %63, i32 0, i32 2, !dbg !1467
  %64 = load i64, ptr %st_nlink, align 8, !dbg !1467
  %cmp67 = icmp eq i64 %64, 1, !dbg !1468
  %conv68 = zext i1 %cmp67 to i32, !dbg !1468
  %conv69 = sext i32 %conv68 to i64, !dbg !1466
  call void @klee_prefer_cex(ptr noundef %62, i64 noundef %conv69), !dbg !1469
  %65 = load ptr, ptr %s, align 8, !dbg !1470
  %66 = load ptr, ptr %s, align 8, !dbg !1471
  %st_uid = getelementptr inbounds %struct.stat64.9, ptr %66, i32 0, i32 4, !dbg !1472
  %67 = load i32, ptr %st_uid, align 4, !dbg !1472
  %68 = load ptr, ptr %defaults.addr, align 8, !dbg !1473
  %st_uid70 = getelementptr inbounds %struct.stat64.9, ptr %68, i32 0, i32 4, !dbg !1474
  %69 = load i32, ptr %st_uid70, align 4, !dbg !1474
  %cmp71 = icmp eq i32 %67, %69, !dbg !1475
  %conv72 = zext i1 %cmp71 to i32, !dbg !1475
  %conv73 = sext i32 %conv72 to i64, !dbg !1471
  call void @klee_prefer_cex(ptr noundef %65, i64 noundef %conv73), !dbg !1476
  %70 = load ptr, ptr %s, align 8, !dbg !1477
  %71 = load ptr, ptr %s, align 8, !dbg !1478
  %st_gid = getelementptr inbounds %struct.stat64.9, ptr %71, i32 0, i32 5, !dbg !1479
  %72 = load i32, ptr %st_gid, align 8, !dbg !1479
  %73 = load ptr, ptr %defaults.addr, align 8, !dbg !1480
  %st_gid74 = getelementptr inbounds %struct.stat64.9, ptr %73, i32 0, i32 5, !dbg !1481
  %74 = load i32, ptr %st_gid74, align 8, !dbg !1481
  %cmp75 = icmp eq i32 %72, %74, !dbg !1482
  %conv76 = zext i1 %cmp75 to i32, !dbg !1482
  %conv77 = sext i32 %conv76 to i64, !dbg !1478
  call void @klee_prefer_cex(ptr noundef %70, i64 noundef %conv77), !dbg !1483
  %75 = load ptr, ptr %s, align 8, !dbg !1484
  %76 = load ptr, ptr %s, align 8, !dbg !1485
  %st_blksize78 = getelementptr inbounds %struct.stat64.9, ptr %76, i32 0, i32 9, !dbg !1486
  %77 = load i64, ptr %st_blksize78, align 8, !dbg !1486
  %cmp79 = icmp eq i64 %77, 4096, !dbg !1487
  %conv80 = zext i1 %cmp79 to i32, !dbg !1487
  %conv81 = sext i32 %conv80 to i64, !dbg !1485
  call void @klee_prefer_cex(ptr noundef %75, i64 noundef %conv81), !dbg !1488
  %78 = load ptr, ptr %s, align 8, !dbg !1489
  %79 = load ptr, ptr %s, align 8, !dbg !1490
  %st_atim = getelementptr inbounds %struct.stat64.9, ptr %79, i32 0, i32 11, !dbg !1491
  %tv_sec = getelementptr inbounds %struct.timespec.8, ptr %st_atim, i32 0, i32 0, !dbg !1491
  %80 = load i64, ptr %tv_sec, align 8, !dbg !1491
  %81 = load ptr, ptr %defaults.addr, align 8, !dbg !1492
  %st_atim82 = getelementptr inbounds %struct.stat64.9, ptr %81, i32 0, i32 11, !dbg !1493
  %tv_sec83 = getelementptr inbounds %struct.timespec.8, ptr %st_atim82, i32 0, i32 0, !dbg !1493
  %82 = load i64, ptr %tv_sec83, align 8, !dbg !1493
  %cmp84 = icmp eq i64 %80, %82, !dbg !1494
  %conv85 = zext i1 %cmp84 to i32, !dbg !1494
  %conv86 = sext i32 %conv85 to i64, !dbg !1490
  call void @klee_prefer_cex(ptr noundef %78, i64 noundef %conv86), !dbg !1495
  %83 = load ptr, ptr %s, align 8, !dbg !1496
  %84 = load ptr, ptr %s, align 8, !dbg !1497
  %st_mtim = getelementptr inbounds %struct.stat64.9, ptr %84, i32 0, i32 12, !dbg !1498
  %tv_sec87 = getelementptr inbounds %struct.timespec.8, ptr %st_mtim, i32 0, i32 0, !dbg !1498
  %85 = load i64, ptr %tv_sec87, align 8, !dbg !1498
  %86 = load ptr, ptr %defaults.addr, align 8, !dbg !1499
  %st_mtim88 = getelementptr inbounds %struct.stat64.9, ptr %86, i32 0, i32 12, !dbg !1500
  %tv_sec89 = getelementptr inbounds %struct.timespec.8, ptr %st_mtim88, i32 0, i32 0, !dbg !1500
  %87 = load i64, ptr %tv_sec89, align 8, !dbg !1500
  %cmp90 = icmp eq i64 %85, %87, !dbg !1501
  %conv91 = zext i1 %cmp90 to i32, !dbg !1501
  %conv92 = sext i32 %conv91 to i64, !dbg !1497
  call void @klee_prefer_cex(ptr noundef %83, i64 noundef %conv92), !dbg !1502
  %88 = load ptr, ptr %s, align 8, !dbg !1503
  %89 = load ptr, ptr %s, align 8, !dbg !1504
  %st_ctim = getelementptr inbounds %struct.stat64.9, ptr %89, i32 0, i32 13, !dbg !1505
  %tv_sec93 = getelementptr inbounds %struct.timespec.8, ptr %st_ctim, i32 0, i32 0, !dbg !1505
  %90 = load i64, ptr %tv_sec93, align 8, !dbg !1505
  %91 = load ptr, ptr %defaults.addr, align 8, !dbg !1506
  %st_ctim94 = getelementptr inbounds %struct.stat64.9, ptr %91, i32 0, i32 13, !dbg !1507
  %tv_sec95 = getelementptr inbounds %struct.timespec.8, ptr %st_ctim94, i32 0, i32 0, !dbg !1507
  %92 = load i64, ptr %tv_sec95, align 8, !dbg !1507
  %cmp96 = icmp eq i64 %90, %92, !dbg !1508
  %conv97 = zext i1 %cmp96 to i32, !dbg !1508
  %conv98 = sext i32 %conv97 to i64, !dbg !1504
  call void @klee_prefer_cex(ptr noundef %88, i64 noundef %conv98), !dbg !1509
  %93 = load ptr, ptr %dfile.addr, align 8, !dbg !1510
  %size99 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %93, i32 0, i32 0, !dbg !1511
  %94 = load i32, ptr %size99, align 8, !dbg !1511
  %conv100 = zext i32 %94 to i64, !dbg !1510
  %95 = load ptr, ptr %s, align 8, !dbg !1512
  %st_size = getelementptr inbounds %struct.stat64.9, ptr %95, i32 0, i32 8, !dbg !1513
  store i64 %conv100, ptr %st_size, align 8, !dbg !1514
  %96 = load ptr, ptr %s, align 8, !dbg !1515
  %st_blocks = getelementptr inbounds %struct.stat64.9, ptr %96, i32 0, i32 10, !dbg !1516
  store i64 8, ptr %st_blocks, align 8, !dbg !1517
  %97 = load ptr, ptr %s, align 8, !dbg !1518
  %98 = load ptr, ptr %dfile.addr, align 8, !dbg !1519
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %98, i32 0, i32 2, !dbg !1520
  store ptr %97, ptr %stat, align 8, !dbg !1521
  ret void, !dbg !1522
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #7

declare i32 @klee_is_symbolic(i64 noundef) #4

declare void @klee_assume(i64 noundef) #4

declare void @klee_prefer_cex(ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @klee_range(i32 noundef %start, i32 noundef %end, ptr noundef %name) #0 !dbg !1523 {
entry:
  %retval = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %name.addr = alloca ptr, align 8
  %x = alloca i32, align 4
  store i32 %start, ptr %start.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %start.addr, metadata !1526, metadata !DIExpression()), !dbg !1527
  store i32 %end, ptr %end.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %end.addr, metadata !1528, metadata !DIExpression()), !dbg !1529
  store ptr %name, ptr %name.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %name.addr, metadata !1530, metadata !DIExpression()), !dbg !1531
  call void @llvm.dbg.declare(metadata ptr %x, metadata !1532, metadata !DIExpression()), !dbg !1533
  %0 = load i32, ptr %start.addr, align 4, !dbg !1534
  %1 = load i32, ptr %end.addr, align 4, !dbg !1536
  %cmp = icmp sge i32 %0, %1, !dbg !1537
  br i1 %cmp, label %if.then, label %if.end, !dbg !1538

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.55, i32 noundef 16, ptr noundef @.str.1.56, ptr noundef @.str.2.57) #13, !dbg !1539
  unreachable, !dbg !1539

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %start.addr, align 4, !dbg !1540
  %add = add nsw i32 %2, 1, !dbg !1542
  %3 = load i32, ptr %end.addr, align 4, !dbg !1543
  %cmp1 = icmp eq i32 %add, %3, !dbg !1544
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1545

if.then2:                                         ; preds = %if.end
  %4 = load i32, ptr %start.addr, align 4, !dbg !1546
  store i32 %4, ptr %retval, align 4, !dbg !1548
  br label %return, !dbg !1548

if.else:                                          ; preds = %if.end
  %5 = load ptr, ptr %name.addr, align 8, !dbg !1549
  call void @klee_make_symbolic(ptr noundef %x, i64 noundef 4, ptr noundef %5), !dbg !1551
  %6 = load i32, ptr %start.addr, align 4, !dbg !1552
  %cmp3 = icmp eq i32 %6, 0, !dbg !1554
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1555

if.then4:                                         ; preds = %if.else
  %7 = load i32, ptr %x, align 4, !dbg !1556
  %8 = load i32, ptr %end.addr, align 4, !dbg !1558
  %cmp5 = icmp ult i32 %7, %8, !dbg !1559
  %conv = zext i1 %cmp5 to i32, !dbg !1559
  %conv6 = sext i32 %conv to i64, !dbg !1560
  call void @klee_assume(i64 noundef %conv6), !dbg !1561
  br label %if.end14, !dbg !1562

if.else7:                                         ; preds = %if.else
  %9 = load i32, ptr %start.addr, align 4, !dbg !1563
  %10 = load i32, ptr %x, align 4, !dbg !1565
  %cmp8 = icmp sle i32 %9, %10, !dbg !1566
  %conv9 = zext i1 %cmp8 to i32, !dbg !1566
  %conv10 = sext i32 %conv9 to i64, !dbg !1563
  call void @klee_assume(i64 noundef %conv10), !dbg !1567
  %11 = load i32, ptr %x, align 4, !dbg !1568
  %12 = load i32, ptr %end.addr, align 4, !dbg !1569
  %cmp11 = icmp slt i32 %11, %12, !dbg !1570
  %conv12 = zext i1 %cmp11 to i32, !dbg !1570
  %conv13 = sext i32 %conv12 to i64, !dbg !1568
  call void @klee_assume(i64 noundef %conv13), !dbg !1571
  br label %if.end14

if.end14:                                         ; preds = %if.else7, %if.then4
  %13 = load i32, ptr %x, align 4, !dbg !1572
  store i32 %13, ptr %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

return:                                           ; preds = %if.end14, %if.then2
  %14 = load i32, ptr %retval, align 4, !dbg !1574
  ret i32 %14, !dbg !1574
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @access(ptr noundef nonnull %pathname, i32 noundef %mode) #0 !dbg !1575 {
entry:
  %retval = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %mode.addr = alloca i32, align 4
  %dfile = alloca ptr, align 8
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !1578, metadata !DIExpression()), !dbg !1579
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !1580, metadata !DIExpression()), !dbg !1581
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !1582, metadata !DIExpression()), !dbg !1608
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !1609
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !1610
  store ptr %call, ptr %dfile, align 8, !dbg !1608
  %1 = load ptr, ptr %dfile, align 8, !dbg !1611
  %tobool = icmp ne ptr %1, null, !dbg !1611
  br i1 %tobool, label %if.then, label %if.end, !dbg !1613

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4, !dbg !1614
  br label %return, !dbg !1614

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %pathname.addr, align 8, !dbg !1616
  %call1 = call ptr @__concretize_string(ptr noundef %2), !dbg !1617
  %3 = load i32, ptr %mode.addr, align 4, !dbg !1618
  %call2 = call i64 (i64, ...) @syscall(i64 noundef 21, ptr noundef %call1, i32 noundef %3) #16, !dbg !1619
  %conv = trunc i64 %call2 to i32, !dbg !1619
  store i32 %conv, ptr %retval, align 4, !dbg !1620
  br label %return, !dbg !1620

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, ptr %retval, align 4, !dbg !1621
  ret i32 %4, !dbg !1621
}

; Function Attrs: noinline nounwind uwtable
define internal ptr @__get_sym_file(ptr noundef %pathname) #0 !dbg !1622 {
entry:
  %retval = alloca ptr, align 8
  %pathname.addr = alloca ptr, align 8
  %cwd = alloca [1024 x i8], align 16
  %cwd_len = alloca i64, align 8
  %c = alloca i8, align 1
  %i = alloca i32, align 4
  %df = alloca ptr, align 8
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !1625, metadata !DIExpression()), !dbg !1626
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !1627
  %tobool = icmp ne ptr %0, null, !dbg !1627
  br i1 %tobool, label %if.end, label %if.then, !dbg !1629

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8, !dbg !1630
  br label %return, !dbg !1630

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pathname.addr, align 8, !dbg !1631
  %arrayidx = getelementptr inbounds i8, ptr %1, i64 0, !dbg !1631
  %2 = load i8, ptr %arrayidx, align 1, !dbg !1631
  %conv = sext i8 %2 to i32, !dbg !1631
  %cmp = icmp eq i32 %conv, 47, !dbg !1633
  br i1 %cmp, label %if.then2, label %if.end29, !dbg !1634

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata ptr %cwd, metadata !1635, metadata !DIExpression()), !dbg !1638
  %3 = call ptr @memset(ptr %cwd, i32 0, i64 1024), !dbg !1638
  %arraydecay = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 0, !dbg !1639
  %call = call ptr @getcwd(ptr noundef %arraydecay, i64 noundef 1024) #16, !dbg !1641
  %tobool3 = icmp ne ptr %call, null, !dbg !1641
  br i1 %tobool3, label %if.then4, label %if.end29, !dbg !1642

if.then4:                                         ; preds = %if.then2
  call void @llvm.dbg.declare(metadata ptr %cwd_len, metadata !1643, metadata !DIExpression()), !dbg !1645
  %arraydecay5 = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 0, !dbg !1646
  %call6 = call i64 @strlen(ptr noundef %arraydecay5) #14, !dbg !1647
  store i64 %call6, ptr %cwd_len, align 8, !dbg !1645
  %4 = load i64, ptr %cwd_len, align 8, !dbg !1648
  %cmp7 = icmp ugt i64 %4, 0, !dbg !1650
  br i1 %cmp7, label %land.lhs.true, label %if.end15, !dbg !1651

land.lhs.true:                                    ; preds = %if.then4
  %5 = load i64, ptr %cwd_len, align 8, !dbg !1652
  %sub = sub i64 %5, 1, !dbg !1653
  %arrayidx9 = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 %sub, !dbg !1654
  %6 = load i8, ptr %arrayidx9, align 1, !dbg !1654
  %conv10 = sext i8 %6 to i32, !dbg !1654
  %cmp11 = icmp eq i32 %conv10, 47, !dbg !1655
  br i1 %cmp11, label %if.then13, label %if.end15, !dbg !1656

if.then13:                                        ; preds = %land.lhs.true
  %7 = load i64, ptr %cwd_len, align 8, !dbg !1657
  %dec = add i64 %7, -1, !dbg !1657
  store i64 %dec, ptr %cwd_len, align 8, !dbg !1657
  %arrayidx14 = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 %dec, !dbg !1659
  store i8 0, ptr %arrayidx14, align 1, !dbg !1660
  br label %if.end15, !dbg !1661

if.end15:                                         ; preds = %if.then13, %land.lhs.true, %if.then4
  %8 = load ptr, ptr %pathname.addr, align 8, !dbg !1662
  %arraydecay16 = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 0, !dbg !1664
  %9 = load i64, ptr %cwd_len, align 8, !dbg !1665
  %call17 = call i32 @strncmp(ptr noundef %8, ptr noundef %arraydecay16, i64 noundef %9) #14, !dbg !1666
  %cmp18 = icmp eq i32 %call17, 0, !dbg !1667
  br i1 %cmp18, label %if.then20, label %if.end29, !dbg !1668

if.then20:                                        ; preds = %if.end15
  %10 = load ptr, ptr %pathname.addr, align 8, !dbg !1669
  %11 = load i64, ptr %cwd_len, align 8, !dbg !1672
  %arrayidx21 = getelementptr inbounds i8, ptr %10, i64 %11, !dbg !1669
  %12 = load i8, ptr %arrayidx21, align 1, !dbg !1669
  %conv22 = sext i8 %12 to i32, !dbg !1669
  %cmp23 = icmp ne i32 %conv22, 0, !dbg !1673
  br i1 %cmp23, label %if.then25, label %if.end29, !dbg !1674

if.then25:                                        ; preds = %if.then20
  %13 = load i64, ptr %cwd_len, align 8, !dbg !1675
  %add = add i64 %13, 1, !dbg !1676
  %14 = load ptr, ptr %pathname.addr, align 8, !dbg !1677
  %add.ptr = getelementptr inbounds i8, ptr %14, i64 %add, !dbg !1677
  store ptr %add.ptr, ptr %pathname.addr, align 8, !dbg !1677
  br label %if.end29, !dbg !1678

if.end29:                                         ; preds = %if.then2, %if.then20, %if.then25, %if.end15, %if.end
  call void @llvm.dbg.declare(metadata ptr %c, metadata !1679, metadata !DIExpression()), !dbg !1680
  %15 = load ptr, ptr %pathname.addr, align 8, !dbg !1681
  %arrayidx30 = getelementptr inbounds i8, ptr %15, i64 0, !dbg !1681
  %16 = load i8, ptr %arrayidx30, align 1, !dbg !1681
  store i8 %16, ptr %c, align 1, !dbg !1680
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1682, metadata !DIExpression()), !dbg !1683
  %17 = load i8, ptr %c, align 1, !dbg !1684
  %conv31 = sext i8 %17 to i32, !dbg !1684
  %cmp32 = icmp eq i32 %conv31, 0, !dbg !1686
  br i1 %cmp32, label %if.then38, label %lor.lhs.false, !dbg !1687

lor.lhs.false:                                    ; preds = %if.end29
  %18 = load ptr, ptr %pathname.addr, align 8, !dbg !1688
  %arrayidx34 = getelementptr inbounds i8, ptr %18, i64 1, !dbg !1688
  %19 = load i8, ptr %arrayidx34, align 1, !dbg !1688
  %conv35 = sext i8 %19 to i32, !dbg !1688
  %cmp36 = icmp ne i32 %conv35, 0, !dbg !1689
  br i1 %cmp36, label %if.then38, label %if.end39, !dbg !1690

if.then38:                                        ; preds = %lor.lhs.false, %if.end29
  store ptr null, ptr %retval, align 8, !dbg !1691
  br label %return, !dbg !1691

if.end39:                                         ; preds = %lor.lhs.false
  store i32 0, ptr %i, align 4, !dbg !1692
  br label %for.cond, !dbg !1694

for.cond:                                         ; preds = %for.inc, %if.end39
  %20 = load i32, ptr %i, align 4, !dbg !1695
  %21 = load i32, ptr @__exe_fs, align 8, !dbg !1697
  %cmp40 = icmp ult i32 %20, %21, !dbg !1698
  br i1 %cmp40, label %for.body, label %for.end, !dbg !1699

for.body:                                         ; preds = %for.cond
  %22 = load i8, ptr %c, align 1, !dbg !1700
  %conv42 = sext i8 %22 to i32, !dbg !1700
  %23 = load i32, ptr %i, align 4, !dbg !1703
  %conv43 = trunc i32 %23 to i8, !dbg !1704
  %conv44 = sext i8 %conv43 to i32, !dbg !1704
  %add45 = add nsw i32 65, %conv44, !dbg !1705
  %cmp46 = icmp eq i32 %conv42, %add45, !dbg !1706
  br i1 %cmp46, label %if.then48, label %for.inc, !dbg !1707

if.then48:                                        ; preds = %for.body
  call void @llvm.dbg.declare(metadata ptr %df, metadata !1708, metadata !DIExpression()), !dbg !1710
  %24 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8, !dbg !1711
  %25 = load i32, ptr %i, align 4, !dbg !1712
  %idxprom = zext i32 %25 to i64, !dbg !1713
  %arrayidx49 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %24, i64 %idxprom, !dbg !1713
  store ptr %arrayidx49, ptr %df, align 8, !dbg !1710
  %26 = load ptr, ptr %df, align 8, !dbg !1714
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %26, i32 0, i32 2, !dbg !1716
  %27 = load ptr, ptr %stat, align 8, !dbg !1716
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %27, i32 0, i32 1, !dbg !1717
  %28 = load i64, ptr %st_ino, align 8, !dbg !1717
  %cmp50 = icmp eq i64 %28, 0, !dbg !1718
  br i1 %cmp50, label %if.then52, label %if.end53, !dbg !1719

if.then52:                                        ; preds = %if.then48
  store ptr null, ptr %retval, align 8, !dbg !1720
  br label %return, !dbg !1720

if.end53:                                         ; preds = %if.then48
  %29 = load ptr, ptr %df, align 8, !dbg !1721
  store ptr %29, ptr %retval, align 8, !dbg !1722
  br label %return, !dbg !1722

for.inc:                                          ; preds = %for.body
  %30 = load i32, ptr %i, align 4, !dbg !1723
  %inc = add i32 %30, 1, !dbg !1723
  store i32 %inc, ptr %i, align 4, !dbg !1723
  br label %for.cond, !dbg !1724, !llvm.loop !1725

for.end:                                          ; preds = %for.cond
  store ptr null, ptr %retval, align 8, !dbg !1727
  br label %return, !dbg !1727

return:                                           ; preds = %for.end, %if.end53, %if.then52, %if.then38, %if.then
  %31 = load ptr, ptr %retval, align 8, !dbg !1728
  ret ptr %31, !dbg !1728
}

; Function Attrs: noinline nounwind uwtable
define internal ptr @__concretize_string(ptr noundef %s) #0 !dbg !1729 {
entry:
  %s.addr = alloca ptr, align 8
  %sc = alloca ptr, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %cc = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !1732, metadata !DIExpression()), !dbg !1733
  call void @llvm.dbg.declare(metadata ptr %sc, metadata !1734, metadata !DIExpression()), !dbg !1735
  %0 = load ptr, ptr %s.addr, align 8, !dbg !1736
  %call = call ptr @__concretize_ptr(ptr noundef %0), !dbg !1737
  store ptr %call, ptr %sc, align 8, !dbg !1735
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1738, metadata !DIExpression()), !dbg !1739
  store i32 0, ptr %i, align 4, !dbg !1740
  br label %for.cond, !dbg !1742

for.cond:                                         ; preds = %for.inc, %entry
  call void @llvm.dbg.declare(metadata ptr %c, metadata !1743, metadata !DIExpression()), !dbg !1746
  %1 = load ptr, ptr %sc, align 8, !dbg !1747
  %2 = load i8, ptr %1, align 1, !dbg !1748
  store i8 %2, ptr %c, align 1, !dbg !1746
  %3 = load i8, ptr %c, align 1, !dbg !1749
  %conv = sext i8 %3 to i64, !dbg !1749
  %call1 = call i32 @klee_is_symbolic(i64 noundef %conv), !dbg !1751
  %tobool = icmp ne i32 %call1, 0, !dbg !1751
  br i1 %tobool, label %if.end4, label %if.then, !dbg !1752

if.then:                                          ; preds = %for.cond
  %4 = load i8, ptr %c, align 1, !dbg !1753
  %tobool2 = icmp ne i8 %4, 0, !dbg !1753
  br i1 %tobool2, label %for.inc, label %for.end, !dbg !1756

if.end4:                                          ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !1757
  %6 = load i32, ptr %i, align 4, !dbg !1759
  %sub = sub i32 %6, 1, !dbg !1760
  %and = and i32 %5, %sub, !dbg !1761
  %tobool5 = icmp ne i32 %and, 0, !dbg !1761
  br i1 %tobool5, label %if.else14, label %if.then6, !dbg !1762

if.then6:                                         ; preds = %if.end4
  %7 = load i8, ptr %c, align 1, !dbg !1763
  %tobool7 = icmp ne i8 %7, 0, !dbg !1763
  br i1 %tobool7, label %if.else, label %if.then8, !dbg !1766

if.then8:                                         ; preds = %if.then6
  %8 = load ptr, ptr %sc, align 8, !dbg !1767
  store i8 0, ptr %8, align 1, !dbg !1769
  br label %for.end, !dbg !1770

if.else:                                          ; preds = %if.then6
  %9 = load i8, ptr %c, align 1, !dbg !1771
  %conv9 = sext i8 %9 to i32, !dbg !1771
  %cmp = icmp eq i32 %conv9, 47, !dbg !1773
  br i1 %cmp, label %if.then11, label %for.inc, !dbg !1774

if.then11:                                        ; preds = %if.else
  %10 = load ptr, ptr %sc, align 8, !dbg !1775
  store i8 47, ptr %10, align 1, !dbg !1777
  br label %for.inc, !dbg !1778

if.else14:                                        ; preds = %if.end4
  call void @llvm.dbg.declare(metadata ptr %cc, metadata !1779, metadata !DIExpression()), !dbg !1781
  %11 = load i8, ptr %c, align 1, !dbg !1782
  %conv15 = sext i8 %11 to i64, !dbg !1783
  %call16 = call i64 @klee_get_valuel(i64 noundef %conv15), !dbg !1784
  %conv17 = trunc i64 %call16 to i8, !dbg !1785
  store i8 %conv17, ptr %cc, align 1, !dbg !1781
  %12 = load i8, ptr %cc, align 1, !dbg !1786
  %conv18 = sext i8 %12 to i32, !dbg !1786
  %13 = load i8, ptr %c, align 1, !dbg !1787
  %conv19 = sext i8 %13 to i32, !dbg !1787
  %cmp20 = icmp eq i32 %conv18, %conv19, !dbg !1788
  %conv21 = zext i1 %cmp20 to i32, !dbg !1788
  %conv22 = sext i32 %conv21 to i64, !dbg !1786
  call void @klee_assume(i64 noundef %conv22), !dbg !1789
  %14 = load i8, ptr %cc, align 1, !dbg !1790
  %15 = load ptr, ptr %sc, align 8, !dbg !1791
  store i8 %14, ptr %15, align 1, !dbg !1792
  %16 = load i8, ptr %cc, align 1, !dbg !1793
  %tobool23 = icmp ne i8 %16, 0, !dbg !1793
  br i1 %tobool23, label %for.inc, label %for.end, !dbg !1795

for.inc:                                          ; preds = %if.else, %if.then11, %if.else14, %if.then
  %17 = load i32, ptr %i, align 4, !dbg !1796
  %inc = add i32 %17, 1, !dbg !1796
  store i32 %inc, ptr %i, align 4, !dbg !1796
  %18 = load ptr, ptr %sc, align 8, !dbg !1797
  %incdec.ptr = getelementptr inbounds i8, ptr %18, i32 1, !dbg !1797
  store ptr %incdec.ptr, ptr %sc, align 8, !dbg !1797
  br label %for.cond, !dbg !1798, !llvm.loop !1799

for.end:                                          ; preds = %if.else14, %if.then, %if.then8
  %19 = load ptr, ptr %s.addr, align 8, !dbg !1802
  ret ptr %19, !dbg !1803
}

; Function Attrs: nounwind
declare i64 @syscall(i64 noundef, ...) #9

; Function Attrs: noinline nounwind uwtable
define internal ptr @__concretize_ptr(ptr noundef %p) #0 !dbg !1804 {
entry:
  %p.addr = alloca ptr, align 8
  %pc = alloca ptr, align 8
  store ptr %p, ptr %p.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %p.addr, metadata !1807, metadata !DIExpression()), !dbg !1808
  call void @llvm.dbg.declare(metadata ptr %pc, metadata !1809, metadata !DIExpression()), !dbg !1810
  %0 = load ptr, ptr %p.addr, align 8, !dbg !1811
  %1 = ptrtoint ptr %0 to i64, !dbg !1812
  %call = call i64 @klee_get_valuel(i64 noundef %1), !dbg !1813
  %2 = inttoptr i64 %call to ptr, !dbg !1814
  store ptr %2, ptr %pc, align 8, !dbg !1810
  %3 = load ptr, ptr %pc, align 8, !dbg !1815
  %4 = load ptr, ptr %p.addr, align 8, !dbg !1816
  %cmp = icmp eq ptr %3, %4, !dbg !1817
  %conv = zext i1 %cmp to i32, !dbg !1817
  %conv1 = sext i32 %conv to i64, !dbg !1815
  call void @klee_assume(i64 noundef %conv1), !dbg !1818
  %5 = load ptr, ptr %pc, align 8, !dbg !1819
  ret ptr %5, !dbg !1820
}

declare i64 @klee_get_valuel(i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @getcwd(ptr noundef %buf, i64 noundef %size) #0 !dbg !493 {
entry:
  %retval = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %r = alloca i32, align 4
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !1821, metadata !DIExpression()), !dbg !1822
  store i64 %size, ptr %size.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !1823, metadata !DIExpression()), !dbg !1824
  call void @llvm.dbg.declare(metadata ptr %r, metadata !1825, metadata !DIExpression()), !dbg !1826
  %0 = load i32, ptr @getcwd.n_calls, align 4, !dbg !1827
  %inc = add nsw i32 %0, 1, !dbg !1827
  store i32 %inc, ptr @getcwd.n_calls, align 4, !dbg !1827
  %1 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1828
  %tobool = icmp ne i32 %1, 0, !dbg !1830
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !1831

land.lhs.true:                                    ; preds = %entry
  %2 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 10), align 8, !dbg !1832
  %3 = load i32, ptr %2, align 4, !dbg !1833
  %4 = load i32, ptr @getcwd.n_calls, align 4, !dbg !1834
  %cmp = icmp eq i32 %3, %4, !dbg !1835
  br i1 %cmp, label %if.then, label %if.end, !dbg !1836

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1837
  %dec = add i32 %5, -1, !dbg !1837
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1837
  %call = call ptr @__errno_location() #17, !dbg !1839
  store i32 34, ptr %call, align 4, !dbg !1840
  store ptr null, ptr %retval, align 8, !dbg !1841
  br label %return, !dbg !1841

if.end:                                           ; preds = %land.lhs.true, %entry
  %6 = load ptr, ptr %buf.addr, align 8, !dbg !1842
  %tobool1 = icmp ne ptr %6, null, !dbg !1842
  br i1 %tobool1, label %if.else, label %if.then2, !dbg !1844

if.then2:                                         ; preds = %if.end
  store i64 1024, ptr %size.addr, align 8, !dbg !1845
  %7 = load i64, ptr %size.addr, align 8, !dbg !1847
  %call3 = call noalias ptr @malloc(i64 noundef %7) #12, !dbg !1848
  store ptr %call3, ptr %buf.addr, align 8, !dbg !1849
  %8 = load ptr, ptr %buf.addr, align 8, !dbg !1850
  %tobool4 = icmp ne ptr %8, null, !dbg !1850
  br i1 %tobool4, label %if.end12, label %if.then5, !dbg !1852

if.then5:                                         ; preds = %if.then2
  %call6 = call ptr @__errno_location() #17, !dbg !1853
  store i32 12, ptr %call6, align 4, !dbg !1855
  store ptr null, ptr %retval, align 8, !dbg !1856
  br label %return, !dbg !1856

if.else:                                          ; preds = %if.end
  %9 = load i64, ptr %size.addr, align 8, !dbg !1857
  %tobool8 = icmp ne i64 %9, 0, !dbg !1857
  br i1 %tobool8, label %if.end12, label %if.then9, !dbg !1859

if.then9:                                         ; preds = %if.else
  %call10 = call ptr @__errno_location() #17, !dbg !1860
  store i32 22, ptr %call10, align 4, !dbg !1862
  store ptr null, ptr %retval, align 8, !dbg !1863
  br label %return, !dbg !1863

if.end12:                                         ; preds = %if.else, %if.then2
  %10 = load ptr, ptr %buf.addr, align 8, !dbg !1864
  %call13 = call ptr @__concretize_ptr(ptr noundef %10), !dbg !1865
  store ptr %call13, ptr %buf.addr, align 8, !dbg !1866
  %11 = load i64, ptr %size.addr, align 8, !dbg !1867
  %call14 = call i64 @__concretize_size(i64 noundef %11), !dbg !1868
  store i64 %call14, ptr %size.addr, align 8, !dbg !1869
  %12 = load ptr, ptr %buf.addr, align 8, !dbg !1870
  %13 = load i64, ptr %size.addr, align 8, !dbg !1871
  call void @klee_check_memory_access(ptr noundef %12, i64 noundef %13), !dbg !1872
  %14 = load ptr, ptr %buf.addr, align 8, !dbg !1873
  %15 = load i64, ptr %size.addr, align 8, !dbg !1874
  %call15 = call i64 (i64, ...) @syscall(i64 noundef 79, ptr noundef %14, i64 noundef %15) #16, !dbg !1875
  %conv = trunc i64 %call15 to i32, !dbg !1875
  store i32 %conv, ptr %r, align 4, !dbg !1876
  %16 = load i32, ptr %r, align 4, !dbg !1877
  %cmp16 = icmp eq i32 %16, -1, !dbg !1879
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !1880

if.then18:                                        ; preds = %if.end12
  store ptr null, ptr %retval, align 8, !dbg !1881
  br label %return, !dbg !1881

if.end19:                                         ; preds = %if.end12
  %17 = load ptr, ptr %buf.addr, align 8, !dbg !1882
  store ptr %17, ptr %retval, align 8, !dbg !1883
  br label %return, !dbg !1883

return:                                           ; preds = %if.end19, %if.then18, %if.then9, %if.then5, %if.then
  %18 = load ptr, ptr %retval, align 8, !dbg !1884
  ret ptr %18, !dbg !1884
}

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #10

; Function Attrs: noinline nounwind uwtable
define internal i64 @__concretize_size(i64 noundef %s) #0 !dbg !1885 {
entry:
  %s.addr = alloca i64, align 8
  %sc = alloca i64, align 8
  store i64 %s, ptr %s.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !1888, metadata !DIExpression()), !dbg !1889
  call void @llvm.dbg.declare(metadata ptr %sc, metadata !1890, metadata !DIExpression()), !dbg !1891
  %0 = load i64, ptr %s.addr, align 8, !dbg !1892
  %call = call i64 @klee_get_valuel(i64 noundef %0), !dbg !1893
  store i64 %call, ptr %sc, align 8, !dbg !1891
  %1 = load i64, ptr %sc, align 8, !dbg !1894
  %2 = load i64, ptr %s.addr, align 8, !dbg !1895
  %cmp = icmp eq i64 %1, %2, !dbg !1896
  %conv = zext i1 %cmp to i32, !dbg !1896
  %conv1 = sext i32 %conv to i64, !dbg !1894
  call void @klee_assume(i64 noundef %conv1), !dbg !1897
  %3 = load i64, ptr %sc, align 8, !dbg !1898
  ret i64 %3, !dbg !1899
}

declare void @klee_check_memory_access(ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @umask(i32 noundef %mask) #0 !dbg !1900 {
entry:
  %mask.addr = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %mask, ptr %mask.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mask.addr, metadata !1903, metadata !DIExpression()), !dbg !1904
  call void @llvm.dbg.declare(metadata ptr %r, metadata !1905, metadata !DIExpression()), !dbg !1906
  %0 = load i32, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 1), align 8, !dbg !1907
  store i32 %0, ptr %r, align 4, !dbg !1906
  %1 = load i32, ptr %mask.addr, align 4, !dbg !1908
  %and = and i32 %1, 511, !dbg !1909
  store i32 %and, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 1), align 8, !dbg !1910
  %2 = load i32, ptr %r, align 4, !dbg !1911
  ret i32 %2, !dbg !1912
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_open(ptr noundef %pathname, i32 noundef %flags, i32 noundef %mode) #0 !dbg !1913 {
entry:
  %retval = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %mode.addr = alloca i32, align 4
  %df = alloca ptr, align 8
  %f = alloca ptr, align 8
  %fd = alloca i32, align 4
  %os_fd = alloca i32, align 4
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !1916, metadata !DIExpression()), !dbg !1917
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !1918, metadata !DIExpression()), !dbg !1919
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !1920, metadata !DIExpression()), !dbg !1921
  call void @llvm.dbg.declare(metadata ptr %df, metadata !1922, metadata !DIExpression()), !dbg !1923
  call void @llvm.dbg.declare(metadata ptr %f, metadata !1924, metadata !DIExpression()), !dbg !1933
  call void @llvm.dbg.declare(metadata ptr %fd, metadata !1934, metadata !DIExpression()), !dbg !1935
  store i32 0, ptr %fd, align 4, !dbg !1936
  br label %for.cond, !dbg !1938

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %fd, align 4, !dbg !1939
  %cmp = icmp slt i32 %0, 32, !dbg !1941
  br i1 %cmp, label %for.body, label %for.end, !dbg !1942

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %fd, align 4, !dbg !1943
  %idxprom = sext i32 %1 to i64, !dbg !1945
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !1945
  %flags1 = getelementptr inbounds %struct.exe_file_t.6, ptr %arrayidx, i32 0, i32 1, !dbg !1946
  %2 = load i32, ptr %flags1, align 4, !dbg !1946
  %and = and i32 %2, 1, !dbg !1947
  %tobool = icmp ne i32 %and, 0, !dbg !1947
  br i1 %tobool, label %for.inc, label %for.end, !dbg !1948

for.inc:                                          ; preds = %for.body
  %3 = load i32, ptr %fd, align 4, !dbg !1949
  %inc = add nsw i32 %3, 1, !dbg !1949
  store i32 %inc, ptr %fd, align 4, !dbg !1949
  br label %for.cond, !dbg !1950, !llvm.loop !1951

for.end:                                          ; preds = %for.body, %for.cond
  %4 = load i32, ptr %fd, align 4, !dbg !1953
  %cmp2 = icmp eq i32 %4, 32, !dbg !1955
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !1956

if.then3:                                         ; preds = %for.end
  %call = call ptr @__errno_location() #17, !dbg !1957
  store i32 24, ptr %call, align 4, !dbg !1959
  store i32 -1, ptr %retval, align 4, !dbg !1960
  br label %return, !dbg !1960

if.end4:                                          ; preds = %for.end
  %5 = load i32, ptr %fd, align 4, !dbg !1961
  %idxprom5 = sext i32 %5 to i64, !dbg !1962
  %arrayidx6 = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom5, !dbg !1962
  store ptr %arrayidx6, ptr %f, align 8, !dbg !1963
  %6 = load ptr, ptr %f, align 8, !dbg !1964
  %7 = call ptr @memset(ptr %6, i32 0, i64 24), !dbg !1965
  %8 = load ptr, ptr %pathname.addr, align 8, !dbg !1966
  %call7 = call ptr @__get_sym_file(ptr noundef %8), !dbg !1967
  store ptr %call7, ptr %df, align 8, !dbg !1968
  %9 = load ptr, ptr %df, align 8, !dbg !1969
  %tobool8 = icmp ne ptr %9, null, !dbg !1969
  br i1 %tobool8, label %if.then9, label %if.else45, !dbg !1971

if.then9:                                         ; preds = %if.end4
  %10 = load ptr, ptr %df, align 8, !dbg !1972
  %11 = load ptr, ptr %f, align 8, !dbg !1974
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %11, i32 0, i32 3, !dbg !1975
  store ptr %10, ptr %dfile, align 8, !dbg !1976
  %12 = load i32, ptr %flags.addr, align 4, !dbg !1977
  %and10 = and i32 %12, 64, !dbg !1979
  %tobool11 = icmp ne i32 %and10, 0, !dbg !1979
  br i1 %tobool11, label %land.lhs.true, label %if.end16, !dbg !1980

land.lhs.true:                                    ; preds = %if.then9
  %13 = load i32, ptr %flags.addr, align 4, !dbg !1981
  %and12 = and i32 %13, 128, !dbg !1982
  %tobool13 = icmp ne i32 %and12, 0, !dbg !1982
  br i1 %tobool13, label %if.then14, label %if.end16, !dbg !1983

if.then14:                                        ; preds = %land.lhs.true
  %call15 = call ptr @__errno_location() #17, !dbg !1984
  store i32 17, ptr %call15, align 4, !dbg !1986
  store i32 -1, ptr %retval, align 4, !dbg !1987
  br label %return, !dbg !1987

if.end16:                                         ; preds = %land.lhs.true, %if.then9
  %14 = load i32, ptr %flags.addr, align 4, !dbg !1988
  %and17 = and i32 %14, 512, !dbg !1990
  %tobool18 = icmp ne i32 %and17, 0, !dbg !1990
  br i1 %tobool18, label %land.lhs.true19, label %if.end24, !dbg !1991

land.lhs.true19:                                  ; preds = %if.end16
  %15 = load i32, ptr %flags.addr, align 4, !dbg !1992
  %and20 = and i32 %15, 0, !dbg !1993
  %tobool21 = icmp ne i32 %and20, 0, !dbg !1993
  br i1 %tobool21, label %if.then22, label %if.end24, !dbg !1994

if.then22:                                        ; preds = %land.lhs.true19
  call void @klee_warning(ptr noundef @.str.58), !dbg !1995
  %call23 = call ptr @__errno_location() #17, !dbg !1997
  store i32 13, ptr %call23, align 4, !dbg !1998
  store i32 -1, ptr %retval, align 4, !dbg !1999
  br label %return, !dbg !1999

if.end24:                                         ; preds = %land.lhs.true19, %if.end16
  %16 = load i32, ptr %flags.addr, align 4, !dbg !2000
  %and25 = and i32 %16, 128, !dbg !2002
  %tobool26 = icmp ne i32 %and25, 0, !dbg !2002
  br i1 %tobool26, label %land.lhs.true27, label %if.end32, !dbg !2003

land.lhs.true27:                                  ; preds = %if.end24
  %17 = load i32, ptr %flags.addr, align 4, !dbg !2004
  %and28 = and i32 %17, 64, !dbg !2005
  %tobool29 = icmp ne i32 %and28, 0, !dbg !2005
  br i1 %tobool29, label %if.end32, label %if.then30, !dbg !2006

if.then30:                                        ; preds = %land.lhs.true27
  call void @klee_warning(ptr noundef @.str.1.59), !dbg !2007
  %call31 = call ptr @__errno_location() #17, !dbg !2009
  store i32 13, ptr %call31, align 4, !dbg !2010
  store i32 -1, ptr %retval, align 4, !dbg !2011
  br label %return, !dbg !2011

if.end32:                                         ; preds = %land.lhs.true27, %if.end24
  %18 = load i32, ptr %flags.addr, align 4, !dbg !2012
  %19 = load ptr, ptr %df, align 8, !dbg !2014
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %19, i32 0, i32 2, !dbg !2015
  %20 = load ptr, ptr %stat, align 8, !dbg !2015
  %call33 = call i32 @has_permission(i32 noundef %18, ptr noundef %20), !dbg !2016
  %tobool34 = icmp ne i32 %call33, 0, !dbg !2016
  br i1 %tobool34, label %if.else, label %if.then35, !dbg !2017

if.then35:                                        ; preds = %if.end32
  %call36 = call ptr @__errno_location() #17, !dbg !2018
  store i32 13, ptr %call36, align 4, !dbg !2020
  store i32 -1, ptr %retval, align 4, !dbg !2021
  br label %return, !dbg !2021

if.else:                                          ; preds = %if.end32
  %21 = load ptr, ptr %f, align 8, !dbg !2022
  %dfile37 = getelementptr inbounds %struct.exe_file_t.6, ptr %21, i32 0, i32 3, !dbg !2023
  %22 = load ptr, ptr %dfile37, align 8, !dbg !2023
  %stat38 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %22, i32 0, i32 2, !dbg !2024
  %23 = load ptr, ptr %stat38, align 8, !dbg !2024
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %23, i32 0, i32 3, !dbg !2025
  %24 = load i32, ptr %st_mode, align 8, !dbg !2025
  %and39 = and i32 %24, -512, !dbg !2026
  %25 = load i32, ptr %mode.addr, align 4, !dbg !2027
  %26 = load i32, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 1), align 8, !dbg !2028
  %not = xor i32 %26, -1, !dbg !2029
  %and40 = and i32 %25, %not, !dbg !2030
  %or = or i32 %and39, %and40, !dbg !2031
  %27 = load ptr, ptr %f, align 8, !dbg !2032
  %dfile41 = getelementptr inbounds %struct.exe_file_t.6, ptr %27, i32 0, i32 3, !dbg !2033
  %28 = load ptr, ptr %dfile41, align 8, !dbg !2033
  %stat42 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %28, i32 0, i32 2, !dbg !2034
  %29 = load ptr, ptr %stat42, align 8, !dbg !2034
  %st_mode43 = getelementptr inbounds %struct.stat64.9, ptr %29, i32 0, i32 3, !dbg !2035
  store i32 %or, ptr %st_mode43, align 8, !dbg !2036
  br label %if.end53, !dbg !2037

if.else45:                                        ; preds = %if.end4
  call void @llvm.dbg.declare(metadata ptr %os_fd, metadata !2038, metadata !DIExpression()), !dbg !2040
  %30 = load ptr, ptr %pathname.addr, align 8, !dbg !2041
  %call46 = call ptr @__concretize_string(ptr noundef %30), !dbg !2042
  %31 = load i32, ptr %flags.addr, align 4, !dbg !2043
  %32 = load i32, ptr %mode.addr, align 4, !dbg !2044
  %call47 = call i64 (i64, ...) @syscall(i64 noundef 2, ptr noundef %call46, i32 noundef %31, i32 noundef %32) #16, !dbg !2045
  %conv = trunc i64 %call47 to i32, !dbg !2045
  store i32 %conv, ptr %os_fd, align 4, !dbg !2040
  %33 = load i32, ptr %os_fd, align 4, !dbg !2046
  %cmp48 = icmp eq i32 %33, -1, !dbg !2048
  br i1 %cmp48, label %if.then50, label %if.end51, !dbg !2049

if.then50:                                        ; preds = %if.else45
  store i32 -1, ptr %retval, align 4, !dbg !2050
  br label %return, !dbg !2050

if.end51:                                         ; preds = %if.else45
  %34 = load i32, ptr %os_fd, align 4, !dbg !2051
  %35 = load ptr, ptr %f, align 8, !dbg !2052
  %fd52 = getelementptr inbounds %struct.exe_file_t.6, ptr %35, i32 0, i32 0, !dbg !2053
  store i32 %34, ptr %fd52, align 8, !dbg !2054
  br label %if.end53

if.end53:                                         ; preds = %if.end51, %if.else
  %36 = load ptr, ptr %f, align 8, !dbg !2055
  %flags54 = getelementptr inbounds %struct.exe_file_t.6, ptr %36, i32 0, i32 1, !dbg !2056
  store i32 1, ptr %flags54, align 4, !dbg !2057
  %37 = load i32, ptr %flags.addr, align 4, !dbg !2058
  %and55 = and i32 %37, 3, !dbg !2060
  %cmp56 = icmp eq i32 %and55, 0, !dbg !2061
  br i1 %cmp56, label %if.then58, label %if.else61, !dbg !2062

if.then58:                                        ; preds = %if.end53
  %38 = load ptr, ptr %f, align 8, !dbg !2063
  %flags59 = getelementptr inbounds %struct.exe_file_t.6, ptr %38, i32 0, i32 1, !dbg !2065
  %39 = load i32, ptr %flags59, align 4, !dbg !2066
  %or60 = or i32 %39, 4, !dbg !2066
  store i32 %or60, ptr %flags59, align 4, !dbg !2066
  br label %if.end72, !dbg !2067

if.else61:                                        ; preds = %if.end53
  %40 = load i32, ptr %flags.addr, align 4, !dbg !2068
  %and62 = and i32 %40, 3, !dbg !2070
  %cmp63 = icmp eq i32 %and62, 1, !dbg !2071
  br i1 %cmp63, label %if.then65, label %if.else68, !dbg !2072

if.then65:                                        ; preds = %if.else61
  %41 = load ptr, ptr %f, align 8, !dbg !2073
  %flags66 = getelementptr inbounds %struct.exe_file_t.6, ptr %41, i32 0, i32 1, !dbg !2075
  %42 = load i32, ptr %flags66, align 4, !dbg !2076
  %or67 = or i32 %42, 8, !dbg !2076
  store i32 %or67, ptr %flags66, align 4, !dbg !2076
  br label %if.end72, !dbg !2077

if.else68:                                        ; preds = %if.else61
  %43 = load ptr, ptr %f, align 8, !dbg !2078
  %flags69 = getelementptr inbounds %struct.exe_file_t.6, ptr %43, i32 0, i32 1, !dbg !2080
  %44 = load i32, ptr %flags69, align 4, !dbg !2081
  %or70 = or i32 %44, 12, !dbg !2081
  store i32 %or70, ptr %flags69, align 4, !dbg !2081
  br label %if.end72

if.end72:                                         ; preds = %if.then65, %if.else68, %if.then58
  %45 = load i32, ptr %fd, align 4, !dbg !2082
  store i32 %45, ptr %retval, align 4, !dbg !2083
  br label %return, !dbg !2083

return:                                           ; preds = %if.end72, %if.then50, %if.then35, %if.then30, %if.then22, %if.then14, %if.then3
  %46 = load i32, ptr %retval, align 4, !dbg !2084
  ret i32 %46, !dbg !2084
}

declare void @klee_warning(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @has_permission(i32 noundef %flags, ptr noundef %s) #0 !dbg !2085 {
entry:
  %retval = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %s.addr = alloca ptr, align 8
  %mode = alloca i32, align 4
  %read_request = alloca i32, align 4
  %write_request = alloca i32, align 4
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !2088, metadata !DIExpression()), !dbg !2089
  store ptr %s, ptr %s.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !2090, metadata !DIExpression()), !dbg !2091
  call void @llvm.dbg.declare(metadata ptr %mode, metadata !2092, metadata !DIExpression()), !dbg !2093
  %0 = load ptr, ptr %s.addr, align 8, !dbg !2094
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %0, i32 0, i32 3, !dbg !2095
  %1 = load i32, ptr %st_mode, align 8, !dbg !2095
  store i32 %1, ptr %mode, align 4, !dbg !2093
  call void @llvm.dbg.declare(metadata ptr %read_request, metadata !2096, metadata !DIExpression()), !dbg !2097
  %2 = load i32, ptr %flags.addr, align 4, !dbg !2098
  %and = and i32 %2, 0, !dbg !2099
  %3 = load i32, ptr %flags.addr, align 4, !dbg !2100
  %and1 = and i32 %3, 2, !dbg !2101
  %or = or i32 %and, %and1, !dbg !2102
  %tobool = icmp ne i32 %or, 0, !dbg !2103
  %4 = zext i1 %tobool to i64, !dbg !2103
  %cond = select i1 %tobool, i32 1, i32 0, !dbg !2103
  store i32 %cond, ptr %read_request, align 4, !dbg !2097
  call void @llvm.dbg.declare(metadata ptr %write_request, metadata !2104, metadata !DIExpression()), !dbg !2105
  %5 = load i32, ptr %flags.addr, align 4, !dbg !2106
  %and2 = and i32 %5, 1, !dbg !2107
  %6 = load i32, ptr %flags.addr, align 4, !dbg !2108
  %and3 = and i32 %6, 2, !dbg !2109
  %or4 = or i32 %and2, %and3, !dbg !2110
  %tobool5 = icmp ne i32 %or4, 0, !dbg !2111
  %7 = zext i1 %tobool5 to i64, !dbg !2111
  %cond6 = select i1 %tobool5, i32 1, i32 0, !dbg !2111
  store i32 %cond6, ptr %write_request, align 4, !dbg !2105
  %8 = load i32, ptr %read_request, align 4, !dbg !2112
  %9 = load i32, ptr %mode, align 4, !dbg !2114
  %and7 = and i32 %9, 256, !dbg !2115
  %10 = load i32, ptr %mode, align 4, !dbg !2116
  %and8 = and i32 %10, 32, !dbg !2117
  %or9 = or i32 %and7, %and8, !dbg !2118
  %11 = load i32, ptr %mode, align 4, !dbg !2119
  %and10 = and i32 %11, 4, !dbg !2120
  %or11 = or i32 %or9, %and10, !dbg !2121
  %tobool12 = icmp ne i32 %or11, 0, !dbg !2122
  %lnot = xor i1 %tobool12, true, !dbg !2122
  %lnot.ext = zext i1 %lnot to i32, !dbg !2122
  %and13 = and i32 %8, %lnot.ext, !dbg !2123
  %12 = load i32, ptr %write_request, align 4, !dbg !2124
  %13 = load i32, ptr %mode, align 4, !dbg !2125
  %and14 = and i32 %13, 128, !dbg !2126
  %14 = load i32, ptr %mode, align 4, !dbg !2127
  %and15 = and i32 %14, 16, !dbg !2128
  %or16 = or i32 %and14, %and15, !dbg !2129
  %15 = load i32, ptr %mode, align 4, !dbg !2130
  %and17 = and i32 %15, 2, !dbg !2131
  %or18 = or i32 %or16, %and17, !dbg !2132
  %tobool19 = icmp ne i32 %or18, 0, !dbg !2133
  %lnot20 = xor i1 %tobool19, true, !dbg !2133
  %lnot.ext21 = zext i1 %lnot20 to i32, !dbg !2133
  %and22 = and i32 %12, %lnot.ext21, !dbg !2134
  %or23 = or i32 %and13, %and22, !dbg !2135
  %tobool24 = icmp ne i32 %or23, 0, !dbg !2135
  br i1 %tobool24, label %if.then, label %if.end, !dbg !2136

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4, !dbg !2137
  br label %return, !dbg !2137

if.end:                                           ; preds = %entry
  store i32 1, ptr %retval, align 4, !dbg !2138
  br label %return, !dbg !2138

return:                                           ; preds = %if.end, %if.then
  %16 = load i32, ptr %retval, align 4, !dbg !2139
  ret i32 %16, !dbg !2139
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_openat(i32 noundef %basefd, ptr noundef %pathname, i32 noundef %flags, i32 noundef %mode) #0 !dbg !2140 {
entry:
  %retval = alloca i32, align 4
  %basefd.addr = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %mode.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %fd = alloca i32, align 4
  %bf = alloca ptr, align 8
  %os_fd = alloca i32, align 4
  store i32 %basefd, ptr %basefd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %basefd.addr, metadata !2143, metadata !DIExpression()), !dbg !2144
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !2145, metadata !DIExpression()), !dbg !2146
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !2147, metadata !DIExpression()), !dbg !2148
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !2149, metadata !DIExpression()), !dbg !2150
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2151, metadata !DIExpression()), !dbg !2152
  call void @llvm.dbg.declare(metadata ptr %fd, metadata !2153, metadata !DIExpression()), !dbg !2154
  %0 = load i32, ptr %basefd.addr, align 4, !dbg !2155
  %cmp = icmp ne i32 %0, -100, !dbg !2157
  br i1 %cmp, label %if.then, label %if.end8, !dbg !2158

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %bf, metadata !2159, metadata !DIExpression()), !dbg !2161
  %1 = load i32, ptr %basefd.addr, align 4, !dbg !2162
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2163
  store ptr %call, ptr %bf, align 8, !dbg !2161
  %2 = load ptr, ptr %bf, align 8, !dbg !2164
  %tobool = icmp ne ptr %2, null, !dbg !2164
  br i1 %tobool, label %if.else, label %if.then1, !dbg !2166

if.then1:                                         ; preds = %if.then
  %call2 = call ptr @__errno_location() #17, !dbg !2167
  store i32 9, ptr %call2, align 4, !dbg !2169
  store i32 -1, ptr %retval, align 4, !dbg !2170
  br label %return, !dbg !2170

if.else:                                          ; preds = %if.then
  %3 = load ptr, ptr %bf, align 8, !dbg !2171
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %3, i32 0, i32 3, !dbg !2173
  %4 = load ptr, ptr %dfile, align 8, !dbg !2173
  %tobool3 = icmp ne ptr %4, null, !dbg !2171
  br i1 %tobool3, label %if.then4, label %if.end6, !dbg !2174

if.then4:                                         ; preds = %if.else
  call void @klee_warning(ptr noundef @.str.2.60), !dbg !2175
  %call5 = call ptr @__errno_location() #17, !dbg !2177
  store i32 2, ptr %call5, align 4, !dbg !2178
  store i32 -1, ptr %retval, align 4, !dbg !2179
  br label %return, !dbg !2179

if.end6:                                          ; preds = %if.else
  %5 = load ptr, ptr %bf, align 8, !dbg !2180
  %fd7 = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 0, !dbg !2181
  %6 = load i32, ptr %fd7, align 8, !dbg !2181
  store i32 %6, ptr %basefd.addr, align 4, !dbg !2182
  br label %if.end8, !dbg !2183

if.end8:                                          ; preds = %if.end6, %entry
  %7 = load ptr, ptr %pathname.addr, align 8, !dbg !2184
  %call9 = call ptr @__get_sym_file(ptr noundef %7), !dbg !2186
  %tobool10 = icmp ne ptr %call9, null, !dbg !2186
  br i1 %tobool10, label %if.then11, label %if.end13, !dbg !2187

if.then11:                                        ; preds = %if.end8
  %8 = load ptr, ptr %pathname.addr, align 8, !dbg !2188
  %9 = load i32, ptr %flags.addr, align 4, !dbg !2190
  %10 = load i32, ptr %mode.addr, align 4, !dbg !2191
  %call12 = call i32 @__fd_open(ptr noundef %8, i32 noundef %9, i32 noundef %10), !dbg !2192
  store i32 %call12, ptr %retval, align 4, !dbg !2193
  br label %return, !dbg !2193

if.end13:                                         ; preds = %if.end8
  store i32 0, ptr %fd, align 4, !dbg !2194
  br label %for.cond, !dbg !2196

for.cond:                                         ; preds = %for.inc, %if.end13
  %11 = load i32, ptr %fd, align 4, !dbg !2197
  %cmp14 = icmp slt i32 %11, 32, !dbg !2199
  br i1 %cmp14, label %for.body, label %for.end, !dbg !2200

for.body:                                         ; preds = %for.cond
  %12 = load i32, ptr %fd, align 4, !dbg !2201
  %idxprom = sext i32 %12 to i64, !dbg !2203
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !2203
  %flags15 = getelementptr inbounds %struct.exe_file_t.6, ptr %arrayidx, i32 0, i32 1, !dbg !2204
  %13 = load i32, ptr %flags15, align 4, !dbg !2204
  %and = and i32 %13, 1, !dbg !2205
  %tobool16 = icmp ne i32 %and, 0, !dbg !2205
  br i1 %tobool16, label %for.inc, label %for.end, !dbg !2206

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %fd, align 4, !dbg !2207
  %inc = add nsw i32 %14, 1, !dbg !2207
  store i32 %inc, ptr %fd, align 4, !dbg !2207
  br label %for.cond, !dbg !2208, !llvm.loop !2209

for.end:                                          ; preds = %for.body, %for.cond
  %15 = load i32, ptr %fd, align 4, !dbg !2211
  %cmp19 = icmp eq i32 %15, 32, !dbg !2213
  br i1 %cmp19, label %if.then20, label %if.end22, !dbg !2214

if.then20:                                        ; preds = %for.end
  %call21 = call ptr @__errno_location() #17, !dbg !2215
  store i32 24, ptr %call21, align 4, !dbg !2217
  store i32 -1, ptr %retval, align 4, !dbg !2218
  br label %return, !dbg !2218

if.end22:                                         ; preds = %for.end
  %16 = load i32, ptr %fd, align 4, !dbg !2219
  %idxprom23 = sext i32 %16 to i64, !dbg !2220
  %arrayidx24 = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom23, !dbg !2220
  store ptr %arrayidx24, ptr %f, align 8, !dbg !2221
  %17 = load ptr, ptr %f, align 8, !dbg !2222
  %18 = call ptr @memset(ptr %17, i32 0, i64 24), !dbg !2223
  call void @llvm.dbg.declare(metadata ptr %os_fd, metadata !2224, metadata !DIExpression()), !dbg !2225
  %19 = load i32, ptr %basefd.addr, align 4, !dbg !2226
  %conv = sext i32 %19 to i64, !dbg !2227
  %20 = load ptr, ptr %pathname.addr, align 8, !dbg !2228
  %call25 = call ptr @__concretize_string(ptr noundef %20), !dbg !2229
  %21 = load i32, ptr %flags.addr, align 4, !dbg !2230
  %conv26 = sext i32 %21 to i64, !dbg !2231
  %22 = load i32, ptr %mode.addr, align 4, !dbg !2232
  %call27 = call i64 (i64, ...) @syscall(i64 noundef 257, i64 noundef %conv, ptr noundef %call25, i64 noundef %conv26, i32 noundef %22) #16, !dbg !2233
  %conv28 = trunc i64 %call27 to i32, !dbg !2233
  store i32 %conv28, ptr %os_fd, align 4, !dbg !2225
  %23 = load i32, ptr %os_fd, align 4, !dbg !2234
  %cmp29 = icmp eq i32 %23, -1, !dbg !2236
  br i1 %cmp29, label %if.then31, label %if.end32, !dbg !2237

if.then31:                                        ; preds = %if.end22
  store i32 -1, ptr %retval, align 4, !dbg !2238
  br label %return, !dbg !2238

if.end32:                                         ; preds = %if.end22
  %24 = load i32, ptr %os_fd, align 4, !dbg !2239
  %25 = load ptr, ptr %f, align 8, !dbg !2240
  %fd33 = getelementptr inbounds %struct.exe_file_t.6, ptr %25, i32 0, i32 0, !dbg !2241
  store i32 %24, ptr %fd33, align 8, !dbg !2242
  %26 = load ptr, ptr %f, align 8, !dbg !2243
  %flags34 = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 1, !dbg !2244
  store i32 1, ptr %flags34, align 4, !dbg !2245
  %27 = load i32, ptr %flags.addr, align 4, !dbg !2246
  %and35 = and i32 %27, 3, !dbg !2248
  %cmp36 = icmp eq i32 %and35, 0, !dbg !2249
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2250

if.then38:                                        ; preds = %if.end32
  %28 = load ptr, ptr %f, align 8, !dbg !2251
  %flags39 = getelementptr inbounds %struct.exe_file_t.6, ptr %28, i32 0, i32 1, !dbg !2253
  %29 = load i32, ptr %flags39, align 4, !dbg !2254
  %or = or i32 %29, 4, !dbg !2254
  store i32 %or, ptr %flags39, align 4, !dbg !2254
  br label %if.end51, !dbg !2255

if.else40:                                        ; preds = %if.end32
  %30 = load i32, ptr %flags.addr, align 4, !dbg !2256
  %and41 = and i32 %30, 3, !dbg !2258
  %cmp42 = icmp eq i32 %and41, 1, !dbg !2259
  br i1 %cmp42, label %if.then44, label %if.else47, !dbg !2260

if.then44:                                        ; preds = %if.else40
  %31 = load ptr, ptr %f, align 8, !dbg !2261
  %flags45 = getelementptr inbounds %struct.exe_file_t.6, ptr %31, i32 0, i32 1, !dbg !2263
  %32 = load i32, ptr %flags45, align 4, !dbg !2264
  %or46 = or i32 %32, 8, !dbg !2264
  store i32 %or46, ptr %flags45, align 4, !dbg !2264
  br label %if.end51, !dbg !2265

if.else47:                                        ; preds = %if.else40
  %33 = load ptr, ptr %f, align 8, !dbg !2266
  %flags48 = getelementptr inbounds %struct.exe_file_t.6, ptr %33, i32 0, i32 1, !dbg !2268
  %34 = load i32, ptr %flags48, align 4, !dbg !2269
  %or49 = or i32 %34, 12, !dbg !2269
  store i32 %or49, ptr %flags48, align 4, !dbg !2269
  br label %if.end51

if.end51:                                         ; preds = %if.then44, %if.else47, %if.then38
  %35 = load i32, ptr %fd, align 4, !dbg !2270
  store i32 %35, ptr %retval, align 4, !dbg !2271
  br label %return, !dbg !2271

return:                                           ; preds = %if.end51, %if.then31, %if.then20, %if.then11, %if.then4, %if.then1
  %36 = load i32, ptr %retval, align 4, !dbg !2272
  ret i32 %36, !dbg !2272
}

; Function Attrs: noinline nounwind uwtable
define internal ptr @__get_file(i32 noundef %fd) #0 !dbg !2273 {
entry:
  %retval = alloca ptr, align 8
  %fd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2276, metadata !DIExpression()), !dbg !2277
  %0 = load i32, ptr %fd.addr, align 4, !dbg !2278
  %cmp = icmp sge i32 %0, 0, !dbg !2280
  %1 = load i32, ptr %fd.addr, align 4
  %cmp1 = icmp slt i32 %1, 32
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2281
  br i1 %or.cond, label %if.then, label %if.end3, !dbg !2281

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2282, metadata !DIExpression()), !dbg !2284
  %2 = load i32, ptr %fd.addr, align 4, !dbg !2285
  %idxprom = sext i32 %2 to i64, !dbg !2286
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !2286
  store ptr %arrayidx, ptr %f, align 8, !dbg !2284
  %3 = load ptr, ptr %f, align 8, !dbg !2287
  %flags = getelementptr inbounds %struct.exe_file_t.6, ptr %3, i32 0, i32 1, !dbg !2289
  %4 = load i32, ptr %flags, align 4, !dbg !2289
  %and = and i32 %4, 1, !dbg !2290
  %tobool = icmp ne i32 %and, 0, !dbg !2290
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !2291

if.then2:                                         ; preds = %if.then
  %5 = load ptr, ptr %f, align 8, !dbg !2292
  store ptr %5, ptr %retval, align 8, !dbg !2293
  br label %return, !dbg !2293

if.end3:                                          ; preds = %if.then, %entry
  store ptr null, ptr %retval, align 8, !dbg !2294
  br label %return, !dbg !2294

return:                                           ; preds = %if.end3, %if.then2
  %6 = load ptr, ptr %retval, align 8, !dbg !2295
  ret ptr %6, !dbg !2295
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @utimes(ptr noundef nonnull %path, ptr noundef %times) #0 !dbg !2296 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %times.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  %newTimes = alloca [2 x %struct.timespec.8], align 16
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2307, metadata !DIExpression()), !dbg !2308
  store ptr %times, ptr %times.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %times.addr, metadata !2309, metadata !DIExpression()), !dbg !2310
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !2311, metadata !DIExpression()), !dbg !2312
  %0 = load ptr, ptr %path.addr, align 8, !dbg !2313
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !2314
  store ptr %call, ptr %dfile, align 8, !dbg !2312
  %1 = load ptr, ptr %dfile, align 8, !dbg !2315
  %tobool = icmp ne ptr %1, null, !dbg !2315
  br i1 %tobool, label %if.then, label %if.end12, !dbg !2317

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %times.addr, align 8, !dbg !2318
  %tobool1 = icmp ne ptr %2, null, !dbg !2318
  br i1 %tobool1, label %if.end, label %if.then2, !dbg !2321

if.then2:                                         ; preds = %if.then
  call void @llvm.dbg.declare(metadata ptr %newTimes, metadata !2322, metadata !DIExpression()), !dbg !2325
  %arrayidx = getelementptr inbounds [2 x %struct.timespec.8], ptr %newTimes, i64 0, i64 0, !dbg !2326
  %call3 = call i32 @gettimeofday(ptr noundef %arrayidx, ptr noundef null) #16, !dbg !2327
  %arrayidx4 = getelementptr inbounds [2 x %struct.timespec.8], ptr %newTimes, i64 0, i64 1, !dbg !2328
  %arrayidx5 = getelementptr inbounds [2 x %struct.timespec.8], ptr %newTimes, i64 0, i64 0, !dbg !2329
  %3 = call ptr @memcpy(ptr %arrayidx4, ptr %arrayidx5, i64 16), !dbg !2329
  %arraydecay = getelementptr inbounds [2 x %struct.timespec.8], ptr %newTimes, i64 0, i64 0, !dbg !2330
  store ptr %arraydecay, ptr %times.addr, align 8, !dbg !2331
  br label %if.end, !dbg !2332

if.end:                                           ; preds = %if.then2, %if.then
  %4 = load ptr, ptr %times.addr, align 8, !dbg !2333
  %arrayidx6 = getelementptr inbounds %struct.timespec.8, ptr %4, i64 0, !dbg !2333
  %tv_sec = getelementptr inbounds %struct.timespec.8, ptr %arrayidx6, i32 0, i32 0, !dbg !2334
  %5 = load i64, ptr %tv_sec, align 8, !dbg !2334
  %6 = load ptr, ptr %dfile, align 8, !dbg !2335
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %6, i32 0, i32 2, !dbg !2336
  %7 = load ptr, ptr %stat, align 8, !dbg !2336
  %st_atim = getelementptr inbounds %struct.stat64.9, ptr %7, i32 0, i32 11, !dbg !2337
  %tv_sec7 = getelementptr inbounds %struct.timespec.8, ptr %st_atim, i32 0, i32 0, !dbg !2337
  store i64 %5, ptr %tv_sec7, align 8, !dbg !2338
  %8 = load ptr, ptr %times.addr, align 8, !dbg !2339
  %arrayidx8 = getelementptr inbounds %struct.timespec.8, ptr %8, i64 1, !dbg !2339
  %tv_sec9 = getelementptr inbounds %struct.timespec.8, ptr %arrayidx8, i32 0, i32 0, !dbg !2340
  %9 = load i64, ptr %tv_sec9, align 8, !dbg !2340
  %10 = load ptr, ptr %dfile, align 8, !dbg !2341
  %stat10 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %10, i32 0, i32 2, !dbg !2342
  %11 = load ptr, ptr %stat10, align 8, !dbg !2342
  %st_mtim = getelementptr inbounds %struct.stat64.9, ptr %11, i32 0, i32 12, !dbg !2343
  %tv_sec11 = getelementptr inbounds %struct.timespec.8, ptr %st_mtim, i32 0, i32 0, !dbg !2343
  store i64 %9, ptr %tv_sec11, align 8, !dbg !2344
  store i32 0, ptr %retval, align 4, !dbg !2345
  br label %return, !dbg !2345

if.end12:                                         ; preds = %entry
  %12 = load ptr, ptr %path.addr, align 8, !dbg !2346
  %call13 = call ptr @__concretize_string(ptr noundef %12), !dbg !2347
  %13 = load ptr, ptr %times.addr, align 8, !dbg !2348
  %call14 = call i64 (i64, ...) @syscall(i64 noundef 235, ptr noundef %call13, ptr noundef %13) #16, !dbg !2349
  %conv = trunc i64 %call14 to i32, !dbg !2349
  store i32 %conv, ptr %retval, align 4, !dbg !2350
  br label %return, !dbg !2350

return:                                           ; preds = %if.end12, %if.end
  %14 = load i32, ptr %retval, align 4, !dbg !2351
  ret i32 %14, !dbg !2351
}

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #9

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @futimesat(i32 noundef %fd, ptr noundef %path, ptr noundef %times) #0 !dbg !2352 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %times.addr = alloca ptr, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2355, metadata !DIExpression()), !dbg !2356
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2357, metadata !DIExpression()), !dbg !2358
  store ptr %times, ptr %times.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %times.addr, metadata !2359, metadata !DIExpression()), !dbg !2360
  %0 = load i32, ptr %fd.addr, align 4, !dbg !2361
  %cmp = icmp ne i32 %0, -100, !dbg !2363
  br i1 %cmp, label %if.then, label %if.end8, !dbg !2364

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2365, metadata !DIExpression()), !dbg !2367
  %1 = load i32, ptr %fd.addr, align 4, !dbg !2368
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2369
  store ptr %call, ptr %f, align 8, !dbg !2367
  %2 = load ptr, ptr %f, align 8, !dbg !2370
  %tobool = icmp ne ptr %2, null, !dbg !2370
  br i1 %tobool, label %if.else, label %if.then1, !dbg !2372

if.then1:                                         ; preds = %if.then
  %call2 = call ptr @__errno_location() #17, !dbg !2373
  store i32 9, ptr %call2, align 4, !dbg !2375
  store i32 -1, ptr %retval, align 4, !dbg !2376
  br label %return, !dbg !2376

if.else:                                          ; preds = %if.then
  %3 = load ptr, ptr %f, align 8, !dbg !2377
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %3, i32 0, i32 3, !dbg !2379
  %4 = load ptr, ptr %dfile, align 8, !dbg !2379
  %tobool3 = icmp ne ptr %4, null, !dbg !2377
  br i1 %tobool3, label %if.then4, label %if.end6, !dbg !2380

if.then4:                                         ; preds = %if.else
  call void @klee_warning(ptr noundef @.str.2.60), !dbg !2381
  %call5 = call ptr @__errno_location() #17, !dbg !2383
  store i32 2, ptr %call5, align 4, !dbg !2384
  store i32 -1, ptr %retval, align 4, !dbg !2385
  br label %return, !dbg !2385

if.end6:                                          ; preds = %if.else
  %5 = load ptr, ptr %f, align 8, !dbg !2386
  %fd7 = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 0, !dbg !2387
  %6 = load i32, ptr %fd7, align 8, !dbg !2387
  store i32 %6, ptr %fd.addr, align 4, !dbg !2388
  br label %if.end8, !dbg !2389

if.end8:                                          ; preds = %if.end6, %entry
  %7 = load ptr, ptr %path.addr, align 8, !dbg !2390
  %call9 = call ptr @__get_sym_file(ptr noundef %7), !dbg !2392
  %tobool10 = icmp ne ptr %call9, null, !dbg !2392
  br i1 %tobool10, label %if.then11, label %if.end13, !dbg !2393

if.then11:                                        ; preds = %if.end8
  %8 = load ptr, ptr %path.addr, align 8, !dbg !2394
  %9 = load ptr, ptr %times.addr, align 8, !dbg !2396
  %call12 = call i32 @utimes(ptr noundef %8, ptr noundef %9) #16, !dbg !2397
  store i32 %call12, ptr %retval, align 4, !dbg !2398
  br label %return, !dbg !2398

if.end13:                                         ; preds = %if.end8
  %10 = load i32, ptr %fd.addr, align 4, !dbg !2399
  %conv = sext i32 %10 to i64, !dbg !2400
  %11 = load ptr, ptr %path.addr, align 8, !dbg !2401
  %tobool14 = icmp ne ptr %11, null, !dbg !2401
  br i1 %tobool14, label %cond.true, label %cond.end, !dbg !2401

cond.true:                                        ; preds = %if.end13
  %12 = load ptr, ptr %path.addr, align 8, !dbg !2402
  %call15 = call ptr @__concretize_string(ptr noundef %12), !dbg !2403
  br label %cond.end, !dbg !2401

cond.end:                                         ; preds = %if.end13, %cond.true
  %cond = phi ptr [ %call15, %cond.true ], [ null, %if.end13 ], !dbg !2401
  %13 = load ptr, ptr %times.addr, align 8, !dbg !2404
  %call16 = call i64 (i64, ...) @syscall(i64 noundef 261, i64 noundef %conv, ptr noundef %cond, ptr noundef %13) #16, !dbg !2405
  %conv17 = trunc i64 %call16 to i32, !dbg !2405
  store i32 %conv17, ptr %retval, align 4, !dbg !2406
  br label %return, !dbg !2406

return:                                           ; preds = %cond.end, %if.then11, %if.then4, %if.then1
  %14 = load i32, ptr %retval, align 4, !dbg !2407
  ret i32 %14, !dbg !2407
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @close(i32 noundef %fd) #0 !dbg !311 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %r = alloca i32, align 4
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2408, metadata !DIExpression()), !dbg !2409
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2410, metadata !DIExpression()), !dbg !2411
  call void @llvm.dbg.declare(metadata ptr %r, metadata !2412, metadata !DIExpression()), !dbg !2413
  store i32 0, ptr %r, align 4, !dbg !2413
  %0 = load i32, ptr @close.n_calls, align 4, !dbg !2414
  %inc = add nsw i32 %0, 1, !dbg !2414
  store i32 %inc, ptr @close.n_calls, align 4, !dbg !2414
  %1 = load i32, ptr %fd.addr, align 4, !dbg !2415
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2416
  store ptr %call, ptr %f, align 8, !dbg !2417
  %2 = load ptr, ptr %f, align 8, !dbg !2418
  %tobool = icmp ne ptr %2, null, !dbg !2418
  br i1 %tobool, label %if.end, label %if.then, !dbg !2420

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !2421
  store i32 9, ptr %call1, align 4, !dbg !2423
  store i32 -1, ptr %retval, align 4, !dbg !2424
  br label %return, !dbg !2424

if.end:                                           ; preds = %entry
  %3 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2425
  %tobool2 = icmp ne i32 %3, 0, !dbg !2427
  br i1 %tobool2, label %land.lhs.true, label %if.end5, !dbg !2428

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 8), align 8, !dbg !2429
  %5 = load i32, ptr %4, align 4, !dbg !2430
  %6 = load i32, ptr @close.n_calls, align 4, !dbg !2431
  %cmp = icmp eq i32 %5, %6, !dbg !2432
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !2433

if.then3:                                         ; preds = %land.lhs.true
  %7 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2434
  %dec = add i32 %7, -1, !dbg !2434
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2434
  %call4 = call ptr @__errno_location() #17, !dbg !2436
  store i32 5, ptr %call4, align 4, !dbg !2437
  store i32 -1, ptr %retval, align 4, !dbg !2438
  br label %return, !dbg !2438

if.end5:                                          ; preds = %land.lhs.true, %if.end
  %8 = load ptr, ptr %f, align 8, !dbg !2439
  %9 = call ptr @memset(ptr %8, i32 0, i64 24), !dbg !2440
  %10 = load i32, ptr %r, align 4, !dbg !2441
  store i32 %10, ptr %retval, align 4, !dbg !2442
  br label %return, !dbg !2442

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %11 = load i32, ptr %retval, align 4, !dbg !2443
  ret i32 %11, !dbg !2443
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @read(i32 noundef %fd, ptr noundef %buf, i64 noundef %count) #0 !dbg !378 {
entry:
  %retval = alloca i64, align 8
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %count.addr = alloca i64, align 8
  %f = alloca ptr, align 8
  %r = alloca i32, align 4
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2444, metadata !DIExpression()), !dbg !2445
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2446, metadata !DIExpression()), !dbg !2447
  store i64 %count, ptr %count.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !2448, metadata !DIExpression()), !dbg !2449
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2450, metadata !DIExpression()), !dbg !2451
  %0 = load i32, ptr @read.n_calls, align 4, !dbg !2452
  %inc = add nsw i32 %0, 1, !dbg !2452
  store i32 %inc, ptr @read.n_calls, align 4, !dbg !2452
  %1 = load i64, ptr %count.addr, align 8, !dbg !2453
  %cmp = icmp eq i64 %1, 0, !dbg !2455
  br i1 %cmp, label %if.then, label %if.end, !dbg !2456

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8, !dbg !2457
  br label %return, !dbg !2457

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %buf.addr, align 8, !dbg !2458
  %cmp1 = icmp eq ptr %2, null, !dbg !2460
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !2461

if.then2:                                         ; preds = %if.end
  %call = call ptr @__errno_location() #17, !dbg !2462
  store i32 14, ptr %call, align 4, !dbg !2464
  store i64 -1, ptr %retval, align 8, !dbg !2465
  br label %return, !dbg !2465

if.end3:                                          ; preds = %if.end
  %3 = load i32, ptr %fd.addr, align 4, !dbg !2466
  %call4 = call ptr @__get_file(i32 noundef %3), !dbg !2467
  store ptr %call4, ptr %f, align 8, !dbg !2468
  %4 = load ptr, ptr %f, align 8, !dbg !2469
  %tobool = icmp ne ptr %4, null, !dbg !2469
  br i1 %tobool, label %if.end7, label %if.then5, !dbg !2471

if.then5:                                         ; preds = %if.end3
  %call6 = call ptr @__errno_location() #17, !dbg !2472
  store i32 9, ptr %call6, align 4, !dbg !2474
  store i64 -1, ptr %retval, align 8, !dbg !2475
  br label %return, !dbg !2475

if.end7:                                          ; preds = %if.end3
  %5 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2476
  %tobool8 = icmp ne i32 %5, 0, !dbg !2478
  br i1 %tobool8, label %land.lhs.true, label %if.end12, !dbg !2479

land.lhs.true:                                    ; preds = %if.end7
  %6 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 6), align 8, !dbg !2480
  %7 = load i32, ptr %6, align 4, !dbg !2481
  %8 = load i32, ptr @read.n_calls, align 4, !dbg !2482
  %cmp9 = icmp eq i32 %7, %8, !dbg !2483
  br i1 %cmp9, label %if.then10, label %if.end12, !dbg !2484

if.then10:                                        ; preds = %land.lhs.true
  %9 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2485
  %dec = add i32 %9, -1, !dbg !2485
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2485
  %call11 = call ptr @__errno_location() #17, !dbg !2487
  store i32 5, ptr %call11, align 4, !dbg !2488
  store i64 -1, ptr %retval, align 8, !dbg !2489
  br label %return, !dbg !2489

if.end12:                                         ; preds = %land.lhs.true, %if.end7
  %10 = load ptr, ptr %f, align 8, !dbg !2490
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %10, i32 0, i32 3, !dbg !2492
  %11 = load ptr, ptr %dfile, align 8, !dbg !2492
  %tobool13 = icmp ne ptr %11, null, !dbg !2490
  br i1 %tobool13, label %if.else38, label %if.then14, !dbg !2493

if.then14:                                        ; preds = %if.end12
  call void @llvm.dbg.declare(metadata ptr %r, metadata !2494, metadata !DIExpression()), !dbg !2496
  %12 = load ptr, ptr %buf.addr, align 8, !dbg !2497
  %call15 = call ptr @__concretize_ptr(ptr noundef %12), !dbg !2498
  store ptr %call15, ptr %buf.addr, align 8, !dbg !2499
  %13 = load i64, ptr %count.addr, align 8, !dbg !2500
  %call16 = call i64 @__concretize_size(i64 noundef %13), !dbg !2501
  store i64 %call16, ptr %count.addr, align 8, !dbg !2502
  %14 = load ptr, ptr %buf.addr, align 8, !dbg !2503
  %15 = load i64, ptr %count.addr, align 8, !dbg !2504
  call void @klee_check_memory_access(ptr noundef %14, i64 noundef %15), !dbg !2505
  %16 = load ptr, ptr %f, align 8, !dbg !2506
  %fd17 = getelementptr inbounds %struct.exe_file_t.6, ptr %16, i32 0, i32 0, !dbg !2508
  %17 = load i32, ptr %fd17, align 8, !dbg !2508
  %cmp18 = icmp eq i32 %17, 0, !dbg !2509
  br i1 %cmp18, label %if.then19, label %if.else, !dbg !2510

if.then19:                                        ; preds = %if.then14
  %18 = load ptr, ptr %f, align 8, !dbg !2511
  %fd20 = getelementptr inbounds %struct.exe_file_t.6, ptr %18, i32 0, i32 0, !dbg !2512
  %19 = load i32, ptr %fd20, align 8, !dbg !2512
  %20 = load ptr, ptr %buf.addr, align 8, !dbg !2513
  %21 = load i64, ptr %count.addr, align 8, !dbg !2514
  %call21 = call i64 (i64, ...) @syscall(i64 noundef 0, i32 noundef %19, ptr noundef %20, i64 noundef %21) #16, !dbg !2515
  %conv = trunc i64 %call21 to i32, !dbg !2515
  store i32 %conv, ptr %r, align 4, !dbg !2516
  br label %if.end25, !dbg !2517

if.else:                                          ; preds = %if.then14
  %22 = load ptr, ptr %f, align 8, !dbg !2518
  %fd22 = getelementptr inbounds %struct.exe_file_t.6, ptr %22, i32 0, i32 0, !dbg !2519
  %23 = load i32, ptr %fd22, align 8, !dbg !2519
  %24 = load ptr, ptr %buf.addr, align 8, !dbg !2520
  %25 = load i64, ptr %count.addr, align 8, !dbg !2521
  %26 = load ptr, ptr %f, align 8, !dbg !2522
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 2, !dbg !2523
  %27 = load i64, ptr %off, align 8, !dbg !2523
  %call23 = call i64 (i64, ...) @syscall(i64 noundef 17, i32 noundef %23, ptr noundef %24, i64 noundef %25, i64 noundef %27) #16, !dbg !2524
  %conv24 = trunc i64 %call23 to i32, !dbg !2524
  store i32 %conv24, ptr %r, align 4, !dbg !2525
  br label %if.end25

if.end25:                                         ; preds = %if.else, %if.then19
  %28 = load i32, ptr %r, align 4, !dbg !2526
  %cmp26 = icmp eq i32 %28, -1, !dbg !2528
  br i1 %cmp26, label %if.then28, label %if.end29, !dbg !2529

if.then28:                                        ; preds = %if.end25
  store i64 -1, ptr %retval, align 8, !dbg !2530
  br label %return, !dbg !2530

if.end29:                                         ; preds = %if.end25
  %29 = load ptr, ptr %f, align 8, !dbg !2531
  %fd30 = getelementptr inbounds %struct.exe_file_t.6, ptr %29, i32 0, i32 0, !dbg !2533
  %30 = load i32, ptr %fd30, align 8, !dbg !2533
  %cmp31 = icmp ne i32 %30, 0, !dbg !2534
  br i1 %cmp31, label %if.then33, label %if.end36, !dbg !2535

if.then33:                                        ; preds = %if.end29
  %31 = load i32, ptr %r, align 4, !dbg !2536
  %conv34 = sext i32 %31 to i64, !dbg !2536
  %32 = load ptr, ptr %f, align 8, !dbg !2537
  %off35 = getelementptr inbounds %struct.exe_file_t.6, ptr %32, i32 0, i32 2, !dbg !2538
  %33 = load i64, ptr %off35, align 8, !dbg !2539
  %add = add nsw i64 %33, %conv34, !dbg !2539
  store i64 %add, ptr %off35, align 8, !dbg !2539
  br label %if.end36, !dbg !2537

if.end36:                                         ; preds = %if.then33, %if.end29
  %34 = load i32, ptr %r, align 4, !dbg !2540
  %conv37 = sext i32 %34 to i64, !dbg !2540
  store i64 %conv37, ptr %retval, align 8, !dbg !2541
  br label %return, !dbg !2541

if.else38:                                        ; preds = %if.end12
  %35 = load ptr, ptr %f, align 8, !dbg !2542
  %off39 = getelementptr inbounds %struct.exe_file_t.6, ptr %35, i32 0, i32 2, !dbg !2542
  %36 = load i64, ptr %off39, align 8, !dbg !2542
  %cmp40 = icmp sge i64 %36, 0, !dbg !2542
  br i1 %cmp40, label %if.end44, label %if.else43, !dbg !2546

if.else43:                                        ; preds = %if.else38
  call void @__assert_fail(ptr noundef @.str.3.63, ptr noundef @.str.4.64, i32 noundef 379, ptr noundef @__PRETTY_FUNCTION__.read) #15, !dbg !2542
  unreachable, !dbg !2542

if.end44:                                         ; preds = %if.else38
  %37 = load ptr, ptr %f, align 8, !dbg !2547
  %dfile45 = getelementptr inbounds %struct.exe_file_t.6, ptr %37, i32 0, i32 3, !dbg !2549
  %38 = load ptr, ptr %dfile45, align 8, !dbg !2549
  %size = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %38, i32 0, i32 0, !dbg !2550
  %39 = load i32, ptr %size, align 8, !dbg !2550
  %conv46 = zext i32 %39 to i64, !dbg !2551
  %40 = load ptr, ptr %f, align 8, !dbg !2552
  %off47 = getelementptr inbounds %struct.exe_file_t.6, ptr %40, i32 0, i32 2, !dbg !2553
  %41 = load i64, ptr %off47, align 8, !dbg !2553
  %cmp48 = icmp slt i64 %conv46, %41, !dbg !2554
  br i1 %cmp48, label %if.then50, label %if.end51, !dbg !2555

if.then50:                                        ; preds = %if.end44
  store i64 0, ptr %retval, align 8, !dbg !2556
  br label %return, !dbg !2556

if.end51:                                         ; preds = %if.end44
  %42 = load ptr, ptr %f, align 8, !dbg !2557
  %off52 = getelementptr inbounds %struct.exe_file_t.6, ptr %42, i32 0, i32 2, !dbg !2559
  %43 = load i64, ptr %off52, align 8, !dbg !2559
  %44 = load i64, ptr %count.addr, align 8, !dbg !2560
  %add53 = add i64 %43, %44, !dbg !2561
  %45 = load ptr, ptr %f, align 8, !dbg !2562
  %dfile54 = getelementptr inbounds %struct.exe_file_t.6, ptr %45, i32 0, i32 3, !dbg !2563
  %46 = load ptr, ptr %dfile54, align 8, !dbg !2563
  %size55 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %46, i32 0, i32 0, !dbg !2564
  %47 = load i32, ptr %size55, align 8, !dbg !2564
  %conv56 = zext i32 %47 to i64, !dbg !2562
  %cmp57 = icmp ugt i64 %add53, %conv56, !dbg !2565
  br i1 %cmp57, label %if.then59, label %if.end64, !dbg !2566

if.then59:                                        ; preds = %if.end51
  %48 = load ptr, ptr %f, align 8, !dbg !2567
  %dfile60 = getelementptr inbounds %struct.exe_file_t.6, ptr %48, i32 0, i32 3, !dbg !2569
  %49 = load ptr, ptr %dfile60, align 8, !dbg !2569
  %size61 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %49, i32 0, i32 0, !dbg !2570
  %50 = load i32, ptr %size61, align 8, !dbg !2570
  %conv62 = zext i32 %50 to i64, !dbg !2567
  %51 = load ptr, ptr %f, align 8, !dbg !2571
  %off63 = getelementptr inbounds %struct.exe_file_t.6, ptr %51, i32 0, i32 2, !dbg !2572
  %52 = load i64, ptr %off63, align 8, !dbg !2572
  %sub = sub nsw i64 %conv62, %52, !dbg !2573
  store i64 %sub, ptr %count.addr, align 8, !dbg !2574
  br label %if.end64, !dbg !2575

if.end64:                                         ; preds = %if.then59, %if.end51
  %53 = load ptr, ptr %buf.addr, align 8, !dbg !2576
  %54 = load ptr, ptr %f, align 8, !dbg !2577
  %dfile65 = getelementptr inbounds %struct.exe_file_t.6, ptr %54, i32 0, i32 3, !dbg !2578
  %55 = load ptr, ptr %dfile65, align 8, !dbg !2578
  %contents = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %55, i32 0, i32 1, !dbg !2579
  %56 = load ptr, ptr %contents, align 8, !dbg !2579
  %57 = load ptr, ptr %f, align 8, !dbg !2580
  %off66 = getelementptr inbounds %struct.exe_file_t.6, ptr %57, i32 0, i32 2, !dbg !2581
  %58 = load i64, ptr %off66, align 8, !dbg !2581
  %add.ptr = getelementptr inbounds i8, ptr %56, i64 %58, !dbg !2582
  %59 = load i64, ptr %count.addr, align 8, !dbg !2583
  %60 = call ptr @memcpy(ptr %53, ptr %add.ptr, i64 %59), !dbg !2584
  %61 = load i64, ptr %count.addr, align 8, !dbg !2585
  %62 = load ptr, ptr %f, align 8, !dbg !2586
  %off67 = getelementptr inbounds %struct.exe_file_t.6, ptr %62, i32 0, i32 2, !dbg !2587
  %63 = load i64, ptr %off67, align 8, !dbg !2588
  %add68 = add i64 %63, %61, !dbg !2588
  store i64 %add68, ptr %off67, align 8, !dbg !2588
  %64 = load i64, ptr %count.addr, align 8, !dbg !2589
  store i64 %64, ptr %retval, align 8, !dbg !2590
  br label %return, !dbg !2590

return:                                           ; preds = %if.end64, %if.then50, %if.end36, %if.then28, %if.then10, %if.then5, %if.then2, %if.then
  %65 = load i64, ptr %retval, align 8, !dbg !2591
  ret i64 %65, !dbg !2591
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @write(i32 noundef %fd, ptr noundef %buf, i64 noundef %count) #0 !dbg !400 {
entry:
  %retval = alloca i64, align 8
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %count.addr = alloca i64, align 8
  %f = alloca ptr, align 8
  %r = alloca i32, align 4
  %actual_count = alloca i64, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2592, metadata !DIExpression()), !dbg !2593
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2594, metadata !DIExpression()), !dbg !2595
  store i64 %count, ptr %count.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !2596, metadata !DIExpression()), !dbg !2597
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2598, metadata !DIExpression()), !dbg !2599
  %0 = load i32, ptr @write.n_calls, align 4, !dbg !2600
  %inc = add nsw i32 %0, 1, !dbg !2600
  store i32 %inc, ptr @write.n_calls, align 4, !dbg !2600
  %1 = load i32, ptr %fd.addr, align 4, !dbg !2601
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2602
  store ptr %call, ptr %f, align 8, !dbg !2603
  %2 = load ptr, ptr %f, align 8, !dbg !2604
  %tobool = icmp ne ptr %2, null, !dbg !2604
  br i1 %tobool, label %if.end, label %if.then, !dbg !2606

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !2607
  store i32 9, ptr %call1, align 4, !dbg !2609
  store i64 -1, ptr %retval, align 8, !dbg !2610
  br label %return, !dbg !2610

if.end:                                           ; preds = %entry
  %3 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2611
  %tobool2 = icmp ne i32 %3, 0, !dbg !2613
  br i1 %tobool2, label %land.lhs.true, label %if.end5, !dbg !2614

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 7), align 8, !dbg !2615
  %5 = load i32, ptr %4, align 4, !dbg !2616
  %6 = load i32, ptr @write.n_calls, align 4, !dbg !2617
  %cmp = icmp eq i32 %5, %6, !dbg !2618
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !2619

if.then3:                                         ; preds = %land.lhs.true
  %7 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2620
  %dec = add i32 %7, -1, !dbg !2620
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2620
  %call4 = call ptr @__errno_location() #17, !dbg !2622
  store i32 5, ptr %call4, align 4, !dbg !2623
  store i64 -1, ptr %retval, align 8, !dbg !2624
  br label %return, !dbg !2624

if.end5:                                          ; preds = %land.lhs.true, %if.end
  %8 = load ptr, ptr %f, align 8, !dbg !2625
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !2627
  %9 = load ptr, ptr %dfile, align 8, !dbg !2627
  %tobool6 = icmp ne ptr %9, null, !dbg !2625
  br i1 %tobool6, label %if.else42, label %if.then7, !dbg !2628

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata ptr %r, metadata !2629, metadata !DIExpression()), !dbg !2631
  %10 = load ptr, ptr %buf.addr, align 8, !dbg !2632
  %call8 = call ptr @__concretize_ptr(ptr noundef %10), !dbg !2633
  store ptr %call8, ptr %buf.addr, align 8, !dbg !2634
  %11 = load i64, ptr %count.addr, align 8, !dbg !2635
  %call9 = call i64 @__concretize_size(i64 noundef %11), !dbg !2636
  store i64 %call9, ptr %count.addr, align 8, !dbg !2637
  %12 = load ptr, ptr %buf.addr, align 8, !dbg !2638
  %13 = load i64, ptr %count.addr, align 8, !dbg !2639
  call void @klee_check_memory_access(ptr noundef %12, i64 noundef %13), !dbg !2640
  %14 = load ptr, ptr %f, align 8, !dbg !2641
  %fd10 = getelementptr inbounds %struct.exe_file_t.6, ptr %14, i32 0, i32 0, !dbg !2643
  %15 = load i32, ptr %fd10, align 8, !dbg !2643
  %cmp11 = icmp eq i32 %15, 1, !dbg !2644
  br i1 %cmp11, label %if.then14, label %lor.lhs.false, !dbg !2645

lor.lhs.false:                                    ; preds = %if.then7
  %16 = load ptr, ptr %f, align 8, !dbg !2646
  %fd12 = getelementptr inbounds %struct.exe_file_t.6, ptr %16, i32 0, i32 0, !dbg !2647
  %17 = load i32, ptr %fd12, align 8, !dbg !2647
  %cmp13 = icmp eq i32 %17, 2, !dbg !2648
  br i1 %cmp13, label %if.then14, label %if.else, !dbg !2649

if.then14:                                        ; preds = %lor.lhs.false, %if.then7
  %18 = load ptr, ptr %f, align 8, !dbg !2650
  %fd15 = getelementptr inbounds %struct.exe_file_t.6, ptr %18, i32 0, i32 0, !dbg !2651
  %19 = load i32, ptr %fd15, align 8, !dbg !2651
  %20 = load ptr, ptr %buf.addr, align 8, !dbg !2652
  %21 = load i64, ptr %count.addr, align 8, !dbg !2653
  %call16 = call i64 (i64, ...) @syscall(i64 noundef 1, i32 noundef %19, ptr noundef %20, i64 noundef %21) #16, !dbg !2654
  %conv = trunc i64 %call16 to i32, !dbg !2654
  store i32 %conv, ptr %r, align 4, !dbg !2655
  br label %if.end20, !dbg !2656

if.else:                                          ; preds = %lor.lhs.false
  %22 = load ptr, ptr %f, align 8, !dbg !2657
  %fd17 = getelementptr inbounds %struct.exe_file_t.6, ptr %22, i32 0, i32 0, !dbg !2658
  %23 = load i32, ptr %fd17, align 8, !dbg !2658
  %24 = load ptr, ptr %buf.addr, align 8, !dbg !2659
  %25 = load i64, ptr %count.addr, align 8, !dbg !2660
  %26 = load ptr, ptr %f, align 8, !dbg !2661
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 2, !dbg !2662
  %27 = load i64, ptr %off, align 8, !dbg !2662
  %call18 = call i64 (i64, ...) @syscall(i64 noundef 18, i32 noundef %23, ptr noundef %24, i64 noundef %25, i64 noundef %27) #16, !dbg !2663
  %conv19 = trunc i64 %call18 to i32, !dbg !2663
  store i32 %conv19, ptr %r, align 4, !dbg !2664
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then14
  %28 = load i32, ptr %r, align 4, !dbg !2665
  %cmp21 = icmp eq i32 %28, -1, !dbg !2667
  br i1 %cmp21, label %if.then23, label %if.end24, !dbg !2668

if.then23:                                        ; preds = %if.end20
  store i64 -1, ptr %retval, align 8, !dbg !2669
  br label %return, !dbg !2669

if.end24:                                         ; preds = %if.end20
  %29 = load i32, ptr %r, align 4, !dbg !2670
  %cmp25 = icmp sge i32 %29, 0, !dbg !2670
  br i1 %cmp25, label %if.end29, label %if.else28, !dbg !2673

if.else28:                                        ; preds = %if.end24
  call void @__assert_fail(ptr noundef @.str.5.65, ptr noundef @.str.4.64, i32 noundef 431, ptr noundef @__PRETTY_FUNCTION__.write) #15, !dbg !2670
  unreachable, !dbg !2670

if.end29:                                         ; preds = %if.end24
  %30 = load ptr, ptr %f, align 8, !dbg !2674
  %fd30 = getelementptr inbounds %struct.exe_file_t.6, ptr %30, i32 0, i32 0, !dbg !2676
  %31 = load i32, ptr %fd30, align 8, !dbg !2676
  %cmp31 = icmp ne i32 %31, 1, !dbg !2677
  br i1 %cmp31, label %land.lhs.true33, label %if.end40, !dbg !2678

land.lhs.true33:                                  ; preds = %if.end29
  %32 = load ptr, ptr %f, align 8, !dbg !2679
  %fd34 = getelementptr inbounds %struct.exe_file_t.6, ptr %32, i32 0, i32 0, !dbg !2680
  %33 = load i32, ptr %fd34, align 8, !dbg !2680
  %cmp35 = icmp ne i32 %33, 2, !dbg !2681
  br i1 %cmp35, label %if.then37, label %if.end40, !dbg !2682

if.then37:                                        ; preds = %land.lhs.true33
  %34 = load i32, ptr %r, align 4, !dbg !2683
  %conv38 = sext i32 %34 to i64, !dbg !2683
  %35 = load ptr, ptr %f, align 8, !dbg !2684
  %off39 = getelementptr inbounds %struct.exe_file_t.6, ptr %35, i32 0, i32 2, !dbg !2685
  %36 = load i64, ptr %off39, align 8, !dbg !2686
  %add = add nsw i64 %36, %conv38, !dbg !2686
  store i64 %add, ptr %off39, align 8, !dbg !2686
  br label %if.end40, !dbg !2684

if.end40:                                         ; preds = %if.then37, %land.lhs.true33, %if.end29
  %37 = load i32, ptr %r, align 4, !dbg !2687
  %conv41 = sext i32 %37 to i64, !dbg !2687
  store i64 %conv41, ptr %retval, align 8, !dbg !2688
  br label %return, !dbg !2688

if.else42:                                        ; preds = %if.end5
  call void @llvm.dbg.declare(metadata ptr %actual_count, metadata !2689, metadata !DIExpression()), !dbg !2691
  store i64 0, ptr %actual_count, align 8, !dbg !2691
  %38 = load ptr, ptr %f, align 8, !dbg !2692
  %off43 = getelementptr inbounds %struct.exe_file_t.6, ptr %38, i32 0, i32 2, !dbg !2694
  %39 = load i64, ptr %off43, align 8, !dbg !2694
  %40 = load i64, ptr %count.addr, align 8, !dbg !2695
  %add44 = add i64 %39, %40, !dbg !2696
  %41 = load ptr, ptr %f, align 8, !dbg !2697
  %dfile45 = getelementptr inbounds %struct.exe_file_t.6, ptr %41, i32 0, i32 3, !dbg !2698
  %42 = load ptr, ptr %dfile45, align 8, !dbg !2698
  %size = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %42, i32 0, i32 0, !dbg !2699
  %43 = load i32, ptr %size, align 8, !dbg !2699
  %conv46 = zext i32 %43 to i64, !dbg !2697
  %cmp47 = icmp ule i64 %add44, %conv46, !dbg !2700
  br i1 %cmp47, label %if.then49, label %if.else50, !dbg !2701

if.then49:                                        ; preds = %if.else42
  %44 = load i64, ptr %count.addr, align 8, !dbg !2702
  store i64 %44, ptr %actual_count, align 8, !dbg !2703
  br label %if.end67, !dbg !2704

if.else50:                                        ; preds = %if.else42
  %45 = load i32, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 2), align 4, !dbg !2705
  %tobool51 = icmp ne i32 %45, 0, !dbg !2708
  br i1 %tobool51, label %if.then52, label %if.else53, !dbg !2709

if.then52:                                        ; preds = %if.else50
  call void @__assert_fail(ptr noundef @.str.6.66, ptr noundef @.str.4.64, i32 noundef 444, ptr noundef @__PRETTY_FUNCTION__.write) #15, !dbg !2710
  unreachable, !dbg !2710

if.else53:                                        ; preds = %if.else50
  %46 = load ptr, ptr %f, align 8, !dbg !2713
  %off54 = getelementptr inbounds %struct.exe_file_t.6, ptr %46, i32 0, i32 2, !dbg !2716
  %47 = load i64, ptr %off54, align 8, !dbg !2716
  %48 = load ptr, ptr %f, align 8, !dbg !2717
  %dfile55 = getelementptr inbounds %struct.exe_file_t.6, ptr %48, i32 0, i32 3, !dbg !2718
  %49 = load ptr, ptr %dfile55, align 8, !dbg !2718
  %size56 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %49, i32 0, i32 0, !dbg !2719
  %50 = load i32, ptr %size56, align 8, !dbg !2719
  %conv57 = zext i32 %50 to i64, !dbg !2720
  %cmp58 = icmp slt i64 %47, %conv57, !dbg !2721
  br i1 %cmp58, label %if.then60, label %if.end67, !dbg !2722

if.then60:                                        ; preds = %if.else53
  %51 = load ptr, ptr %f, align 8, !dbg !2723
  %dfile61 = getelementptr inbounds %struct.exe_file_t.6, ptr %51, i32 0, i32 3, !dbg !2724
  %52 = load ptr, ptr %dfile61, align 8, !dbg !2724
  %size62 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %52, i32 0, i32 0, !dbg !2725
  %53 = load i32, ptr %size62, align 8, !dbg !2725
  %conv63 = zext i32 %53 to i64, !dbg !2723
  %54 = load ptr, ptr %f, align 8, !dbg !2726
  %off64 = getelementptr inbounds %struct.exe_file_t.6, ptr %54, i32 0, i32 2, !dbg !2727
  %55 = load i64, ptr %off64, align 8, !dbg !2727
  %sub = sub nsw i64 %conv63, %55, !dbg !2728
  store i64 %sub, ptr %actual_count, align 8, !dbg !2729
  br label %if.end67, !dbg !2730

if.end67:                                         ; preds = %if.then60, %if.else53, %if.then49
  %56 = load i64, ptr %actual_count, align 8, !dbg !2731
  %tobool68 = icmp ne i64 %56, 0, !dbg !2731
  br i1 %tobool68, label %if.then69, label %if.end72, !dbg !2733

if.then69:                                        ; preds = %if.end67
  %57 = load ptr, ptr %f, align 8, !dbg !2734
  %dfile70 = getelementptr inbounds %struct.exe_file_t.6, ptr %57, i32 0, i32 3, !dbg !2735
  %58 = load ptr, ptr %dfile70, align 8, !dbg !2735
  %contents = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %58, i32 0, i32 1, !dbg !2736
  %59 = load ptr, ptr %contents, align 8, !dbg !2736
  %60 = load ptr, ptr %f, align 8, !dbg !2737
  %off71 = getelementptr inbounds %struct.exe_file_t.6, ptr %60, i32 0, i32 2, !dbg !2738
  %61 = load i64, ptr %off71, align 8, !dbg !2738
  %add.ptr = getelementptr inbounds i8, ptr %59, i64 %61, !dbg !2739
  %62 = load ptr, ptr %buf.addr, align 8, !dbg !2740
  %63 = load i64, ptr %actual_count, align 8, !dbg !2741
  %64 = call ptr @memcpy(ptr %add.ptr, ptr %62, i64 %63), !dbg !2742
  br label %if.end72, !dbg !2742

if.end72:                                         ; preds = %if.then69, %if.end67
  %65 = load i64, ptr %count.addr, align 8, !dbg !2743
  %66 = load i64, ptr %actual_count, align 8, !dbg !2745
  %cmp73 = icmp ne i64 %65, %66, !dbg !2746
  br i1 %cmp73, label %if.then75, label %if.end76, !dbg !2747

if.then75:                                        ; preds = %if.end72
  call void @klee_warning(ptr noundef @.str.7.67), !dbg !2748
  br label %if.end76, !dbg !2748

if.end76:                                         ; preds = %if.then75, %if.end72
  %67 = load ptr, ptr %f, align 8, !dbg !2749
  %dfile77 = getelementptr inbounds %struct.exe_file_t.6, ptr %67, i32 0, i32 3, !dbg !2751
  %68 = load ptr, ptr %dfile77, align 8, !dbg !2751
  %69 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !2752
  %cmp78 = icmp eq ptr %68, %69, !dbg !2753
  br i1 %cmp78, label %if.then80, label %if.end84, !dbg !2754

if.then80:                                        ; preds = %if.end76
  %70 = load i64, ptr %actual_count, align 8, !dbg !2755
  %71 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 3), align 8, !dbg !2756
  %conv81 = zext i32 %71 to i64, !dbg !2756
  %add82 = add i64 %conv81, %70, !dbg !2756
  %conv83 = trunc i64 %add82 to i32, !dbg !2756
  store i32 %conv83, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 3), align 8, !dbg !2756
  br label %if.end84, !dbg !2757

if.end84:                                         ; preds = %if.then80, %if.end76
  %72 = load i64, ptr %count.addr, align 8, !dbg !2758
  %73 = load ptr, ptr %f, align 8, !dbg !2759
  %off85 = getelementptr inbounds %struct.exe_file_t.6, ptr %73, i32 0, i32 2, !dbg !2760
  %74 = load i64, ptr %off85, align 8, !dbg !2761
  %add86 = add i64 %74, %72, !dbg !2761
  store i64 %add86, ptr %off85, align 8, !dbg !2761
  %75 = load i64, ptr %count.addr, align 8, !dbg !2762
  store i64 %75, ptr %retval, align 8, !dbg !2763
  br label %return, !dbg !2763

return:                                           ; preds = %if.end84, %if.end40, %if.then23, %if.then3, %if.then
  %76 = load i64, ptr %retval, align 8, !dbg !2764
  ret i64 %76, !dbg !2764
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @__fd_lseek(i32 noundef %fd, i64 noundef %offset, i32 noundef %whence) #0 !dbg !2765 {
entry:
  %retval = alloca i64, align 8
  %fd.addr = alloca i32, align 4
  %offset.addr = alloca i64, align 8
  %whence.addr = alloca i32, align 4
  %new_off = alloca i64, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2768, metadata !DIExpression()), !dbg !2769
  store i64 %offset, ptr %offset.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %offset.addr, metadata !2770, metadata !DIExpression()), !dbg !2771
  store i32 %whence, ptr %whence.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %whence.addr, metadata !2772, metadata !DIExpression()), !dbg !2773
  call void @llvm.dbg.declare(metadata ptr %new_off, metadata !2774, metadata !DIExpression()), !dbg !2775
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2776, metadata !DIExpression()), !dbg !2777
  %0 = load i32, ptr %fd.addr, align 4, !dbg !2778
  %call = call ptr @__get_file(i32 noundef %0), !dbg !2779
  store ptr %call, ptr %f, align 8, !dbg !2777
  %1 = load ptr, ptr %f, align 8, !dbg !2780
  %tobool = icmp ne ptr %1, null, !dbg !2780
  br i1 %tobool, label %if.end, label %if.then, !dbg !2782

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !2783
  store i32 9, ptr %call1, align 4, !dbg !2785
  store i64 -1, ptr %retval, align 8, !dbg !2786
  br label %return, !dbg !2786

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !2787
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !2789
  %3 = load ptr, ptr %dfile, align 8, !dbg !2789
  %tobool2 = icmp ne ptr %3, null, !dbg !2787
  br i1 %tobool2, label %if.end24, label %if.then3, !dbg !2790

if.then3:                                         ; preds = %if.end
  %4 = load i32, ptr %whence.addr, align 4, !dbg !2791
  %cmp = icmp eq i32 %4, 0, !dbg !2794
  br i1 %cmp, label %if.then4, label %if.else, !dbg !2795

if.then4:                                         ; preds = %if.then3
  %5 = load ptr, ptr %f, align 8, !dbg !2796
  %fd5 = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 0, !dbg !2798
  %6 = load i32, ptr %fd5, align 8, !dbg !2798
  %7 = load i64, ptr %offset.addr, align 8, !dbg !2799
  %call6 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %6, i64 noundef %7, i32 noundef 0) #16, !dbg !2800
  store i64 %call6, ptr %new_off, align 8, !dbg !2801
  br label %if.end19, !dbg !2802

if.else:                                          ; preds = %if.then3
  %8 = load ptr, ptr %f, align 8, !dbg !2803
  %fd7 = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 0, !dbg !2805
  %9 = load i32, ptr %fd7, align 8, !dbg !2805
  %10 = load ptr, ptr %f, align 8, !dbg !2806
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %10, i32 0, i32 2, !dbg !2807
  %11 = load i64, ptr %off, align 8, !dbg !2807
  %call8 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %9, i64 noundef %11, i32 noundef 0) #16, !dbg !2808
  store i64 %call8, ptr %new_off, align 8, !dbg !2809
  %12 = load i64, ptr %new_off, align 8, !dbg !2810
  %cmp9 = icmp ne i64 %12, -1, !dbg !2812
  br i1 %cmp9, label %if.then10, label %if.end19, !dbg !2813

if.then10:                                        ; preds = %if.else
  %13 = load i64, ptr %new_off, align 8, !dbg !2814
  %14 = load ptr, ptr %f, align 8, !dbg !2814
  %off11 = getelementptr inbounds %struct.exe_file_t.6, ptr %14, i32 0, i32 2, !dbg !2814
  %15 = load i64, ptr %off11, align 8, !dbg !2814
  %cmp12 = icmp eq i64 %13, %15, !dbg !2814
  br i1 %cmp12, label %if.end15, label %if.else14, !dbg !2818

if.else14:                                        ; preds = %if.then10
  call void @__assert_fail(ptr noundef @.str.8.68, ptr noundef @.str.4.64, i32 noundef 490, ptr noundef @__PRETTY_FUNCTION__.__fd_lseek) #15, !dbg !2814
  unreachable, !dbg !2814

if.end15:                                         ; preds = %if.then10
  %16 = load ptr, ptr %f, align 8, !dbg !2819
  %fd16 = getelementptr inbounds %struct.exe_file_t.6, ptr %16, i32 0, i32 0, !dbg !2820
  %17 = load i32, ptr %fd16, align 8, !dbg !2820
  %18 = load i64, ptr %offset.addr, align 8, !dbg !2821
  %19 = load i32, ptr %whence.addr, align 4, !dbg !2822
  %call17 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %17, i64 noundef %18, i32 noundef %19) #16, !dbg !2823
  store i64 %call17, ptr %new_off, align 8, !dbg !2824
  br label %if.end19, !dbg !2825

if.end19:                                         ; preds = %if.else, %if.end15, %if.then4
  %20 = load i64, ptr %new_off, align 8, !dbg !2826
  %cmp20 = icmp eq i64 %20, -1, !dbg !2828
  br i1 %cmp20, label %if.then21, label %if.end22, !dbg !2829

if.then21:                                        ; preds = %if.end19
  store i64 -1, ptr %retval, align 8, !dbg !2830
  br label %return, !dbg !2830

if.end22:                                         ; preds = %if.end19
  %21 = load i64, ptr %new_off, align 8, !dbg !2831
  %22 = load ptr, ptr %f, align 8, !dbg !2832
  %off23 = getelementptr inbounds %struct.exe_file_t.6, ptr %22, i32 0, i32 2, !dbg !2833
  store i64 %21, ptr %off23, align 8, !dbg !2834
  %23 = load i64, ptr %new_off, align 8, !dbg !2835
  store i64 %23, ptr %retval, align 8, !dbg !2836
  br label %return, !dbg !2836

if.end24:                                         ; preds = %if.end
  %24 = load i32, ptr %whence.addr, align 4, !dbg !2837
  switch i32 %24, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb25
    i32 2, label %sw.bb27
  ], !dbg !2838

sw.bb:                                            ; preds = %if.end24
  %25 = load i64, ptr %offset.addr, align 8, !dbg !2839
  store i64 %25, ptr %new_off, align 8, !dbg !2841
  br label %sw.epilog, !dbg !2842

sw.bb25:                                          ; preds = %if.end24
  %26 = load ptr, ptr %f, align 8, !dbg !2843
  %off26 = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 2, !dbg !2844
  %27 = load i64, ptr %off26, align 8, !dbg !2844
  %28 = load i64, ptr %offset.addr, align 8, !dbg !2845
  %add = add nsw i64 %27, %28, !dbg !2846
  store i64 %add, ptr %new_off, align 8, !dbg !2847
  br label %sw.epilog, !dbg !2848

sw.bb27:                                          ; preds = %if.end24
  %29 = load ptr, ptr %f, align 8, !dbg !2849
  %dfile28 = getelementptr inbounds %struct.exe_file_t.6, ptr %29, i32 0, i32 3, !dbg !2850
  %30 = load ptr, ptr %dfile28, align 8, !dbg !2850
  %size = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %30, i32 0, i32 0, !dbg !2851
  %31 = load i32, ptr %size, align 8, !dbg !2851
  %conv = zext i32 %31 to i64, !dbg !2849
  %32 = load i64, ptr %offset.addr, align 8, !dbg !2852
  %add29 = add nsw i64 %conv, %32, !dbg !2853
  store i64 %add29, ptr %new_off, align 8, !dbg !2854
  br label %sw.epilog, !dbg !2855

sw.default:                                       ; preds = %if.end24
  %call30 = call ptr @__errno_location() #17, !dbg !2856
  store i32 22, ptr %call30, align 4, !dbg !2858
  store i64 -1, ptr %retval, align 8, !dbg !2859
  br label %return, !dbg !2859

sw.epilog:                                        ; preds = %sw.bb27, %sw.bb25, %sw.bb
  %33 = load i64, ptr %new_off, align 8, !dbg !2860
  %cmp31 = icmp slt i64 %33, 0, !dbg !2862
  br i1 %cmp31, label %if.then33, label %if.end35, !dbg !2863

if.then33:                                        ; preds = %sw.epilog
  %call34 = call ptr @__errno_location() #17, !dbg !2864
  store i32 22, ptr %call34, align 4, !dbg !2866
  store i64 -1, ptr %retval, align 8, !dbg !2867
  br label %return, !dbg !2867

if.end35:                                         ; preds = %sw.epilog
  %34 = load i64, ptr %new_off, align 8, !dbg !2868
  %35 = load ptr, ptr %f, align 8, !dbg !2869
  %off36 = getelementptr inbounds %struct.exe_file_t.6, ptr %35, i32 0, i32 2, !dbg !2870
  store i64 %34, ptr %off36, align 8, !dbg !2871
  %36 = load ptr, ptr %f, align 8, !dbg !2872
  %off37 = getelementptr inbounds %struct.exe_file_t.6, ptr %36, i32 0, i32 2, !dbg !2873
  %37 = load i64, ptr %off37, align 8, !dbg !2873
  store i64 %37, ptr %retval, align 8, !dbg !2874
  br label %return, !dbg !2874

return:                                           ; preds = %if.end35, %if.then33, %sw.default, %if.end22, %if.then21, %if.then
  %38 = load i64, ptr %retval, align 8, !dbg !2875
  ret i64 %38, !dbg !2875
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_stat(ptr noundef %path, ptr noundef %buf) #0 !dbg !2876 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2879, metadata !DIExpression()), !dbg !2880
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2881, metadata !DIExpression()), !dbg !2882
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !2883, metadata !DIExpression()), !dbg !2884
  %0 = load ptr, ptr %path.addr, align 8, !dbg !2885
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !2886
  store ptr %call, ptr %dfile, align 8, !dbg !2884
  %1 = load ptr, ptr %dfile, align 8, !dbg !2887
  %tobool = icmp ne ptr %1, null, !dbg !2887
  br i1 %tobool, label %if.then, label %if.end, !dbg !2889

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %buf.addr, align 8, !dbg !2890
  %3 = load ptr, ptr %dfile, align 8, !dbg !2892
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %3, i32 0, i32 2, !dbg !2893
  %4 = load ptr, ptr %stat, align 8, !dbg !2893
  %5 = call ptr @memcpy(ptr %2, ptr %4, i64 144), !dbg !2894
  store i32 0, ptr %retval, align 4, !dbg !2895
  br label %return, !dbg !2895

if.end:                                           ; preds = %entry
  %6 = load ptr, ptr %path.addr, align 8, !dbg !2896
  %call1 = call ptr @__concretize_string(ptr noundef %6), !dbg !2898
  %7 = load ptr, ptr %buf.addr, align 8, !dbg !2899
  %call2 = call i64 (i64, ...) @syscall(i64 noundef 4, ptr noundef %call1, ptr noundef %7) #16, !dbg !2900
  %conv = trunc i64 %call2 to i32, !dbg !2900
  store i32 %conv, ptr %retval, align 4, !dbg !2901
  br label %return, !dbg !2901

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !2902
  ret i32 %8, !dbg !2902
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fstatat(i32 noundef %fd, ptr noundef nonnull %path, ptr noundef nonnull %buf, i32 noundef %flags) #0 !dbg !2903 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %dfile9 = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2906, metadata !DIExpression()), !dbg !2907
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2908, metadata !DIExpression()), !dbg !2909
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2910, metadata !DIExpression()), !dbg !2911
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !2912, metadata !DIExpression()), !dbg !2913
  %0 = load i32, ptr %fd.addr, align 4, !dbg !2914
  %cmp = icmp ne i32 %0, -100, !dbg !2916
  br i1 %cmp, label %if.then, label %if.end8, !dbg !2917

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2918, metadata !DIExpression()), !dbg !2920
  %1 = load i32, ptr %fd.addr, align 4, !dbg !2921
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2922
  store ptr %call, ptr %f, align 8, !dbg !2920
  %2 = load ptr, ptr %f, align 8, !dbg !2923
  %tobool = icmp ne ptr %2, null, !dbg !2923
  br i1 %tobool, label %if.else, label %if.then1, !dbg !2925

if.then1:                                         ; preds = %if.then
  %call2 = call ptr @__errno_location() #17, !dbg !2926
  store i32 9, ptr %call2, align 4, !dbg !2928
  store i32 -1, ptr %retval, align 4, !dbg !2929
  br label %return, !dbg !2929

if.else:                                          ; preds = %if.then
  %3 = load ptr, ptr %f, align 8, !dbg !2930
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %3, i32 0, i32 3, !dbg !2932
  %4 = load ptr, ptr %dfile, align 8, !dbg !2932
  %tobool3 = icmp ne ptr %4, null, !dbg !2930
  br i1 %tobool3, label %if.then4, label %if.end6, !dbg !2933

if.then4:                                         ; preds = %if.else
  call void @klee_warning(ptr noundef @.str.2.60), !dbg !2934
  %call5 = call ptr @__errno_location() #17, !dbg !2936
  store i32 2, ptr %call5, align 4, !dbg !2937
  store i32 -1, ptr %retval, align 4, !dbg !2938
  br label %return, !dbg !2938

if.end6:                                          ; preds = %if.else
  %5 = load ptr, ptr %f, align 8, !dbg !2939
  %fd7 = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 0, !dbg !2940
  %6 = load i32, ptr %fd7, align 8, !dbg !2940
  store i32 %6, ptr %fd.addr, align 4, !dbg !2941
  br label %if.end8, !dbg !2942

if.end8:                                          ; preds = %if.end6, %entry
  call void @llvm.dbg.declare(metadata ptr %dfile9, metadata !2943, metadata !DIExpression()), !dbg !2944
  %7 = load ptr, ptr %path.addr, align 8, !dbg !2945
  %call10 = call ptr @__get_sym_file(ptr noundef %7), !dbg !2946
  store ptr %call10, ptr %dfile9, align 8, !dbg !2944
  %8 = load ptr, ptr %dfile9, align 8, !dbg !2947
  %tobool11 = icmp ne ptr %8, null, !dbg !2947
  br i1 %tobool11, label %if.then12, label %if.end13, !dbg !2949

if.then12:                                        ; preds = %if.end8
  %9 = load ptr, ptr %buf.addr, align 8, !dbg !2950
  %10 = load ptr, ptr %dfile9, align 8, !dbg !2952
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %10, i32 0, i32 2, !dbg !2953
  %11 = load ptr, ptr %stat, align 8, !dbg !2953
  %12 = call ptr @memcpy(ptr %9, ptr %11, i64 144), !dbg !2954
  store i32 0, ptr %retval, align 4, !dbg !2955
  br label %return, !dbg !2955

if.end13:                                         ; preds = %if.end8
  %13 = load ptr, ptr %path.addr, align 8, !dbg !2956
  %tobool14 = icmp ne ptr %13, null, !dbg !2956
  br i1 %tobool14, label %if.end17, label %if.else16, !dbg !2959

if.else16:                                        ; preds = %if.end13
  call void @__assert_fail(ptr noundef @.str.9.69, ptr noundef @.str.4.64, i32 noundef 560, ptr noundef @__PRETTY_FUNCTION__.fstatat) #15, !dbg !2956
  unreachable, !dbg !2956

if.end17:                                         ; preds = %if.end13
  %14 = load i32, ptr %fd.addr, align 4, !dbg !2960
  %conv = sext i32 %14 to i64, !dbg !2961
  %15 = load ptr, ptr %path.addr, align 8, !dbg !2962
  %call18 = call ptr @__concretize_string(ptr noundef %15), !dbg !2962
  %16 = load ptr, ptr %buf.addr, align 8, !dbg !2963
  %17 = load i32, ptr %flags.addr, align 4, !dbg !2964
  %conv19 = sext i32 %17 to i64, !dbg !2965
  %call20 = call i64 (i64, ...) @syscall(i64 noundef 262, i64 noundef %conv, ptr noundef %call18, ptr noundef %16, i64 noundef %conv19) #16, !dbg !2966
  %conv21 = trunc i64 %call20 to i32, !dbg !2966
  store i32 %conv21, ptr %retval, align 4, !dbg !2967
  br label %return, !dbg !2967

return:                                           ; preds = %if.end17, %if.then12, %if.then4, %if.then1
  %18 = load i32, ptr %retval, align 4, !dbg !2968
  ret i32 %18, !dbg !2968
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_lstat(ptr noundef %path, ptr noundef %buf) #0 !dbg !2969 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2970, metadata !DIExpression()), !dbg !2971
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2972, metadata !DIExpression()), !dbg !2973
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !2974, metadata !DIExpression()), !dbg !2975
  %0 = load ptr, ptr %path.addr, align 8, !dbg !2976
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !2977
  store ptr %call, ptr %dfile, align 8, !dbg !2975
  %1 = load ptr, ptr %dfile, align 8, !dbg !2978
  %tobool = icmp ne ptr %1, null, !dbg !2978
  br i1 %tobool, label %if.then, label %if.end, !dbg !2980

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %buf.addr, align 8, !dbg !2981
  %3 = load ptr, ptr %dfile, align 8, !dbg !2983
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %3, i32 0, i32 2, !dbg !2984
  %4 = load ptr, ptr %stat, align 8, !dbg !2984
  %5 = call ptr @memcpy(ptr %2, ptr %4, i64 144), !dbg !2985
  store i32 0, ptr %retval, align 4, !dbg !2986
  br label %return, !dbg !2986

if.end:                                           ; preds = %entry
  %6 = load ptr, ptr %path.addr, align 8, !dbg !2987
  %call1 = call ptr @__concretize_string(ptr noundef %6), !dbg !2989
  %7 = load ptr, ptr %buf.addr, align 8, !dbg !2990
  %call2 = call i64 (i64, ...) @syscall(i64 noundef 6, ptr noundef %call1, ptr noundef %7) #16, !dbg !2991
  %conv = trunc i64 %call2 to i32, !dbg !2991
  store i32 %conv, ptr %retval, align 4, !dbg !2992
  br label %return, !dbg !2992

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !2993
  ret i32 %8, !dbg !2993
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chdir(ptr noundef nonnull %path) #0 !dbg !2994 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2997, metadata !DIExpression()), !dbg !2998
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !2999, metadata !DIExpression()), !dbg !3000
  %0 = load ptr, ptr %path.addr, align 8, !dbg !3001
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !3002
  store ptr %call, ptr %dfile, align 8, !dbg !3000
  %1 = load ptr, ptr %dfile, align 8, !dbg !3003
  %tobool = icmp ne ptr %1, null, !dbg !3003
  br i1 %tobool, label %if.then, label %if.end, !dbg !3005

if.then:                                          ; preds = %entry
  call void @klee_warning(ptr noundef @.str.10.70), !dbg !3006
  %call1 = call ptr @__errno_location() #17, !dbg !3008
  store i32 2, ptr %call1, align 4, !dbg !3009
  store i32 -1, ptr %retval, align 4, !dbg !3010
  br label %return, !dbg !3010

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %path.addr, align 8, !dbg !3011
  %call2 = call ptr @__concretize_string(ptr noundef %2), !dbg !3012
  %call3 = call i64 (i64, ...) @syscall(i64 noundef 80, ptr noundef %call2) #16, !dbg !3013
  %conv = trunc i64 %call3 to i32, !dbg !3013
  store i32 %conv, ptr %retval, align 4, !dbg !3014
  br label %return, !dbg !3014

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, ptr %retval, align 4, !dbg !3015
  ret i32 %3, !dbg !3015
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fchdir(i32 noundef %fd) #0 !dbg !3016 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3017, metadata !DIExpression()), !dbg !3018
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3019, metadata !DIExpression()), !dbg !3020
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3021
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3022
  store ptr %call, ptr %f, align 8, !dbg !3020
  %1 = load ptr, ptr %f, align 8, !dbg !3023
  %tobool = icmp ne ptr %1, null, !dbg !3023
  br i1 %tobool, label %if.end, label %if.then, !dbg !3025

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3026
  store i32 9, ptr %call1, align 4, !dbg !3028
  store i32 -1, ptr %retval, align 4, !dbg !3029
  br label %return, !dbg !3029

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !3030
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !3032
  %3 = load ptr, ptr %dfile, align 8, !dbg !3032
  %tobool2 = icmp ne ptr %3, null, !dbg !3030
  br i1 %tobool2, label %if.then3, label %if.end5, !dbg !3033

if.then3:                                         ; preds = %if.end
  call void @klee_warning(ptr noundef @.str.10.70), !dbg !3034
  %call4 = call ptr @__errno_location() #17, !dbg !3036
  store i32 2, ptr %call4, align 4, !dbg !3037
  store i32 -1, ptr %retval, align 4, !dbg !3038
  br label %return, !dbg !3038

if.end5:                                          ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !3039
  %fd6 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 0, !dbg !3040
  %5 = load i32, ptr %fd6, align 8, !dbg !3040
  %call7 = call i64 (i64, ...) @syscall(i64 noundef 81, i32 noundef %5) #16, !dbg !3041
  %conv = trunc i64 %call7 to i32, !dbg !3041
  store i32 %conv, ptr %retval, align 4, !dbg !3042
  br label %return, !dbg !3042

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %6 = load i32, ptr %retval, align 4, !dbg !3043
  ret i32 %6, !dbg !3043
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chmod(ptr noundef nonnull %path, i32 noundef %mode) #0 !dbg !434 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %mode.addr = alloca i32, align 4
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !3044, metadata !DIExpression()), !dbg !3045
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !3046, metadata !DIExpression()), !dbg !3047
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !3048, metadata !DIExpression()), !dbg !3049
  %0 = load ptr, ptr %path.addr, align 8, !dbg !3050
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !3051
  store ptr %call, ptr %dfile, align 8, !dbg !3049
  %1 = load i32, ptr @chmod.n_calls, align 4, !dbg !3052
  %inc = add nsw i32 %1, 1, !dbg !3052
  store i32 %inc, ptr @chmod.n_calls, align 4, !dbg !3052
  %2 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3053
  %tobool = icmp ne i32 %2, 0, !dbg !3055
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !3056

land.lhs.true:                                    ; preds = %entry
  %3 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 11), align 8, !dbg !3057
  %4 = load i32, ptr %3, align 4, !dbg !3058
  %5 = load i32, ptr @chmod.n_calls, align 4, !dbg !3059
  %cmp = icmp eq i32 %4, %5, !dbg !3060
  br i1 %cmp, label %if.then, label %if.end, !dbg !3061

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3062
  %dec = add i32 %6, -1, !dbg !3062
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3062
  %call1 = call ptr @__errno_location() #17, !dbg !3064
  store i32 5, ptr %call1, align 4, !dbg !3065
  store i32 -1, ptr %retval, align 4, !dbg !3066
  br label %return, !dbg !3066

if.end:                                           ; preds = %land.lhs.true, %entry
  %7 = load ptr, ptr %dfile, align 8, !dbg !3067
  %tobool2 = icmp ne ptr %7, null, !dbg !3067
  br i1 %tobool2, label %if.then3, label %if.end5, !dbg !3069

if.then3:                                         ; preds = %if.end
  %8 = load ptr, ptr %dfile, align 8, !dbg !3070
  %9 = load i32, ptr %mode.addr, align 4, !dbg !3072
  %call4 = call i32 @__df_chmod(ptr noundef %8, i32 noundef %9), !dbg !3073
  store i32 %call4, ptr %retval, align 4, !dbg !3074
  br label %return, !dbg !3074

if.end5:                                          ; preds = %if.end
  %10 = load ptr, ptr %path.addr, align 8, !dbg !3075
  %call6 = call ptr @__concretize_string(ptr noundef %10), !dbg !3076
  %11 = load i32, ptr %mode.addr, align 4, !dbg !3077
  %call7 = call i64 (i64, ...) @syscall(i64 noundef 90, ptr noundef %call6, i32 noundef %11) #16, !dbg !3078
  %conv = trunc i64 %call7 to i32, !dbg !3078
  store i32 %conv, ptr %retval, align 4, !dbg !3079
  br label %return, !dbg !3079

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %12 = load i32, ptr %retval, align 4, !dbg !3080
  ret i32 %12, !dbg !3080
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @__df_chmod(ptr noundef %df, i32 noundef %mode) #0 !dbg !3081 {
entry:
  %retval = alloca i32, align 4
  %df.addr = alloca ptr, align 8
  %mode.addr = alloca i32, align 4
  store ptr %df, ptr %df.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %df.addr, metadata !3084, metadata !DIExpression()), !dbg !3085
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !3086, metadata !DIExpression()), !dbg !3087
  %call = call i32 @geteuid() #16, !dbg !3088
  %0 = load ptr, ptr %df.addr, align 8, !dbg !3090
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %0, i32 0, i32 2, !dbg !3091
  %1 = load ptr, ptr %stat, align 8, !dbg !3091
  %st_uid = getelementptr inbounds %struct.stat64.9, ptr %1, i32 0, i32 4, !dbg !3092
  %2 = load i32, ptr %st_uid, align 4, !dbg !3092
  %cmp = icmp eq i32 %call, %2, !dbg !3093
  br i1 %cmp, label %if.then, label %if.else, !dbg !3094

if.then:                                          ; preds = %entry
  %call1 = call i32 @getgid() #16, !dbg !3095
  %3 = load ptr, ptr %df.addr, align 8, !dbg !3098
  %stat2 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %3, i32 0, i32 2, !dbg !3099
  %4 = load ptr, ptr %stat2, align 8, !dbg !3099
  %st_gid = getelementptr inbounds %struct.stat64.9, ptr %4, i32 0, i32 5, !dbg !3100
  %5 = load i32, ptr %st_gid, align 8, !dbg !3100
  %cmp3 = icmp ne i32 %call1, %5, !dbg !3101
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !3102

if.then4:                                         ; preds = %if.then
  %6 = load i32, ptr %mode.addr, align 4, !dbg !3103
  %and = and i32 %6, -1025, !dbg !3103
  store i32 %and, ptr %mode.addr, align 4, !dbg !3103
  br label %if.end, !dbg !3104

if.end:                                           ; preds = %if.then4, %if.then
  %7 = load ptr, ptr %df.addr, align 8, !dbg !3105
  %stat5 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %7, i32 0, i32 2, !dbg !3106
  %8 = load ptr, ptr %stat5, align 8, !dbg !3106
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %8, i32 0, i32 3, !dbg !3107
  %9 = load i32, ptr %st_mode, align 8, !dbg !3107
  %and6 = and i32 %9, -4096, !dbg !3108
  %10 = load i32, ptr %mode.addr, align 4, !dbg !3109
  %and7 = and i32 %10, 4095, !dbg !3110
  %or = or i32 %and6, %and7, !dbg !3111
  %11 = load ptr, ptr %df.addr, align 8, !dbg !3112
  %stat8 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %11, i32 0, i32 2, !dbg !3113
  %12 = load ptr, ptr %stat8, align 8, !dbg !3113
  %st_mode9 = getelementptr inbounds %struct.stat64.9, ptr %12, i32 0, i32 3, !dbg !3114
  store i32 %or, ptr %st_mode9, align 8, !dbg !3115
  store i32 0, ptr %retval, align 4, !dbg !3116
  br label %return, !dbg !3116

if.else:                                          ; preds = %entry
  %call10 = call ptr @__errno_location() #17, !dbg !3117
  store i32 1, ptr %call10, align 4, !dbg !3119
  store i32 -1, ptr %retval, align 4, !dbg !3120
  br label %return, !dbg !3120

return:                                           ; preds = %if.else, %if.end
  %13 = load i32, ptr %retval, align 4, !dbg !3121
  ret i32 %13, !dbg !3121
}

; Function Attrs: nounwind
declare i32 @geteuid() #9

; Function Attrs: nounwind
declare i32 @getgid() #9

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fchmod(i32 noundef %fd, i32 noundef %mode) #0 !dbg !440 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %mode.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3122, metadata !DIExpression()), !dbg !3123
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !3124, metadata !DIExpression()), !dbg !3125
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3126, metadata !DIExpression()), !dbg !3127
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3128
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3129
  store ptr %call, ptr %f, align 8, !dbg !3127
  %1 = load ptr, ptr %f, align 8, !dbg !3130
  %tobool = icmp ne ptr %1, null, !dbg !3130
  br i1 %tobool, label %if.end, label %if.then, !dbg !3132

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3133
  store i32 9, ptr %call1, align 4, !dbg !3135
  store i32 -1, ptr %retval, align 4, !dbg !3136
  br label %return, !dbg !3136

if.end:                                           ; preds = %entry
  %2 = load i32, ptr @fchmod.n_calls, align 4, !dbg !3137
  %inc = add nsw i32 %2, 1, !dbg !3137
  store i32 %inc, ptr @fchmod.n_calls, align 4, !dbg !3137
  %3 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3138
  %tobool2 = icmp ne i32 %3, 0, !dbg !3140
  br i1 %tobool2, label %land.lhs.true, label %if.end5, !dbg !3141

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 12), align 8, !dbg !3142
  %5 = load i32, ptr %4, align 4, !dbg !3143
  %6 = load i32, ptr @fchmod.n_calls, align 4, !dbg !3144
  %cmp = icmp eq i32 %5, %6, !dbg !3145
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !3146

if.then3:                                         ; preds = %land.lhs.true
  %7 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3147
  %dec = add i32 %7, -1, !dbg !3147
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3147
  %call4 = call ptr @__errno_location() #17, !dbg !3149
  store i32 5, ptr %call4, align 4, !dbg !3150
  store i32 -1, ptr %retval, align 4, !dbg !3151
  br label %return, !dbg !3151

if.end5:                                          ; preds = %land.lhs.true, %if.end
  %8 = load ptr, ptr %f, align 8, !dbg !3152
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !3154
  %9 = load ptr, ptr %dfile, align 8, !dbg !3154
  %tobool6 = icmp ne ptr %9, null, !dbg !3152
  br i1 %tobool6, label %if.then7, label %if.end10, !dbg !3155

if.then7:                                         ; preds = %if.end5
  %10 = load ptr, ptr %f, align 8, !dbg !3156
  %dfile8 = getelementptr inbounds %struct.exe_file_t.6, ptr %10, i32 0, i32 3, !dbg !3158
  %11 = load ptr, ptr %dfile8, align 8, !dbg !3158
  %12 = load i32, ptr %mode.addr, align 4, !dbg !3159
  %call9 = call i32 @__df_chmod(ptr noundef %11, i32 noundef %12), !dbg !3160
  store i32 %call9, ptr %retval, align 4, !dbg !3161
  br label %return, !dbg !3161

if.end10:                                         ; preds = %if.end5
  %13 = load ptr, ptr %f, align 8, !dbg !3162
  %fd11 = getelementptr inbounds %struct.exe_file_t.6, ptr %13, i32 0, i32 0, !dbg !3163
  %14 = load i32, ptr %fd11, align 8, !dbg !3163
  %15 = load i32, ptr %mode.addr, align 4, !dbg !3164
  %call12 = call i64 (i64, ...) @syscall(i64 noundef 91, i32 noundef %14, i32 noundef %15) #16, !dbg !3165
  %conv = trunc i64 %call12 to i32, !dbg !3165
  store i32 %conv, ptr %retval, align 4, !dbg !3166
  br label %return, !dbg !3166

return:                                           ; preds = %if.end10, %if.then7, %if.then3, %if.then
  %16 = load i32, ptr %retval, align 4, !dbg !3167
  ret i32 %16, !dbg !3167
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chown(ptr noundef nonnull %path, i32 noundef %owner, i32 noundef %group) #0 !dbg !3168 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %owner.addr = alloca i32, align 4
  %group.addr = alloca i32, align 4
  %df = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !3173, metadata !DIExpression()), !dbg !3174
  store i32 %owner, ptr %owner.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %owner.addr, metadata !3175, metadata !DIExpression()), !dbg !3176
  store i32 %group, ptr %group.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %group.addr, metadata !3177, metadata !DIExpression()), !dbg !3178
  call void @llvm.dbg.declare(metadata ptr %df, metadata !3179, metadata !DIExpression()), !dbg !3180
  %0 = load ptr, ptr %path.addr, align 8, !dbg !3181
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !3182
  store ptr %call, ptr %df, align 8, !dbg !3180
  %1 = load ptr, ptr %df, align 8, !dbg !3183
  %tobool = icmp ne ptr %1, null, !dbg !3183
  br i1 %tobool, label %if.then, label %if.end, !dbg !3185

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %df, align 8, !dbg !3186
  %3 = load i32, ptr %owner.addr, align 4, !dbg !3188
  %4 = load i32, ptr %group.addr, align 4, !dbg !3189
  %call1 = call i32 @__df_chown(ptr noundef %2, i32 noundef %3, i32 noundef %4), !dbg !3190
  store i32 %call1, ptr %retval, align 4, !dbg !3191
  br label %return, !dbg !3191

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %path.addr, align 8, !dbg !3192
  %call2 = call ptr @__concretize_string(ptr noundef %5), !dbg !3193
  %6 = load i32, ptr %owner.addr, align 4, !dbg !3194
  %7 = load i32, ptr %group.addr, align 4, !dbg !3195
  %call3 = call i64 (i64, ...) @syscall(i64 noundef 92, ptr noundef %call2, i32 noundef %6, i32 noundef %7) #16, !dbg !3196
  %conv = trunc i64 %call3 to i32, !dbg !3196
  store i32 %conv, ptr %retval, align 4, !dbg !3197
  br label %return, !dbg !3197

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !3198
  ret i32 %8, !dbg !3198
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @__df_chown(ptr noundef %df, i32 noundef %owner, i32 noundef %group) #0 !dbg !3199 {
entry:
  %df.addr = alloca ptr, align 8
  %owner.addr = alloca i32, align 4
  %group.addr = alloca i32, align 4
  store ptr %df, ptr %df.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %df.addr, metadata !3202, metadata !DIExpression()), !dbg !3203
  store i32 %owner, ptr %owner.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %owner.addr, metadata !3204, metadata !DIExpression()), !dbg !3205
  store i32 %group, ptr %group.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %group.addr, metadata !3206, metadata !DIExpression()), !dbg !3207
  call void @klee_warning(ptr noundef @.str.26.71), !dbg !3208
  %call = call ptr @__errno_location() #17, !dbg !3209
  store i32 1, ptr %call, align 4, !dbg !3210
  ret i32 -1, !dbg !3211
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fchown(i32 noundef %fd, i32 noundef %owner, i32 noundef %group) #0 !dbg !3212 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %owner.addr = alloca i32, align 4
  %group.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3215, metadata !DIExpression()), !dbg !3216
  store i32 %owner, ptr %owner.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %owner.addr, metadata !3217, metadata !DIExpression()), !dbg !3218
  store i32 %group, ptr %group.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %group.addr, metadata !3219, metadata !DIExpression()), !dbg !3220
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3221, metadata !DIExpression()), !dbg !3222
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3223
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3224
  store ptr %call, ptr %f, align 8, !dbg !3222
  %1 = load ptr, ptr %f, align 8, !dbg !3225
  %tobool = icmp ne ptr %1, null, !dbg !3225
  br i1 %tobool, label %if.end, label %if.then, !dbg !3227

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3228
  store i32 9, ptr %call1, align 4, !dbg !3230
  store i32 -1, ptr %retval, align 4, !dbg !3231
  br label %return, !dbg !3231

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !3232
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !3234
  %3 = load ptr, ptr %dfile, align 8, !dbg !3234
  %tobool2 = icmp ne ptr %3, null, !dbg !3232
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !3235

if.then3:                                         ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !3236
  %dfile4 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 3, !dbg !3238
  %5 = load ptr, ptr %dfile4, align 8, !dbg !3238
  %6 = load i32, ptr %owner.addr, align 4, !dbg !3239
  %7 = load i32, ptr %group.addr, align 4, !dbg !3240
  %call5 = call i32 @__df_chown(ptr noundef %5, i32 noundef %6, i32 noundef %7), !dbg !3241
  store i32 %call5, ptr %retval, align 4, !dbg !3242
  br label %return, !dbg !3242

if.end6:                                          ; preds = %if.end
  %8 = load i32, ptr %fd.addr, align 4, !dbg !3243
  %9 = load i32, ptr %owner.addr, align 4, !dbg !3244
  %10 = load i32, ptr %group.addr, align 4, !dbg !3245
  %call7 = call i64 (i64, ...) @syscall(i64 noundef 93, i32 noundef %8, i32 noundef %9, i32 noundef %10) #16, !dbg !3246
  %conv = trunc i64 %call7 to i32, !dbg !3246
  store i32 %conv, ptr %retval, align 4, !dbg !3247
  br label %return, !dbg !3247

return:                                           ; preds = %if.end6, %if.then3, %if.then
  %11 = load i32, ptr %retval, align 4, !dbg !3248
  ret i32 %11, !dbg !3248
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @lchown(ptr noundef nonnull %path, i32 noundef %owner, i32 noundef %group) #0 !dbg !3249 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %owner.addr = alloca i32, align 4
  %group.addr = alloca i32, align 4
  %df = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !3250, metadata !DIExpression()), !dbg !3251
  store i32 %owner, ptr %owner.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %owner.addr, metadata !3252, metadata !DIExpression()), !dbg !3253
  store i32 %group, ptr %group.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %group.addr, metadata !3254, metadata !DIExpression()), !dbg !3255
  call void @llvm.dbg.declare(metadata ptr %df, metadata !3256, metadata !DIExpression()), !dbg !3257
  %0 = load ptr, ptr %path.addr, align 8, !dbg !3258
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !3259
  store ptr %call, ptr %df, align 8, !dbg !3257
  %1 = load ptr, ptr %df, align 8, !dbg !3260
  %tobool = icmp ne ptr %1, null, !dbg !3260
  br i1 %tobool, label %if.then, label %if.end, !dbg !3262

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %df, align 8, !dbg !3263
  %3 = load i32, ptr %owner.addr, align 4, !dbg !3265
  %4 = load i32, ptr %group.addr, align 4, !dbg !3266
  %call1 = call i32 @__df_chown(ptr noundef %2, i32 noundef %3, i32 noundef %4), !dbg !3267
  store i32 %call1, ptr %retval, align 4, !dbg !3268
  br label %return, !dbg !3268

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %path.addr, align 8, !dbg !3269
  %call2 = call ptr @__concretize_string(ptr noundef %5), !dbg !3270
  %6 = load i32, ptr %owner.addr, align 4, !dbg !3271
  %7 = load i32, ptr %group.addr, align 4, !dbg !3272
  %call3 = call i64 (i64, ...) @syscall(i64 noundef 92, ptr noundef %call2, i32 noundef %6, i32 noundef %7) #16, !dbg !3273
  %conv = trunc i64 %call3 to i32, !dbg !3273
  store i32 %conv, ptr %retval, align 4, !dbg !3274
  br label %return, !dbg !3274

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !3275
  ret i32 %8, !dbg !3275
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_fstat(i32 noundef %fd, ptr noundef %buf) #0 !dbg !3276 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3277, metadata !DIExpression()), !dbg !3278
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !3279, metadata !DIExpression()), !dbg !3280
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3281, metadata !DIExpression()), !dbg !3282
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3283
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3284
  store ptr %call, ptr %f, align 8, !dbg !3282
  %1 = load ptr, ptr %f, align 8, !dbg !3285
  %tobool = icmp ne ptr %1, null, !dbg !3285
  br i1 %tobool, label %if.end, label %if.then, !dbg !3287

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3288
  store i32 9, ptr %call1, align 4, !dbg !3290
  store i32 -1, ptr %retval, align 4, !dbg !3291
  br label %return, !dbg !3291

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !3292
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !3294
  %3 = load ptr, ptr %dfile, align 8, !dbg !3294
  %tobool2 = icmp ne ptr %3, null, !dbg !3292
  br i1 %tobool2, label %if.end6, label %if.then3, !dbg !3295

if.then3:                                         ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !3296
  %fd4 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 0, !dbg !3298
  %5 = load i32, ptr %fd4, align 8, !dbg !3298
  %6 = load ptr, ptr %buf.addr, align 8, !dbg !3299
  %call5 = call i64 (i64, ...) @syscall(i64 noundef 5, i32 noundef %5, ptr noundef %6) #16, !dbg !3300
  %conv = trunc i64 %call5 to i32, !dbg !3300
  store i32 %conv, ptr %retval, align 4, !dbg !3301
  br label %return, !dbg !3301

if.end6:                                          ; preds = %if.end
  %7 = load ptr, ptr %buf.addr, align 8, !dbg !3302
  %8 = load ptr, ptr %f, align 8, !dbg !3303
  %dfile7 = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !3304
  %9 = load ptr, ptr %dfile7, align 8, !dbg !3304
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %9, i32 0, i32 2, !dbg !3305
  %10 = load ptr, ptr %stat, align 8, !dbg !3305
  %11 = call ptr @memcpy(ptr %7, ptr %10, i64 144), !dbg !3306
  store i32 0, ptr %retval, align 4, !dbg !3307
  br label %return, !dbg !3307

return:                                           ; preds = %if.end6, %if.then3, %if.then
  %12 = load i32, ptr %retval, align 4, !dbg !3308
  ret i32 %12, !dbg !3308
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_ftruncate(i32 noundef %fd, i64 noundef %length) #0 !dbg !445 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %length.addr = alloca i64, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3309, metadata !DIExpression()), !dbg !3310
  store i64 %length, ptr %length.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %length.addr, metadata !3311, metadata !DIExpression()), !dbg !3312
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3313, metadata !DIExpression()), !dbg !3314
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3315
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3316
  store ptr %call, ptr %f, align 8, !dbg !3314
  %1 = load i32, ptr @__fd_ftruncate.n_calls, align 4, !dbg !3317
  %inc = add nsw i32 %1, 1, !dbg !3317
  store i32 %inc, ptr @__fd_ftruncate.n_calls, align 4, !dbg !3317
  %2 = load ptr, ptr %f, align 8, !dbg !3318
  %tobool = icmp ne ptr %2, null, !dbg !3318
  br i1 %tobool, label %if.end, label %if.then, !dbg !3320

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3321
  store i32 9, ptr %call1, align 4, !dbg !3323
  store i32 -1, ptr %retval, align 4, !dbg !3324
  br label %return, !dbg !3324

if.end:                                           ; preds = %entry
  %3 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3325
  %tobool2 = icmp ne i32 %3, 0, !dbg !3327
  br i1 %tobool2, label %land.lhs.true, label %if.end5, !dbg !3328

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 9), align 8, !dbg !3329
  %5 = load i32, ptr %4, align 4, !dbg !3330
  %6 = load i32, ptr @__fd_ftruncate.n_calls, align 4, !dbg !3331
  %cmp = icmp eq i32 %5, %6, !dbg !3332
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !3333

if.then3:                                         ; preds = %land.lhs.true
  %7 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3334
  %dec = add i32 %7, -1, !dbg !3334
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3334
  %call4 = call ptr @__errno_location() #17, !dbg !3336
  store i32 5, ptr %call4, align 4, !dbg !3337
  store i32 -1, ptr %retval, align 4, !dbg !3338
  br label %return, !dbg !3338

if.end5:                                          ; preds = %land.lhs.true, %if.end
  %8 = load ptr, ptr %f, align 8, !dbg !3339
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !3341
  %9 = load ptr, ptr %dfile, align 8, !dbg !3341
  %tobool6 = icmp ne ptr %9, null, !dbg !3339
  br i1 %tobool6, label %if.then7, label %if.end9, !dbg !3342

if.then7:                                         ; preds = %if.end5
  call void @klee_warning(ptr noundef @.str.11.72), !dbg !3343
  %call8 = call ptr @__errno_location() #17, !dbg !3345
  store i32 5, ptr %call8, align 4, !dbg !3346
  store i32 -1, ptr %retval, align 4, !dbg !3347
  br label %return, !dbg !3347

if.end9:                                          ; preds = %if.end5
  %10 = load ptr, ptr %f, align 8, !dbg !3348
  %fd10 = getelementptr inbounds %struct.exe_file_t.6, ptr %10, i32 0, i32 0, !dbg !3349
  %11 = load i32, ptr %fd10, align 8, !dbg !3349
  %12 = load i64, ptr %length.addr, align 8, !dbg !3350
  %call11 = call i64 (i64, ...) @syscall(i64 noundef 77, i32 noundef %11, i64 noundef %12) #16, !dbg !3351
  %conv = trunc i64 %call11 to i32, !dbg !3351
  store i32 %conv, ptr %retval, align 4, !dbg !3352
  br label %return, !dbg !3352

return:                                           ; preds = %if.end9, %if.then7, %if.then3, %if.then
  %13 = load i32, ptr %retval, align 4, !dbg !3353
  ret i32 %13, !dbg !3353
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_getdents(i32 noundef %fd, ptr noundef %dirp, i32 noundef %count) #0 !dbg !3354 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %dirp.addr = alloca ptr, align 8
  %count.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %i = alloca i64, align 8
  %pad = alloca i64, align 8
  %bytes = alloca i64, align 8
  %df = alloca ptr, align 8
  %os_pos = alloca i64, align 8
  %s = alloca i64, align 8
  %res = alloca i32, align 4
  %pos = alloca i32, align 4
  %dp = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3357, metadata !DIExpression()), !dbg !3358
  store ptr %dirp, ptr %dirp.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %dirp.addr, metadata !3359, metadata !DIExpression()), !dbg !3360
  store i32 %count, ptr %count.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !3361, metadata !DIExpression()), !dbg !3362
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3363, metadata !DIExpression()), !dbg !3364
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3365
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3366
  store ptr %call, ptr %f, align 8, !dbg !3364
  %1 = load ptr, ptr %f, align 8, !dbg !3367
  %tobool = icmp ne ptr %1, null, !dbg !3367
  br i1 %tobool, label %if.end, label %if.then, !dbg !3369

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3370
  store i32 9, ptr %call1, align 4, !dbg !3372
  store i32 -1, ptr %retval, align 4, !dbg !3373
  br label %return, !dbg !3373

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !3374
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !3376
  %3 = load ptr, ptr %dfile, align 8, !dbg !3376
  %tobool2 = icmp ne ptr %3, null, !dbg !3374
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !3377

if.then3:                                         ; preds = %if.end
  call void @klee_warning(ptr noundef @.str.12.73), !dbg !3378
  %call4 = call ptr @__errno_location() #17, !dbg !3380
  store i32 22, ptr %call4, align 4, !dbg !3381
  store i32 -1, ptr %retval, align 4, !dbg !3382
  br label %return, !dbg !3382

if.else:                                          ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !3383
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 2, !dbg !3386
  %5 = load i64, ptr %off, align 8, !dbg !3386
  %cmp = icmp ult i64 %5, 4096, !dbg !3387
  br i1 %cmp, label %if.then5, label %if.else43, !dbg !3388

if.then5:                                         ; preds = %if.else
  call void @llvm.dbg.declare(metadata ptr %i, metadata !3389, metadata !DIExpression()), !dbg !3391
  call void @llvm.dbg.declare(metadata ptr %pad, metadata !3392, metadata !DIExpression()), !dbg !3393
  call void @llvm.dbg.declare(metadata ptr %bytes, metadata !3394, metadata !DIExpression()), !dbg !3395
  store i64 0, ptr %bytes, align 8, !dbg !3395
  %6 = load ptr, ptr %f, align 8, !dbg !3396
  %off6 = getelementptr inbounds %struct.exe_file_t.6, ptr %6, i32 0, i32 2, !dbg !3397
  %7 = load i64, ptr %off6, align 8, !dbg !3397
  %div = udiv i64 %7, 280, !dbg !3398
  store i64 %div, ptr %i, align 8, !dbg !3399
  %8 = load i64, ptr %i, align 8, !dbg !3400
  %mul = mul i64 %8, 280, !dbg !3402
  %9 = load ptr, ptr %f, align 8, !dbg !3403
  %off7 = getelementptr inbounds %struct.exe_file_t.6, ptr %9, i32 0, i32 2, !dbg !3404
  %10 = load i64, ptr %off7, align 8, !dbg !3404
  %cmp8 = icmp ne i64 %mul, %10, !dbg !3405
  br i1 %cmp8, label %if.then11, label %lor.lhs.false, !dbg !3406

lor.lhs.false:                                    ; preds = %if.then5
  %11 = load i64, ptr %i, align 8, !dbg !3407
  %12 = load i32, ptr @__exe_fs, align 8, !dbg !3408
  %conv = zext i32 %12 to i64, !dbg !3409
  %cmp9 = icmp sgt i64 %11, %conv, !dbg !3410
  br i1 %cmp9, label %if.then11, label %for.cond, !dbg !3411

if.then11:                                        ; preds = %lor.lhs.false, %if.then5
  %call12 = call ptr @__errno_location() #17, !dbg !3412
  store i32 22, ptr %call12, align 4, !dbg !3414
  store i32 -1, ptr %retval, align 4, !dbg !3415
  br label %return, !dbg !3415

for.cond:                                         ; preds = %lor.lhs.false, %for.body
  %13 = load i64, ptr %i, align 8, !dbg !3416
  %14 = load i32, ptr @__exe_fs, align 8, !dbg !3419
  %conv14 = zext i32 %14 to i64, !dbg !3420
  %cmp15 = icmp slt i64 %13, %conv14, !dbg !3421
  br i1 %cmp15, label %for.body, label %for.end, !dbg !3422

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata ptr %df, metadata !3423, metadata !DIExpression()), !dbg !3425
  %15 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8, !dbg !3426
  %16 = load i64, ptr %i, align 8, !dbg !3427
  %arrayidx = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %15, i64 %16, !dbg !3428
  store ptr %arrayidx, ptr %df, align 8, !dbg !3425
  %17 = load ptr, ptr %df, align 8, !dbg !3429
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %17, i32 0, i32 2, !dbg !3430
  %18 = load ptr, ptr %stat, align 8, !dbg !3430
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %18, i32 0, i32 1, !dbg !3431
  %19 = load i64, ptr %st_ino, align 8, !dbg !3431
  %20 = load ptr, ptr %dirp.addr, align 8, !dbg !3432
  %d_ino = getelementptr inbounds %struct.dirent64, ptr %20, i32 0, i32 0, !dbg !3433
  store i64 %19, ptr %d_ino, align 8, !dbg !3434
  %21 = load ptr, ptr %dirp.addr, align 8, !dbg !3435
  %d_reclen = getelementptr inbounds %struct.dirent64, ptr %21, i32 0, i32 2, !dbg !3436
  store i16 280, ptr %d_reclen, align 8, !dbg !3437
  %22 = load ptr, ptr %df, align 8, !dbg !3438
  %stat17 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %22, i32 0, i32 2, !dbg !3438
  %23 = load ptr, ptr %stat17, align 8, !dbg !3438
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %23, i32 0, i32 3, !dbg !3438
  %24 = load i32, ptr %st_mode, align 8, !dbg !3438
  %and = and i32 %24, 61440, !dbg !3438
  %shr = lshr i32 %and, 12, !dbg !3438
  %conv18 = trunc i32 %shr to i8, !dbg !3438
  %25 = load ptr, ptr %dirp.addr, align 8, !dbg !3439
  %d_type = getelementptr inbounds %struct.dirent64, ptr %25, i32 0, i32 3, !dbg !3440
  store i8 %conv18, ptr %d_type, align 2, !dbg !3441
  %26 = load i64, ptr %i, align 8, !dbg !3442
  %add = add nsw i64 65, %26, !dbg !3443
  %conv19 = trunc i64 %add to i8, !dbg !3444
  %27 = load ptr, ptr %dirp.addr, align 8, !dbg !3445
  %d_name = getelementptr inbounds %struct.dirent64, ptr %27, i32 0, i32 4, !dbg !3446
  %arrayidx20 = getelementptr inbounds [256 x i8], ptr %d_name, i64 0, i64 0, !dbg !3445
  store i8 %conv19, ptr %arrayidx20, align 1, !dbg !3447
  %28 = load ptr, ptr %dirp.addr, align 8, !dbg !3448
  %d_name21 = getelementptr inbounds %struct.dirent64, ptr %28, i32 0, i32 4, !dbg !3449
  %arrayidx22 = getelementptr inbounds [256 x i8], ptr %d_name21, i64 0, i64 1, !dbg !3448
  store i8 0, ptr %arrayidx22, align 1, !dbg !3450
  %29 = load i64, ptr %i, align 8, !dbg !3451
  %add23 = add nsw i64 %29, 1, !dbg !3452
  %mul24 = mul i64 %add23, 280, !dbg !3453
  %30 = load ptr, ptr %dirp.addr, align 8, !dbg !3454
  %d_off = getelementptr inbounds %struct.dirent64, ptr %30, i32 0, i32 1, !dbg !3455
  store i64 %mul24, ptr %d_off, align 8, !dbg !3456
  %31 = load ptr, ptr %dirp.addr, align 8, !dbg !3457
  %d_reclen25 = getelementptr inbounds %struct.dirent64, ptr %31, i32 0, i32 2, !dbg !3458
  %32 = load i16, ptr %d_reclen25, align 8, !dbg !3458
  %conv26 = zext i16 %32 to i64, !dbg !3457
  %33 = load i64, ptr %bytes, align 8, !dbg !3459
  %add27 = add nsw i64 %33, %conv26, !dbg !3459
  store i64 %add27, ptr %bytes, align 8, !dbg !3459
  %34 = load ptr, ptr %dirp.addr, align 8, !dbg !3460
  %incdec.ptr = getelementptr inbounds %struct.dirent64, ptr %34, i32 1, !dbg !3460
  store ptr %incdec.ptr, ptr %dirp.addr, align 8, !dbg !3460
  %35 = load i64, ptr %i, align 8, !dbg !3461
  %inc = add nsw i64 %35, 1, !dbg !3461
  store i64 %inc, ptr %i, align 8, !dbg !3461
  br label %for.cond, !dbg !3462, !llvm.loop !3463

for.end:                                          ; preds = %for.cond
  %36 = load i32, ptr %count.addr, align 4, !dbg !3465
  %cmp28 = icmp uge i32 %36, 4096, !dbg !3466
  %37 = load i32, ptr %count.addr, align 4, !dbg !3465
  %cond = select i1 %cmp28, i32 4096, i32 %37, !dbg !3465
  %conv30 = zext i32 %cond to i64, !dbg !3465
  store i64 %conv30, ptr %pad, align 8, !dbg !3467
  %38 = load ptr, ptr %dirp.addr, align 8, !dbg !3468
  %d_ino31 = getelementptr inbounds %struct.dirent64, ptr %38, i32 0, i32 0, !dbg !3469
  store i64 0, ptr %d_ino31, align 8, !dbg !3470
  %39 = load i64, ptr %pad, align 8, !dbg !3471
  %40 = load i64, ptr %bytes, align 8, !dbg !3472
  %sub = sub nsw i64 %39, %40, !dbg !3473
  %conv32 = trunc i64 %sub to i16, !dbg !3471
  %41 = load ptr, ptr %dirp.addr, align 8, !dbg !3474
  %d_reclen33 = getelementptr inbounds %struct.dirent64, ptr %41, i32 0, i32 2, !dbg !3475
  store i16 %conv32, ptr %d_reclen33, align 8, !dbg !3476
  %42 = load ptr, ptr %dirp.addr, align 8, !dbg !3477
  %d_type34 = getelementptr inbounds %struct.dirent64, ptr %42, i32 0, i32 3, !dbg !3478
  store i8 0, ptr %d_type34, align 2, !dbg !3479
  %43 = load ptr, ptr %dirp.addr, align 8, !dbg !3480
  %d_name35 = getelementptr inbounds %struct.dirent64, ptr %43, i32 0, i32 4, !dbg !3481
  %arrayidx36 = getelementptr inbounds [256 x i8], ptr %d_name35, i64 0, i64 0, !dbg !3480
  store i8 0, ptr %arrayidx36, align 1, !dbg !3482
  %44 = load ptr, ptr %dirp.addr, align 8, !dbg !3483
  %d_off37 = getelementptr inbounds %struct.dirent64, ptr %44, i32 0, i32 1, !dbg !3484
  store i64 4096, ptr %d_off37, align 8, !dbg !3485
  %45 = load ptr, ptr %dirp.addr, align 8, !dbg !3486
  %d_reclen38 = getelementptr inbounds %struct.dirent64, ptr %45, i32 0, i32 2, !dbg !3487
  %46 = load i16, ptr %d_reclen38, align 8, !dbg !3487
  %conv39 = zext i16 %46 to i64, !dbg !3486
  %47 = load i64, ptr %bytes, align 8, !dbg !3488
  %add40 = add nsw i64 %47, %conv39, !dbg !3488
  store i64 %add40, ptr %bytes, align 8, !dbg !3488
  %48 = load i64, ptr %pad, align 8, !dbg !3489
  %49 = load ptr, ptr %f, align 8, !dbg !3490
  %off41 = getelementptr inbounds %struct.exe_file_t.6, ptr %49, i32 0, i32 2, !dbg !3491
  store i64 %48, ptr %off41, align 8, !dbg !3492
  %50 = load i64, ptr %bytes, align 8, !dbg !3493
  %conv42 = trunc i64 %50 to i32, !dbg !3493
  store i32 %conv42, ptr %retval, align 4, !dbg !3494
  br label %return, !dbg !3494

if.else43:                                        ; preds = %if.else
  call void @llvm.dbg.declare(metadata ptr %os_pos, metadata !3495, metadata !DIExpression()), !dbg !3497
  %51 = load ptr, ptr %f, align 8, !dbg !3498
  %off44 = getelementptr inbounds %struct.exe_file_t.6, ptr %51, i32 0, i32 2, !dbg !3499
  %52 = load i64, ptr %off44, align 8, !dbg !3499
  %sub45 = sub nsw i64 %52, 4096, !dbg !3500
  store i64 %sub45, ptr %os_pos, align 8, !dbg !3497
  %53 = load ptr, ptr %dirp.addr, align 8, !dbg !3501
  %54 = load i32, ptr %count.addr, align 4, !dbg !3502
  %conv46 = zext i32 %54 to i64, !dbg !3502
  %55 = call ptr @memset(ptr %53, i32 0, i64 %conv46), !dbg !3503
  call void @llvm.dbg.declare(metadata ptr %s, metadata !3504, metadata !DIExpression()), !dbg !3505
  %56 = load ptr, ptr %f, align 8, !dbg !3506
  %fd47 = getelementptr inbounds %struct.exe_file_t.6, ptr %56, i32 0, i32 0, !dbg !3507
  %57 = load i32, ptr %fd47, align 8, !dbg !3507
  %58 = load i64, ptr %os_pos, align 8, !dbg !3508
  %call48 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %57, i64 noundef %58, i32 noundef 0) #16, !dbg !3509
  store i64 %call48, ptr %s, align 8, !dbg !3505
  %59 = load i64, ptr %s, align 8, !dbg !3510
  %60 = load i64, ptr %s, align 8, !dbg !3511
  %cmp49 = icmp ne i64 %60, -1, !dbg !3511
  br i1 %cmp49, label %if.end53, label %if.else52, !dbg !3514

if.else52:                                        ; preds = %if.else43
  call void @__assert_fail(ptr noundef @.str.13.74, ptr noundef @.str.4.64, i32 noundef 830, ptr noundef @__PRETTY_FUNCTION__.__fd_getdents) #15, !dbg !3511
  unreachable, !dbg !3511

if.end53:                                         ; preds = %if.else43
  call void @llvm.dbg.declare(metadata ptr %res, metadata !3515, metadata !DIExpression()), !dbg !3516
  %61 = load ptr, ptr %f, align 8, !dbg !3517
  %fd54 = getelementptr inbounds %struct.exe_file_t.6, ptr %61, i32 0, i32 0, !dbg !3518
  %62 = load i32, ptr %fd54, align 8, !dbg !3518
  %63 = load ptr, ptr %dirp.addr, align 8, !dbg !3519
  %64 = load i32, ptr %count.addr, align 4, !dbg !3520
  %call55 = call i64 (i64, ...) @syscall(i64 noundef 217, i32 noundef %62, ptr noundef %63, i32 noundef %64) #16, !dbg !3521
  %conv56 = trunc i64 %call55 to i32, !dbg !3521
  store i32 %conv56, ptr %res, align 4, !dbg !3516
  %65 = load i32, ptr %res, align 4, !dbg !3522
  %cmp57 = icmp sgt i32 %65, -1, !dbg !3524
  br i1 %cmp57, label %if.then59, label %if.end78, !dbg !3525

if.then59:                                        ; preds = %if.end53
  call void @llvm.dbg.declare(metadata ptr %pos, metadata !3526, metadata !DIExpression()), !dbg !3528
  store i32 0, ptr %pos, align 4, !dbg !3528
  %66 = load ptr, ptr %f, align 8, !dbg !3529
  %fd60 = getelementptr inbounds %struct.exe_file_t.6, ptr %66, i32 0, i32 0, !dbg !3530
  %67 = load i32, ptr %fd60, align 8, !dbg !3530
  %call61 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %67, i32 noundef 0, i32 noundef 1) #16, !dbg !3531
  %68 = load ptr, ptr %f, align 8, !dbg !3532
  %off62 = getelementptr inbounds %struct.exe_file_t.6, ptr %68, i32 0, i32 2, !dbg !3533
  store i64 %call61, ptr %off62, align 8, !dbg !3534
  %69 = load ptr, ptr %f, align 8, !dbg !3535
  %off63 = getelementptr inbounds %struct.exe_file_t.6, ptr %69, i32 0, i32 2, !dbg !3535
  %70 = load i64, ptr %off63, align 8, !dbg !3535
  %cmp64 = icmp ne i64 %70, -1, !dbg !3535
  br i1 %cmp64, label %if.end68, label %if.else67, !dbg !3538

if.else67:                                        ; preds = %if.then59
  call void @__assert_fail(ptr noundef @.str.14.75, ptr noundef @.str.4.64, i32 noundef 835, ptr noundef @__PRETTY_FUNCTION__.__fd_getdents) #15, !dbg !3535
  unreachable, !dbg !3535

if.end68:                                         ; preds = %if.then59
  %71 = load ptr, ptr %f, align 8, !dbg !3539
  %off69 = getelementptr inbounds %struct.exe_file_t.6, ptr %71, i32 0, i32 2, !dbg !3540
  %72 = load i64, ptr %off69, align 8, !dbg !3541
  %add70 = add nsw i64 %72, 4096, !dbg !3541
  store i64 %add70, ptr %off69, align 8, !dbg !3541
  br label %while.cond, !dbg !3542

while.cond:                                       ; preds = %while.body, %if.end68
  %73 = load i32, ptr %pos, align 4, !dbg !3543
  %74 = load i32, ptr %res, align 4, !dbg !3544
  %cmp71 = icmp slt i32 %73, %74, !dbg !3545
  br i1 %cmp71, label %while.body, label %if.end78, !dbg !3542

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata ptr %dp, metadata !3546, metadata !DIExpression()), !dbg !3548
  %75 = load ptr, ptr %dirp.addr, align 8, !dbg !3549
  %76 = load i32, ptr %pos, align 4, !dbg !3550
  %idx.ext = sext i32 %76 to i64, !dbg !3551
  %add.ptr = getelementptr inbounds i8, ptr %75, i64 %idx.ext, !dbg !3551
  store ptr %add.ptr, ptr %dp, align 8, !dbg !3548
  %77 = load ptr, ptr %dp, align 8, !dbg !3552
  %d_off73 = getelementptr inbounds %struct.dirent64, ptr %77, i32 0, i32 1, !dbg !3553
  %78 = load i64, ptr %d_off73, align 8, !dbg !3554
  %add74 = add nsw i64 %78, 4096, !dbg !3554
  store i64 %add74, ptr %d_off73, align 8, !dbg !3554
  %79 = load ptr, ptr %dp, align 8, !dbg !3555
  %d_reclen75 = getelementptr inbounds %struct.dirent64, ptr %79, i32 0, i32 2, !dbg !3556
  %80 = load i16, ptr %d_reclen75, align 8, !dbg !3556
  %conv76 = zext i16 %80 to i32, !dbg !3555
  %81 = load i32, ptr %pos, align 4, !dbg !3557
  %add77 = add nsw i32 %81, %conv76, !dbg !3557
  store i32 %add77, ptr %pos, align 4, !dbg !3557
  br label %while.cond, !dbg !3542, !llvm.loop !3558

if.end78:                                         ; preds = %while.cond, %if.end53
  %82 = load i32, ptr %res, align 4, !dbg !3560
  store i32 %82, ptr %retval, align 4, !dbg !3561
  br label %return, !dbg !3561

return:                                           ; preds = %if.end78, %for.end, %if.then11, %if.then3, %if.then
  %83 = load i32, ptr %retval, align 4, !dbg !3562
  ret i32 %83, !dbg !3562
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ioctl(i32 noundef %fd, i64 noundef %request, ...) #0 !dbg !3563 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %request.addr = alloca i64, align 8
  %f = alloca ptr, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %buf = alloca ptr, align 8
  %stat = alloca ptr, align 8
  %ts = alloca ptr, align 8
  %ws = alloca ptr, align 8
  %res = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3566, metadata !DIExpression()), !dbg !3567
  store i64 %request, ptr %request.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %request.addr, metadata !3568, metadata !DIExpression()), !dbg !3569
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3570, metadata !DIExpression()), !dbg !3571
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3572
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3573
  store ptr %call, ptr %f, align 8, !dbg !3571
  call void @llvm.dbg.declare(metadata ptr %ap, metadata !3574, metadata !DIExpression()), !dbg !3590
  call void @llvm.dbg.declare(metadata ptr %buf, metadata !3591, metadata !DIExpression()), !dbg !3592
  %1 = load ptr, ptr %f, align 8, !dbg !3593
  %tobool = icmp ne ptr %1, null, !dbg !3593
  br i1 %tobool, label %if.end, label %if.then, !dbg !3595

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3596
  store i32 9, ptr %call1, align 4, !dbg !3598
  store i32 -1, ptr %retval, align 4, !dbg !3599
  br label %return, !dbg !3599

if.end:                                           ; preds = %entry
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3600
  call void @llvm.va_start(ptr %arraydecay), !dbg !3600
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3601
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay2, i32 0, i32 0, !dbg !3601
  %gp_offset = load i32, ptr %gp_offset_p, align 16, !dbg !3601
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !3601
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !3601

vaarg.in_reg:                                     ; preds = %if.end
  %2 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay2, i32 0, i32 3, !dbg !3601
  %reg_save_area = load ptr, ptr %2, align 16, !dbg !3601
  %3 = getelementptr i8, ptr %reg_save_area, i32 %gp_offset, !dbg !3601
  %4 = add i32 %gp_offset, 8, !dbg !3601
  store i32 %4, ptr %gp_offset_p, align 16, !dbg !3601
  br label %vaarg.end, !dbg !3601

vaarg.in_mem:                                     ; preds = %if.end
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay2, i32 0, i32 2, !dbg !3601
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8, !dbg !3601
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8, !dbg !3601
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8, !dbg !3601
  br label %vaarg.end, !dbg !3601

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %3, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ], !dbg !3601
  %5 = load ptr, ptr %vaarg.addr, align 8, !dbg !3601
  store ptr %5, ptr %buf, align 8, !dbg !3602
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3603
  call void @llvm.va_end(ptr %arraydecay3), !dbg !3603
  %6 = load ptr, ptr %f, align 8, !dbg !3604
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %6, i32 0, i32 3, !dbg !3606
  %7 = load ptr, ptr %dfile, align 8, !dbg !3606
  %tobool4 = icmp ne ptr %7, null, !dbg !3604
  br i1 %tobool4, label %if.then5, label %if.end101, !dbg !3607

if.then5:                                         ; preds = %vaarg.end
  call void @llvm.dbg.declare(metadata ptr %stat, metadata !3608, metadata !DIExpression()), !dbg !3610
  %8 = load ptr, ptr %f, align 8, !dbg !3611
  %dfile6 = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !3612
  %9 = load ptr, ptr %dfile6, align 8, !dbg !3612
  %stat7 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %9, i32 0, i32 2, !dbg !3613
  %10 = load ptr, ptr %stat7, align 8, !dbg !3613
  store ptr %10, ptr %stat, align 8, !dbg !3610
  %11 = load i64, ptr %request.addr, align 8, !dbg !3614
  switch i64 %11, label %sw.default [
    i64 21505, label %sw.bb
    i64 21506, label %sw.bb46
    i64 21507, label %sw.bb53
    i64 21508, label %sw.bb58
    i64 21523, label %sw.bb65
    i64 21524, label %sw.bb72
    i64 21531, label %sw.bb80
    i64 2150657282, label %sw.bb98
  ], !dbg !3615

sw.bb:                                            ; preds = %if.then5
  call void @llvm.dbg.declare(metadata ptr %ts, metadata !3616, metadata !DIExpression()), !dbg !3636
  %12 = load ptr, ptr %buf, align 8, !dbg !3637
  store ptr %12, ptr %ts, align 8, !dbg !3636
  call void @klee_warning_once(ptr noundef @.str.15.76), !dbg !3638
  %13 = load ptr, ptr %stat, align 8, !dbg !3639
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %13, i32 0, i32 3, !dbg !3639
  %14 = load i32, ptr %st_mode, align 8, !dbg !3639
  %and = and i32 %14, 61440, !dbg !3639
  %cmp = icmp eq i32 %and, 8192, !dbg !3639
  br i1 %cmp, label %if.then8, label %if.else, !dbg !3641

if.then8:                                         ; preds = %sw.bb
  %15 = load ptr, ptr %ts, align 8, !dbg !3642
  %c_iflag = getelementptr inbounds %struct.termios, ptr %15, i32 0, i32 0, !dbg !3644
  store i32 27906, ptr %c_iflag, align 4, !dbg !3645
  %16 = load ptr, ptr %ts, align 8, !dbg !3646
  %c_oflag = getelementptr inbounds %struct.termios, ptr %16, i32 0, i32 1, !dbg !3647
  store i32 5, ptr %c_oflag, align 4, !dbg !3648
  %17 = load ptr, ptr %ts, align 8, !dbg !3649
  %c_cflag = getelementptr inbounds %struct.termios, ptr %17, i32 0, i32 2, !dbg !3650
  store i32 1215, ptr %c_cflag, align 4, !dbg !3651
  %18 = load ptr, ptr %ts, align 8, !dbg !3652
  %c_lflag = getelementptr inbounds %struct.termios, ptr %18, i32 0, i32 3, !dbg !3653
  store i32 35287, ptr %c_lflag, align 4, !dbg !3654
  %19 = load ptr, ptr %ts, align 8, !dbg !3655
  %c_line = getelementptr inbounds %struct.termios, ptr %19, i32 0, i32 4, !dbg !3656
  store i8 0, ptr %c_line, align 4, !dbg !3657
  %20 = load ptr, ptr %ts, align 8, !dbg !3658
  %c_cc = getelementptr inbounds %struct.termios, ptr %20, i32 0, i32 5, !dbg !3659
  %arrayidx = getelementptr inbounds [32 x i8], ptr %c_cc, i64 0, i64 0, !dbg !3658
  store i8 3, ptr %arrayidx, align 1, !dbg !3660
  %21 = load ptr, ptr %ts, align 8, !dbg !3661
  %c_cc9 = getelementptr inbounds %struct.termios, ptr %21, i32 0, i32 5, !dbg !3662
  %arrayidx10 = getelementptr inbounds [32 x i8], ptr %c_cc9, i64 0, i64 1, !dbg !3661
  store i8 28, ptr %arrayidx10, align 1, !dbg !3663
  %22 = load ptr, ptr %ts, align 8, !dbg !3664
  %c_cc11 = getelementptr inbounds %struct.termios, ptr %22, i32 0, i32 5, !dbg !3665
  %arrayidx12 = getelementptr inbounds [32 x i8], ptr %c_cc11, i64 0, i64 2, !dbg !3664
  store i8 127, ptr %arrayidx12, align 1, !dbg !3666
  %23 = load ptr, ptr %ts, align 8, !dbg !3667
  %c_cc13 = getelementptr inbounds %struct.termios, ptr %23, i32 0, i32 5, !dbg !3668
  %arrayidx14 = getelementptr inbounds [32 x i8], ptr %c_cc13, i64 0, i64 3, !dbg !3667
  store i8 21, ptr %arrayidx14, align 1, !dbg !3669
  %24 = load ptr, ptr %ts, align 8, !dbg !3670
  %c_cc15 = getelementptr inbounds %struct.termios, ptr %24, i32 0, i32 5, !dbg !3671
  %arrayidx16 = getelementptr inbounds [32 x i8], ptr %c_cc15, i64 0, i64 4, !dbg !3670
  store i8 4, ptr %arrayidx16, align 1, !dbg !3672
  %25 = load ptr, ptr %ts, align 8, !dbg !3673
  %c_cc17 = getelementptr inbounds %struct.termios, ptr %25, i32 0, i32 5, !dbg !3674
  %arrayidx18 = getelementptr inbounds [32 x i8], ptr %c_cc17, i64 0, i64 5, !dbg !3673
  store i8 0, ptr %arrayidx18, align 1, !dbg !3675
  %26 = load ptr, ptr %ts, align 8, !dbg !3676
  %c_cc19 = getelementptr inbounds %struct.termios, ptr %26, i32 0, i32 5, !dbg !3677
  %arrayidx20 = getelementptr inbounds [32 x i8], ptr %c_cc19, i64 0, i64 6, !dbg !3676
  store i8 1, ptr %arrayidx20, align 1, !dbg !3678
  %27 = load ptr, ptr %ts, align 8, !dbg !3679
  %c_cc21 = getelementptr inbounds %struct.termios, ptr %27, i32 0, i32 5, !dbg !3680
  %arrayidx22 = getelementptr inbounds [32 x i8], ptr %c_cc21, i64 0, i64 7, !dbg !3679
  store i8 -1, ptr %arrayidx22, align 1, !dbg !3681
  %28 = load ptr, ptr %ts, align 8, !dbg !3682
  %c_cc23 = getelementptr inbounds %struct.termios, ptr %28, i32 0, i32 5, !dbg !3683
  %arrayidx24 = getelementptr inbounds [32 x i8], ptr %c_cc23, i64 0, i64 8, !dbg !3682
  store i8 17, ptr %arrayidx24, align 1, !dbg !3684
  %29 = load ptr, ptr %ts, align 8, !dbg !3685
  %c_cc25 = getelementptr inbounds %struct.termios, ptr %29, i32 0, i32 5, !dbg !3686
  %arrayidx26 = getelementptr inbounds [32 x i8], ptr %c_cc25, i64 0, i64 9, !dbg !3685
  store i8 19, ptr %arrayidx26, align 1, !dbg !3687
  %30 = load ptr, ptr %ts, align 8, !dbg !3688
  %c_cc27 = getelementptr inbounds %struct.termios, ptr %30, i32 0, i32 5, !dbg !3689
  %arrayidx28 = getelementptr inbounds [32 x i8], ptr %c_cc27, i64 0, i64 10, !dbg !3688
  store i8 26, ptr %arrayidx28, align 1, !dbg !3690
  %31 = load ptr, ptr %ts, align 8, !dbg !3691
  %c_cc29 = getelementptr inbounds %struct.termios, ptr %31, i32 0, i32 5, !dbg !3692
  %arrayidx30 = getelementptr inbounds [32 x i8], ptr %c_cc29, i64 0, i64 11, !dbg !3691
  store i8 -1, ptr %arrayidx30, align 1, !dbg !3693
  %32 = load ptr, ptr %ts, align 8, !dbg !3694
  %c_cc31 = getelementptr inbounds %struct.termios, ptr %32, i32 0, i32 5, !dbg !3695
  %arrayidx32 = getelementptr inbounds [32 x i8], ptr %c_cc31, i64 0, i64 12, !dbg !3694
  store i8 18, ptr %arrayidx32, align 1, !dbg !3696
  %33 = load ptr, ptr %ts, align 8, !dbg !3697
  %c_cc33 = getelementptr inbounds %struct.termios, ptr %33, i32 0, i32 5, !dbg !3698
  %arrayidx34 = getelementptr inbounds [32 x i8], ptr %c_cc33, i64 0, i64 13, !dbg !3697
  store i8 15, ptr %arrayidx34, align 1, !dbg !3699
  %34 = load ptr, ptr %ts, align 8, !dbg !3700
  %c_cc35 = getelementptr inbounds %struct.termios, ptr %34, i32 0, i32 5, !dbg !3701
  %arrayidx36 = getelementptr inbounds [32 x i8], ptr %c_cc35, i64 0, i64 14, !dbg !3700
  store i8 23, ptr %arrayidx36, align 1, !dbg !3702
  %35 = load ptr, ptr %ts, align 8, !dbg !3703
  %c_cc37 = getelementptr inbounds %struct.termios, ptr %35, i32 0, i32 5, !dbg !3704
  %arrayidx38 = getelementptr inbounds [32 x i8], ptr %c_cc37, i64 0, i64 15, !dbg !3703
  store i8 22, ptr %arrayidx38, align 1, !dbg !3705
  %36 = load ptr, ptr %ts, align 8, !dbg !3706
  %c_cc39 = getelementptr inbounds %struct.termios, ptr %36, i32 0, i32 5, !dbg !3707
  %arrayidx40 = getelementptr inbounds [32 x i8], ptr %c_cc39, i64 0, i64 16, !dbg !3706
  store i8 -1, ptr %arrayidx40, align 1, !dbg !3708
  %37 = load ptr, ptr %ts, align 8, !dbg !3709
  %c_cc41 = getelementptr inbounds %struct.termios, ptr %37, i32 0, i32 5, !dbg !3710
  %arrayidx42 = getelementptr inbounds [32 x i8], ptr %c_cc41, i64 0, i64 17, !dbg !3709
  store i8 0, ptr %arrayidx42, align 1, !dbg !3711
  %38 = load ptr, ptr %ts, align 8, !dbg !3712
  %c_cc43 = getelementptr inbounds %struct.termios, ptr %38, i32 0, i32 5, !dbg !3713
  %arrayidx44 = getelementptr inbounds [32 x i8], ptr %c_cc43, i64 0, i64 18, !dbg !3712
  store i8 0, ptr %arrayidx44, align 1, !dbg !3714
  store i32 0, ptr %retval, align 4, !dbg !3715
  br label %return, !dbg !3715

if.else:                                          ; preds = %sw.bb
  %call45 = call ptr @__errno_location() #17, !dbg !3716
  store i32 25, ptr %call45, align 4, !dbg !3718
  store i32 -1, ptr %retval, align 4, !dbg !3719
  br label %return, !dbg !3719

sw.bb46:                                          ; preds = %if.then5
  call void @klee_warning_once(ptr noundef @.str.16.77), !dbg !3720
  %39 = load ptr, ptr %stat, align 8, !dbg !3722
  %st_mode47 = getelementptr inbounds %struct.stat64.9, ptr %39, i32 0, i32 3, !dbg !3722
  %40 = load i32, ptr %st_mode47, align 8, !dbg !3722
  %and48 = and i32 %40, 61440, !dbg !3722
  %cmp49 = icmp eq i32 %and48, 8192, !dbg !3722
  br i1 %cmp49, label %if.then50, label %if.else51, !dbg !3724

if.then50:                                        ; preds = %sw.bb46
  store i32 0, ptr %retval, align 4, !dbg !3725
  br label %return, !dbg !3725

if.else51:                                        ; preds = %sw.bb46
  %call52 = call ptr @__errno_location() #17, !dbg !3727
  store i32 25, ptr %call52, align 4, !dbg !3729
  store i32 -1, ptr %retval, align 4, !dbg !3730
  br label %return, !dbg !3730

sw.bb53:                                          ; preds = %if.then5
  call void @klee_warning_once(ptr noundef @.str.17.78), !dbg !3731
  %41 = load i32, ptr %fd.addr, align 4, !dbg !3733
  %cmp54 = icmp eq i32 %41, 0, !dbg !3735
  br i1 %cmp54, label %if.then55, label %if.else56, !dbg !3736

if.then55:                                        ; preds = %sw.bb53
  store i32 0, ptr %retval, align 4, !dbg !3737
  br label %return, !dbg !3737

if.else56:                                        ; preds = %sw.bb53
  %call57 = call ptr @__errno_location() #17, !dbg !3739
  store i32 25, ptr %call57, align 4, !dbg !3741
  store i32 -1, ptr %retval, align 4, !dbg !3742
  br label %return, !dbg !3742

sw.bb58:                                          ; preds = %if.then5
  call void @klee_warning_once(ptr noundef @.str.18.79), !dbg !3743
  %42 = load ptr, ptr %stat, align 8, !dbg !3745
  %st_mode59 = getelementptr inbounds %struct.stat64.9, ptr %42, i32 0, i32 3, !dbg !3745
  %43 = load i32, ptr %st_mode59, align 8, !dbg !3745
  %and60 = and i32 %43, 61440, !dbg !3745
  %cmp61 = icmp eq i32 %and60, 8192, !dbg !3745
  br i1 %cmp61, label %if.then62, label %if.else63, !dbg !3747

if.then62:                                        ; preds = %sw.bb58
  store i32 0, ptr %retval, align 4, !dbg !3748
  br label %return, !dbg !3748

if.else63:                                        ; preds = %sw.bb58
  %call64 = call ptr @__errno_location() #17, !dbg !3750
  store i32 25, ptr %call64, align 4, !dbg !3752
  store i32 -1, ptr %retval, align 4, !dbg !3753
  br label %return, !dbg !3753

sw.bb65:                                          ; preds = %if.then5
  call void @llvm.dbg.declare(metadata ptr %ws, metadata !3754, metadata !DIExpression()), !dbg !3764
  %44 = load ptr, ptr %buf, align 8, !dbg !3765
  store ptr %44, ptr %ws, align 8, !dbg !3764
  %45 = load ptr, ptr %ws, align 8, !dbg !3766
  %ws_row = getelementptr inbounds %struct.winsize, ptr %45, i32 0, i32 0, !dbg !3767
  store i16 24, ptr %ws_row, align 2, !dbg !3768
  %46 = load ptr, ptr %ws, align 8, !dbg !3769
  %ws_col = getelementptr inbounds %struct.winsize, ptr %46, i32 0, i32 1, !dbg !3770
  store i16 80, ptr %ws_col, align 2, !dbg !3771
  call void @klee_warning_once(ptr noundef @.str.19.80), !dbg !3772
  %47 = load ptr, ptr %stat, align 8, !dbg !3773
  %st_mode66 = getelementptr inbounds %struct.stat64.9, ptr %47, i32 0, i32 3, !dbg !3773
  %48 = load i32, ptr %st_mode66, align 8, !dbg !3773
  %and67 = and i32 %48, 61440, !dbg !3773
  %cmp68 = icmp eq i32 %and67, 8192, !dbg !3773
  br i1 %cmp68, label %if.then69, label %if.else70, !dbg !3775

if.then69:                                        ; preds = %sw.bb65
  store i32 0, ptr %retval, align 4, !dbg !3776
  br label %return, !dbg !3776

if.else70:                                        ; preds = %sw.bb65
  %call71 = call ptr @__errno_location() #17, !dbg !3778
  store i32 25, ptr %call71, align 4, !dbg !3780
  store i32 -1, ptr %retval, align 4, !dbg !3781
  br label %return, !dbg !3781

sw.bb72:                                          ; preds = %if.then5
  call void @klee_warning_once(ptr noundef @.str.20.81), !dbg !3782
  %49 = load ptr, ptr %stat, align 8, !dbg !3784
  %st_mode73 = getelementptr inbounds %struct.stat64.9, ptr %49, i32 0, i32 3, !dbg !3784
  %50 = load i32, ptr %st_mode73, align 8, !dbg !3784
  %and74 = and i32 %50, 61440, !dbg !3784
  %cmp75 = icmp eq i32 %and74, 8192, !dbg !3784
  br i1 %cmp75, label %if.then76, label %if.else78, !dbg !3786

if.then76:                                        ; preds = %sw.bb72
  %call77 = call ptr @__errno_location() #17, !dbg !3787
  store i32 22, ptr %call77, align 4, !dbg !3789
  store i32 -1, ptr %retval, align 4, !dbg !3790
  br label %return, !dbg !3790

if.else78:                                        ; preds = %sw.bb72
  %call79 = call ptr @__errno_location() #17, !dbg !3791
  store i32 25, ptr %call79, align 4, !dbg !3793
  store i32 -1, ptr %retval, align 4, !dbg !3794
  br label %return, !dbg !3794

sw.bb80:                                          ; preds = %if.then5
  call void @llvm.dbg.declare(metadata ptr %res, metadata !3795, metadata !DIExpression()), !dbg !3797
  %51 = load ptr, ptr %buf, align 8, !dbg !3798
  store ptr %51, ptr %res, align 8, !dbg !3797
  call void @klee_warning_once(ptr noundef @.str.21.82), !dbg !3799
  %52 = load ptr, ptr %stat, align 8, !dbg !3800
  %st_mode81 = getelementptr inbounds %struct.stat64.9, ptr %52, i32 0, i32 3, !dbg !3800
  %53 = load i32, ptr %st_mode81, align 8, !dbg !3800
  %and82 = and i32 %53, 61440, !dbg !3800
  %cmp83 = icmp eq i32 %and82, 8192, !dbg !3800
  br i1 %cmp83, label %if.then84, label %if.else96, !dbg !3802

if.then84:                                        ; preds = %sw.bb80
  %54 = load ptr, ptr %f, align 8, !dbg !3803
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %54, i32 0, i32 2, !dbg !3806
  %55 = load i64, ptr %off, align 8, !dbg !3806
  %56 = load ptr, ptr %f, align 8, !dbg !3807
  %dfile85 = getelementptr inbounds %struct.exe_file_t.6, ptr %56, i32 0, i32 3, !dbg !3808
  %57 = load ptr, ptr %dfile85, align 8, !dbg !3808
  %size = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %57, i32 0, i32 0, !dbg !3809
  %58 = load i32, ptr %size, align 8, !dbg !3809
  %conv = zext i32 %58 to i64, !dbg !3810
  %cmp86 = icmp slt i64 %55, %conv, !dbg !3811
  br i1 %cmp86, label %if.then88, label %if.else94, !dbg !3812

if.then88:                                        ; preds = %if.then84
  %59 = load ptr, ptr %f, align 8, !dbg !3813
  %dfile89 = getelementptr inbounds %struct.exe_file_t.6, ptr %59, i32 0, i32 3, !dbg !3815
  %60 = load ptr, ptr %dfile89, align 8, !dbg !3815
  %size90 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %60, i32 0, i32 0, !dbg !3816
  %61 = load i32, ptr %size90, align 8, !dbg !3816
  %conv91 = zext i32 %61 to i64, !dbg !3813
  %62 = load ptr, ptr %f, align 8, !dbg !3817
  %off92 = getelementptr inbounds %struct.exe_file_t.6, ptr %62, i32 0, i32 2, !dbg !3818
  %63 = load i64, ptr %off92, align 8, !dbg !3818
  %sub = sub nsw i64 %conv91, %63, !dbg !3819
  %conv93 = trunc i64 %sub to i32, !dbg !3813
  %64 = load ptr, ptr %res, align 8, !dbg !3820
  store i32 %conv93, ptr %64, align 4, !dbg !3821
  br label %if.end95, !dbg !3822

if.else94:                                        ; preds = %if.then84
  %65 = load ptr, ptr %res, align 8, !dbg !3823
  store i32 0, ptr %65, align 4, !dbg !3825
  br label %if.end95

if.end95:                                         ; preds = %if.else94, %if.then88
  store i32 0, ptr %retval, align 4, !dbg !3826
  br label %return, !dbg !3826

if.else96:                                        ; preds = %sw.bb80
  %call97 = call ptr @__errno_location() #17, !dbg !3827
  store i32 25, ptr %call97, align 4, !dbg !3829
  store i32 -1, ptr %retval, align 4, !dbg !3830
  br label %return, !dbg !3830

sw.bb98:                                          ; preds = %if.then5
  call void @klee_warning(ptr noundef @.str.22.83), !dbg !3831
  %call99 = call ptr @__errno_location() #17, !dbg !3833
  store i32 22, ptr %call99, align 4, !dbg !3834
  store i32 -1, ptr %retval, align 4, !dbg !3835
  br label %return, !dbg !3835

sw.default:                                       ; preds = %if.then5
  call void @klee_warning(ptr noundef @.str.12.73), !dbg !3836
  %call100 = call ptr @__errno_location() #17, !dbg !3837
  store i32 22, ptr %call100, align 4, !dbg !3838
  store i32 -1, ptr %retval, align 4, !dbg !3839
  br label %return, !dbg !3839

if.end101:                                        ; preds = %vaarg.end
  %66 = load ptr, ptr %f, align 8, !dbg !3840
  %fd102 = getelementptr inbounds %struct.exe_file_t.6, ptr %66, i32 0, i32 0, !dbg !3841
  %67 = load i32, ptr %fd102, align 8, !dbg !3841
  %68 = load i64, ptr %request.addr, align 8, !dbg !3842
  %69 = load ptr, ptr %buf, align 8, !dbg !3843
  %call103 = call i64 (i64, ...) @syscall(i64 noundef 16, i32 noundef %67, i64 noundef %68, ptr noundef %69) #16, !dbg !3844
  %conv104 = trunc i64 %call103 to i32, !dbg !3844
  store i32 %conv104, ptr %retval, align 4, !dbg !3845
  br label %return, !dbg !3845

return:                                           ; preds = %if.end101, %sw.default, %sw.bb98, %if.else96, %if.end95, %if.else78, %if.then76, %if.else70, %if.then69, %if.else63, %if.then62, %if.else56, %if.then55, %if.else51, %if.then50, %if.else, %if.then8, %if.then
  %70 = load i32, ptr %retval, align 4, !dbg !3846
  ret i32 %70, !dbg !3846
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #11

declare void @klee_warning_once(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fcntl(i32 noundef %fd, i32 noundef %cmd, ...) #0 !dbg !3847 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %cmd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arg = alloca i32, align 4
  %lock = alloca ptr, align 8
  %flags = alloca i32, align 4
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3850, metadata !DIExpression()), !dbg !3851
  store i32 %cmd, ptr %cmd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %cmd.addr, metadata !3852, metadata !DIExpression()), !dbg !3853
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3854, metadata !DIExpression()), !dbg !3855
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3856
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3857
  store ptr %call, ptr %f, align 8, !dbg !3855
  call void @llvm.dbg.declare(metadata ptr %ap, metadata !3858, metadata !DIExpression()), !dbg !3859
  call void @llvm.dbg.declare(metadata ptr %arg, metadata !3860, metadata !DIExpression()), !dbg !3861
  call void @llvm.dbg.declare(metadata ptr %lock, metadata !3862, metadata !DIExpression()), !dbg !3874
  %1 = load ptr, ptr %f, align 8, !dbg !3875
  %tobool = icmp ne ptr %1, null, !dbg !3875
  br i1 %tobool, label %if.end, label %if.then, !dbg !3877

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3878
  store i32 9, ptr %call1, align 4, !dbg !3880
  store i32 -1, ptr %retval, align 4, !dbg !3881
  br label %return, !dbg !3881

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %cmd.addr, align 4, !dbg !3882
  %cmp = icmp eq i32 %2, 1, !dbg !3884
  %3 = load i32, ptr %cmd.addr, align 4
  %cmp2 = icmp eq i32 %3, 3
  %or.cond = select i1 %cmp, i1 true, i1 %cmp2, !dbg !3885
  %4 = load i32, ptr %cmd.addr, align 4
  %cmp4 = icmp eq i32 %4, 9
  %or.cond1 = select i1 %or.cond, i1 true, i1 %cmp4, !dbg !3885
  %5 = load i32, ptr %cmd.addr, align 4
  %cmp6 = icmp eq i32 %5, 11
  %or.cond2 = select i1 %or.cond1, i1 true, i1 %cmp6, !dbg !3885
  %6 = load i32, ptr %cmd.addr, align 4
  %cmp8 = icmp eq i32 %6, 1025
  %or.cond3 = select i1 %or.cond2, i1 true, i1 %cmp8, !dbg !3885
  %7 = load i32, ptr %cmd.addr, align 4
  %cmp10 = icmp eq i32 %7, 1026
  %or.cond4 = select i1 %or.cond3, i1 true, i1 %cmp10, !dbg !3885
  br i1 %or.cond4, label %if.then11, label %if.else, !dbg !3885

if.then11:                                        ; preds = %if.end
  store i32 0, ptr %arg, align 4, !dbg !3886
  br label %if.end36, !dbg !3888

if.else:                                          ; preds = %if.end
  %8 = load i32, ptr %cmd.addr, align 4, !dbg !3889
  %cmp12 = icmp eq i32 %8, 5, !dbg !3891
  %9 = load i32, ptr %cmd.addr, align 4
  %cmp14 = icmp eq i32 %9, 6
  %or.cond5 = select i1 %cmp12, i1 true, i1 %cmp14, !dbg !3892
  %10 = load i32, ptr %cmd.addr, align 4
  %cmp16 = icmp eq i32 %10, 7
  %or.cond6 = select i1 %or.cond5, i1 true, i1 %cmp16, !dbg !3892
  br i1 %or.cond6, label %if.then17, label %if.else20, !dbg !3892

if.then17:                                        ; preds = %if.else
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3893
  call void @llvm.va_start(ptr %arraydecay), !dbg !3893
  %arraydecay18 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3895
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay18, i32 0, i32 0, !dbg !3895
  %gp_offset = load i32, ptr %gp_offset_p, align 16, !dbg !3895
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !3895
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !3895

vaarg.in_reg:                                     ; preds = %if.then17
  %11 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay18, i32 0, i32 3, !dbg !3895
  %reg_save_area = load ptr, ptr %11, align 16, !dbg !3895
  %12 = getelementptr i8, ptr %reg_save_area, i32 %gp_offset, !dbg !3895
  %13 = add i32 %gp_offset, 8, !dbg !3895
  store i32 %13, ptr %gp_offset_p, align 16, !dbg !3895
  br label %vaarg.end, !dbg !3895

vaarg.in_mem:                                     ; preds = %if.then17
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay18, i32 0, i32 2, !dbg !3895
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8, !dbg !3895
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8, !dbg !3895
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8, !dbg !3895
  br label %vaarg.end, !dbg !3895

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %12, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ], !dbg !3895
  %14 = load ptr, ptr %vaarg.addr, align 8, !dbg !3895
  store ptr %14, ptr %lock, align 8, !dbg !3896
  %arraydecay19 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3897
  call void @llvm.va_end(ptr %arraydecay19), !dbg !3897
  br label %if.end36, !dbg !3898

if.else20:                                        ; preds = %if.else
  %arraydecay21 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3899
  call void @llvm.va_start(ptr %arraydecay21), !dbg !3899
  %arraydecay22 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3901
  %gp_offset_p23 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay22, i32 0, i32 0, !dbg !3901
  %gp_offset24 = load i32, ptr %gp_offset_p23, align 16, !dbg !3901
  %fits_in_gp25 = icmp ule i32 %gp_offset24, 40, !dbg !3901
  br i1 %fits_in_gp25, label %vaarg.in_reg26, label %vaarg.in_mem28, !dbg !3901

vaarg.in_reg26:                                   ; preds = %if.else20
  %15 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay22, i32 0, i32 3, !dbg !3901
  %reg_save_area27 = load ptr, ptr %15, align 16, !dbg !3901
  %16 = getelementptr i8, ptr %reg_save_area27, i32 %gp_offset24, !dbg !3901
  %17 = add i32 %gp_offset24, 8, !dbg !3901
  store i32 %17, ptr %gp_offset_p23, align 16, !dbg !3901
  br label %vaarg.end32, !dbg !3901

vaarg.in_mem28:                                   ; preds = %if.else20
  %overflow_arg_area_p29 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay22, i32 0, i32 2, !dbg !3901
  %overflow_arg_area30 = load ptr, ptr %overflow_arg_area_p29, align 8, !dbg !3901
  %overflow_arg_area.next31 = getelementptr i8, ptr %overflow_arg_area30, i32 8, !dbg !3901
  store ptr %overflow_arg_area.next31, ptr %overflow_arg_area_p29, align 8, !dbg !3901
  br label %vaarg.end32, !dbg !3901

vaarg.end32:                                      ; preds = %vaarg.in_mem28, %vaarg.in_reg26
  %vaarg.addr33 = phi ptr [ %16, %vaarg.in_reg26 ], [ %overflow_arg_area30, %vaarg.in_mem28 ], !dbg !3901
  %18 = load i32, ptr %vaarg.addr33, align 4, !dbg !3901
  store i32 %18, ptr %arg, align 4, !dbg !3902
  %arraydecay34 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3903
  call void @llvm.va_end(ptr %arraydecay34), !dbg !3903
  br label %if.end36

if.end36:                                         ; preds = %vaarg.end, %vaarg.end32, %if.then11
  %19 = load ptr, ptr %f, align 8, !dbg !3904
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %19, i32 0, i32 3, !dbg !3906
  %20 = load ptr, ptr %dfile, align 8, !dbg !3906
  %tobool37 = icmp ne ptr %20, null, !dbg !3904
  br i1 %tobool37, label %if.then38, label %if.end56, !dbg !3907

if.then38:                                        ; preds = %if.end36
  %21 = load i32, ptr %cmd.addr, align 4, !dbg !3908
  switch i32 %21, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb43
    i32 3, label %sw.bb52
    i32 5, label %sw.bb53
    i32 6, label %sw.bb54
  ], !dbg !3910

sw.bb:                                            ; preds = %if.then38
  call void @llvm.dbg.declare(metadata ptr %flags, metadata !3911, metadata !DIExpression()), !dbg !3914
  store i32 0, ptr %flags, align 4, !dbg !3914
  %22 = load ptr, ptr %f, align 8, !dbg !3915
  %flags39 = getelementptr inbounds %struct.exe_file_t.6, ptr %22, i32 0, i32 1, !dbg !3917
  %23 = load i32, ptr %flags39, align 4, !dbg !3917
  %and = and i32 %23, 2, !dbg !3918
  %tobool40 = icmp ne i32 %and, 0, !dbg !3918
  br i1 %tobool40, label %if.then41, label %if.end42, !dbg !3919

if.then41:                                        ; preds = %sw.bb
  %24 = load i32, ptr %flags, align 4, !dbg !3920
  %or = or i32 %24, 1, !dbg !3920
  store i32 %or, ptr %flags, align 4, !dbg !3920
  br label %if.end42, !dbg !3921

if.end42:                                         ; preds = %if.then41, %sw.bb
  %25 = load i32, ptr %flags, align 4, !dbg !3922
  store i32 %25, ptr %retval, align 4, !dbg !3923
  br label %return, !dbg !3923

sw.bb43:                                          ; preds = %if.then38
  %26 = load ptr, ptr %f, align 8, !dbg !3924
  %flags44 = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 1, !dbg !3926
  %27 = load i32, ptr %flags44, align 4, !dbg !3927
  %and45 = and i32 %27, -3, !dbg !3927
  store i32 %and45, ptr %flags44, align 4, !dbg !3927
  %28 = load i32, ptr %arg, align 4, !dbg !3928
  %and46 = and i32 %28, 1, !dbg !3930
  %tobool47 = icmp ne i32 %and46, 0, !dbg !3930
  br i1 %tobool47, label %if.then48, label %if.end51, !dbg !3931

if.then48:                                        ; preds = %sw.bb43
  %29 = load ptr, ptr %f, align 8, !dbg !3932
  %flags49 = getelementptr inbounds %struct.exe_file_t.6, ptr %29, i32 0, i32 1, !dbg !3933
  %30 = load i32, ptr %flags49, align 4, !dbg !3934
  %or50 = or i32 %30, 2, !dbg !3934
  store i32 %or50, ptr %flags49, align 4, !dbg !3934
  br label %if.end51, !dbg !3932

if.end51:                                         ; preds = %if.then48, %sw.bb43
  store i32 0, ptr %retval, align 4, !dbg !3935
  br label %return, !dbg !3935

sw.bb52:                                          ; preds = %if.then38
  store i32 0, ptr %retval, align 4, !dbg !3936
  br label %return, !dbg !3936

sw.bb53:                                          ; preds = %if.then38
  %31 = load ptr, ptr %lock, align 8, !dbg !3938
  %l_type = getelementptr inbounds %struct.flock, ptr %31, i32 0, i32 0, !dbg !3940
  store i16 2, ptr %l_type, align 8, !dbg !3941
  store i32 0, ptr %retval, align 4, !dbg !3942
  br label %return, !dbg !3942

sw.bb54:                                          ; preds = %if.then38
  store i32 0, ptr %retval, align 4, !dbg !3943
  br label %return, !dbg !3943

sw.default:                                       ; preds = %if.then38
  call void @klee_warning(ptr noundef @.str.12.73), !dbg !3945
  %call55 = call ptr @__errno_location() #17, !dbg !3946
  store i32 22, ptr %call55, align 4, !dbg !3947
  store i32 -1, ptr %retval, align 4, !dbg !3948
  br label %return, !dbg !3948

if.end56:                                         ; preds = %if.end36
  %32 = load ptr, ptr %f, align 8, !dbg !3949
  %fd57 = getelementptr inbounds %struct.exe_file_t.6, ptr %32, i32 0, i32 0, !dbg !3950
  %33 = load i32, ptr %fd57, align 8, !dbg !3950
  %34 = load i32, ptr %cmd.addr, align 4, !dbg !3951
  %35 = load i32, ptr %arg, align 4, !dbg !3952
  %call58 = call i64 (i64, ...) @syscall(i64 noundef 72, i32 noundef %33, i32 noundef %34, i32 noundef %35) #16, !dbg !3953
  %conv = trunc i64 %call58 to i32, !dbg !3953
  store i32 %conv, ptr %retval, align 4, !dbg !3954
  br label %return, !dbg !3954

return:                                           ; preds = %if.end56, %sw.default, %sw.bb54, %sw.bb53, %sw.bb52, %if.end51, %if.end42, %if.then
  %36 = load i32, ptr %retval, align 4, !dbg !3955
  ret i32 %36, !dbg !3955
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_statfs(ptr noundef %path, ptr noundef %buf) #0 !dbg !3956 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !3986, metadata !DIExpression()), !dbg !3987
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !3988, metadata !DIExpression()), !dbg !3989
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !3990, metadata !DIExpression()), !dbg !3991
  %0 = load ptr, ptr %path.addr, align 8, !dbg !3992
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !3993
  store ptr %call, ptr %dfile, align 8, !dbg !3991
  %1 = load ptr, ptr %dfile, align 8, !dbg !3994
  %tobool = icmp ne ptr %1, null, !dbg !3994
  br i1 %tobool, label %if.then, label %if.end, !dbg !3996

if.then:                                          ; preds = %entry
  call void @klee_warning(ptr noundef @.str.10.70), !dbg !3997
  %call1 = call ptr @__errno_location() #17, !dbg !3999
  store i32 2, ptr %call1, align 4, !dbg !4000
  store i32 -1, ptr %retval, align 4, !dbg !4001
  br label %return, !dbg !4001

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %path.addr, align 8, !dbg !4002
  %call2 = call ptr @__concretize_string(ptr noundef %2), !dbg !4003
  %3 = load ptr, ptr %buf.addr, align 8, !dbg !4004
  %call3 = call i64 (i64, ...) @syscall(i64 noundef 137, ptr noundef %call2, ptr noundef %3) #16, !dbg !4005
  %conv = trunc i64 %call3 to i32, !dbg !4005
  store i32 %conv, ptr %retval, align 4, !dbg !4006
  br label %return, !dbg !4006

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, ptr %retval, align 4, !dbg !4007
  ret i32 %4, !dbg !4007
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fstatfs(i32 noundef %fd, ptr noundef nonnull %buf) #0 !dbg !4008 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4011, metadata !DIExpression()), !dbg !4012
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4013, metadata !DIExpression()), !dbg !4014
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4015, metadata !DIExpression()), !dbg !4016
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4017
  %call = call ptr @__get_file(i32 noundef %0), !dbg !4018
  store ptr %call, ptr %f, align 8, !dbg !4016
  %1 = load ptr, ptr %f, align 8, !dbg !4019
  %tobool = icmp ne ptr %1, null, !dbg !4019
  br i1 %tobool, label %if.end, label %if.then, !dbg !4021

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !4022
  store i32 9, ptr %call1, align 4, !dbg !4024
  store i32 -1, ptr %retval, align 4, !dbg !4025
  br label %return, !dbg !4025

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !4026
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !4028
  %3 = load ptr, ptr %dfile, align 8, !dbg !4028
  %tobool2 = icmp ne ptr %3, null, !dbg !4026
  br i1 %tobool2, label %if.then3, label %if.end5, !dbg !4029

if.then3:                                         ; preds = %if.end
  call void @klee_warning(ptr noundef @.str.23.84), !dbg !4030
  %call4 = call ptr @__errno_location() #17, !dbg !4032
  store i32 9, ptr %call4, align 4, !dbg !4033
  store i32 -1, ptr %retval, align 4, !dbg !4034
  br label %return, !dbg !4034

if.end5:                                          ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !4035
  %fd6 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 0, !dbg !4036
  %5 = load i32, ptr %fd6, align 8, !dbg !4036
  %6 = load ptr, ptr %buf.addr, align 8, !dbg !4037
  %call7 = call i64 (i64, ...) @syscall(i64 noundef 138, i32 noundef %5, ptr noundef %6) #16, !dbg !4038
  %conv = trunc i64 %call7 to i32, !dbg !4038
  store i32 %conv, ptr %retval, align 4, !dbg !4039
  br label %return, !dbg !4039

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %7 = load i32, ptr %retval, align 4, !dbg !4040
  ret i32 %7, !dbg !4040
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fsync(i32 noundef %fd) #0 !dbg !4041 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4042, metadata !DIExpression()), !dbg !4043
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4044, metadata !DIExpression()), !dbg !4045
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4046
  %call = call ptr @__get_file(i32 noundef %0), !dbg !4047
  store ptr %call, ptr %f, align 8, !dbg !4045
  %1 = load ptr, ptr %f, align 8, !dbg !4048
  %tobool = icmp ne ptr %1, null, !dbg !4048
  br i1 %tobool, label %if.else, label %if.then, !dbg !4050

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !4051
  store i32 9, ptr %call1, align 4, !dbg !4053
  store i32 -1, ptr %retval, align 4, !dbg !4054
  br label %return, !dbg !4054

if.else:                                          ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !4055
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !4057
  %3 = load ptr, ptr %dfile, align 8, !dbg !4057
  %tobool2 = icmp ne ptr %3, null, !dbg !4055
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !4058

if.then3:                                         ; preds = %if.else
  store i32 0, ptr %retval, align 4, !dbg !4059
  br label %return, !dbg !4059

if.end4:                                          ; preds = %if.else
  %4 = load ptr, ptr %f, align 8, !dbg !4061
  %fd5 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 0, !dbg !4062
  %5 = load i32, ptr %fd5, align 8, !dbg !4062
  %call6 = call i64 (i64, ...) @syscall(i64 noundef 74, i32 noundef %5) #16, !dbg !4063
  %conv = trunc i64 %call6 to i32, !dbg !4063
  store i32 %conv, ptr %retval, align 4, !dbg !4064
  br label %return, !dbg !4064

return:                                           ; preds = %if.end4, %if.then3, %if.then
  %6 = load i32, ptr %retval, align 4, !dbg !4065
  ret i32 %6, !dbg !4065
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dup2(i32 noundef %oldfd, i32 noundef %newfd) #0 !dbg !4066 {
entry:
  %retval = alloca i32, align 4
  %oldfd.addr = alloca i32, align 4
  %newfd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %f2 = alloca ptr, align 8
  store i32 %oldfd, ptr %oldfd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %oldfd.addr, metadata !4069, metadata !DIExpression()), !dbg !4070
  store i32 %newfd, ptr %newfd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %newfd.addr, metadata !4071, metadata !DIExpression()), !dbg !4072
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4073, metadata !DIExpression()), !dbg !4074
  %0 = load i32, ptr %oldfd.addr, align 4, !dbg !4075
  %call = call ptr @__get_file(i32 noundef %0), !dbg !4076
  store ptr %call, ptr %f, align 8, !dbg !4074
  %1 = load ptr, ptr %f, align 8, !dbg !4077
  %tobool = icmp ne ptr %1, null, !dbg !4077
  %2 = load i32, ptr %newfd.addr, align 4
  %cmp = icmp sge i32 %2, 0
  %or.cond = select i1 %tobool, i1 %cmp, i1 false, !dbg !4079
  %3 = load i32, ptr %newfd.addr, align 4
  %cmp1 = icmp slt i32 %3, 32
  %or.cond1 = select i1 %or.cond, i1 %cmp1, i1 false, !dbg !4079
  br i1 %or.cond1, label %if.else, label %if.then, !dbg !4079

if.then:                                          ; preds = %entry
  %call2 = call ptr @__errno_location() #17, !dbg !4080
  store i32 9, ptr %call2, align 4, !dbg !4082
  store i32 -1, ptr %retval, align 4, !dbg !4083
  br label %return, !dbg !4083

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %f2, metadata !4084, metadata !DIExpression()), !dbg !4086
  %4 = load i32, ptr %newfd.addr, align 4, !dbg !4087
  %idxprom = sext i32 %4 to i64, !dbg !4088
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !4088
  store ptr %arrayidx, ptr %f2, align 8, !dbg !4086
  %5 = load ptr, ptr %f2, align 8, !dbg !4089
  %flags = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 1, !dbg !4091
  %6 = load i32, ptr %flags, align 4, !dbg !4091
  %and = and i32 %6, 1, !dbg !4092
  %tobool3 = icmp ne i32 %and, 0, !dbg !4092
  br i1 %tobool3, label %if.then4, label %if.end, !dbg !4093

if.then4:                                         ; preds = %if.else
  %7 = load i32, ptr %newfd.addr, align 4, !dbg !4094
  %call5 = call i32 @close(i32 noundef %7), !dbg !4095
  br label %if.end, !dbg !4095

if.end:                                           ; preds = %if.then4, %if.else
  %8 = load ptr, ptr %f2, align 8, !dbg !4096
  %9 = load ptr, ptr %f, align 8, !dbg !4097
  %10 = call ptr @memcpy(ptr %8, ptr %9, i64 24), !dbg !4098
  %11 = load ptr, ptr %f2, align 8, !dbg !4099
  %flags6 = getelementptr inbounds %struct.exe_file_t.6, ptr %11, i32 0, i32 1, !dbg !4100
  %12 = load i32, ptr %flags6, align 4, !dbg !4101
  %and7 = and i32 %12, -3, !dbg !4101
  store i32 %and7, ptr %flags6, align 4, !dbg !4101
  %13 = load i32, ptr %newfd.addr, align 4, !dbg !4102
  store i32 %13, ptr %retval, align 4, !dbg !4103
  br label %return, !dbg !4103

return:                                           ; preds = %if.end, %if.then
  %14 = load i32, ptr %retval, align 4, !dbg !4104
  ret i32 %14, !dbg !4104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dup(i32 noundef %oldfd) #0 !dbg !4105 {
entry:
  %retval = alloca i32, align 4
  %oldfd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %fd = alloca i32, align 4
  store i32 %oldfd, ptr %oldfd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %oldfd.addr, metadata !4106, metadata !DIExpression()), !dbg !4107
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4108, metadata !DIExpression()), !dbg !4109
  %0 = load i32, ptr %oldfd.addr, align 4, !dbg !4110
  %call = call ptr @__get_file(i32 noundef %0), !dbg !4111
  store ptr %call, ptr %f, align 8, !dbg !4109
  %1 = load ptr, ptr %f, align 8, !dbg !4112
  %tobool = icmp ne ptr %1, null, !dbg !4112
  br i1 %tobool, label %if.else, label %if.then, !dbg !4114

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !4115
  store i32 9, ptr %call1, align 4, !dbg !4117
  store i32 -1, ptr %retval, align 4, !dbg !4118
  br label %return, !dbg !4118

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %fd, metadata !4119, metadata !DIExpression()), !dbg !4121
  store i32 0, ptr %fd, align 4, !dbg !4122
  br label %for.cond, !dbg !4124

for.cond:                                         ; preds = %for.inc, %if.else
  %2 = load i32, ptr %fd, align 4, !dbg !4125
  %cmp = icmp slt i32 %2, 32, !dbg !4127
  br i1 %cmp, label %for.body, label %for.end, !dbg !4128

for.body:                                         ; preds = %for.cond
  %3 = load i32, ptr %fd, align 4, !dbg !4129
  %idxprom = sext i32 %3 to i64, !dbg !4131
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !4131
  %flags = getelementptr inbounds %struct.exe_file_t.6, ptr %arrayidx, i32 0, i32 1, !dbg !4132
  %4 = load i32, ptr %flags, align 4, !dbg !4132
  %and = and i32 %4, 1, !dbg !4133
  %tobool2 = icmp ne i32 %and, 0, !dbg !4133
  br i1 %tobool2, label %for.inc, label %for.end, !dbg !4134

for.inc:                                          ; preds = %for.body
  %5 = load i32, ptr %fd, align 4, !dbg !4135
  %inc = add nsw i32 %5, 1, !dbg !4135
  store i32 %inc, ptr %fd, align 4, !dbg !4135
  br label %for.cond, !dbg !4136, !llvm.loop !4137

for.end:                                          ; preds = %for.body, %for.cond
  %6 = load i32, ptr %fd, align 4, !dbg !4139
  %cmp4 = icmp eq i32 %6, 32, !dbg !4141
  br i1 %cmp4, label %if.then5, label %if.else7, !dbg !4142

if.then5:                                         ; preds = %for.end
  %call6 = call ptr @__errno_location() #17, !dbg !4143
  store i32 24, ptr %call6, align 4, !dbg !4145
  store i32 -1, ptr %retval, align 4, !dbg !4146
  br label %return, !dbg !4146

if.else7:                                         ; preds = %for.end
  %7 = load i32, ptr %oldfd.addr, align 4, !dbg !4147
  %8 = load i32, ptr %fd, align 4, !dbg !4149
  %call8 = call i32 @dup2(i32 noundef %7, i32 noundef %8) #16, !dbg !4150
  store i32 %call8, ptr %retval, align 4, !dbg !4151
  br label %return, !dbg !4151

return:                                           ; preds = %if.else7, %if.then5, %if.then
  %9 = load i32, ptr %retval, align 4, !dbg !4152
  ret i32 %9, !dbg !4152
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rmdir(ptr noundef nonnull %pathname) #0 !dbg !4153 {
entry:
  %retval = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4154, metadata !DIExpression()), !dbg !4155
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !4156, metadata !DIExpression()), !dbg !4157
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !4158
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !4159
  store ptr %call, ptr %dfile, align 8, !dbg !4157
  %1 = load ptr, ptr %dfile, align 8, !dbg !4160
  %tobool = icmp ne ptr %1, null, !dbg !4160
  br i1 %tobool, label %if.then, label %if.end, !dbg !4162

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %dfile, align 8, !dbg !4163
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %2, i32 0, i32 2, !dbg !4163
  %3 = load ptr, ptr %stat, align 8, !dbg !4163
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %3, i32 0, i32 3, !dbg !4163
  %4 = load i32, ptr %st_mode, align 8, !dbg !4163
  %and = and i32 %4, 61440, !dbg !4163
  %cmp = icmp eq i32 %and, 16384, !dbg !4163
  br i1 %cmp, label %if.then1, label %if.else, !dbg !4166

if.then1:                                         ; preds = %if.then
  %5 = load ptr, ptr %dfile, align 8, !dbg !4167
  %stat2 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %5, i32 0, i32 2, !dbg !4169
  %6 = load ptr, ptr %stat2, align 8, !dbg !4169
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %6, i32 0, i32 1, !dbg !4170
  store i64 0, ptr %st_ino, align 8, !dbg !4171
  store i32 0, ptr %retval, align 4, !dbg !4172
  br label %return, !dbg !4172

if.else:                                          ; preds = %if.then
  %call3 = call ptr @__errno_location() #17, !dbg !4173
  store i32 20, ptr %call3, align 4, !dbg !4175
  store i32 -1, ptr %retval, align 4, !dbg !4176
  br label %return, !dbg !4176

if.end:                                           ; preds = %entry
  call void @klee_warning(ptr noundef @.str.24.85), !dbg !4177
  %call4 = call ptr @__errno_location() #17, !dbg !4178
  store i32 1, ptr %call4, align 4, !dbg !4179
  store i32 -1, ptr %retval, align 4, !dbg !4180
  br label %return, !dbg !4180

return:                                           ; preds = %if.end, %if.else, %if.then1
  %7 = load i32, ptr %retval, align 4, !dbg !4181
  ret i32 %7, !dbg !4181
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @unlink(ptr noundef nonnull %pathname) #0 !dbg !4182 {
entry:
  %retval = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4183, metadata !DIExpression()), !dbg !4184
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !4185, metadata !DIExpression()), !dbg !4186
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !4187
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !4188
  store ptr %call, ptr %dfile, align 8, !dbg !4186
  %1 = load ptr, ptr %dfile, align 8, !dbg !4189
  %tobool = icmp ne ptr %1, null, !dbg !4189
  br i1 %tobool, label %if.then, label %if.end, !dbg !4191

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %dfile, align 8, !dbg !4192
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %2, i32 0, i32 2, !dbg !4192
  %3 = load ptr, ptr %stat, align 8, !dbg !4192
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %3, i32 0, i32 3, !dbg !4192
  %4 = load i32, ptr %st_mode, align 8, !dbg !4192
  %and = and i32 %4, 61440, !dbg !4192
  %cmp = icmp eq i32 %and, 32768, !dbg !4192
  br i1 %cmp, label %if.then1, label %if.else, !dbg !4195

if.then1:                                         ; preds = %if.then
  %5 = load ptr, ptr %dfile, align 8, !dbg !4196
  %stat2 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %5, i32 0, i32 2, !dbg !4198
  %6 = load ptr, ptr %stat2, align 8, !dbg !4198
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %6, i32 0, i32 1, !dbg !4199
  store i64 0, ptr %st_ino, align 8, !dbg !4200
  store i32 0, ptr %retval, align 4, !dbg !4201
  br label %return, !dbg !4201

if.else:                                          ; preds = %if.then
  %7 = load ptr, ptr %dfile, align 8, !dbg !4202
  %stat3 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %7, i32 0, i32 2, !dbg !4202
  %8 = load ptr, ptr %stat3, align 8, !dbg !4202
  %st_mode4 = getelementptr inbounds %struct.stat64.9, ptr %8, i32 0, i32 3, !dbg !4202
  %9 = load i32, ptr %st_mode4, align 8, !dbg !4202
  %and5 = and i32 %9, 61440, !dbg !4202
  %cmp6 = icmp eq i32 %and5, 16384, !dbg !4202
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !4204

if.then7:                                         ; preds = %if.else
  %call8 = call ptr @__errno_location() #17, !dbg !4205
  store i32 21, ptr %call8, align 4, !dbg !4207
  store i32 -1, ptr %retval, align 4, !dbg !4208
  br label %return, !dbg !4208

if.else9:                                         ; preds = %if.else
  %call10 = call ptr @__errno_location() #17, !dbg !4209
  store i32 1, ptr %call10, align 4, !dbg !4211
  store i32 -1, ptr %retval, align 4, !dbg !4212
  br label %return, !dbg !4212

if.end:                                           ; preds = %entry
  call void @klee_warning(ptr noundef @.str.24.85), !dbg !4213
  %call11 = call ptr @__errno_location() #17, !dbg !4214
  store i32 1, ptr %call11, align 4, !dbg !4215
  store i32 -1, ptr %retval, align 4, !dbg !4216
  br label %return, !dbg !4216

return:                                           ; preds = %if.end, %if.else9, %if.then7, %if.then1
  %10 = load i32, ptr %retval, align 4, !dbg !4217
  ret i32 %10, !dbg !4217
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @unlinkat(i32 noundef %dirfd, ptr noundef nonnull %pathname, i32 noundef %flags) #0 !dbg !4218 {
entry:
  %retval = alloca i32, align 4
  %dirfd.addr = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %dfile = alloca ptr, align 8
  store i32 %dirfd, ptr %dirfd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %dirfd.addr, metadata !4221, metadata !DIExpression()), !dbg !4222
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4223, metadata !DIExpression()), !dbg !4224
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !4225, metadata !DIExpression()), !dbg !4226
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !4227, metadata !DIExpression()), !dbg !4228
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !4229
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !4230
  store ptr %call, ptr %dfile, align 8, !dbg !4228
  %1 = load ptr, ptr %dfile, align 8, !dbg !4231
  %tobool = icmp ne ptr %1, null, !dbg !4231
  br i1 %tobool, label %if.then, label %if.end, !dbg !4233

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %dfile, align 8, !dbg !4234
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %2, i32 0, i32 2, !dbg !4234
  %3 = load ptr, ptr %stat, align 8, !dbg !4234
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %3, i32 0, i32 3, !dbg !4234
  %4 = load i32, ptr %st_mode, align 8, !dbg !4234
  %and = and i32 %4, 61440, !dbg !4234
  %cmp = icmp eq i32 %and, 32768, !dbg !4234
  br i1 %cmp, label %if.then1, label %if.else, !dbg !4237

if.then1:                                         ; preds = %if.then
  %5 = load ptr, ptr %dfile, align 8, !dbg !4238
  %stat2 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %5, i32 0, i32 2, !dbg !4240
  %6 = load ptr, ptr %stat2, align 8, !dbg !4240
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %6, i32 0, i32 1, !dbg !4241
  store i64 0, ptr %st_ino, align 8, !dbg !4242
  store i32 0, ptr %retval, align 4, !dbg !4243
  br label %return, !dbg !4243

if.else:                                          ; preds = %if.then
  %7 = load ptr, ptr %dfile, align 8, !dbg !4244
  %stat3 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %7, i32 0, i32 2, !dbg !4244
  %8 = load ptr, ptr %stat3, align 8, !dbg !4244
  %st_mode4 = getelementptr inbounds %struct.stat64.9, ptr %8, i32 0, i32 3, !dbg !4244
  %9 = load i32, ptr %st_mode4, align 8, !dbg !4244
  %and5 = and i32 %9, 61440, !dbg !4244
  %cmp6 = icmp eq i32 %and5, 16384, !dbg !4244
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !4246

if.then7:                                         ; preds = %if.else
  %call8 = call ptr @__errno_location() #17, !dbg !4247
  store i32 21, ptr %call8, align 4, !dbg !4249
  store i32 -1, ptr %retval, align 4, !dbg !4250
  br label %return, !dbg !4250

if.else9:                                         ; preds = %if.else
  %call10 = call ptr @__errno_location() #17, !dbg !4251
  store i32 1, ptr %call10, align 4, !dbg !4253
  store i32 -1, ptr %retval, align 4, !dbg !4254
  br label %return, !dbg !4254

if.end:                                           ; preds = %entry
  call void @klee_warning(ptr noundef @.str.24.85), !dbg !4255
  %call11 = call ptr @__errno_location() #17, !dbg !4256
  store i32 1, ptr %call11, align 4, !dbg !4257
  store i32 -1, ptr %retval, align 4, !dbg !4258
  br label %return, !dbg !4258

return:                                           ; preds = %if.end, %if.else9, %if.then7, %if.then1
  %10 = load i32, ptr %retval, align 4, !dbg !4259
  ret i32 %10, !dbg !4259
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @readlink(ptr noundef nonnull %path, ptr noundef nonnull %buf, i64 noundef %bufsize) #0 !dbg !4260 {
entry:
  %retval = alloca i64, align 8
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %bufsize.addr = alloca i64, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4263, metadata !DIExpression()), !dbg !4264
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4265, metadata !DIExpression()), !dbg !4266
  store i64 %bufsize, ptr %bufsize.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %bufsize.addr, metadata !4267, metadata !DIExpression()), !dbg !4268
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !4269, metadata !DIExpression()), !dbg !4270
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4271
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !4272
  store ptr %call, ptr %dfile, align 8, !dbg !4270
  %1 = load ptr, ptr %dfile, align 8, !dbg !4273
  %tobool = icmp ne ptr %1, null, !dbg !4273
  br i1 %tobool, label %if.then, label %if.end20, !dbg !4275

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %dfile, align 8, !dbg !4276
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %2, i32 0, i32 2, !dbg !4276
  %3 = load ptr, ptr %stat, align 8, !dbg !4276
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %3, i32 0, i32 3, !dbg !4276
  %4 = load i32, ptr %st_mode, align 8, !dbg !4276
  %and = and i32 %4, 61440, !dbg !4276
  %cmp = icmp eq i32 %and, 40960, !dbg !4276
  br i1 %cmp, label %if.then1, label %if.else, !dbg !4279

if.then1:                                         ; preds = %if.then
  %5 = load ptr, ptr %path.addr, align 8, !dbg !4280
  %arrayidx = getelementptr inbounds i8, ptr %5, i64 0, !dbg !4280
  %6 = load i8, ptr %arrayidx, align 1, !dbg !4280
  %7 = load ptr, ptr %buf.addr, align 8, !dbg !4282
  %arrayidx2 = getelementptr inbounds i8, ptr %7, i64 0, !dbg !4282
  store i8 %6, ptr %arrayidx2, align 1, !dbg !4283
  %8 = load i64, ptr %bufsize.addr, align 8, !dbg !4284
  %cmp3 = icmp ugt i64 %8, 1, !dbg !4286
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !4287

if.then4:                                         ; preds = %if.then1
  %9 = load ptr, ptr %buf.addr, align 8, !dbg !4288
  %arrayidx5 = getelementptr inbounds i8, ptr %9, i64 1, !dbg !4288
  store i8 46, ptr %arrayidx5, align 1, !dbg !4289
  br label %if.end, !dbg !4288

if.end:                                           ; preds = %if.then4, %if.then1
  %10 = load i64, ptr %bufsize.addr, align 8, !dbg !4290
  %cmp6 = icmp ugt i64 %10, 2, !dbg !4292
  br i1 %cmp6, label %if.then7, label %if.end9, !dbg !4293

if.then7:                                         ; preds = %if.end
  %11 = load ptr, ptr %buf.addr, align 8, !dbg !4294
  %arrayidx8 = getelementptr inbounds i8, ptr %11, i64 2, !dbg !4294
  store i8 108, ptr %arrayidx8, align 1, !dbg !4295
  br label %if.end9, !dbg !4294

if.end9:                                          ; preds = %if.then7, %if.end
  %12 = load i64, ptr %bufsize.addr, align 8, !dbg !4296
  %cmp10 = icmp ugt i64 %12, 3, !dbg !4298
  br i1 %cmp10, label %if.then11, label %if.end13, !dbg !4299

if.then11:                                        ; preds = %if.end9
  %13 = load ptr, ptr %buf.addr, align 8, !dbg !4300
  %arrayidx12 = getelementptr inbounds i8, ptr %13, i64 3, !dbg !4300
  store i8 110, ptr %arrayidx12, align 1, !dbg !4301
  br label %if.end13, !dbg !4300

if.end13:                                         ; preds = %if.then11, %if.end9
  %14 = load i64, ptr %bufsize.addr, align 8, !dbg !4302
  %cmp14 = icmp ugt i64 %14, 4, !dbg !4304
  br i1 %cmp14, label %if.then15, label %if.end17, !dbg !4305

if.then15:                                        ; preds = %if.end13
  %15 = load ptr, ptr %buf.addr, align 8, !dbg !4306
  %arrayidx16 = getelementptr inbounds i8, ptr %15, i64 4, !dbg !4306
  store i8 107, ptr %arrayidx16, align 1, !dbg !4307
  br label %if.end17, !dbg !4306

if.end17:                                         ; preds = %if.then15, %if.end13
  %16 = load i64, ptr %bufsize.addr, align 8, !dbg !4308
  %cmp18 = icmp ugt i64 %16, 5, !dbg !4309
  %17 = load i64, ptr %bufsize.addr, align 8, !dbg !4310
  %cond = select i1 %cmp18, i64 5, i64 %17, !dbg !4310
  store i64 %cond, ptr %retval, align 8, !dbg !4311
  br label %return, !dbg !4311

if.else:                                          ; preds = %if.then
  %call19 = call ptr @__errno_location() #17, !dbg !4312
  store i32 22, ptr %call19, align 4, !dbg !4314
  store i64 -1, ptr %retval, align 8, !dbg !4315
  br label %return, !dbg !4315

if.end20:                                         ; preds = %entry
  %18 = load ptr, ptr %path.addr, align 8, !dbg !4316
  %19 = load ptr, ptr %buf.addr, align 8, !dbg !4317
  %20 = load i64, ptr %bufsize.addr, align 8, !dbg !4318
  %call21 = call i64 (i64, ...) @syscall(i64 noundef 89, ptr noundef %18, ptr noundef %19, i64 noundef %20) #16, !dbg !4319
  store i64 %call21, ptr %retval, align 8, !dbg !4320
  br label %return, !dbg !4320

return:                                           ; preds = %if.end20, %if.else, %if.end17
  %21 = load i64, ptr %retval, align 8, !dbg !4321
  ret i64 %21, !dbg !4321
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @select(i32 noundef %nfds, ptr noundef %read, ptr noundef %write, ptr noundef %except, ptr noundef %timeout) #0 !dbg !4322 {
entry:
  %retval = alloca i32, align 4
  %nfds.addr = alloca i32, align 4
  %read.addr = alloca ptr, align 8
  %write.addr = alloca ptr, align 8
  %except.addr = alloca ptr, align 8
  %timeout.addr = alloca ptr, align 8
  %in_read = alloca %struct.fd_set, align 8
  %in_write = alloca %struct.fd_set, align 8
  %in_except = alloca %struct.fd_set, align 8
  %os_read = alloca %struct.fd_set, align 8
  %os_write = alloca %struct.fd_set, align 8
  %os_except = alloca %struct.fd_set, align 8
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %os_nfds = alloca i32, align 4
  %f = alloca ptr, align 8
  %tv = alloca %struct.timespec.8, align 8
  %r = alloca i32, align 4
  %f182 = alloca ptr, align 8
  store i32 %nfds, ptr %nfds.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %nfds.addr, metadata !4334, metadata !DIExpression()), !dbg !4335
  store ptr %read, ptr %read.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %read.addr, metadata !4336, metadata !DIExpression()), !dbg !4337
  store ptr %write, ptr %write.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %write.addr, metadata !4338, metadata !DIExpression()), !dbg !4339
  store ptr %except, ptr %except.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %except.addr, metadata !4340, metadata !DIExpression()), !dbg !4341
  store ptr %timeout, ptr %timeout.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %timeout.addr, metadata !4342, metadata !DIExpression()), !dbg !4343
  call void @llvm.dbg.declare(metadata ptr %in_read, metadata !4344, metadata !DIExpression()), !dbg !4345
  call void @llvm.dbg.declare(metadata ptr %in_write, metadata !4346, metadata !DIExpression()), !dbg !4347
  call void @llvm.dbg.declare(metadata ptr %in_except, metadata !4348, metadata !DIExpression()), !dbg !4349
  call void @llvm.dbg.declare(metadata ptr %os_read, metadata !4350, metadata !DIExpression()), !dbg !4351
  call void @llvm.dbg.declare(metadata ptr %os_write, metadata !4352, metadata !DIExpression()), !dbg !4353
  call void @llvm.dbg.declare(metadata ptr %os_except, metadata !4354, metadata !DIExpression()), !dbg !4355
  call void @llvm.dbg.declare(metadata ptr %i, metadata !4356, metadata !DIExpression()), !dbg !4357
  call void @llvm.dbg.declare(metadata ptr %count, metadata !4358, metadata !DIExpression()), !dbg !4359
  store i32 0, ptr %count, align 4, !dbg !4359
  call void @llvm.dbg.declare(metadata ptr %os_nfds, metadata !4360, metadata !DIExpression()), !dbg !4361
  store i32 0, ptr %os_nfds, align 4, !dbg !4361
  %0 = load ptr, ptr %read.addr, align 8, !dbg !4362
  %tobool = icmp ne ptr %0, null, !dbg !4362
  br i1 %tobool, label %if.then, label %if.else, !dbg !4364

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %read.addr, align 8, !dbg !4365
  %2 = call ptr @memcpy(ptr %in_read, ptr %1, i64 128), !dbg !4367
  %3 = load ptr, ptr %read.addr, align 8, !dbg !4368
  %4 = call ptr @memset(ptr %3, i32 0, i64 128), !dbg !4368
  br label %if.end, !dbg !4369

if.else:                                          ; preds = %entry
  %5 = call ptr @memset(ptr %in_read, i32 0, i64 128), !dbg !4370
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load ptr, ptr %write.addr, align 8, !dbg !4372
  %tobool1 = icmp ne ptr %6, null, !dbg !4372
  br i1 %tobool1, label %if.then2, label %if.else3, !dbg !4374

if.then2:                                         ; preds = %if.end
  %7 = load ptr, ptr %write.addr, align 8, !dbg !4375
  %8 = call ptr @memcpy(ptr %in_write, ptr %7, i64 128), !dbg !4377
  %9 = load ptr, ptr %write.addr, align 8, !dbg !4378
  %10 = call ptr @memset(ptr %9, i32 0, i64 128), !dbg !4378
  br label %if.end4, !dbg !4379

if.else3:                                         ; preds = %if.end
  %11 = call ptr @memset(ptr %in_write, i32 0, i64 128), !dbg !4380
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %12 = load ptr, ptr %except.addr, align 8, !dbg !4382
  %tobool5 = icmp ne ptr %12, null, !dbg !4382
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !4384

if.then6:                                         ; preds = %if.end4
  %13 = load ptr, ptr %except.addr, align 8, !dbg !4385
  %14 = call ptr @memcpy(ptr %in_except, ptr %13, i64 128), !dbg !4387
  %15 = load ptr, ptr %except.addr, align 8, !dbg !4388
  %16 = call ptr @memset(ptr %15, i32 0, i64 128), !dbg !4388
  br label %if.end8, !dbg !4389

if.else7:                                         ; preds = %if.end4
  %17 = call ptr @memset(ptr %in_except, i32 0, i64 128), !dbg !4390
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %18 = call ptr @memset(ptr %os_read, i32 0, i64 128), !dbg !4392
  %19 = call ptr @memset(ptr %os_write, i32 0, i64 128), !dbg !4393
  %20 = call ptr @memset(ptr %os_except, i32 0, i64 128), !dbg !4394
  store i32 0, ptr %i, align 4, !dbg !4395
  br label %for.cond, !dbg !4397

for.cond:                                         ; preds = %for.inc, %if.end8
  %21 = load i32, ptr %i, align 4, !dbg !4398
  %22 = load i32, ptr %nfds.addr, align 4, !dbg !4400
  %cmp = icmp slt i32 %21, %22, !dbg !4401
  br i1 %cmp, label %for.body, label %for.end, !dbg !4402

for.body:                                         ; preds = %for.cond
  %fds_bits = getelementptr inbounds %struct.fd_set, ptr %in_read, i32 0, i32 0, !dbg !4403
  %23 = load i32, ptr %i, align 4, !dbg !4403
  %div = sdiv i32 %23, 64, !dbg !4403
  %idxprom = sext i32 %div to i64, !dbg !4403
  %arrayidx = getelementptr inbounds [16 x i64], ptr %fds_bits, i64 0, i64 %idxprom, !dbg !4403
  %24 = load i64, ptr %arrayidx, align 8, !dbg !4403
  %25 = load i32, ptr %i, align 4, !dbg !4403
  %rem = srem i32 %25, 64, !dbg !4403
  %int_cast_to_i64 = zext i32 %rem to i64, !dbg !4403
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4403
  %shl = shl i32 1, %rem, !dbg !4403, !klee.check.shift !4406
  %conv = sext i32 %shl to i64, !dbg !4403
  %and = and i64 %24, %conv, !dbg !4403
  %tobool9 = icmp ne i64 %and, 0, !dbg !4403
  br i1 %tobool9, label %if.then29, label %lor.lhs.false, !dbg !4407

lor.lhs.false:                                    ; preds = %for.body
  %fds_bits10 = getelementptr inbounds %struct.fd_set, ptr %in_write, i32 0, i32 0, !dbg !4408
  %26 = load i32, ptr %i, align 4, !dbg !4408
  %div11 = sdiv i32 %26, 64, !dbg !4408
  %idxprom12 = sext i32 %div11 to i64, !dbg !4408
  %arrayidx13 = getelementptr inbounds [16 x i64], ptr %fds_bits10, i64 0, i64 %idxprom12, !dbg !4408
  %27 = load i64, ptr %arrayidx13, align 8, !dbg !4408
  %28 = load i32, ptr %i, align 4, !dbg !4408
  %rem14 = srem i32 %28, 64, !dbg !4408
  %int_cast_to_i641 = zext i32 %rem14 to i64, !dbg !4408
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4408
  %shl15 = shl i32 1, %rem14, !dbg !4408, !klee.check.shift !4406
  %conv16 = sext i32 %shl15 to i64, !dbg !4408
  %and17 = and i64 %27, %conv16, !dbg !4408
  %tobool18 = icmp ne i64 %and17, 0, !dbg !4408
  br i1 %tobool18, label %if.then29, label %lor.lhs.false19, !dbg !4409

lor.lhs.false19:                                  ; preds = %lor.lhs.false
  %fds_bits20 = getelementptr inbounds %struct.fd_set, ptr %in_except, i32 0, i32 0, !dbg !4410
  %29 = load i32, ptr %i, align 4, !dbg !4410
  %div21 = sdiv i32 %29, 64, !dbg !4410
  %idxprom22 = sext i32 %div21 to i64, !dbg !4410
  %arrayidx23 = getelementptr inbounds [16 x i64], ptr %fds_bits20, i64 0, i64 %idxprom22, !dbg !4410
  %30 = load i64, ptr %arrayidx23, align 8, !dbg !4410
  %31 = load i32, ptr %i, align 4, !dbg !4410
  %rem24 = srem i32 %31, 64, !dbg !4410
  %int_cast_to_i642 = zext i32 %rem24 to i64, !dbg !4410
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4410
  %shl25 = shl i32 1, %rem24, !dbg !4410, !klee.check.shift !4406
  %conv26 = sext i32 %shl25 to i64, !dbg !4410
  %and27 = and i64 %30, %conv26, !dbg !4410
  %tobool28 = icmp ne i64 %and27, 0, !dbg !4410
  br i1 %tobool28, label %if.then29, label %for.inc, !dbg !4411

if.then29:                                        ; preds = %lor.lhs.false19, %lor.lhs.false, %for.body
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4412, metadata !DIExpression()), !dbg !4414
  %32 = load i32, ptr %i, align 4, !dbg !4415
  %call = call ptr @__get_file(i32 noundef %32), !dbg !4416
  store ptr %call, ptr %f, align 8, !dbg !4414
  %33 = load ptr, ptr %f, align 8, !dbg !4417
  %tobool30 = icmp ne ptr %33, null, !dbg !4417
  br i1 %tobool30, label %if.else33, label %if.then31, !dbg !4419

if.then31:                                        ; preds = %if.then29
  %call32 = call ptr @__errno_location() #17, !dbg !4420
  store i32 9, ptr %call32, align 4, !dbg !4422
  store i32 -1, ptr %retval, align 4, !dbg !4423
  br label %return, !dbg !4423

if.else33:                                        ; preds = %if.then29
  %34 = load ptr, ptr %f, align 8, !dbg !4424
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %34, i32 0, i32 3, !dbg !4426
  %35 = load ptr, ptr %dfile, align 8, !dbg !4426
  %tobool34 = icmp ne ptr %35, null, !dbg !4424
  br i1 %tobool34, label %if.then35, label %if.else92, !dbg !4427

if.then35:                                        ; preds = %if.else33
  %fds_bits36 = getelementptr inbounds %struct.fd_set, ptr %in_read, i32 0, i32 0, !dbg !4428
  %36 = load i32, ptr %i, align 4, !dbg !4428
  %div37 = sdiv i32 %36, 64, !dbg !4428
  %idxprom38 = sext i32 %div37 to i64, !dbg !4428
  %arrayidx39 = getelementptr inbounds [16 x i64], ptr %fds_bits36, i64 0, i64 %idxprom38, !dbg !4428
  %37 = load i64, ptr %arrayidx39, align 8, !dbg !4428
  %38 = load i32, ptr %i, align 4, !dbg !4428
  %rem40 = srem i32 %38, 64, !dbg !4428
  %int_cast_to_i643 = zext i32 %rem40 to i64, !dbg !4428
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i643), !dbg !4428
  %shl41 = shl i32 1, %rem40, !dbg !4428, !klee.check.shift !4406
  %conv42 = sext i32 %shl41 to i64, !dbg !4428
  %and43 = and i64 %37, %conv42, !dbg !4428
  %tobool44 = icmp ne i64 %and43, 0, !dbg !4428
  br i1 %tobool44, label %if.then45, label %if.end53, !dbg !4431

if.then45:                                        ; preds = %if.then35
  %39 = load i32, ptr %i, align 4, !dbg !4432
  %rem46 = srem i32 %39, 64, !dbg !4432
  %int_cast_to_i644 = zext i32 %rem46 to i64, !dbg !4432
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i644), !dbg !4432
  %shl47 = shl i32 1, %rem46, !dbg !4432, !klee.check.shift !4406
  %conv48 = sext i32 %shl47 to i64, !dbg !4432
  %40 = load ptr, ptr %read.addr, align 8, !dbg !4432
  %fds_bits49 = getelementptr inbounds %struct.fd_set, ptr %40, i32 0, i32 0, !dbg !4432
  %41 = load i32, ptr %i, align 4, !dbg !4432
  %div50 = sdiv i32 %41, 64, !dbg !4432
  %idxprom51 = sext i32 %div50 to i64, !dbg !4432
  %arrayidx52 = getelementptr inbounds [16 x i64], ptr %fds_bits49, i64 0, i64 %idxprom51, !dbg !4432
  %42 = load i64, ptr %arrayidx52, align 8, !dbg !4432
  %or = or i64 %42, %conv48, !dbg !4432
  store i64 %or, ptr %arrayidx52, align 8, !dbg !4432
  br label %if.end53, !dbg !4432

if.end53:                                         ; preds = %if.then45, %if.then35
  %fds_bits54 = getelementptr inbounds %struct.fd_set, ptr %in_write, i32 0, i32 0, !dbg !4433
  %43 = load i32, ptr %i, align 4, !dbg !4433
  %div55 = sdiv i32 %43, 64, !dbg !4433
  %idxprom56 = sext i32 %div55 to i64, !dbg !4433
  %arrayidx57 = getelementptr inbounds [16 x i64], ptr %fds_bits54, i64 0, i64 %idxprom56, !dbg !4433
  %44 = load i64, ptr %arrayidx57, align 8, !dbg !4433
  %45 = load i32, ptr %i, align 4, !dbg !4433
  %rem58 = srem i32 %45, 64, !dbg !4433
  %int_cast_to_i645 = zext i32 %rem58 to i64, !dbg !4433
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i645), !dbg !4433
  %shl59 = shl i32 1, %rem58, !dbg !4433, !klee.check.shift !4406
  %conv60 = sext i32 %shl59 to i64, !dbg !4433
  %and61 = and i64 %44, %conv60, !dbg !4433
  %tobool62 = icmp ne i64 %and61, 0, !dbg !4433
  br i1 %tobool62, label %if.then63, label %if.end72, !dbg !4435

if.then63:                                        ; preds = %if.end53
  %46 = load i32, ptr %i, align 4, !dbg !4436
  %rem64 = srem i32 %46, 64, !dbg !4436
  %int_cast_to_i646 = zext i32 %rem64 to i64, !dbg !4436
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i646), !dbg !4436
  %shl65 = shl i32 1, %rem64, !dbg !4436, !klee.check.shift !4406
  %conv66 = sext i32 %shl65 to i64, !dbg !4436
  %47 = load ptr, ptr %write.addr, align 8, !dbg !4436
  %fds_bits67 = getelementptr inbounds %struct.fd_set, ptr %47, i32 0, i32 0, !dbg !4436
  %48 = load i32, ptr %i, align 4, !dbg !4436
  %div68 = sdiv i32 %48, 64, !dbg !4436
  %idxprom69 = sext i32 %div68 to i64, !dbg !4436
  %arrayidx70 = getelementptr inbounds [16 x i64], ptr %fds_bits67, i64 0, i64 %idxprom69, !dbg !4436
  %49 = load i64, ptr %arrayidx70, align 8, !dbg !4436
  %or71 = or i64 %49, %conv66, !dbg !4436
  store i64 %or71, ptr %arrayidx70, align 8, !dbg !4436
  br label %if.end72, !dbg !4436

if.end72:                                         ; preds = %if.then63, %if.end53
  %fds_bits73 = getelementptr inbounds %struct.fd_set, ptr %in_except, i32 0, i32 0, !dbg !4437
  %50 = load i32, ptr %i, align 4, !dbg !4437
  %div74 = sdiv i32 %50, 64, !dbg !4437
  %idxprom75 = sext i32 %div74 to i64, !dbg !4437
  %arrayidx76 = getelementptr inbounds [16 x i64], ptr %fds_bits73, i64 0, i64 %idxprom75, !dbg !4437
  %51 = load i64, ptr %arrayidx76, align 8, !dbg !4437
  %52 = load i32, ptr %i, align 4, !dbg !4437
  %rem77 = srem i32 %52, 64, !dbg !4437
  %int_cast_to_i647 = zext i32 %rem77 to i64, !dbg !4437
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i647), !dbg !4437
  %shl78 = shl i32 1, %rem77, !dbg !4437, !klee.check.shift !4406
  %conv79 = sext i32 %shl78 to i64, !dbg !4437
  %and80 = and i64 %51, %conv79, !dbg !4437
  %tobool81 = icmp ne i64 %and80, 0, !dbg !4437
  br i1 %tobool81, label %if.then82, label %if.end91, !dbg !4439

if.then82:                                        ; preds = %if.end72
  %53 = load i32, ptr %i, align 4, !dbg !4440
  %rem83 = srem i32 %53, 64, !dbg !4440
  %int_cast_to_i648 = zext i32 %rem83 to i64, !dbg !4440
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i648), !dbg !4440
  %shl84 = shl i32 1, %rem83, !dbg !4440, !klee.check.shift !4406
  %conv85 = sext i32 %shl84 to i64, !dbg !4440
  %54 = load ptr, ptr %except.addr, align 8, !dbg !4440
  %fds_bits86 = getelementptr inbounds %struct.fd_set, ptr %54, i32 0, i32 0, !dbg !4440
  %55 = load i32, ptr %i, align 4, !dbg !4440
  %div87 = sdiv i32 %55, 64, !dbg !4440
  %idxprom88 = sext i32 %div87 to i64, !dbg !4440
  %arrayidx89 = getelementptr inbounds [16 x i64], ptr %fds_bits86, i64 0, i64 %idxprom88, !dbg !4440
  %56 = load i64, ptr %arrayidx89, align 8, !dbg !4440
  %or90 = or i64 %56, %conv85, !dbg !4440
  store i64 %or90, ptr %arrayidx89, align 8, !dbg !4440
  br label %if.end91, !dbg !4440

if.end91:                                         ; preds = %if.then82, %if.end72
  %57 = load i32, ptr %count, align 4, !dbg !4441
  %inc = add nsw i32 %57, 1, !dbg !4441
  store i32 %inc, ptr %count, align 4, !dbg !4441
  br label %for.inc, !dbg !4442

if.else92:                                        ; preds = %if.else33
  %fds_bits93 = getelementptr inbounds %struct.fd_set, ptr %in_read, i32 0, i32 0, !dbg !4443
  %58 = load i32, ptr %i, align 4, !dbg !4443
  %div94 = sdiv i32 %58, 64, !dbg !4443
  %idxprom95 = sext i32 %div94 to i64, !dbg !4443
  %arrayidx96 = getelementptr inbounds [16 x i64], ptr %fds_bits93, i64 0, i64 %idxprom95, !dbg !4443
  %59 = load i64, ptr %arrayidx96, align 8, !dbg !4443
  %60 = load i32, ptr %i, align 4, !dbg !4443
  %rem97 = srem i32 %60, 64, !dbg !4443
  %int_cast_to_i649 = zext i32 %rem97 to i64, !dbg !4443
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i649), !dbg !4443
  %shl98 = shl i32 1, %rem97, !dbg !4443, !klee.check.shift !4406
  %conv99 = sext i32 %shl98 to i64, !dbg !4443
  %and100 = and i64 %59, %conv99, !dbg !4443
  %tobool101 = icmp ne i64 %and100, 0, !dbg !4443
  br i1 %tobool101, label %if.then102, label %if.end112, !dbg !4446

if.then102:                                       ; preds = %if.else92
  %61 = load ptr, ptr %f, align 8, !dbg !4447
  %fd = getelementptr inbounds %struct.exe_file_t.6, ptr %61, i32 0, i32 0, !dbg !4447
  %62 = load i32, ptr %fd, align 8, !dbg !4447
  %rem103 = srem i32 %62, 64, !dbg !4447
  %int_cast_to_i6410 = zext i32 %rem103 to i64, !dbg !4447
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6410), !dbg !4447
  %shl104 = shl i32 1, %rem103, !dbg !4447, !klee.check.shift !4406
  %conv105 = sext i32 %shl104 to i64, !dbg !4447
  %fds_bits106 = getelementptr inbounds %struct.fd_set, ptr %os_read, i32 0, i32 0, !dbg !4447
  %63 = load ptr, ptr %f, align 8, !dbg !4447
  %fd107 = getelementptr inbounds %struct.exe_file_t.6, ptr %63, i32 0, i32 0, !dbg !4447
  %64 = load i32, ptr %fd107, align 8, !dbg !4447
  %div108 = sdiv i32 %64, 64, !dbg !4447
  %idxprom109 = sext i32 %div108 to i64, !dbg !4447
  %arrayidx110 = getelementptr inbounds [16 x i64], ptr %fds_bits106, i64 0, i64 %idxprom109, !dbg !4447
  %65 = load i64, ptr %arrayidx110, align 8, !dbg !4447
  %or111 = or i64 %65, %conv105, !dbg !4447
  store i64 %or111, ptr %arrayidx110, align 8, !dbg !4447
  br label %if.end112, !dbg !4447

if.end112:                                        ; preds = %if.then102, %if.else92
  %fds_bits113 = getelementptr inbounds %struct.fd_set, ptr %in_write, i32 0, i32 0, !dbg !4448
  %66 = load i32, ptr %i, align 4, !dbg !4448
  %div114 = sdiv i32 %66, 64, !dbg !4448
  %idxprom115 = sext i32 %div114 to i64, !dbg !4448
  %arrayidx116 = getelementptr inbounds [16 x i64], ptr %fds_bits113, i64 0, i64 %idxprom115, !dbg !4448
  %67 = load i64, ptr %arrayidx116, align 8, !dbg !4448
  %68 = load i32, ptr %i, align 4, !dbg !4448
  %rem117 = srem i32 %68, 64, !dbg !4448
  %int_cast_to_i6411 = zext i32 %rem117 to i64, !dbg !4448
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6411), !dbg !4448
  %shl118 = shl i32 1, %rem117, !dbg !4448, !klee.check.shift !4406
  %conv119 = sext i32 %shl118 to i64, !dbg !4448
  %and120 = and i64 %67, %conv119, !dbg !4448
  %tobool121 = icmp ne i64 %and120, 0, !dbg !4448
  br i1 %tobool121, label %if.then122, label %if.end133, !dbg !4450

if.then122:                                       ; preds = %if.end112
  %69 = load ptr, ptr %f, align 8, !dbg !4451
  %fd123 = getelementptr inbounds %struct.exe_file_t.6, ptr %69, i32 0, i32 0, !dbg !4451
  %70 = load i32, ptr %fd123, align 8, !dbg !4451
  %rem124 = srem i32 %70, 64, !dbg !4451
  %int_cast_to_i6412 = zext i32 %rem124 to i64, !dbg !4451
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6412), !dbg !4451
  %shl125 = shl i32 1, %rem124, !dbg !4451, !klee.check.shift !4406
  %conv126 = sext i32 %shl125 to i64, !dbg !4451
  %fds_bits127 = getelementptr inbounds %struct.fd_set, ptr %os_write, i32 0, i32 0, !dbg !4451
  %71 = load ptr, ptr %f, align 8, !dbg !4451
  %fd128 = getelementptr inbounds %struct.exe_file_t.6, ptr %71, i32 0, i32 0, !dbg !4451
  %72 = load i32, ptr %fd128, align 8, !dbg !4451
  %div129 = sdiv i32 %72, 64, !dbg !4451
  %idxprom130 = sext i32 %div129 to i64, !dbg !4451
  %arrayidx131 = getelementptr inbounds [16 x i64], ptr %fds_bits127, i64 0, i64 %idxprom130, !dbg !4451
  %73 = load i64, ptr %arrayidx131, align 8, !dbg !4451
  %or132 = or i64 %73, %conv126, !dbg !4451
  store i64 %or132, ptr %arrayidx131, align 8, !dbg !4451
  br label %if.end133, !dbg !4451

if.end133:                                        ; preds = %if.then122, %if.end112
  %fds_bits134 = getelementptr inbounds %struct.fd_set, ptr %in_except, i32 0, i32 0, !dbg !4452
  %74 = load i32, ptr %i, align 4, !dbg !4452
  %div135 = sdiv i32 %74, 64, !dbg !4452
  %idxprom136 = sext i32 %div135 to i64, !dbg !4452
  %arrayidx137 = getelementptr inbounds [16 x i64], ptr %fds_bits134, i64 0, i64 %idxprom136, !dbg !4452
  %75 = load i64, ptr %arrayidx137, align 8, !dbg !4452
  %76 = load i32, ptr %i, align 4, !dbg !4452
  %rem138 = srem i32 %76, 64, !dbg !4452
  %int_cast_to_i6413 = zext i32 %rem138 to i64, !dbg !4452
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6413), !dbg !4452
  %shl139 = shl i32 1, %rem138, !dbg !4452, !klee.check.shift !4406
  %conv140 = sext i32 %shl139 to i64, !dbg !4452
  %and141 = and i64 %75, %conv140, !dbg !4452
  %tobool142 = icmp ne i64 %and141, 0, !dbg !4452
  br i1 %tobool142, label %if.then143, label %if.end154, !dbg !4454

if.then143:                                       ; preds = %if.end133
  %77 = load ptr, ptr %f, align 8, !dbg !4455
  %fd144 = getelementptr inbounds %struct.exe_file_t.6, ptr %77, i32 0, i32 0, !dbg !4455
  %78 = load i32, ptr %fd144, align 8, !dbg !4455
  %rem145 = srem i32 %78, 64, !dbg !4455
  %int_cast_to_i6414 = zext i32 %rem145 to i64, !dbg !4455
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6414), !dbg !4455
  %shl146 = shl i32 1, %rem145, !dbg !4455, !klee.check.shift !4406
  %conv147 = sext i32 %shl146 to i64, !dbg !4455
  %fds_bits148 = getelementptr inbounds %struct.fd_set, ptr %os_except, i32 0, i32 0, !dbg !4455
  %79 = load ptr, ptr %f, align 8, !dbg !4455
  %fd149 = getelementptr inbounds %struct.exe_file_t.6, ptr %79, i32 0, i32 0, !dbg !4455
  %80 = load i32, ptr %fd149, align 8, !dbg !4455
  %div150 = sdiv i32 %80, 64, !dbg !4455
  %idxprom151 = sext i32 %div150 to i64, !dbg !4455
  %arrayidx152 = getelementptr inbounds [16 x i64], ptr %fds_bits148, i64 0, i64 %idxprom151, !dbg !4455
  %81 = load i64, ptr %arrayidx152, align 8, !dbg !4455
  %or153 = or i64 %81, %conv147, !dbg !4455
  store i64 %or153, ptr %arrayidx152, align 8, !dbg !4455
  br label %if.end154, !dbg !4455

if.end154:                                        ; preds = %if.then143, %if.end133
  %82 = load ptr, ptr %f, align 8, !dbg !4456
  %fd155 = getelementptr inbounds %struct.exe_file_t.6, ptr %82, i32 0, i32 0, !dbg !4458
  %83 = load i32, ptr %fd155, align 8, !dbg !4458
  %84 = load i32, ptr %os_nfds, align 4, !dbg !4459
  %cmp156 = icmp sge i32 %83, %84, !dbg !4460
  br i1 %cmp156, label %if.then158, label %for.inc, !dbg !4461

if.then158:                                       ; preds = %if.end154
  %85 = load ptr, ptr %f, align 8, !dbg !4462
  %fd159 = getelementptr inbounds %struct.exe_file_t.6, ptr %85, i32 0, i32 0, !dbg !4463
  %86 = load i32, ptr %fd159, align 8, !dbg !4463
  %add = add nsw i32 %86, 1, !dbg !4464
  store i32 %add, ptr %os_nfds, align 4, !dbg !4465
  br label %for.inc, !dbg !4466

for.inc:                                          ; preds = %lor.lhs.false19, %if.end91, %if.then158, %if.end154
  %87 = load i32, ptr %i, align 4, !dbg !4467
  %inc164 = add nsw i32 %87, 1, !dbg !4467
  store i32 %inc164, ptr %i, align 4, !dbg !4467
  br label %for.cond, !dbg !4468, !llvm.loop !4469

for.end:                                          ; preds = %for.cond
  %88 = load i32, ptr %os_nfds, align 4, !dbg !4471
  %cmp165 = icmp sgt i32 %88, 0, !dbg !4473
  br i1 %cmp165, label %if.then167, label %if.end262, !dbg !4474

if.then167:                                       ; preds = %for.end
  call void @llvm.dbg.declare(metadata ptr %tv, metadata !4475, metadata !DIExpression()), !dbg !4477
  %89 = call ptr @memset(ptr %tv, i32 0, i64 16), !dbg !4477
  call void @llvm.dbg.declare(metadata ptr %r, metadata !4478, metadata !DIExpression()), !dbg !4479
  %90 = load i32, ptr %os_nfds, align 4, !dbg !4480
  %call168 = call i64 (i64, ...) @syscall(i64 noundef 23, i32 noundef %90, ptr noundef %os_read, ptr noundef %os_write, ptr noundef %os_except, ptr noundef %tv) #16, !dbg !4481
  %conv169 = trunc i64 %call168 to i32, !dbg !4481
  store i32 %conv169, ptr %r, align 4, !dbg !4479
  %91 = load i32, ptr %r, align 4, !dbg !4482
  %cmp170 = icmp eq i32 %91, -1, !dbg !4484
  br i1 %cmp170, label %if.then172, label %if.else176, !dbg !4485

if.then172:                                       ; preds = %if.then167
  %92 = load i32, ptr %count, align 4, !dbg !4486
  %tobool173 = icmp ne i32 %92, 0, !dbg !4486
  br i1 %tobool173, label %if.end262, label %if.then174, !dbg !4489

if.then174:                                       ; preds = %if.then172
  store i32 -1, ptr %retval, align 4, !dbg !4490
  br label %return, !dbg !4490

if.else176:                                       ; preds = %if.then167
  %93 = load i32, ptr %r, align 4, !dbg !4491
  %94 = load i32, ptr %count, align 4, !dbg !4493
  %add177 = add nsw i32 %94, %93, !dbg !4493
  store i32 %add177, ptr %count, align 4, !dbg !4493
  store i32 0, ptr %i, align 4, !dbg !4494
  br label %for.cond178, !dbg !4496

for.cond178:                                      ; preds = %for.inc258, %if.else176
  %95 = load i32, ptr %i, align 4, !dbg !4497
  %96 = load i32, ptr %nfds.addr, align 4, !dbg !4499
  %cmp179 = icmp slt i32 %95, %96, !dbg !4500
  br i1 %cmp179, label %for.body181, label %if.end262, !dbg !4501

for.body181:                                      ; preds = %for.cond178
  call void @llvm.dbg.declare(metadata ptr %f182, metadata !4502, metadata !DIExpression()), !dbg !4504
  %97 = load i32, ptr %i, align 4, !dbg !4505
  %call183 = call ptr @__get_file(i32 noundef %97), !dbg !4506
  store ptr %call183, ptr %f182, align 8, !dbg !4504
  %98 = load ptr, ptr %f182, align 8, !dbg !4507
  %tobool184 = icmp ne ptr %98, null, !dbg !4507
  br i1 %tobool184, label %land.lhs.true, label %for.inc258, !dbg !4509

land.lhs.true:                                    ; preds = %for.body181
  %99 = load ptr, ptr %f182, align 8, !dbg !4510
  %dfile185 = getelementptr inbounds %struct.exe_file_t.6, ptr %99, i32 0, i32 3, !dbg !4511
  %100 = load ptr, ptr %dfile185, align 8, !dbg !4511
  %tobool186 = icmp ne ptr %100, null, !dbg !4510
  br i1 %tobool186, label %for.inc258, label %if.then187, !dbg !4512

if.then187:                                       ; preds = %land.lhs.true
  %101 = load ptr, ptr %read.addr, align 8, !dbg !4513
  %tobool188 = icmp ne ptr %101, null, !dbg !4513
  br i1 %tobool188, label %land.lhs.true189, label %if.end210, !dbg !4516

land.lhs.true189:                                 ; preds = %if.then187
  %fds_bits190 = getelementptr inbounds %struct.fd_set, ptr %os_read, i32 0, i32 0, !dbg !4517
  %102 = load ptr, ptr %f182, align 8, !dbg !4517
  %fd191 = getelementptr inbounds %struct.exe_file_t.6, ptr %102, i32 0, i32 0, !dbg !4517
  %103 = load i32, ptr %fd191, align 8, !dbg !4517
  %div192 = sdiv i32 %103, 64, !dbg !4517
  %idxprom193 = sext i32 %div192 to i64, !dbg !4517
  %arrayidx194 = getelementptr inbounds [16 x i64], ptr %fds_bits190, i64 0, i64 %idxprom193, !dbg !4517
  %104 = load i64, ptr %arrayidx194, align 8, !dbg !4517
  %105 = load ptr, ptr %f182, align 8, !dbg !4517
  %fd195 = getelementptr inbounds %struct.exe_file_t.6, ptr %105, i32 0, i32 0, !dbg !4517
  %106 = load i32, ptr %fd195, align 8, !dbg !4517
  %rem196 = srem i32 %106, 64, !dbg !4517
  %int_cast_to_i6415 = zext i32 %rem196 to i64, !dbg !4517
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6415), !dbg !4517
  %shl197 = shl i32 1, %rem196, !dbg !4517, !klee.check.shift !4406
  %conv198 = sext i32 %shl197 to i64, !dbg !4517
  %and199 = and i64 %104, %conv198, !dbg !4517
  %tobool200 = icmp ne i64 %and199, 0, !dbg !4517
  br i1 %tobool200, label %if.then201, label %if.end210, !dbg !4518

if.then201:                                       ; preds = %land.lhs.true189
  %107 = load i32, ptr %i, align 4, !dbg !4519
  %rem202 = srem i32 %107, 64, !dbg !4519
  %int_cast_to_i6416 = zext i32 %rem202 to i64, !dbg !4519
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6416), !dbg !4519
  %shl203 = shl i32 1, %rem202, !dbg !4519, !klee.check.shift !4406
  %conv204 = sext i32 %shl203 to i64, !dbg !4519
  %108 = load ptr, ptr %read.addr, align 8, !dbg !4519
  %fds_bits205 = getelementptr inbounds %struct.fd_set, ptr %108, i32 0, i32 0, !dbg !4519
  %109 = load i32, ptr %i, align 4, !dbg !4519
  %div206 = sdiv i32 %109, 64, !dbg !4519
  %idxprom207 = sext i32 %div206 to i64, !dbg !4519
  %arrayidx208 = getelementptr inbounds [16 x i64], ptr %fds_bits205, i64 0, i64 %idxprom207, !dbg !4519
  %110 = load i64, ptr %arrayidx208, align 8, !dbg !4519
  %or209 = or i64 %110, %conv204, !dbg !4519
  store i64 %or209, ptr %arrayidx208, align 8, !dbg !4519
  br label %if.end210, !dbg !4519

if.end210:                                        ; preds = %if.then201, %land.lhs.true189, %if.then187
  %111 = load ptr, ptr %write.addr, align 8, !dbg !4520
  %tobool211 = icmp ne ptr %111, null, !dbg !4520
  br i1 %tobool211, label %land.lhs.true212, label %if.end233, !dbg !4522

land.lhs.true212:                                 ; preds = %if.end210
  %fds_bits213 = getelementptr inbounds %struct.fd_set, ptr %os_write, i32 0, i32 0, !dbg !4523
  %112 = load ptr, ptr %f182, align 8, !dbg !4523
  %fd214 = getelementptr inbounds %struct.exe_file_t.6, ptr %112, i32 0, i32 0, !dbg !4523
  %113 = load i32, ptr %fd214, align 8, !dbg !4523
  %div215 = sdiv i32 %113, 64, !dbg !4523
  %idxprom216 = sext i32 %div215 to i64, !dbg !4523
  %arrayidx217 = getelementptr inbounds [16 x i64], ptr %fds_bits213, i64 0, i64 %idxprom216, !dbg !4523
  %114 = load i64, ptr %arrayidx217, align 8, !dbg !4523
  %115 = load ptr, ptr %f182, align 8, !dbg !4523
  %fd218 = getelementptr inbounds %struct.exe_file_t.6, ptr %115, i32 0, i32 0, !dbg !4523
  %116 = load i32, ptr %fd218, align 8, !dbg !4523
  %rem219 = srem i32 %116, 64, !dbg !4523
  %int_cast_to_i6417 = zext i32 %rem219 to i64, !dbg !4523
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6417), !dbg !4523
  %shl220 = shl i32 1, %rem219, !dbg !4523, !klee.check.shift !4406
  %conv221 = sext i32 %shl220 to i64, !dbg !4523
  %and222 = and i64 %114, %conv221, !dbg !4523
  %tobool223 = icmp ne i64 %and222, 0, !dbg !4523
  br i1 %tobool223, label %if.then224, label %if.end233, !dbg !4524

if.then224:                                       ; preds = %land.lhs.true212
  %117 = load i32, ptr %i, align 4, !dbg !4525
  %rem225 = srem i32 %117, 64, !dbg !4525
  %int_cast_to_i6418 = zext i32 %rem225 to i64, !dbg !4525
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6418), !dbg !4525
  %shl226 = shl i32 1, %rem225, !dbg !4525, !klee.check.shift !4406
  %conv227 = sext i32 %shl226 to i64, !dbg !4525
  %118 = load ptr, ptr %write.addr, align 8, !dbg !4525
  %fds_bits228 = getelementptr inbounds %struct.fd_set, ptr %118, i32 0, i32 0, !dbg !4525
  %119 = load i32, ptr %i, align 4, !dbg !4525
  %div229 = sdiv i32 %119, 64, !dbg !4525
  %idxprom230 = sext i32 %div229 to i64, !dbg !4525
  %arrayidx231 = getelementptr inbounds [16 x i64], ptr %fds_bits228, i64 0, i64 %idxprom230, !dbg !4525
  %120 = load i64, ptr %arrayidx231, align 8, !dbg !4525
  %or232 = or i64 %120, %conv227, !dbg !4525
  store i64 %or232, ptr %arrayidx231, align 8, !dbg !4525
  br label %if.end233, !dbg !4525

if.end233:                                        ; preds = %if.then224, %land.lhs.true212, %if.end210
  %121 = load ptr, ptr %except.addr, align 8, !dbg !4526
  %tobool234 = icmp ne ptr %121, null, !dbg !4526
  br i1 %tobool234, label %land.lhs.true235, label %for.inc258, !dbg !4528

land.lhs.true235:                                 ; preds = %if.end233
  %fds_bits236 = getelementptr inbounds %struct.fd_set, ptr %os_except, i32 0, i32 0, !dbg !4529
  %122 = load ptr, ptr %f182, align 8, !dbg !4529
  %fd237 = getelementptr inbounds %struct.exe_file_t.6, ptr %122, i32 0, i32 0, !dbg !4529
  %123 = load i32, ptr %fd237, align 8, !dbg !4529
  %div238 = sdiv i32 %123, 64, !dbg !4529
  %idxprom239 = sext i32 %div238 to i64, !dbg !4529
  %arrayidx240 = getelementptr inbounds [16 x i64], ptr %fds_bits236, i64 0, i64 %idxprom239, !dbg !4529
  %124 = load i64, ptr %arrayidx240, align 8, !dbg !4529
  %125 = load ptr, ptr %f182, align 8, !dbg !4529
  %fd241 = getelementptr inbounds %struct.exe_file_t.6, ptr %125, i32 0, i32 0, !dbg !4529
  %126 = load i32, ptr %fd241, align 8, !dbg !4529
  %rem242 = srem i32 %126, 64, !dbg !4529
  %int_cast_to_i6419 = zext i32 %rem242 to i64, !dbg !4529
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6419), !dbg !4529
  %shl243 = shl i32 1, %rem242, !dbg !4529, !klee.check.shift !4406
  %conv244 = sext i32 %shl243 to i64, !dbg !4529
  %and245 = and i64 %124, %conv244, !dbg !4529
  %tobool246 = icmp ne i64 %and245, 0, !dbg !4529
  br i1 %tobool246, label %if.then247, label %for.inc258, !dbg !4530

if.then247:                                       ; preds = %land.lhs.true235
  %127 = load i32, ptr %i, align 4, !dbg !4531
  %rem248 = srem i32 %127, 64, !dbg !4531
  %int_cast_to_i6420 = zext i32 %rem248 to i64, !dbg !4531
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6420), !dbg !4531
  %shl249 = shl i32 1, %rem248, !dbg !4531, !klee.check.shift !4406
  %conv250 = sext i32 %shl249 to i64, !dbg !4531
  %128 = load ptr, ptr %except.addr, align 8, !dbg !4531
  %fds_bits251 = getelementptr inbounds %struct.fd_set, ptr %128, i32 0, i32 0, !dbg !4531
  %129 = load i32, ptr %i, align 4, !dbg !4531
  %div252 = sdiv i32 %129, 64, !dbg !4531
  %idxprom253 = sext i32 %div252 to i64, !dbg !4531
  %arrayidx254 = getelementptr inbounds [16 x i64], ptr %fds_bits251, i64 0, i64 %idxprom253, !dbg !4531
  %130 = load i64, ptr %arrayidx254, align 8, !dbg !4531
  %or255 = or i64 %130, %conv250, !dbg !4531
  store i64 %or255, ptr %arrayidx254, align 8, !dbg !4531
  br label %for.inc258, !dbg !4531

for.inc258:                                       ; preds = %for.body181, %land.lhs.true, %if.then247, %land.lhs.true235, %if.end233
  %131 = load i32, ptr %i, align 4, !dbg !4532
  %inc259 = add nsw i32 %131, 1, !dbg !4532
  store i32 %inc259, ptr %i, align 4, !dbg !4532
  br label %for.cond178, !dbg !4533, !llvm.loop !4534

if.end262:                                        ; preds = %if.then172, %for.cond178, %for.end
  %132 = load i32, ptr %count, align 4, !dbg !4536
  store i32 %132, ptr %retval, align 4, !dbg !4537
  br label %return, !dbg !4537

return:                                           ; preds = %if.end262, %if.then174, %if.then31
  %133 = load i32, ptr %retval, align 4, !dbg !4538
  ret i32 %133, !dbg !4538
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chroot(ptr noundef nonnull %path) #0 !dbg !4539 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4540, metadata !DIExpression()), !dbg !4541
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4542
  %arrayidx = getelementptr inbounds i8, ptr %0, i64 0, !dbg !4542
  %1 = load i8, ptr %arrayidx, align 1, !dbg !4542
  %conv = sext i8 %1 to i32, !dbg !4542
  %cmp = icmp eq i32 %conv, 0, !dbg !4544
  br i1 %cmp, label %if.then, label %if.end, !dbg !4545

if.then:                                          ; preds = %entry
  %call = call ptr @__errno_location() #17, !dbg !4546
  store i32 2, ptr %call, align 4, !dbg !4548
  store i32 -1, ptr %retval, align 4, !dbg !4549
  br label %return, !dbg !4549

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %path.addr, align 8, !dbg !4550
  %arrayidx2 = getelementptr inbounds i8, ptr %2, i64 0, !dbg !4550
  %3 = load i8, ptr %arrayidx2, align 1, !dbg !4550
  %conv3 = sext i8 %3 to i32, !dbg !4550
  %cmp4 = icmp eq i32 %conv3, 47, !dbg !4552
  br i1 %cmp4, label %land.lhs.true, label %if.end11, !dbg !4553

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr %path.addr, align 8, !dbg !4554
  %arrayidx6 = getelementptr inbounds i8, ptr %4, i64 1, !dbg !4554
  %5 = load i8, ptr %arrayidx6, align 1, !dbg !4554
  %conv7 = sext i8 %5 to i32, !dbg !4554
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !4555
  br i1 %cmp8, label %if.then10, label %if.end11, !dbg !4556

if.then10:                                        ; preds = %land.lhs.true
  store i32 0, ptr %retval, align 4, !dbg !4557
  br label %return, !dbg !4557

if.end11:                                         ; preds = %land.lhs.true, %if.end
  call void @klee_warning(ptr noundef @.str.25.86), !dbg !4559
  %call12 = call ptr @__errno_location() #17, !dbg !4560
  store i32 2, ptr %call12, align 4, !dbg !4561
  store i32 -1, ptr %retval, align 4, !dbg !4562
  br label %return, !dbg !4562

return:                                           ; preds = %if.end11, %if.then10, %if.then
  %6 = load i32, ptr %retval, align 4, !dbg !4563
  ret i32 %6, !dbg !4563
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @open64(ptr noundef nonnull %pathname, i32 noundef %flags, ...) #0 !dbg !4564 {
entry:
  %pathname.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %mode = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4568, metadata !DIExpression()), !dbg !4569
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !4570, metadata !DIExpression()), !dbg !4571
  call void @llvm.dbg.declare(metadata ptr %mode, metadata !4572, metadata !DIExpression()), !dbg !4573
  store i32 0, ptr %mode, align 4, !dbg !4573
  %0 = load i32, ptr %flags.addr, align 4, !dbg !4574
  %and = and i32 %0, 64, !dbg !4576
  %tobool = icmp ne i32 %and, 0, !dbg !4576
  br i1 %tobool, label %if.then, label %if.end, !dbg !4577

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %ap, metadata !4578, metadata !DIExpression()), !dbg !4591
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4592
  call void @llvm.va_start(ptr %arraydecay), !dbg !4592
  %arraydecay1 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4593
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 0, !dbg !4593
  %gp_offset = load i32, ptr %gp_offset_p, align 16, !dbg !4593
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !4593
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !4593

vaarg.in_reg:                                     ; preds = %if.then
  %1 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 3, !dbg !4593
  %reg_save_area = load ptr, ptr %1, align 16, !dbg !4593
  %2 = getelementptr i8, ptr %reg_save_area, i32 %gp_offset, !dbg !4593
  %3 = add i32 %gp_offset, 8, !dbg !4593
  store i32 %3, ptr %gp_offset_p, align 16, !dbg !4593
  br label %vaarg.end, !dbg !4593

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 2, !dbg !4593
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8, !dbg !4593
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8, !dbg !4593
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8, !dbg !4593
  br label %vaarg.end, !dbg !4593

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ], !dbg !4593
  %4 = load i32, ptr %vaarg.addr, align 4, !dbg !4593
  store i32 %4, ptr %mode, align 4, !dbg !4594
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4595
  call void @llvm.va_end(ptr %arraydecay2), !dbg !4595
  br label %if.end, !dbg !4596

if.end:                                           ; preds = %vaarg.end, %entry
  %5 = load ptr, ptr %pathname.addr, align 8, !dbg !4597
  %6 = load i32, ptr %flags.addr, align 4, !dbg !4598
  %7 = load i32, ptr %mode, align 4, !dbg !4599
  %call = call i32 @__fd_open(ptr noundef %5, i32 noundef %6, i32 noundef %7), !dbg !4600
  ret i32 %call, !dbg !4601
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @openat64(i32 noundef %fd, ptr noundef nonnull %pathname, i32 noundef %flags, ...) #0 !dbg !4602 {
entry:
  %fd.addr = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %mode = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4605, metadata !DIExpression()), !dbg !4606
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4607, metadata !DIExpression()), !dbg !4608
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !4609, metadata !DIExpression()), !dbg !4610
  call void @llvm.dbg.declare(metadata ptr %mode, metadata !4611, metadata !DIExpression()), !dbg !4612
  store i32 0, ptr %mode, align 4, !dbg !4612
  %0 = load i32, ptr %flags.addr, align 4, !dbg !4613
  %and = and i32 %0, 64, !dbg !4615
  %tobool = icmp ne i32 %and, 0, !dbg !4615
  br i1 %tobool, label %if.then, label %if.end, !dbg !4616

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %ap, metadata !4617, metadata !DIExpression()), !dbg !4619
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4620
  call void @llvm.va_start(ptr %arraydecay), !dbg !4620
  %arraydecay1 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4621
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 0, !dbg !4621
  %gp_offset = load i32, ptr %gp_offset_p, align 16, !dbg !4621
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !4621
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !4621

vaarg.in_reg:                                     ; preds = %if.then
  %1 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 3, !dbg !4621
  %reg_save_area = load ptr, ptr %1, align 16, !dbg !4621
  %2 = getelementptr i8, ptr %reg_save_area, i32 %gp_offset, !dbg !4621
  %3 = add i32 %gp_offset, 8, !dbg !4621
  store i32 %3, ptr %gp_offset_p, align 16, !dbg !4621
  br label %vaarg.end, !dbg !4621

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 2, !dbg !4621
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8, !dbg !4621
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8, !dbg !4621
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8, !dbg !4621
  br label %vaarg.end, !dbg !4621

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ], !dbg !4621
  %4 = load i32, ptr %vaarg.addr, align 4, !dbg !4621
  store i32 %4, ptr %mode, align 4, !dbg !4622
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4623
  call void @llvm.va_end(ptr %arraydecay2), !dbg !4623
  br label %if.end, !dbg !4624

if.end:                                           ; preds = %vaarg.end, %entry
  %5 = load i32, ptr %fd.addr, align 4, !dbg !4625
  %6 = load ptr, ptr %pathname.addr, align 8, !dbg !4626
  %7 = load i32, ptr %flags.addr, align 4, !dbg !4627
  %8 = load i32, ptr %mode, align 4, !dbg !4628
  %call = call i32 @__fd_openat(i32 noundef %5, ptr noundef %6, i32 noundef %7, i32 noundef %8), !dbg !4629
  ret i32 %call, !dbg !4630
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @lseek64(i32 noundef %fd, i64 noundef %offset, i32 noundef %whence) #0 !dbg !4631 {
entry:
  %fd.addr = alloca i32, align 4
  %offset.addr = alloca i64, align 8
  %whence.addr = alloca i32, align 4
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4634, metadata !DIExpression()), !dbg !4635
  store i64 %offset, ptr %offset.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %offset.addr, metadata !4636, metadata !DIExpression()), !dbg !4637
  store i32 %whence, ptr %whence.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %whence.addr, metadata !4638, metadata !DIExpression()), !dbg !4639
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4640
  %1 = load i64, ptr %offset.addr, align 8, !dbg !4641
  %2 = load i32, ptr %whence.addr, align 4, !dbg !4642
  %call = call i64 @__fd_lseek(i32 noundef %0, i64 noundef %1, i32 noundef %2), !dbg !4643
  ret i64 %call, !dbg !4644
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__xstat64(i32 noundef %vers, ptr noundef %path, ptr noundef %buf) #0 !dbg !4645 {
entry:
  %vers.addr = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store i32 %vers, ptr %vers.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %vers.addr, metadata !4666, metadata !DIExpression()), !dbg !4667
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4668, metadata !DIExpression()), !dbg !4669
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4670, metadata !DIExpression()), !dbg !4671
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4672
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4673
  %call = call i32 @__fd_stat(ptr noundef %0, ptr noundef %1), !dbg !4674
  ret i32 %call, !dbg !4675
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @stat64(ptr noundef nonnull %path, ptr noundef nonnull %buf) #0 !dbg !4676 {
entry:
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4679, metadata !DIExpression()), !dbg !4680
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4681, metadata !DIExpression()), !dbg !4682
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4683
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4684
  %call = call i32 @__fd_stat(ptr noundef %0, ptr noundef %1), !dbg !4685
  ret i32 %call, !dbg !4686
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__lxstat64(i32 noundef %vers, ptr noundef %path, ptr noundef %buf) #0 !dbg !4687 {
entry:
  %vers.addr = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store i32 %vers, ptr %vers.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %vers.addr, metadata !4688, metadata !DIExpression()), !dbg !4689
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4690, metadata !DIExpression()), !dbg !4691
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4692, metadata !DIExpression()), !dbg !4693
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4694
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4695
  %call = call i32 @__fd_lstat(ptr noundef %0, ptr noundef %1), !dbg !4696
  ret i32 %call, !dbg !4697
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @lstat64(ptr noundef nonnull %path, ptr noundef nonnull %buf) #0 !dbg !4698 {
entry:
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4699, metadata !DIExpression()), !dbg !4700
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4701, metadata !DIExpression()), !dbg !4702
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4703
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4704
  %call = call i32 @__fd_lstat(ptr noundef %0, ptr noundef %1), !dbg !4705
  ret i32 %call, !dbg !4706
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fxstat64(i32 noundef %vers, i32 noundef %fd, ptr noundef %buf) #0 !dbg !4707 {
entry:
  %vers.addr = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  store i32 %vers, ptr %vers.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %vers.addr, metadata !4710, metadata !DIExpression()), !dbg !4711
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4712, metadata !DIExpression()), !dbg !4713
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4714, metadata !DIExpression()), !dbg !4715
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4716
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4717
  %call = call i32 @__fd_fstat(i32 noundef %0, ptr noundef %1), !dbg !4718
  ret i32 %call, !dbg !4719
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fstat64(i32 noundef %fd, ptr noundef nonnull %buf) #0 !dbg !4720 {
entry:
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4723, metadata !DIExpression()), !dbg !4724
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4725, metadata !DIExpression()), !dbg !4726
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4727
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4728
  %call = call i32 @__fd_fstat(i32 noundef %0, ptr noundef %1), !dbg !4729
  ret i32 %call, !dbg !4730
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ftruncate64(i32 noundef %fd, i64 noundef %length) #0 !dbg !4731 {
entry:
  %fd.addr = alloca i32, align 4
  %length.addr = alloca i64, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4732, metadata !DIExpression()), !dbg !4733
  store i64 %length, ptr %length.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %length.addr, metadata !4734, metadata !DIExpression()), !dbg !4735
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4736
  %1 = load i64, ptr %length.addr, align 8, !dbg !4737
  %call = call i32 @__fd_ftruncate(i32 noundef %0, i64 noundef %1), !dbg !4738
  ret i32 %call, !dbg !4739
}

; Function Attrs: noinline nounwind uwtable
define weak dso_local i32 @statfs64(ptr noundef nonnull %path, ptr noundef nonnull %buf) #0 !dbg !4740 {
entry:
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4764, metadata !DIExpression()), !dbg !4765
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4766, metadata !DIExpression()), !dbg !4767
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4768
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4769
  %call = call i32 @__fd_statfs(ptr noundef %0, ptr noundef %1), !dbg !4770
  ret i32 %call, !dbg !4771
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @getdents64(i32 noundef %fd, ptr noundef nonnull %dirp, i64 noundef %count) #0 !dbg !4772 {
entry:
  %fd.addr = alloca i32, align 4
  %dirp.addr = alloca ptr, align 8
  %count.addr = alloca i64, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4775, metadata !DIExpression()), !dbg !4776
  store ptr %dirp, ptr %dirp.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %dirp.addr, metadata !4777, metadata !DIExpression()), !dbg !4778
  store i64 %count, ptr %count.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !4779, metadata !DIExpression()), !dbg !4780
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4781
  %1 = load ptr, ptr %dirp.addr, align 8, !dbg !4782
  %2 = load i64, ptr %count.addr, align 8, !dbg !4783
  %conv = trunc i64 %2 to i32, !dbg !4783
  %call = call i32 @__fd_getdents(i32 noundef %0, ptr noundef %1, i32 noundef %conv), !dbg !4784
  %conv1 = sext i32 %call to i64, !dbg !4784
  ret i64 %conv1, !dbg !4785
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @memcpy(ptr noundef %destaddr, ptr noundef %srcaddr, i64 noundef %len) #0 !dbg !4786 {
entry:
  %destaddr.addr = alloca ptr, align 8
  %srcaddr.addr = alloca ptr, align 8
  %len.addr = alloca i64, align 8
  %dest = alloca ptr, align 8
  %src = alloca ptr, align 8
  store ptr %destaddr, ptr %destaddr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %destaddr.addr, metadata !4790, metadata !DIExpression()), !dbg !4791
  store ptr %srcaddr, ptr %srcaddr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %srcaddr.addr, metadata !4792, metadata !DIExpression()), !dbg !4793
  store i64 %len, ptr %len.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %len.addr, metadata !4794, metadata !DIExpression()), !dbg !4795
  call void @llvm.dbg.declare(metadata ptr %dest, metadata !4796, metadata !DIExpression()), !dbg !4797
  %0 = load ptr, ptr %destaddr.addr, align 8, !dbg !4798
  store ptr %0, ptr %dest, align 8, !dbg !4797
  call void @llvm.dbg.declare(metadata ptr %src, metadata !4799, metadata !DIExpression()), !dbg !4800
  %1 = load ptr, ptr %srcaddr.addr, align 8, !dbg !4801
  store ptr %1, ptr %src, align 8, !dbg !4800
  br label %while.cond, !dbg !4802

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, ptr %len.addr, align 8, !dbg !4803
  %dec = add i64 %2, -1, !dbg !4803
  store i64 %dec, ptr %len.addr, align 8, !dbg !4803
  %cmp = icmp ugt i64 %2, 0, !dbg !4804
  br i1 %cmp, label %while.body, label %while.end, !dbg !4802

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr %src, align 8, !dbg !4805
  %incdec.ptr = getelementptr inbounds i8, ptr %3, i32 1, !dbg !4805
  store ptr %incdec.ptr, ptr %src, align 8, !dbg !4805
  %4 = load i8, ptr %3, align 1, !dbg !4806
  %5 = load ptr, ptr %dest, align 8, !dbg !4807
  %incdec.ptr1 = getelementptr inbounds i8, ptr %5, i32 1, !dbg !4807
  store ptr %incdec.ptr1, ptr %dest, align 8, !dbg !4807
  store i8 %4, ptr %5, align 1, !dbg !4808
  br label %while.cond, !dbg !4802, !llvm.loop !4809

while.end:                                        ; preds = %while.cond
  %6 = load ptr, ptr %destaddr.addr, align 8, !dbg !4811
  ret ptr %6, !dbg !4812
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @memset(ptr noundef %dst, i32 noundef %s, i64 noundef %count) #0 !dbg !4813 {
entry:
  %dst.addr = alloca ptr, align 8
  %s.addr = alloca i32, align 4
  %count.addr = alloca i64, align 8
  %a = alloca ptr, align 8
  store ptr %dst, ptr %dst.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %dst.addr, metadata !4817, metadata !DIExpression()), !dbg !4818
  store i32 %s, ptr %s.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !4819, metadata !DIExpression()), !dbg !4820
  store i64 %count, ptr %count.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !4821, metadata !DIExpression()), !dbg !4822
  call void @llvm.dbg.declare(metadata ptr %a, metadata !4823, metadata !DIExpression()), !dbg !4824
  %0 = load ptr, ptr %dst.addr, align 8, !dbg !4825
  store ptr %0, ptr %a, align 8, !dbg !4824
  br label %while.cond, !dbg !4826

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i64, ptr %count.addr, align 8, !dbg !4827
  %dec = add i64 %1, -1, !dbg !4827
  store i64 %dec, ptr %count.addr, align 8, !dbg !4827
  %cmp = icmp ugt i64 %1, 0, !dbg !4828
  br i1 %cmp, label %while.body, label %while.end, !dbg !4826

while.body:                                       ; preds = %while.cond
  %2 = load i32, ptr %s.addr, align 4, !dbg !4829
  %conv = trunc i32 %2 to i8, !dbg !4829
  %3 = load ptr, ptr %a, align 8, !dbg !4830
  %incdec.ptr = getelementptr inbounds i8, ptr %3, i32 1, !dbg !4830
  store ptr %incdec.ptr, ptr %a, align 8, !dbg !4830
  store i8 %conv, ptr %3, align 1, !dbg !4831
  br label %while.cond, !dbg !4826, !llvm.loop !4832

while.end:                                        ; preds = %while.cond
  %4 = load ptr, ptr %dst.addr, align 8, !dbg !4833
  ret ptr %4, !dbg !4834
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_overshift_check(i64 noundef %bitWidth, i64 noundef %shift) #0 !dbg !4835 {
entry:
  %bitWidth.addr = alloca i64, align 8
  %shift.addr = alloca i64, align 8
  store i64 %bitWidth, ptr %bitWidth.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %bitWidth.addr, metadata !4839, metadata !DIExpression()), !dbg !4840
  store i64 %shift, ptr %shift.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %shift.addr, metadata !4841, metadata !DIExpression()), !dbg !4842
  %0 = load i64, ptr %shift.addr, align 8, !dbg !4843
  %1 = load i64, ptr %bitWidth.addr, align 8, !dbg !4845
  %cmp = icmp uge i64 %0, %1, !dbg !4846
  br i1 %cmp, label %if.then, label %if.end, !dbg !4847

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.95, i32 noundef 0, ptr noundef @.str.1.96, ptr noundef @.str.2.97) #13, !dbg !4848
  unreachable, !dbg !4848

if.end:                                           ; preds = %entry
  ret void, !dbg !4850
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #9 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nocallback nofree nosync nounwind willreturn }
attributes #12 = { nounwind allocsize(0) }
attributes #13 = { noreturn }
attributes #14 = { nounwind willreturn memory(read) }
attributes #15 = { noreturn nounwind }
attributes #16 = { nounwind }
attributes #17 = { nounwind willreturn memory(none) }

!llvm.dbg.cu = !{!513, !518, !202, !521, !314, !525, !558, !560, !562}
!llvm.module.flags = !{!565, !566, !567, !568, !569, !570, !571}
!llvm.ident = !{!572, !572, !572, !572, !572, !572, !572, !572, !572}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 102, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "klee_src/runtime/POSIX/klee_init_env.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "ba7d55a62d9543eebe7c76b1af831f03")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 7)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 103, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 7712, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 964)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 121, type: !15, isLocal: true, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 10)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(scope: null, file: !2, line: 121, type: !20, isLocal: true, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 9)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(scope: null, file: !2, line: 122, type: !25, isLocal: true, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 384, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 48)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(scope: null, file: !2, line: 129, type: !30, isLocal: true, isDefinition: true)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 360, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 45)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(scope: null, file: !2, line: 136, type: !35, isLocal: true, isDefinition: true)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(scope: null, file: !2, line: 137, type: !15, isLocal: true, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(scope: null, file: !2, line: 138, type: !42, isLocal: true, isDefinition: true)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 616, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 77)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(scope: null, file: !2, line: 150, type: !47, isLocal: true, isDefinition: true)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 224, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 28)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !2, line: 152, type: !3, isLocal: true, isDefinition: true)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(scope: null, file: !2, line: 165, type: !54, isLocal: true, isDefinition: true)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 12)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(scope: null, file: !2, line: 166, type: !35, isLocal: true, isDefinition: true)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(scope: null, file: !2, line: 167, type: !61, isLocal: true, isDefinition: true)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 576, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 72)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(scope: null, file: !2, line: 174, type: !66, isLocal: true, isDefinition: true)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 39)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !2, line: 181, type: !71, isLocal: true, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 520, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 65)
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(scope: null, file: !2, line: 185, type: !76, isLocal: true, isDefinition: true)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 480, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 60)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(scope: null, file: !2, line: 188, type: !54, isLocal: true, isDefinition: true)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(scope: null, file: !2, line: 189, type: !35, isLocal: true, isDefinition: true)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(scope: null, file: !2, line: 191, type: !85, isLocal: true, isDefinition: true)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 456, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 57)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(scope: null, file: !2, line: 197, type: !90, isLocal: true, isDefinition: true)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !91)
!91 = !{!92}
!92 = !DISubrange(count: 13)
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression())
!94 = distinct !DIGlobalVariable(scope: null, file: !2, line: 198, type: !54, isLocal: true, isDefinition: true)
!95 = !DIGlobalVariableExpression(var: !96, expr: !DIExpression())
!96 = distinct !DIGlobalVariable(scope: null, file: !2, line: 201, type: !97, isLocal: true, isDefinition: true)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 18)
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(scope: null, file: !2, line: 202, type: !102, isLocal: true, isDefinition: true)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !103)
!103 = !{!104}
!104 = !DISubrange(count: 17)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression())
!106 = distinct !DIGlobalVariable(scope: null, file: !2, line: 205, type: !15, isLocal: true, isDefinition: true)
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression())
!108 = distinct !DIGlobalVariable(scope: null, file: !2, line: 205, type: !20, isLocal: true, isDefinition: true)
!109 = !DIGlobalVariableExpression(var: !110, expr: !DIExpression())
!110 = distinct !DIGlobalVariable(scope: null, file: !2, line: 208, type: !54, isLocal: true, isDefinition: true)
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression())
!112 = distinct !DIGlobalVariable(scope: null, file: !2, line: 208, type: !35, isLocal: true, isDefinition: true)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(scope: null, file: !2, line: 210, type: !35, isLocal: true, isDefinition: true)
!115 = !DIGlobalVariableExpression(var: !116, expr: !DIExpression())
!116 = distinct !DIGlobalVariable(scope: null, file: !2, line: 211, type: !15, isLocal: true, isDefinition: true)
!117 = !DIGlobalVariableExpression(var: !118, expr: !DIExpression())
!118 = distinct !DIGlobalVariable(scope: null, file: !2, line: 212, type: !119, isLocal: true, isDefinition: true)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 432, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 54)
!122 = !DIGlobalVariableExpression(var: !123, expr: !DIExpression())
!123 = distinct !DIGlobalVariable(scope: null, file: !2, line: 225, type: !124, isLocal: true, isDefinition: true)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 248, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 31)
!127 = !DIGlobalVariableExpression(var: !128, expr: !DIExpression())
!128 = distinct !DIGlobalVariable(scope: null, file: !2, line: 20, type: !129, isLocal: true, isDefinition: true)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !130)
!130 = !{!131}
!131 = !DISubrange(count: 44)
!132 = !DIGlobalVariableExpression(var: !133, expr: !DIExpression())
!133 = distinct !DIGlobalVariable(scope: null, file: !2, line: 20, type: !20, isLocal: true, isDefinition: true)
!134 = !DIGlobalVariableExpression(var: !135, expr: !DIExpression())
!135 = distinct !DIGlobalVariable(scope: null, file: !2, line: 75, type: !136, isLocal: true, isDefinition: true)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 296, elements: !137)
!137 = !{!138}
!138 = !DISubrange(count: 37)
!139 = !DIGlobalVariableExpression(var: !140, expr: !DIExpression())
!140 = distinct !DIGlobalVariable(scope: null, file: !141, line: 7, type: !142, isLocal: true, isDefinition: true)
!141 = !DIFile(filename: "benchmarks/targets/uniq_klee.c", directory: "/workspace", checksumkind: CSK_MD5, checksum: "6855c749abb113e52967014c2b3185e1")
!142 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 40, elements: !143)
!143 = !{!144}
!144 = !DISubrange(count: 5)
!145 = !DIGlobalVariableExpression(var: !146, expr: !DIExpression())
!146 = distinct !DIGlobalVariable(scope: null, file: !147, line: 112, type: !148, isLocal: true, isDefinition: true)
!147 = !DIFile(filename: "klee_src/runtime/POSIX/fd_init.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "0b3ec57f306e31d8d312045d84027ae7")
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 2)
!151 = !DIGlobalVariableExpression(var: !152, expr: !DIExpression())
!152 = distinct !DIGlobalVariable(scope: null, file: !147, line: 117, type: !153, isLocal: true, isDefinition: true)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 304, elements: !154)
!154 = !{!155}
!155 = !DISubrange(count: 38)
!156 = !DIGlobalVariableExpression(var: !157, expr: !DIExpression())
!157 = distinct !DIGlobalVariable(scope: null, file: !147, line: 117, type: !124, isLocal: true, isDefinition: true)
!158 = !DIGlobalVariableExpression(var: !159, expr: !DIExpression())
!159 = distinct !DIGlobalVariable(scope: null, file: !147, line: 117, type: !20, isLocal: true, isDefinition: true)
!160 = !DIGlobalVariableExpression(var: !161, expr: !DIExpression())
!161 = distinct !DIGlobalVariable(scope: null, file: !147, line: 129, type: !162, isLocal: true, isDefinition: true)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 6)
!165 = !DIGlobalVariableExpression(var: !166, expr: !DIExpression())
!166 = distinct !DIGlobalVariable(scope: null, file: !147, line: 145, type: !15, isLocal: true, isDefinition: true)
!167 = !DIGlobalVariableExpression(var: !168, expr: !DIExpression())
!168 = distinct !DIGlobalVariable(scope: null, file: !147, line: 146, type: !35, isLocal: true, isDefinition: true)
!169 = !DIGlobalVariableExpression(var: !170, expr: !DIExpression())
!170 = distinct !DIGlobalVariable(scope: null, file: !147, line: 147, type: !35, isLocal: true, isDefinition: true)
!171 = !DIGlobalVariableExpression(var: !172, expr: !DIExpression())
!172 = distinct !DIGlobalVariable(scope: null, file: !147, line: 148, type: !173, isLocal: true, isDefinition: true)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !174)
!174 = !{!175}
!175 = !DISubrange(count: 15)
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression())
!177 = distinct !DIGlobalVariable(scope: null, file: !147, line: 149, type: !54, isLocal: true, isDefinition: true)
!178 = !DIGlobalVariableExpression(var: !179, expr: !DIExpression())
!179 = distinct !DIGlobalVariable(scope: null, file: !147, line: 157, type: !3, isLocal: true, isDefinition: true)
!180 = !DIGlobalVariableExpression(var: !181, expr: !DIExpression())
!181 = distinct !DIGlobalVariable(scope: null, file: !147, line: 52, type: !162, isLocal: true, isDefinition: true)
!182 = !DIGlobalVariableExpression(var: !183, expr: !DIExpression())
!183 = distinct !DIGlobalVariable(scope: null, file: !147, line: 54, type: !184, isLocal: true, isDefinition: true)
!184 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !143)
!185 = !DIGlobalVariableExpression(var: !186, expr: !DIExpression())
!186 = distinct !DIGlobalVariable(scope: null, file: !147, line: 54, type: !187, isLocal: true, isDefinition: true)
!187 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 704, elements: !188)
!188 = !{!189}
!189 = !DISubrange(count: 88)
!190 = !DIGlobalVariableExpression(var: !191, expr: !DIExpression())
!191 = distinct !DIGlobalVariable(scope: null, file: !192, line: 16, type: !30, isLocal: true, isDefinition: true)
!192 = !DIFile(filename: "klee_src/runtime/Intrinsic/klee_range.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "967b9ed6e7b3db2f47ee33010ec31c43")
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(scope: null, file: !192, line: 16, type: !195, isLocal: true, isDefinition: true)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 14)
!198 = !DIGlobalVariableExpression(var: !199, expr: !DIExpression())
!199 = distinct !DIGlobalVariable(scope: null, file: !192, line: 16, type: !184, isLocal: true, isDefinition: true)
!200 = !DIGlobalVariableExpression(var: !201, expr: !DIExpression())
!201 = distinct !DIGlobalVariable(name: "__exe_env", scope: !202, file: !147, line: 34, type: !276, isLocal: false, isDefinition: true)
!202 = distinct !DICompileUnit(language: DW_LANG_C89, file: !203, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !204, splitDebugInlining: false, nameTableKind: None)
!203 = !DIFile(filename: "/tmp/klee_src/runtime/POSIX/fd_init.c", directory: "/tmp/klee_build160stp_z3/runtime/POSIX", checksumkind: CSK_MD5, checksum: "0b3ec57f306e31d8d312045d84027ae7")
!204 = !{!200, !145, !151, !156, !158, !160, !165, !167, !169, !171, !176, !178, !205, !180, !182, !185}
!205 = !DIGlobalVariableExpression(var: !206, expr: !DIExpression())
!206 = distinct !DIGlobalVariable(name: "__exe_fs", scope: !202, file: !147, line: 21, type: !207, isLocal: false, isDefinition: true)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_file_system_t", file: !208, line: 87, baseType: !209)
!208 = !DIFile(filename: "klee_src/runtime/POSIX/fd.h", directory: "/tmp", checksumkind: CSK_MD5, checksum: "c3ceb01eba347a2d17a528cf2ea6c932")
!209 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !208, line: 75, size: 832, elements: !210)
!210 = !{!211, !213, !264, !265, !266, !267, !268, !270, !271, !272, !273, !274, !275}
!211 = !DIDerivedType(tag: DW_TAG_member, name: "n_sym_files", scope: !209, file: !208, line: 76, baseType: !212, size: 32)
!212 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "sym_stdin", scope: !209, file: !208, line: 77, baseType: !214, size: 64, offset: 64)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_disk_file_t", file: !208, line: 57, baseType: !216)
!216 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !208, line: 53, size: 192, elements: !217)
!217 = !{!218, !219, !221}
!218 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !216, file: !208, line: 54, baseType: !212, size: 32)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "contents", scope: !216, file: !208, line: 55, baseType: !220, size: 64, offset: 64)
!220 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "stat", scope: !216, file: !208, line: 56, baseType: !222, size: 64, offset: 128)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!223 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat64", file: !224, line: 103, size: 1152, elements: !225)
!224 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_stat.h", directory: "", checksumkind: CSK_MD5, checksum: "3ba283bc334370fe631cbc82f5229ed7")
!225 = !{!226, !230, !232, !234, !236, !238, !240, !242, !243, !246, !248, !250, !258, !259, !260}
!226 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !223, file: !224, line: 108, baseType: !227, size: 64)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !228, line: 145, baseType: !229)
!228 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!229 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !223, file: !224, line: 110, baseType: !231, size: 64, offset: 64)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino64_t", file: !228, line: 149, baseType: !229)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !223, file: !224, line: 111, baseType: !233, size: 64, offset: 128)
!233 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !228, line: 151, baseType: !229)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !223, file: !224, line: 112, baseType: !235, size: 32, offset: 192)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !228, line: 150, baseType: !212)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !223, file: !224, line: 119, baseType: !237, size: 32, offset: 224)
!237 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !228, line: 146, baseType: !212)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !223, file: !224, line: 120, baseType: !239, size: 32, offset: 256)
!239 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !228, line: 147, baseType: !212)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !223, file: !224, line: 122, baseType: !241, size: 32, offset: 288)
!241 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !223, file: !224, line: 123, baseType: !227, size: 64, offset: 320)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !223, file: !224, line: 124, baseType: !244, size: 64, offset: 384)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !228, line: 152, baseType: !245)
!245 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !223, file: !224, line: 130, baseType: !247, size: 64, offset: 448)
!247 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !228, line: 175, baseType: !245)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !223, file: !224, line: 131, baseType: !249, size: 64, offset: 512)
!249 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt64_t", file: !228, line: 181, baseType: !245)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !223, file: !224, line: 139, baseType: !251, size: 128, offset: 576)
!251 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !252, line: 11, size: 128, elements: !253)
!252 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!253 = !{!254, !256}
!254 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !251, file: !252, line: 16, baseType: !255, size: 64)
!255 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !228, line: 160, baseType: !245)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !251, file: !252, line: 21, baseType: !257, size: 64, offset: 64)
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !228, line: 197, baseType: !245)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !223, file: !224, line: 140, baseType: !251, size: 128, offset: 704)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !223, file: !224, line: 141, baseType: !251, size: 128, offset: 832)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !223, file: !224, line: 151, baseType: !261, size: 192, offset: 960)
!261 = !DICompositeType(tag: DW_TAG_array_type, baseType: !257, size: 192, elements: !262)
!262 = !{!263}
!263 = !DISubrange(count: 3)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "sym_stdout", scope: !209, file: !208, line: 77, baseType: !214, size: 64, offset: 128)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "stdout_writes", scope: !209, file: !208, line: 78, baseType: !212, size: 32, offset: 192)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "sym_files", scope: !209, file: !208, line: 79, baseType: !214, size: 64, offset: 256)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "max_failures", scope: !209, file: !208, line: 82, baseType: !212, size: 32, offset: 320)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "read_fail", scope: !209, file: !208, line: 85, baseType: !269, size: 64, offset: 384)
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !241, size: 64)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "write_fail", scope: !209, file: !208, line: 85, baseType: !269, size: 64, offset: 448)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "close_fail", scope: !209, file: !208, line: 85, baseType: !269, size: 64, offset: 512)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "ftruncate_fail", scope: !209, file: !208, line: 85, baseType: !269, size: 64, offset: 576)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "getcwd_fail", scope: !209, file: !208, line: 85, baseType: !269, size: 64, offset: 640)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "chmod_fail", scope: !209, file: !208, line: 86, baseType: !269, size: 64, offset: 704)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "fchmod_fail", scope: !209, file: !208, line: 86, baseType: !269, size: 64, offset: 768)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_sym_env_t", file: !208, line: 101, baseType: !277)
!277 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !208, line: 94, size: 6208, elements: !278)
!278 = !{!279, !293, !295}
!279 = !DIDerivedType(tag: DW_TAG_member, name: "fds", scope: !277, file: !208, line: 95, baseType: !280, size: 6144)
!280 = !DICompositeType(tag: DW_TAG_array_type, baseType: !281, size: 6144, elements: !291)
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_file_t", file: !208, line: 73, baseType: !282)
!282 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !208, line: 66, size: 192, elements: !283)
!283 = !{!284, !285, !286, !290}
!284 = !DIDerivedType(tag: DW_TAG_member, name: "fd", scope: !282, file: !208, line: 67, baseType: !241, size: 32)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !282, file: !208, line: 68, baseType: !212, size: 32, offset: 32)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "off", scope: !282, file: !208, line: 71, baseType: !287, size: 64, offset: 64)
!287 = !DIDerivedType(tag: DW_TAG_typedef, name: "off64_t", file: !288, line: 92, baseType: !289)
!288 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e62424071ad3f1b4d088c139fd9ccfd1")
!289 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !228, line: 153, baseType: !245)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "dfile", scope: !282, file: !208, line: 72, baseType: !214, size: 64, offset: 128)
!291 = !{!292}
!292 = !DISubrange(count: 32)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "umask", scope: !277, file: !208, line: 96, baseType: !294, size: 32, offset: 6144)
!294 = !DIDerivedType(tag: DW_TAG_typedef, name: "mode_t", file: !288, line: 69, baseType: !235)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "save_all_writes", scope: !277, file: !208, line: 100, baseType: !241, size: 32, offset: 6176)
!296 = !DIGlobalVariableExpression(var: !297, expr: !DIExpression())
!297 = distinct !DIGlobalVariable(scope: null, file: !298, line: 159, type: !299, isLocal: true, isDefinition: true)
!298 = !DIFile(filename: "klee_src/runtime/POSIX/fd.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "fd27ffca8f23688b1cbb26cb3f8119d2")
!299 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 368, elements: !300)
!300 = !{!301}
!301 = !DISubrange(count: 46)
!302 = !DIGlobalVariableExpression(var: !303, expr: !DIExpression())
!303 = distinct !DIGlobalVariable(scope: null, file: !298, line: 167, type: !304, isLocal: true, isDefinition: true)
!304 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 376, elements: !305)
!305 = !{!306}
!306 = !DISubrange(count: 47)
!307 = !DIGlobalVariableExpression(var: !308, expr: !DIExpression())
!308 = distinct !DIGlobalVariable(scope: null, file: !298, line: 208, type: !129, isLocal: true, isDefinition: true)
!309 = !DIGlobalVariableExpression(var: !310, expr: !DIExpression())
!310 = distinct !DIGlobalVariable(name: "n_calls", scope: !311, file: !298, line: 299, type: !241, isLocal: true, isDefinition: true)
!311 = distinct !DISubprogram(name: "close", scope: !298, file: !298, line: 298, type: !312, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!312 = !DISubroutineType(types: !313)
!313 = !{!241, !241}
!314 = distinct !DICompileUnit(language: DW_LANG_C89, file: !315, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !316, retainedTypes: !335, globals: !375, splitDebugInlining: false, nameTableKind: None)
!315 = !DIFile(filename: "/tmp/klee_src/runtime/POSIX/fd.c", directory: "/tmp/klee_build160stp_z3/runtime/POSIX", checksumkind: CSK_MD5, checksum: "fd27ffca8f23688b1cbb26cb3f8119d2")
!316 = !{!317, !323}
!317 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !208, line: 59, baseType: !212, size: 32, elements: !318)
!318 = !{!319, !320, !321, !322}
!319 = !DIEnumerator(name: "eOpen", value: 1)
!320 = !DIEnumerator(name: "eCloseOnExec", value: 2)
!321 = !DIEnumerator(name: "eReadable", value: 4)
!322 = !DIEnumerator(name: "eWriteable", value: 8)
!323 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !324, line: 97, baseType: !212, size: 32, elements: !325)
!324 = !DIFile(filename: "/usr/include/dirent.h", directory: "", checksumkind: CSK_MD5, checksum: "6eb1a2faa0cf53b967234cc6c0fe978e")
!325 = !{!326, !327, !328, !329, !330, !331, !332, !333, !334}
!326 = !DIEnumerator(name: "DT_UNKNOWN", value: 0)
!327 = !DIEnumerator(name: "DT_FIFO", value: 1)
!328 = !DIEnumerator(name: "DT_CHR", value: 2)
!329 = !DIEnumerator(name: "DT_DIR", value: 4)
!330 = !DIEnumerator(name: "DT_BLK", value: 6)
!331 = !DIEnumerator(name: "DT_REG", value: 8)
!332 = !DIEnumerator(name: "DT_LNK", value: 10)
!333 = !DIEnumerator(name: "DT_SOCK", value: 12)
!334 = !DIEnumerator(name: "DT_WHT", value: 14)
!335 = !{!245, !336, !287, !229, !337, !220, !351, !241, !5}
!336 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !338, size: 64)
!338 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dirent64", file: !339, line: 37, size: 2240, elements: !340)
!339 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/dirent.h", directory: "", checksumkind: CSK_MD5, checksum: "bc8b10a1ddd2747862e3ae7b91dbf464")
!340 = !{!341, !342, !343, !345, !347}
!341 = !DIDerivedType(tag: DW_TAG_member, name: "d_ino", scope: !338, file: !339, line: 39, baseType: !231, size: 64)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "d_off", scope: !338, file: !339, line: 40, baseType: !289, size: 64, offset: 64)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "d_reclen", scope: !338, file: !339, line: 41, baseType: !344, size: 16, offset: 128)
!344 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!345 = !DIDerivedType(tag: DW_TAG_member, name: "d_type", scope: !338, file: !339, line: 42, baseType: !346, size: 8, offset: 144)
!346 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "d_name", scope: !338, file: !339, line: 43, baseType: !348, size: 2048, offset: 152)
!348 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 2048, elements: !349)
!349 = !{!350}
!350 = !DISubrange(count: 256)
!351 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !352, size: 64)
!352 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !224, line: 26, size: 1152, elements: !353)
!353 = !{!354, !355, !357, !358, !359, !360, !361, !362, !363, !364, !365, !367, !372, !373, !374}
!354 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !352, file: !224, line: 31, baseType: !227, size: 64)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !352, file: !224, line: 36, baseType: !356, size: 64, offset: 64)
!356 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !228, line: 148, baseType: !229)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !352, file: !224, line: 44, baseType: !233, size: 64, offset: 128)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !352, file: !224, line: 45, baseType: !235, size: 32, offset: 192)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !352, file: !224, line: 47, baseType: !237, size: 32, offset: 224)
!360 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !352, file: !224, line: 48, baseType: !239, size: 32, offset: 256)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !352, file: !224, line: 50, baseType: !241, size: 32, offset: 288)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !352, file: !224, line: 52, baseType: !227, size: 64, offset: 320)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !352, file: !224, line: 57, baseType: !244, size: 64, offset: 384)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !352, file: !224, line: 61, baseType: !247, size: 64, offset: 448)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !352, file: !224, line: 63, baseType: !366, size: 64, offset: 512)
!366 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !228, line: 180, baseType: !245)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !352, file: !224, line: 74, baseType: !368, size: 128, offset: 576)
!368 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !252, line: 11, size: 128, elements: !369)
!369 = !{!370, !371}
!370 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !368, file: !252, line: 16, baseType: !255, size: 64)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !368, file: !252, line: 21, baseType: !257, size: 64, offset: 64)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !352, file: !224, line: 75, baseType: !368, size: 128, offset: 704)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !352, file: !224, line: 76, baseType: !368, size: 128, offset: 832)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !352, file: !224, line: 89, baseType: !261, size: 192, offset: 960)
!375 = !{!296, !302, !307, !309, !376, !386, !388, !393, !398, !405, !407, !412, !414, !419, !421, !423, !425, !430, !432, !438, !443, !448, !453, !455, !457, !459, !464, !466, !471, !476, !478, !480, !482, !484, !486, !489, !491, !496, !498}
!376 = !DIGlobalVariableExpression(var: !377, expr: !DIExpression())
!377 = distinct !DIGlobalVariable(name: "n_calls", scope: !378, file: !298, line: 331, type: !241, isLocal: true, isDefinition: true)
!378 = distinct !DISubprogram(name: "read", scope: !298, file: !298, line: 330, type: !379, scopeLine: 330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!379 = !DISubroutineType(types: !380)
!380 = !{!381, !241, !336, !383}
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !288, line: 108, baseType: !382)
!382 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ssize_t", file: !228, line: 194, baseType: !245)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !384, line: 46, baseType: !229)
!384 = !DIFile(filename: "llvm-160-install_O_D_A/lib/clang/16/include/stddef.h", directory: "/tmp", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!385 = !{}
!386 = !DIGlobalVariableExpression(var: !387, expr: !DIExpression())
!387 = distinct !DIGlobalVariable(scope: null, file: !298, line: 379, type: !54, isLocal: true, isDefinition: true)
!388 = !DIGlobalVariableExpression(var: !389, expr: !DIExpression())
!389 = distinct !DIGlobalVariable(scope: null, file: !298, line: 379, type: !390, isLocal: true, isDefinition: true)
!390 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 264, elements: !391)
!391 = !{!392}
!392 = !DISubrange(count: 33)
!393 = !DIGlobalVariableExpression(var: !394, expr: !DIExpression())
!394 = distinct !DIGlobalVariable(scope: null, file: !298, line: 379, type: !395, isLocal: true, isDefinition: true)
!395 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 272, elements: !396)
!396 = !{!397}
!397 = !DISubrange(count: 34)
!398 = !DIGlobalVariableExpression(var: !399, expr: !DIExpression())
!399 = distinct !DIGlobalVariable(name: "n_calls", scope: !400, file: !298, line: 397, type: !241, isLocal: true, isDefinition: true)
!400 = distinct !DISubprogram(name: "write", scope: !298, file: !298, line: 396, type: !401, scopeLine: 396, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!401 = !DISubroutineType(types: !402)
!402 = !{!381, !241, !403, !383}
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !404, size: 64)
!404 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!405 = !DIGlobalVariableExpression(var: !406, expr: !DIExpression())
!406 = distinct !DIGlobalVariable(scope: null, file: !298, line: 431, type: !3, isLocal: true, isDefinition: true)
!407 = !DIGlobalVariableExpression(var: !408, expr: !DIExpression())
!408 = distinct !DIGlobalVariable(scope: null, file: !298, line: 431, type: !409, isLocal: true, isDefinition: true)
!409 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !410)
!410 = !{!411}
!411 = !DISubrange(count: 41)
!412 = !DIGlobalVariableExpression(var: !413, expr: !DIExpression())
!413 = distinct !DIGlobalVariable(scope: null, file: !298, line: 444, type: !148, isLocal: true, isDefinition: true)
!414 = !DIGlobalVariableExpression(var: !415, expr: !DIExpression())
!415 = distinct !DIGlobalVariable(scope: null, file: !298, line: 455, type: !416, isLocal: true, isDefinition: true)
!416 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !417)
!417 = !{!418}
!418 = !DISubrange(count: 24)
!419 = !DIGlobalVariableExpression(var: !420, expr: !DIExpression())
!420 = distinct !DIGlobalVariable(scope: null, file: !298, line: 490, type: !97, isLocal: true, isDefinition: true)
!421 = !DIGlobalVariableExpression(var: !422, expr: !DIExpression())
!422 = distinct !DIGlobalVariable(scope: null, file: !298, line: 490, type: !153, isLocal: true, isDefinition: true)
!423 = !DIGlobalVariableExpression(var: !424, expr: !DIExpression())
!424 = distinct !DIGlobalVariable(scope: null, file: !298, line: 560, type: !184, isLocal: true, isDefinition: true)
!425 = !DIGlobalVariableExpression(var: !426, expr: !DIExpression())
!426 = distinct !DIGlobalVariable(scope: null, file: !298, line: 560, type: !427, isLocal: true, isDefinition: true)
!427 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 408, elements: !428)
!428 = !{!429}
!429 = !DISubrange(count: 51)
!430 = !DIGlobalVariableExpression(var: !431, expr: !DIExpression())
!431 = distinct !DIGlobalVariable(scope: null, file: !298, line: 593, type: !390, isLocal: true, isDefinition: true)
!432 = !DIGlobalVariableExpression(var: !433, expr: !DIExpression())
!433 = distinct !DIGlobalVariable(name: "n_calls", scope: !434, file: !298, line: 633, type: !241, isLocal: true, isDefinition: true)
!434 = distinct !DISubprogram(name: "chmod", scope: !298, file: !298, line: 632, type: !435, scopeLine: 632, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!435 = !DISubroutineType(types: !436)
!436 = !{!241, !437, !294}
!437 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!438 = !DIGlobalVariableExpression(var: !439, expr: !DIExpression())
!439 = distinct !DIGlobalVariable(name: "n_calls", scope: !440, file: !298, line: 652, type: !241, isLocal: true, isDefinition: true)
!440 = distinct !DISubprogram(name: "fchmod", scope: !298, file: !298, line: 651, type: !441, scopeLine: 651, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!441 = !DISubroutineType(types: !442)
!442 = !{!241, !241, !294}
!443 = !DIGlobalVariableExpression(var: !444, expr: !DIExpression())
!444 = distinct !DIGlobalVariable(name: "n_calls", scope: !445, file: !298, line: 738, type: !241, isLocal: true, isDefinition: true)
!445 = distinct !DISubprogram(name: "__fd_ftruncate", scope: !298, file: !298, line: 737, type: !446, scopeLine: 737, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!446 = !DISubroutineType(types: !447)
!447 = !{!241, !241, !287}
!448 = !DIGlobalVariableExpression(var: !449, expr: !DIExpression())
!449 = distinct !DIGlobalVariable(scope: null, file: !298, line: 755, type: !450, isLocal: true, isDefinition: true)
!450 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 240, elements: !451)
!451 = !{!452}
!452 = !DISubrange(count: 30)
!453 = !DIGlobalVariableExpression(var: !454, expr: !DIExpression())
!454 = distinct !DIGlobalVariable(scope: null, file: !298, line: 775, type: !390, isLocal: true, isDefinition: true)
!455 = !DIGlobalVariableExpression(var: !456, expr: !DIExpression())
!456 = distinct !DIGlobalVariable(scope: null, file: !298, line: 830, type: !97, isLocal: true, isDefinition: true)
!457 = !DIGlobalVariableExpression(var: !458, expr: !DIExpression())
!458 = distinct !DIGlobalVariable(scope: null, file: !298, line: 830, type: !71, isLocal: true, isDefinition: true)
!459 = !DIGlobalVariableExpression(var: !460, expr: !DIExpression())
!460 = distinct !DIGlobalVariable(scope: null, file: !298, line: 835, type: !461, isLocal: true, isDefinition: true)
!461 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !462)
!462 = !{!463}
!463 = !DISubrange(count: 22)
!464 = !DIGlobalVariableExpression(var: !465, expr: !DIExpression())
!465 = distinct !DIGlobalVariable(scope: null, file: !298, line: 880, type: !409, isLocal: true, isDefinition: true)
!466 = !DIGlobalVariableExpression(var: !467, expr: !DIExpression())
!467 = distinct !DIGlobalVariable(scope: null, file: !298, line: 920, type: !468, isLocal: true, isDefinition: true)
!468 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !469)
!469 = !{!470}
!470 = !DISubrange(count: 42)
!471 = !DIGlobalVariableExpression(var: !472, expr: !DIExpression())
!472 = distinct !DIGlobalVariable(scope: null, file: !298, line: 930, type: !473, isLocal: true, isDefinition: true)
!473 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 344, elements: !474)
!474 = !{!475}
!475 = !DISubrange(count: 43)
!476 = !DIGlobalVariableExpression(var: !477, expr: !DIExpression())
!477 = distinct !DIGlobalVariable(scope: null, file: !298, line: 940, type: !473, isLocal: true, isDefinition: true)
!478 = !DIGlobalVariableExpression(var: !479, expr: !DIExpression())
!479 = distinct !DIGlobalVariable(scope: null, file: !298, line: 952, type: !30, isLocal: true, isDefinition: true)
!480 = !DIGlobalVariableExpression(var: !481, expr: !DIExpression())
!481 = distinct !DIGlobalVariable(scope: null, file: !298, line: 962, type: !299, isLocal: true, isDefinition: true)
!482 = !DIGlobalVariableExpression(var: !483, expr: !DIExpression())
!483 = distinct !DIGlobalVariable(scope: null, file: !298, line: 973, type: !473, isLocal: true, isDefinition: true)
!484 = !DIGlobalVariableExpression(var: !485, expr: !DIExpression())
!485 = distinct !DIGlobalVariable(scope: null, file: !298, line: 987, type: !129, isLocal: true, isDefinition: true)
!486 = !DIGlobalVariableExpression(var: !487, expr: !DIExpression())
!487 = distinct !DIGlobalVariable(scope: null, file: !298, line: 1094, type: !488, isLocal: true, isDefinition: true)
!488 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !291)
!489 = !DIGlobalVariableExpression(var: !490, expr: !DIExpression())
!490 = distinct !DIGlobalVariable(scope: null, file: !298, line: 1170, type: !102, isLocal: true, isDefinition: true)
!491 = !DIGlobalVariableExpression(var: !492, expr: !DIExpression())
!492 = distinct !DIGlobalVariable(name: "n_calls", scope: !493, file: !298, line: 1332, type: !241, isLocal: true, isDefinition: true)
!493 = distinct !DISubprogram(name: "getcwd", scope: !298, file: !298, line: 1331, type: !494, scopeLine: 1331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!494 = !DISubroutineType(types: !495)
!495 = !{!220, !220, !383}
!496 = !DIGlobalVariableExpression(var: !497, expr: !DIExpression())
!497 = distinct !DIGlobalVariable(scope: null, file: !298, line: 1427, type: !97, isLocal: true, isDefinition: true)
!498 = !DIGlobalVariableExpression(var: !499, expr: !DIExpression())
!499 = distinct !DIGlobalVariable(scope: null, file: !298, line: 676, type: !488, isLocal: true, isDefinition: true)
!500 = !DIGlobalVariableExpression(var: !501, expr: !DIExpression())
!501 = distinct !DIGlobalVariable(scope: null, file: !502, line: 27, type: !503, isLocal: true, isDefinition: true)
!502 = !DIFile(filename: "klee_src/runtime/Intrinsic/klee_overshift_check.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "5666ed772284910b5d0f856859e4d123")
!503 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !504)
!504 = !{!505}
!505 = !DISubrange(count: 8)
!506 = !DIGlobalVariableExpression(var: !507, expr: !DIExpression())
!507 = distinct !DIGlobalVariable(scope: null, file: !502, line: 27, type: !508, isLocal: true, isDefinition: true)
!508 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !509)
!509 = !{!510}
!510 = !DISubrange(count: 16)
!511 = !DIGlobalVariableExpression(var: !512, expr: !DIExpression())
!512 = distinct !DIGlobalVariable(scope: null, file: !502, line: 27, type: !195, isLocal: true, isDefinition: true)
!513 = distinct !DICompileUnit(language: DW_LANG_C89, file: !514, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !515, globals: !517, splitDebugInlining: false, nameTableKind: None)
!514 = !DIFile(filename: "/tmp/klee_src/runtime/POSIX/klee_init_env.c", directory: "/tmp/klee_build160stp_z3/runtime/POSIX", checksumkind: CSK_MD5, checksum: "ba7d55a62d9543eebe7c76b1af831f03")
!515 = !{!516}
!516 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !220, size: 64)
!517 = !{!0, !8, !13, !18, !23, !28, !33, !38, !40, !45, !50, !52, !57, !59, !64, !69, !74, !79, !81, !83, !88, !93, !95, !100, !105, !107, !109, !111, !113, !115, !117, !122, !127, !132, !134}
!518 = distinct !DICompileUnit(language: DW_LANG_C11, file: !519, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !520, splitDebugInlining: false, nameTableKind: None)
!519 = !DIFile(filename: "/workspace/benchmarks/targets/uniq_klee.c", directory: "/workspace", checksumkind: CSK_MD5, checksum: "6855c749abb113e52967014c2b3185e1")
!520 = !{!139}
!521 = distinct !DICompileUnit(language: DW_LANG_C89, file: !522, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !523, globals: !524, splitDebugInlining: false, nameTableKind: None)
!522 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/klee_range.c", directory: "/tmp/klee_build160stp_z3/runtime/Intrinsic", checksumkind: CSK_MD5, checksum: "967b9ed6e7b3db2f47ee33010ec31c43")
!523 = !{!212}
!524 = !{!190, !193, !198}
!525 = distinct !DICompileUnit(language: DW_LANG_C89, file: !526, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !527, splitDebugInlining: false, nameTableKind: None)
!526 = !DIFile(filename: "/tmp/klee_src/runtime/POSIX/fd_64.c", directory: "/tmp/klee_build160stp_z3/runtime/POSIX", checksumkind: CSK_MD5, checksum: "cc9a465ed9cbb2f7acded7c1ccec6e43")
!527 = !{!528, !550}
!528 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !529, size: 64)
!529 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat64", file: !224, line: 103, size: 1152, elements: !530)
!530 = !{!531, !532, !533, !534, !535, !536, !537, !538, !539, !540, !541, !542, !547, !548, !549}
!531 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !529, file: !224, line: 108, baseType: !227, size: 64)
!532 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !529, file: !224, line: 110, baseType: !231, size: 64, offset: 64)
!533 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !529, file: !224, line: 111, baseType: !233, size: 64, offset: 128)
!534 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !529, file: !224, line: 112, baseType: !235, size: 32, offset: 192)
!535 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !529, file: !224, line: 119, baseType: !237, size: 32, offset: 224)
!536 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !529, file: !224, line: 120, baseType: !239, size: 32, offset: 256)
!537 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !529, file: !224, line: 122, baseType: !241, size: 32, offset: 288)
!538 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !529, file: !224, line: 123, baseType: !227, size: 64, offset: 320)
!539 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !529, file: !224, line: 124, baseType: !244, size: 64, offset: 384)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !529, file: !224, line: 130, baseType: !247, size: 64, offset: 448)
!541 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !529, file: !224, line: 131, baseType: !249, size: 64, offset: 512)
!542 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !529, file: !224, line: 139, baseType: !543, size: 128, offset: 576)
!543 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !252, line: 11, size: 128, elements: !544)
!544 = !{!545, !546}
!545 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !543, file: !252, line: 16, baseType: !255, size: 64)
!546 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !543, file: !252, line: 21, baseType: !257, size: 64, offset: 64)
!547 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !529, file: !224, line: 140, baseType: !543, size: 128, offset: 704)
!548 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !529, file: !224, line: 141, baseType: !543, size: 128, offset: 832)
!549 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !529, file: !224, line: 151, baseType: !261, size: 192, offset: 960)
!550 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !551, size: 64)
!551 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dirent64", file: !339, line: 37, size: 2240, elements: !552)
!552 = !{!553, !554, !555, !556, !557}
!553 = !DIDerivedType(tag: DW_TAG_member, name: "d_ino", scope: !551, file: !339, line: 39, baseType: !231, size: 64)
!554 = !DIDerivedType(tag: DW_TAG_member, name: "d_off", scope: !551, file: !339, line: 40, baseType: !289, size: 64, offset: 64)
!555 = !DIDerivedType(tag: DW_TAG_member, name: "d_reclen", scope: !551, file: !339, line: 41, baseType: !344, size: 16, offset: 128)
!556 = !DIDerivedType(tag: DW_TAG_member, name: "d_type", scope: !551, file: !339, line: 42, baseType: !346, size: 8, offset: 144)
!557 = !DIDerivedType(tag: DW_TAG_member, name: "d_name", scope: !551, file: !339, line: 43, baseType: !348, size: 2048, offset: 152)
!558 = distinct !DICompileUnit(language: DW_LANG_C11, file: !559, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!559 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build160stp_z3/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!560 = distinct !DICompileUnit(language: DW_LANG_C11, file: !561, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!561 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memset.c", directory: "/tmp/klee_build160stp_z3/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "f66ef9ef9131ab198e93a41b1a9ae1fc")
!562 = distinct !DICompileUnit(language: DW_LANG_C89, file: !563, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !564, splitDebugInlining: false, nameTableKind: None)
!563 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/klee_overshift_check.c", directory: "/tmp/klee_build160stp_z3/runtime/Intrinsic", checksumkind: CSK_MD5, checksum: "5666ed772284910b5d0f856859e4d123")
!564 = !{!500, !506, !511}
!565 = !{i32 7, !"Dwarf Version", i32 5}
!566 = !{i32 2, !"Debug Info Version", i32 3}
!567 = !{i32 1, !"wchar_size", i32 4}
!568 = !{i32 8, !"PIC Level", i32 2}
!569 = !{i32 7, !"PIE Level", i32 2}
!570 = !{i32 7, !"uwtable", i32 2}
!571 = !{i32 7, !"frame-pointer", i32 2}
!572 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
!573 = distinct !DISubprogram(name: "klee_init_env", scope: !2, file: !2, line: 82, type: !574, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !513, retainedNodes: !385)
!574 = !DISubroutineType(types: !575)
!575 = !{null, !269, !576}
!576 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !516, size: 64)
!577 = !DILocalVariable(name: "argcPtr", arg: 1, scope: !573, file: !2, line: 82, type: !269)
!578 = !DILocation(line: 82, column: 25, scope: !573)
!579 = !DILocalVariable(name: "argvPtr", arg: 2, scope: !573, file: !2, line: 82, type: !576)
!580 = !DILocation(line: 82, column: 42, scope: !573)
!581 = !DILocalVariable(name: "argc", scope: !573, file: !2, line: 83, type: !241)
!582 = !DILocation(line: 83, column: 7, scope: !573)
!583 = !DILocation(line: 83, column: 15, scope: !573)
!584 = !DILocation(line: 83, column: 14, scope: !573)
!585 = !DILocalVariable(name: "argv", scope: !573, file: !2, line: 84, type: !516)
!586 = !DILocation(line: 84, column: 10, scope: !573)
!587 = !DILocation(line: 84, column: 18, scope: !573)
!588 = !DILocation(line: 84, column: 17, scope: !573)
!589 = !DILocalVariable(name: "new_argc", scope: !573, file: !2, line: 86, type: !241)
!590 = !DILocation(line: 86, column: 7, scope: !573)
!591 = !DILocalVariable(name: "n_args", scope: !573, file: !2, line: 86, type: !241)
!592 = !DILocation(line: 86, column: 21, scope: !573)
!593 = !DILocalVariable(name: "new_argv", scope: !573, file: !2, line: 87, type: !594)
!594 = !DICompositeType(tag: DW_TAG_array_type, baseType: !220, size: 65536, elements: !595)
!595 = !{!596}
!596 = !DISubrange(count: 1024)
!597 = !DILocation(line: 87, column: 9, scope: !573)
!598 = !DILocalVariable(name: "max_len", scope: !573, file: !2, line: 88, type: !212)
!599 = !DILocation(line: 88, column: 12, scope: !573)
!600 = !DILocalVariable(name: "min_argvs", scope: !573, file: !2, line: 88, type: !212)
!601 = !DILocation(line: 88, column: 21, scope: !573)
!602 = !DILocalVariable(name: "max_argvs", scope: !573, file: !2, line: 88, type: !212)
!603 = !DILocation(line: 88, column: 32, scope: !573)
!604 = !DILocalVariable(name: "sym_files", scope: !573, file: !2, line: 89, type: !212)
!605 = !DILocation(line: 89, column: 12, scope: !573)
!606 = !DILocalVariable(name: "sym_file_len", scope: !573, file: !2, line: 89, type: !212)
!607 = !DILocation(line: 89, column: 27, scope: !573)
!608 = !DILocalVariable(name: "sym_stdin_len", scope: !573, file: !2, line: 90, type: !212)
!609 = !DILocation(line: 90, column: 12, scope: !573)
!610 = !DILocalVariable(name: "sym_stdout_flag", scope: !573, file: !2, line: 91, type: !241)
!611 = !DILocation(line: 91, column: 7, scope: !573)
!612 = !DILocalVariable(name: "save_all_writes_flag", scope: !573, file: !2, line: 92, type: !241)
!613 = !DILocation(line: 92, column: 7, scope: !573)
!614 = !DILocalVariable(name: "fd_fail", scope: !573, file: !2, line: 93, type: !241)
!615 = !DILocation(line: 93, column: 7, scope: !573)
!616 = !DILocalVariable(name: "final_argv", scope: !573, file: !2, line: 94, type: !516)
!617 = !DILocation(line: 94, column: 10, scope: !573)
!618 = !DILocalVariable(name: "sym_arg_name", scope: !573, file: !2, line: 95, type: !619)
!619 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 48, elements: !163)
!620 = !DILocation(line: 95, column: 8, scope: !573)
!621 = !DILocalVariable(name: "sym_arg_num", scope: !573, file: !2, line: 96, type: !212)
!622 = !DILocation(line: 96, column: 12, scope: !573)
!623 = !DILocalVariable(name: "k", scope: !573, file: !2, line: 97, type: !241)
!624 = !DILocation(line: 97, column: 7, scope: !573)
!625 = !DILocalVariable(name: "i", scope: !573, file: !2, line: 97, type: !241)
!626 = !DILocation(line: 97, column: 14, scope: !573)
!627 = !DILocation(line: 99, column: 3, scope: !573)
!628 = !DILocation(line: 99, column: 19, scope: !573)
!629 = !DILocation(line: 102, column: 7, scope: !630)
!630 = distinct !DILexicalBlock(scope: !573, file: !2, line: 102, column: 7)
!631 = !DILocation(line: 102, column: 12, scope: !630)
!632 = !DILocation(line: 102, column: 17, scope: !630)
!633 = !DILocation(line: 102, column: 28, scope: !630)
!634 = !DILocation(line: 102, column: 20, scope: !630)
!635 = !DILocation(line: 102, column: 7, scope: !573)
!636 = !DILocation(line: 103, column: 5, scope: !637)
!637 = distinct !DILexicalBlock(scope: !630, file: !2, line: 102, column: 48)
!638 = !DILocation(line: 118, column: 3, scope: !637)
!639 = !DILocation(line: 120, column: 3, scope: !573)
!640 = !DILocation(line: 120, column: 10, scope: !573)
!641 = !DILocation(line: 120, column: 14, scope: !573)
!642 = !DILocation(line: 120, column: 12, scope: !573)
!643 = !DILocation(line: 121, column: 17, scope: !644)
!644 = distinct !DILexicalBlock(scope: !645, file: !2, line: 121, column: 9)
!645 = distinct !DILexicalBlock(scope: !573, file: !2, line: 120, column: 20)
!646 = !DILocation(line: 121, column: 22, scope: !644)
!647 = !DILocation(line: 121, column: 9, scope: !644)
!648 = !DILocation(line: 121, column: 39, scope: !644)
!649 = !DILocation(line: 121, column: 50, scope: !644)
!650 = !DILocation(line: 121, column: 55, scope: !644)
!651 = !DILocation(line: 121, column: 42, scope: !644)
!652 = !DILocation(line: 121, column: 9, scope: !645)
!653 = !DILocalVariable(name: "msg", scope: !654, file: !2, line: 122, type: !437)
!654 = distinct !DILexicalBlock(scope: !644, file: !2, line: 121, column: 72)
!655 = !DILocation(line: 122, column: 19, scope: !654)
!656 = !DILocation(line: 123, column: 11, scope: !657)
!657 = distinct !DILexicalBlock(scope: !654, file: !2, line: 123, column: 11)
!658 = !DILocation(line: 123, column: 18, scope: !657)
!659 = !DILocation(line: 123, column: 15, scope: !657)
!660 = !DILocation(line: 123, column: 11, scope: !654)
!661 = !DILocation(line: 124, column: 22, scope: !657)
!662 = !DILocation(line: 124, column: 9, scope: !657)
!663 = !DILocation(line: 126, column: 30, scope: !654)
!664 = !DILocation(line: 126, column: 36, scope: !654)
!665 = !DILocation(line: 126, column: 41, scope: !654)
!666 = !DILocation(line: 126, column: 17, scope: !654)
!667 = !DILocation(line: 126, column: 15, scope: !654)
!668 = !DILocation(line: 128, column: 11, scope: !669)
!669 = distinct !DILexicalBlock(scope: !654, file: !2, line: 128, column: 11)
!670 = !DILocation(line: 128, column: 23, scope: !669)
!671 = !DILocation(line: 128, column: 11, scope: !654)
!672 = !DILocation(line: 129, column: 9, scope: !669)
!673 = !DILocation(line: 131, column: 31, scope: !654)
!674 = !DILocation(line: 131, column: 43, scope: !654)
!675 = !DILocation(line: 131, column: 29, scope: !654)
!676 = !DILocation(line: 131, column: 25, scope: !654)
!677 = !DILocation(line: 131, column: 7, scope: !654)
!678 = !DILocation(line: 131, column: 23, scope: !654)
!679 = !DILocation(line: 132, column: 31, scope: !654)
!680 = !DILocation(line: 132, column: 43, scope: !654)
!681 = !DILocation(line: 132, column: 29, scope: !654)
!682 = !DILocation(line: 132, column: 25, scope: !654)
!683 = !DILocation(line: 132, column: 7, scope: !654)
!684 = !DILocation(line: 132, column: 23, scope: !654)
!685 = !DILocation(line: 133, column: 18, scope: !654)
!686 = !DILocation(line: 134, column: 28, scope: !654)
!687 = !DILocation(line: 134, column: 52, scope: !654)
!688 = !DILocation(line: 134, column: 61, scope: !654)
!689 = !DILocation(line: 134, column: 38, scope: !654)
!690 = !DILocation(line: 134, column: 7, scope: !654)
!691 = !DILocation(line: 136, column: 5, scope: !654)
!692 = !DILocation(line: 136, column: 24, scope: !693)
!693 = distinct !DILexicalBlock(scope: !644, file: !2, line: 136, column: 16)
!694 = !DILocation(line: 136, column: 29, scope: !693)
!695 = !DILocation(line: 136, column: 16, scope: !693)
!696 = !DILocation(line: 136, column: 47, scope: !693)
!697 = !DILocation(line: 137, column: 24, scope: !693)
!698 = !DILocation(line: 137, column: 29, scope: !693)
!699 = !DILocation(line: 137, column: 16, scope: !693)
!700 = !DILocation(line: 136, column: 16, scope: !644)
!701 = !DILocalVariable(name: "msg", scope: !702, file: !2, line: 138, type: !437)
!702 = distinct !DILexicalBlock(scope: !693, file: !2, line: 137, column: 47)
!703 = !DILocation(line: 138, column: 19, scope: !702)
!704 = !DILocation(line: 141, column: 11, scope: !705)
!705 = distinct !DILexicalBlock(scope: !702, file: !2, line: 141, column: 11)
!706 = !DILocation(line: 141, column: 13, scope: !705)
!707 = !DILocation(line: 141, column: 20, scope: !705)
!708 = !DILocation(line: 141, column: 17, scope: !705)
!709 = !DILocation(line: 141, column: 11, scope: !702)
!710 = !DILocation(line: 142, column: 22, scope: !705)
!711 = !DILocation(line: 142, column: 9, scope: !705)
!712 = !DILocation(line: 144, column: 8, scope: !702)
!713 = !DILocation(line: 145, column: 32, scope: !702)
!714 = !DILocation(line: 145, column: 38, scope: !702)
!715 = !DILocation(line: 145, column: 43, scope: !702)
!716 = !DILocation(line: 145, column: 19, scope: !702)
!717 = !DILocation(line: 145, column: 17, scope: !702)
!718 = !DILocation(line: 146, column: 32, scope: !702)
!719 = !DILocation(line: 146, column: 38, scope: !702)
!720 = !DILocation(line: 146, column: 43, scope: !702)
!721 = !DILocation(line: 146, column: 19, scope: !702)
!722 = !DILocation(line: 146, column: 17, scope: !702)
!723 = !DILocation(line: 147, column: 30, scope: !702)
!724 = !DILocation(line: 147, column: 36, scope: !702)
!725 = !DILocation(line: 147, column: 41, scope: !702)
!726 = !DILocation(line: 147, column: 17, scope: !702)
!727 = !DILocation(line: 147, column: 15, scope: !702)
!728 = !DILocation(line: 149, column: 12, scope: !729)
!729 = distinct !DILexicalBlock(scope: !702, file: !2, line: 149, column: 11)
!730 = !DILocation(line: 149, column: 24, scope: !729)
!731 = !DILocation(line: 149, column: 22, scope: !729)
!732 = !DILocation(line: 149, column: 35, scope: !729)
!733 = !DILocation(line: 149, column: 39, scope: !729)
!734 = !DILocation(line: 149, column: 49, scope: !729)
!735 = !DILocation(line: 149, column: 54, scope: !729)
!736 = !DILocation(line: 150, column: 9, scope: !729)
!737 = !DILocation(line: 152, column: 27, scope: !702)
!738 = !DILocation(line: 152, column: 38, scope: !702)
!739 = !DILocation(line: 152, column: 48, scope: !702)
!740 = !DILocation(line: 152, column: 16, scope: !702)
!741 = !DILocation(line: 152, column: 14, scope: !702)
!742 = !DILocation(line: 154, column: 11, scope: !743)
!743 = distinct !DILexicalBlock(scope: !702, file: !2, line: 154, column: 11)
!744 = !DILocation(line: 154, column: 25, scope: !743)
!745 = !DILocation(line: 154, column: 23, scope: !743)
!746 = !DILocation(line: 154, column: 35, scope: !743)
!747 = !DILocation(line: 154, column: 11, scope: !702)
!748 = !DILocation(line: 155, column: 9, scope: !743)
!749 = !DILocation(line: 157, column: 14, scope: !750)
!750 = distinct !DILexicalBlock(scope: !702, file: !2, line: 157, column: 7)
!751 = !DILocation(line: 157, column: 12, scope: !750)
!752 = !DILocation(line: 157, column: 19, scope: !753)
!753 = distinct !DILexicalBlock(scope: !750, file: !2, line: 157, column: 7)
!754 = !DILocation(line: 157, column: 23, scope: !753)
!755 = !DILocation(line: 157, column: 21, scope: !753)
!756 = !DILocation(line: 157, column: 7, scope: !750)
!757 = !DILocation(line: 158, column: 33, scope: !758)
!758 = distinct !DILexicalBlock(scope: !753, file: !2, line: 157, column: 36)
!759 = !DILocation(line: 158, column: 45, scope: !758)
!760 = !DILocation(line: 158, column: 31, scope: !758)
!761 = !DILocation(line: 158, column: 27, scope: !758)
!762 = !DILocation(line: 158, column: 9, scope: !758)
!763 = !DILocation(line: 158, column: 25, scope: !758)
!764 = !DILocation(line: 159, column: 33, scope: !758)
!765 = !DILocation(line: 159, column: 45, scope: !758)
!766 = !DILocation(line: 159, column: 31, scope: !758)
!767 = !DILocation(line: 159, column: 27, scope: !758)
!768 = !DILocation(line: 159, column: 9, scope: !758)
!769 = !DILocation(line: 159, column: 25, scope: !758)
!770 = !DILocation(line: 160, column: 20, scope: !758)
!771 = !DILocation(line: 162, column: 30, scope: !758)
!772 = !DILocation(line: 162, column: 54, scope: !758)
!773 = !DILocation(line: 162, column: 63, scope: !758)
!774 = !DILocation(line: 162, column: 40, scope: !758)
!775 = !DILocation(line: 162, column: 9, scope: !758)
!776 = !DILocation(line: 157, column: 32, scope: !753)
!777 = !DILocation(line: 157, column: 7, scope: !753)
!778 = distinct !{!778, !756, !779}
!779 = !DILocation(line: 164, column: 7, scope: !750)
!780 = !DILocation(line: 165, column: 24, scope: !781)
!781 = distinct !DILexicalBlock(scope: !693, file: !2, line: 165, column: 16)
!782 = !DILocation(line: 165, column: 29, scope: !781)
!783 = !DILocation(line: 165, column: 16, scope: !781)
!784 = !DILocation(line: 165, column: 48, scope: !781)
!785 = !DILocation(line: 166, column: 24, scope: !781)
!786 = !DILocation(line: 166, column: 29, scope: !781)
!787 = !DILocation(line: 166, column: 16, scope: !781)
!788 = !DILocation(line: 165, column: 16, scope: !693)
!789 = !DILocalVariable(name: "msg", scope: !790, file: !2, line: 167, type: !437)
!790 = distinct !DILexicalBlock(scope: !781, file: !2, line: 166, column: 48)
!791 = !DILocation(line: 167, column: 19, scope: !790)
!792 = !DILocation(line: 170, column: 11, scope: !793)
!793 = distinct !DILexicalBlock(scope: !790, file: !2, line: 170, column: 11)
!794 = !DILocation(line: 170, column: 13, scope: !793)
!795 = !DILocation(line: 170, column: 20, scope: !793)
!796 = !DILocation(line: 170, column: 17, scope: !793)
!797 = !DILocation(line: 170, column: 11, scope: !790)
!798 = !DILocation(line: 171, column: 22, scope: !793)
!799 = !DILocation(line: 171, column: 9, scope: !793)
!800 = !DILocation(line: 173, column: 11, scope: !801)
!801 = distinct !DILexicalBlock(scope: !790, file: !2, line: 173, column: 11)
!802 = !DILocation(line: 173, column: 21, scope: !801)
!803 = !DILocation(line: 173, column: 11, scope: !790)
!804 = !DILocation(line: 174, column: 9, scope: !801)
!805 = !DILocation(line: 176, column: 8, scope: !790)
!806 = !DILocation(line: 177, column: 32, scope: !790)
!807 = !DILocation(line: 177, column: 38, scope: !790)
!808 = !DILocation(line: 177, column: 43, scope: !790)
!809 = !DILocation(line: 177, column: 19, scope: !790)
!810 = !DILocation(line: 177, column: 17, scope: !790)
!811 = !DILocation(line: 178, column: 35, scope: !790)
!812 = !DILocation(line: 178, column: 41, scope: !790)
!813 = !DILocation(line: 178, column: 46, scope: !790)
!814 = !DILocation(line: 178, column: 22, scope: !790)
!815 = !DILocation(line: 178, column: 20, scope: !790)
!816 = !DILocation(line: 180, column: 11, scope: !817)
!817 = distinct !DILexicalBlock(scope: !790, file: !2, line: 180, column: 11)
!818 = !DILocation(line: 180, column: 21, scope: !817)
!819 = !DILocation(line: 180, column: 11, scope: !790)
!820 = !DILocation(line: 181, column: 9, scope: !817)
!821 = !DILocation(line: 184, column: 11, scope: !822)
!822 = distinct !DILexicalBlock(scope: !790, file: !2, line: 184, column: 11)
!823 = !DILocation(line: 184, column: 24, scope: !822)
!824 = !DILocation(line: 184, column: 11, scope: !790)
!825 = !DILocation(line: 185, column: 9, scope: !822)
!826 = !DILocation(line: 188, column: 24, scope: !827)
!827 = distinct !DILexicalBlock(scope: !781, file: !2, line: 188, column: 16)
!828 = !DILocation(line: 188, column: 29, scope: !827)
!829 = !DILocation(line: 188, column: 16, scope: !827)
!830 = !DILocation(line: 188, column: 48, scope: !827)
!831 = !DILocation(line: 189, column: 24, scope: !827)
!832 = !DILocation(line: 189, column: 29, scope: !827)
!833 = !DILocation(line: 189, column: 16, scope: !827)
!834 = !DILocation(line: 188, column: 16, scope: !781)
!835 = !DILocalVariable(name: "msg", scope: !836, file: !2, line: 190, type: !437)
!836 = distinct !DILexicalBlock(scope: !827, file: !2, line: 189, column: 48)
!837 = !DILocation(line: 190, column: 19, scope: !836)
!838 = !DILocation(line: 193, column: 11, scope: !839)
!839 = distinct !DILexicalBlock(scope: !836, file: !2, line: 193, column: 11)
!840 = !DILocation(line: 193, column: 18, scope: !839)
!841 = !DILocation(line: 193, column: 15, scope: !839)
!842 = !DILocation(line: 193, column: 11, scope: !836)
!843 = !DILocation(line: 194, column: 22, scope: !839)
!844 = !DILocation(line: 194, column: 9, scope: !839)
!845 = !DILocation(line: 196, column: 36, scope: !836)
!846 = !DILocation(line: 196, column: 42, scope: !836)
!847 = !DILocation(line: 196, column: 47, scope: !836)
!848 = !DILocation(line: 196, column: 23, scope: !836)
!849 = !DILocation(line: 196, column: 21, scope: !836)
!850 = !DILocation(line: 197, column: 5, scope: !836)
!851 = !DILocation(line: 197, column: 24, scope: !852)
!852 = distinct !DILexicalBlock(scope: !827, file: !2, line: 197, column: 16)
!853 = !DILocation(line: 197, column: 29, scope: !852)
!854 = !DILocation(line: 197, column: 16, scope: !852)
!855 = !DILocation(line: 197, column: 49, scope: !852)
!856 = !DILocation(line: 198, column: 24, scope: !852)
!857 = !DILocation(line: 198, column: 29, scope: !852)
!858 = !DILocation(line: 198, column: 16, scope: !852)
!859 = !DILocation(line: 197, column: 16, scope: !827)
!860 = !DILocation(line: 199, column: 23, scope: !861)
!861 = distinct !DILexicalBlock(scope: !852, file: !2, line: 198, column: 49)
!862 = !DILocation(line: 200, column: 8, scope: !861)
!863 = !DILocation(line: 201, column: 5, scope: !861)
!864 = !DILocation(line: 201, column: 24, scope: !865)
!865 = distinct !DILexicalBlock(scope: !852, file: !2, line: 201, column: 16)
!866 = !DILocation(line: 201, column: 29, scope: !865)
!867 = !DILocation(line: 201, column: 16, scope: !865)
!868 = !DILocation(line: 201, column: 54, scope: !865)
!869 = !DILocation(line: 202, column: 24, scope: !865)
!870 = !DILocation(line: 202, column: 29, scope: !865)
!871 = !DILocation(line: 202, column: 16, scope: !865)
!872 = !DILocation(line: 201, column: 16, scope: !852)
!873 = !DILocation(line: 203, column: 28, scope: !874)
!874 = distinct !DILexicalBlock(scope: !865, file: !2, line: 202, column: 54)
!875 = !DILocation(line: 204, column: 8, scope: !874)
!876 = !DILocation(line: 205, column: 5, scope: !874)
!877 = !DILocation(line: 205, column: 24, scope: !878)
!878 = distinct !DILexicalBlock(scope: !865, file: !2, line: 205, column: 16)
!879 = !DILocation(line: 205, column: 29, scope: !878)
!880 = !DILocation(line: 205, column: 16, scope: !878)
!881 = !DILocation(line: 205, column: 46, scope: !878)
!882 = !DILocation(line: 205, column: 57, scope: !878)
!883 = !DILocation(line: 205, column: 62, scope: !878)
!884 = !DILocation(line: 205, column: 49, scope: !878)
!885 = !DILocation(line: 205, column: 16, scope: !865)
!886 = !DILocation(line: 206, column: 15, scope: !887)
!887 = distinct !DILexicalBlock(scope: !878, file: !2, line: 205, column: 79)
!888 = !DILocation(line: 207, column: 8, scope: !887)
!889 = !DILocation(line: 208, column: 5, scope: !887)
!890 = !DILocation(line: 208, column: 24, scope: !891)
!891 = distinct !DILexicalBlock(scope: !878, file: !2, line: 208, column: 16)
!892 = !DILocation(line: 208, column: 29, scope: !891)
!893 = !DILocation(line: 208, column: 16, scope: !891)
!894 = !DILocation(line: 208, column: 48, scope: !891)
!895 = !DILocation(line: 208, column: 59, scope: !891)
!896 = !DILocation(line: 208, column: 64, scope: !891)
!897 = !DILocation(line: 208, column: 51, scope: !891)
!898 = !DILocation(line: 208, column: 16, scope: !878)
!899 = !DILocation(line: 209, column: 9, scope: !900)
!900 = distinct !DILexicalBlock(scope: !891, file: !2, line: 208, column: 83)
!901 = !DILocation(line: 210, column: 5, scope: !900)
!902 = !DILocation(line: 210, column: 24, scope: !903)
!903 = distinct !DILexicalBlock(scope: !891, file: !2, line: 210, column: 16)
!904 = !DILocation(line: 210, column: 29, scope: !903)
!905 = !DILocation(line: 210, column: 16, scope: !903)
!906 = !DILocation(line: 210, column: 47, scope: !903)
!907 = !DILocation(line: 211, column: 24, scope: !903)
!908 = !DILocation(line: 211, column: 29, scope: !903)
!909 = !DILocation(line: 211, column: 16, scope: !903)
!910 = !DILocation(line: 210, column: 16, scope: !891)
!911 = !DILocalVariable(name: "msg", scope: !912, file: !2, line: 212, type: !437)
!912 = distinct !DILexicalBlock(scope: !903, file: !2, line: 211, column: 47)
!913 = !DILocation(line: 212, column: 19, scope: !912)
!914 = !DILocation(line: 213, column: 11, scope: !915)
!915 = distinct !DILexicalBlock(scope: !912, file: !2, line: 213, column: 11)
!916 = !DILocation(line: 213, column: 18, scope: !915)
!917 = !DILocation(line: 213, column: 15, scope: !915)
!918 = !DILocation(line: 213, column: 11, scope: !912)
!919 = !DILocation(line: 214, column: 22, scope: !915)
!920 = !DILocation(line: 214, column: 9, scope: !915)
!921 = !DILocation(line: 216, column: 30, scope: !912)
!922 = !DILocation(line: 216, column: 36, scope: !912)
!923 = !DILocation(line: 216, column: 41, scope: !912)
!924 = !DILocation(line: 216, column: 17, scope: !912)
!925 = !DILocation(line: 216, column: 15, scope: !912)
!926 = !DILocation(line: 217, column: 5, scope: !912)
!927 = !DILocation(line: 219, column: 28, scope: !928)
!928 = distinct !DILexicalBlock(scope: !903, file: !2, line: 217, column: 12)
!929 = !DILocation(line: 219, column: 38, scope: !928)
!930 = !DILocation(line: 219, column: 44, scope: !928)
!931 = !DILocation(line: 219, column: 7, scope: !928)
!932 = distinct !{!932, !639, !933}
!933 = !DILocation(line: 221, column: 3, scope: !573)
!934 = !DILocation(line: 223, column: 33, scope: !573)
!935 = !DILocation(line: 223, column: 42, scope: !573)
!936 = !DILocation(line: 223, column: 32, scope: !573)
!937 = !DILocation(line: 223, column: 47, scope: !573)
!938 = !DILocation(line: 223, column: 25, scope: !573)
!939 = !DILocation(line: 223, column: 14, scope: !573)
!940 = !DILocation(line: 224, column: 8, scope: !941)
!941 = distinct !DILexicalBlock(scope: !573, file: !2, line: 224, column: 7)
!942 = !DILocation(line: 224, column: 7, scope: !573)
!943 = !DILocation(line: 225, column: 5, scope: !941)
!944 = !DILocation(line: 226, column: 20, scope: !573)
!945 = !DILocation(line: 226, column: 3, scope: !573)
!946 = !DILocation(line: 227, column: 10, scope: !573)
!947 = !DILocation(line: 227, column: 3, scope: !573)
!948 = !DILocation(line: 227, column: 32, scope: !573)
!949 = !DILocation(line: 227, column: 41, scope: !573)
!950 = !DILocation(line: 228, column: 3, scope: !573)
!951 = !DILocation(line: 228, column: 14, scope: !573)
!952 = !DILocation(line: 228, column: 24, scope: !573)
!953 = !DILocation(line: 230, column: 14, scope: !573)
!954 = !DILocation(line: 230, column: 4, scope: !573)
!955 = !DILocation(line: 230, column: 12, scope: !573)
!956 = !DILocation(line: 231, column: 14, scope: !573)
!957 = !DILocation(line: 231, column: 4, scope: !573)
!958 = !DILocation(line: 231, column: 12, scope: !573)
!959 = !DILocation(line: 233, column: 17, scope: !573)
!960 = !DILocation(line: 233, column: 28, scope: !573)
!961 = !DILocation(line: 233, column: 42, scope: !573)
!962 = !DILocation(line: 233, column: 57, scope: !573)
!963 = !DILocation(line: 234, column: 17, scope: !573)
!964 = !DILocation(line: 234, column: 39, scope: !573)
!965 = !DILocation(line: 233, column: 3, scope: !573)
!966 = !DILocation(line: 235, column: 1, scope: !573)
!967 = distinct !DISubprogram(name: "__streq", scope: !2, file: !2, line: 48, type: !968, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !513, retainedNodes: !385)
!968 = !DISubroutineType(types: !969)
!969 = !{!241, !437, !437}
!970 = !DILocalVariable(name: "a", arg: 1, scope: !967, file: !2, line: 48, type: !437)
!971 = !DILocation(line: 48, column: 32, scope: !967)
!972 = !DILocalVariable(name: "b", arg: 2, scope: !967, file: !2, line: 48, type: !437)
!973 = !DILocation(line: 48, column: 47, scope: !967)
!974 = !DILocation(line: 49, column: 3, scope: !967)
!975 = !DILocation(line: 49, column: 11, scope: !967)
!976 = !DILocation(line: 49, column: 10, scope: !967)
!977 = !DILocation(line: 49, column: 17, scope: !967)
!978 = !DILocation(line: 49, column: 16, scope: !967)
!979 = !DILocation(line: 49, column: 13, scope: !967)
!980 = !DILocation(line: 50, column: 11, scope: !981)
!981 = distinct !DILexicalBlock(scope: !982, file: !2, line: 50, column: 9)
!982 = distinct !DILexicalBlock(scope: !967, file: !2, line: 49, column: 20)
!983 = !DILocation(line: 50, column: 10, scope: !981)
!984 = !DILocation(line: 50, column: 9, scope: !982)
!985 = !DILocation(line: 51, column: 7, scope: !981)
!986 = !DILocation(line: 52, column: 6, scope: !982)
!987 = !DILocation(line: 53, column: 6, scope: !982)
!988 = distinct !{!988, !974, !989}
!989 = !DILocation(line: 54, column: 3, scope: !967)
!990 = !DILocation(line: 55, column: 3, scope: !967)
!991 = !DILocation(line: 56, column: 1, scope: !967)
!992 = distinct !DISubprogram(name: "__emit_error", scope: !2, file: !2, line: 19, type: !993, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !513, retainedNodes: !385)
!993 = !DISubroutineType(types: !994)
!994 = !{null, !437}
!995 = !DILocalVariable(name: "msg", arg: 1, scope: !992, file: !2, line: 19, type: !437)
!996 = !DILocation(line: 19, column: 38, scope: !992)
!997 = !DILocation(line: 20, column: 41, scope: !992)
!998 = !DILocation(line: 20, column: 3, scope: !992)
!999 = distinct !DISubprogram(name: "__str_to_int", scope: !2, file: !2, line: 26, type: !1000, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !513, retainedNodes: !385)
!1000 = !DISubroutineType(types: !1001)
!1001 = !{!245, !220, !437}
!1002 = !DILocalVariable(name: "s", arg: 1, scope: !999, file: !2, line: 26, type: !220)
!1003 = !DILocation(line: 26, column: 36, scope: !999)
!1004 = !DILocalVariable(name: "error_msg", arg: 2, scope: !999, file: !2, line: 26, type: !437)
!1005 = !DILocation(line: 26, column: 51, scope: !999)
!1006 = !DILocalVariable(name: "res", scope: !999, file: !2, line: 27, type: !245)
!1007 = !DILocation(line: 27, column: 12, scope: !999)
!1008 = !DILocalVariable(name: "c", scope: !999, file: !2, line: 28, type: !5)
!1009 = !DILocation(line: 28, column: 8, scope: !999)
!1010 = !DILocation(line: 30, column: 9, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !999, file: !2, line: 30, column: 7)
!1012 = !DILocation(line: 30, column: 8, scope: !1011)
!1013 = !DILocation(line: 30, column: 7, scope: !999)
!1014 = !DILocation(line: 31, column: 18, scope: !1011)
!1015 = !DILocation(line: 31, column: 5, scope: !1011)
!1016 = !DILocation(line: 33, column: 3, scope: !999)
!1017 = !DILocation(line: 33, column: 17, scope: !999)
!1018 = !DILocation(line: 33, column: 15, scope: !999)
!1019 = !DILocation(line: 33, column: 13, scope: !999)
!1020 = !DILocation(line: 34, column: 9, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1022, file: !2, line: 34, column: 9)
!1022 = distinct !DILexicalBlock(scope: !999, file: !2, line: 33, column: 22)
!1023 = !DILocation(line: 34, column: 11, scope: !1021)
!1024 = !DILocation(line: 34, column: 18, scope: !1021)
!1025 = !DILocation(line: 34, column: 21, scope: !1021)
!1026 = !DILocation(line: 34, column: 23, scope: !1021)
!1027 = !DILocation(line: 34, column: 9, scope: !1022)
!1028 = !DILocation(line: 35, column: 13, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1021, file: !2, line: 34, column: 31)
!1030 = !DILocation(line: 35, column: 17, scope: !1029)
!1031 = !DILocation(line: 35, column: 25, scope: !1029)
!1032 = !DILocation(line: 35, column: 27, scope: !1029)
!1033 = !DILocation(line: 35, column: 24, scope: !1029)
!1034 = !DILocation(line: 35, column: 22, scope: !1029)
!1035 = !DILocation(line: 35, column: 11, scope: !1029)
!1036 = !DILocation(line: 36, column: 5, scope: !1029)
!1037 = !DILocation(line: 37, column: 20, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1021, file: !2, line: 36, column: 12)
!1039 = !DILocation(line: 37, column: 7, scope: !1038)
!1040 = distinct !{!1040, !1016, !1041}
!1041 = !DILocation(line: 39, column: 3, scope: !999)
!1042 = !DILocation(line: 40, column: 10, scope: !999)
!1043 = !DILocation(line: 40, column: 3, scope: !999)
!1044 = distinct !DISubprogram(name: "__add_arg", scope: !2, file: !2, line: 73, type: !1045, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !513, retainedNodes: !385)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{null, !269, !516, !220, !241}
!1047 = !DILocalVariable(name: "argc", arg: 1, scope: !1044, file: !2, line: 73, type: !269)
!1048 = !DILocation(line: 73, column: 28, scope: !1044)
!1049 = !DILocalVariable(name: "argv", arg: 2, scope: !1044, file: !2, line: 73, type: !516)
!1050 = !DILocation(line: 73, column: 41, scope: !1044)
!1051 = !DILocalVariable(name: "arg", arg: 3, scope: !1044, file: !2, line: 73, type: !220)
!1052 = !DILocation(line: 73, column: 53, scope: !1044)
!1053 = !DILocalVariable(name: "argcMax", arg: 4, scope: !1044, file: !2, line: 73, type: !241)
!1054 = !DILocation(line: 73, column: 62, scope: !1044)
!1055 = !DILocation(line: 74, column: 8, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1044, file: !2, line: 74, column: 7)
!1057 = !DILocation(line: 74, column: 7, scope: !1056)
!1058 = !DILocation(line: 74, column: 14, scope: !1056)
!1059 = !DILocation(line: 74, column: 12, scope: !1056)
!1060 = !DILocation(line: 74, column: 7, scope: !1044)
!1061 = !DILocation(line: 75, column: 5, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1056, file: !2, line: 74, column: 23)
!1063 = !DILocation(line: 76, column: 3, scope: !1062)
!1064 = !DILocation(line: 77, column: 19, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1056, file: !2, line: 76, column: 10)
!1066 = !DILocation(line: 77, column: 5, scope: !1065)
!1067 = !DILocation(line: 77, column: 11, scope: !1065)
!1068 = !DILocation(line: 77, column: 10, scope: !1065)
!1069 = !DILocation(line: 77, column: 17, scope: !1065)
!1070 = !DILocation(line: 78, column: 7, scope: !1065)
!1071 = !DILocation(line: 78, column: 12, scope: !1065)
!1072 = !DILocation(line: 80, column: 1, scope: !1044)
!1073 = distinct !DISubprogram(name: "__get_sym_str", scope: !2, file: !2, line: 58, type: !1074, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !513, retainedNodes: !385)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{!220, !241, !220}
!1076 = !DILocalVariable(name: "numChars", arg: 1, scope: !1073, file: !2, line: 58, type: !241)
!1077 = !DILocation(line: 58, column: 32, scope: !1073)
!1078 = !DILocalVariable(name: "name", arg: 2, scope: !1073, file: !2, line: 58, type: !220)
!1079 = !DILocation(line: 58, column: 48, scope: !1073)
!1080 = !DILocalVariable(name: "i", scope: !1073, file: !2, line: 59, type: !241)
!1081 = !DILocation(line: 59, column: 7, scope: !1073)
!1082 = !DILocalVariable(name: "s", scope: !1073, file: !2, line: 60, type: !220)
!1083 = !DILocation(line: 60, column: 9, scope: !1073)
!1084 = !DILocation(line: 60, column: 20, scope: !1073)
!1085 = !DILocation(line: 60, column: 28, scope: !1073)
!1086 = !DILocation(line: 60, column: 13, scope: !1073)
!1087 = !DILocation(line: 61, column: 8, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1073, file: !2, line: 61, column: 7)
!1089 = !DILocation(line: 61, column: 7, scope: !1073)
!1090 = !DILocation(line: 62, column: 5, scope: !1088)
!1091 = !DILocation(line: 63, column: 20, scope: !1073)
!1092 = !DILocation(line: 63, column: 3, scope: !1073)
!1093 = !DILocation(line: 64, column: 22, scope: !1073)
!1094 = !DILocation(line: 64, column: 25, scope: !1073)
!1095 = !DILocation(line: 64, column: 33, scope: !1073)
!1096 = !DILocation(line: 64, column: 37, scope: !1073)
!1097 = !DILocation(line: 64, column: 3, scope: !1073)
!1098 = !DILocation(line: 66, column: 9, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1073, file: !2, line: 66, column: 3)
!1100 = !DILocation(line: 66, column: 8, scope: !1099)
!1101 = !DILocation(line: 66, column: 13, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1099, file: !2, line: 66, column: 3)
!1103 = !DILocation(line: 66, column: 15, scope: !1102)
!1104 = !DILocation(line: 66, column: 14, scope: !1102)
!1105 = !DILocation(line: 66, column: 3, scope: !1099)
!1106 = !DILocation(line: 67, column: 27, scope: !1102)
!1107 = !DILocation(line: 67, column: 40, scope: !1102)
!1108 = !DILocation(line: 67, column: 42, scope: !1102)
!1109 = !DILocation(line: 67, column: 30, scope: !1102)
!1110 = !DILocation(line: 67, column: 5, scope: !1102)
!1111 = !DILocation(line: 66, column: 26, scope: !1102)
!1112 = !DILocation(line: 66, column: 3, scope: !1102)
!1113 = distinct !{!1113, !1105, !1114}
!1114 = !DILocation(line: 67, column: 45, scope: !1099)
!1115 = !DILocation(line: 69, column: 3, scope: !1073)
!1116 = !DILocation(line: 69, column: 5, scope: !1073)
!1117 = !DILocation(line: 69, column: 15, scope: !1073)
!1118 = !DILocation(line: 70, column: 10, scope: !1073)
!1119 = !DILocation(line: 70, column: 3, scope: !1073)
!1120 = distinct !DISubprogram(name: "__klee_posix_wrapper", scope: !2, file: !2, line: 242, type: !1121, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !513, retainedNodes: !385)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!241, !241, !516, !516}
!1123 = !DILocalVariable(name: "argcPtr", arg: 1, scope: !1120, file: !2, line: 242, type: !241)
!1124 = !DILocation(line: 242, column: 30, scope: !1120)
!1125 = !DILocalVariable(name: "argvPtr", arg: 2, scope: !1120, file: !2, line: 242, type: !516)
!1126 = !DILocation(line: 242, column: 46, scope: !1120)
!1127 = !DILocalVariable(name: "envp", arg: 3, scope: !1120, file: !2, line: 242, type: !516)
!1128 = !DILocation(line: 242, column: 62, scope: !1120)
!1129 = !DILocation(line: 243, column: 3, scope: !1120)
!1130 = !DILocation(line: 244, column: 36, scope: !1120)
!1131 = !DILocation(line: 244, column: 45, scope: !1120)
!1132 = !DILocation(line: 244, column: 54, scope: !1120)
!1133 = !DILocation(line: 244, column: 10, scope: !1120)
!1134 = !DILocation(line: 244, column: 3, scope: !1120)
!1135 = distinct !DISubprogram(name: "__isprint", scope: !2, file: !2, line: 43, type: !1136, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !513, retainedNodes: !385)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!241, !4}
!1138 = !DILocalVariable(name: "c", arg: 1, scope: !1135, file: !2, line: 43, type: !4)
!1139 = !DILocation(line: 43, column: 33, scope: !1135)
!1140 = !DILocation(line: 45, column: 17, scope: !1135)
!1141 = !DILocation(line: 45, column: 14, scope: !1135)
!1142 = !DILocation(line: 45, column: 19, scope: !1135)
!1143 = !DILocation(line: 45, column: 3, scope: !1135)
!1144 = distinct !DISubprogram(name: "check_duplicate", scope: !141, file: !141, line: 6, type: !1145, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !518, retainedNodes: !385)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{null, !220}
!1147 = !DILocalVariable(name: "line", arg: 1, scope: !1144, file: !141, line: 6, type: !220)
!1148 = !DILocation(line: 6, column: 28, scope: !1144)
!1149 = !DILocation(line: 7, column: 16, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1144, file: !141, line: 7, column: 9)
!1151 = !DILocation(line: 7, column: 9, scope: !1150)
!1152 = !DILocation(line: 7, column: 22, scope: !1150)
!1153 = !DILocation(line: 7, column: 27, scope: !1150)
!1154 = !DILocation(line: 7, column: 38, scope: !1150)
!1155 = !DILocation(line: 7, column: 30, scope: !1150)
!1156 = !DILocation(line: 7, column: 55, scope: !1150)
!1157 = !DILocation(line: 7, column: 9, scope: !1144)
!1158 = !DILocation(line: 8, column: 9, scope: !1159)
!1159 = distinct !DILexicalBlock(scope: !1150, file: !141, line: 7, column: 61)
!1160 = !DILocation(line: 10, column: 1, scope: !1144)
!1161 = distinct !DISubprogram(name: "main", scope: !141, file: !141, line: 12, type: !1162, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !518, retainedNodes: !385)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!241, !241, !516}
!1164 = !DILocalVariable(name: "argc", arg: 1, scope: !1161, file: !141, line: 12, type: !241)
!1165 = !DILocation(line: 12, column: 14, scope: !1161)
!1166 = !DILocalVariable(name: "argv", arg: 2, scope: !1161, file: !141, line: 12, type: !516)
!1167 = !DILocation(line: 12, column: 27, scope: !1161)
!1168 = !DILocalVariable(name: "buf", scope: !1161, file: !141, line: 13, type: !1169)
!1169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1024, elements: !1170)
!1170 = !{!1171}
!1171 = !DISubrange(count: 128)
!1172 = !DILocation(line: 13, column: 10, scope: !1161)
!1173 = !DILocation(line: 14, column: 5, scope: !1161)
!1174 = !DILocation(line: 15, column: 17, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1161, file: !141, line: 15, column: 9)
!1176 = !DILocation(line: 15, column: 9, scope: !1175)
!1177 = !DILocation(line: 15, column: 39, scope: !1175)
!1178 = !DILocation(line: 15, column: 9, scope: !1161)
!1179 = !DILocation(line: 16, column: 25, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1175, file: !141, line: 15, column: 44)
!1181 = !DILocation(line: 16, column: 9, scope: !1180)
!1182 = !DILocation(line: 17, column: 5, scope: !1180)
!1183 = !DILocation(line: 18, column: 5, scope: !1161)
!1184 = distinct !DISubprogram(name: "klee_init_fds", scope: !147, file: !147, line: 105, type: !1185, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !202, retainedNodes: !385)
!1185 = !DISubroutineType(types: !1186)
!1186 = !{null, !212, !212, !212, !241, !241, !212}
!1187 = !DILocalVariable(name: "n_files", arg: 1, scope: !1184, file: !147, line: 105, type: !212)
!1188 = !DILocation(line: 105, column: 29, scope: !1184)
!1189 = !DILocalVariable(name: "file_length", arg: 2, scope: !1184, file: !147, line: 105, type: !212)
!1190 = !DILocation(line: 105, column: 47, scope: !1184)
!1191 = !DILocalVariable(name: "stdin_length", arg: 3, scope: !1184, file: !147, line: 106, type: !212)
!1192 = !DILocation(line: 106, column: 29, scope: !1184)
!1193 = !DILocalVariable(name: "sym_stdout_flag", arg: 4, scope: !1184, file: !147, line: 106, type: !241)
!1194 = !DILocation(line: 106, column: 47, scope: !1184)
!1195 = !DILocalVariable(name: "save_all_writes_flag", arg: 5, scope: !1184, file: !147, line: 107, type: !241)
!1196 = !DILocation(line: 107, column: 24, scope: !1184)
!1197 = !DILocalVariable(name: "max_failures", arg: 6, scope: !1184, file: !147, line: 107, type: !212)
!1198 = !DILocation(line: 107, column: 55, scope: !1184)
!1199 = !DILocalVariable(name: "k", scope: !1184, file: !147, line: 108, type: !212)
!1200 = !DILocation(line: 108, column: 12, scope: !1184)
!1201 = !DILocalVariable(name: "name", scope: !1184, file: !147, line: 109, type: !1202)
!1202 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 56, elements: !6)
!1203 = !DILocation(line: 109, column: 8, scope: !1184)
!1204 = !DILocalVariable(name: "s", scope: !1184, file: !147, line: 110, type: !223)
!1205 = !DILocation(line: 110, column: 17, scope: !1184)
!1206 = !DILocation(line: 112, column: 3, scope: !1184)
!1207 = !DILocation(line: 114, column: 26, scope: !1184)
!1208 = !DILocation(line: 114, column: 24, scope: !1184)
!1209 = !DILocation(line: 115, column: 61, scope: !1184)
!1210 = !DILocation(line: 115, column: 59, scope: !1184)
!1211 = !DILocation(line: 115, column: 24, scope: !1184)
!1212 = !DILocation(line: 115, column: 22, scope: !1184)
!1213 = !DILocation(line: 116, column: 7, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1184, file: !147, line: 116, column: 7)
!1215 = !DILocation(line: 116, column: 15, scope: !1214)
!1216 = !DILocation(line: 117, column: 5, scope: !1214)
!1217 = !DILocation(line: 119, column: 9, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1184, file: !147, line: 119, column: 3)
!1219 = !DILocation(line: 119, column: 8, scope: !1218)
!1220 = !DILocation(line: 119, column: 13, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1218, file: !147, line: 119, column: 3)
!1222 = !DILocation(line: 119, column: 17, scope: !1221)
!1223 = !DILocation(line: 119, column: 15, scope: !1221)
!1224 = !DILocation(line: 119, column: 3, scope: !1218)
!1225 = !DILocation(line: 120, column: 21, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !147, line: 119, column: 31)
!1227 = !DILocation(line: 120, column: 19, scope: !1226)
!1228 = !DILocation(line: 120, column: 15, scope: !1226)
!1229 = !DILocation(line: 120, column: 5, scope: !1226)
!1230 = !DILocation(line: 120, column: 13, scope: !1226)
!1231 = !DILocation(line: 121, column: 34, scope: !1226)
!1232 = !DILocation(line: 121, column: 44, scope: !1226)
!1233 = !DILocation(line: 121, column: 25, scope: !1226)
!1234 = !DILocation(line: 121, column: 48, scope: !1226)
!1235 = !DILocation(line: 121, column: 61, scope: !1226)
!1236 = !DILocation(line: 121, column: 5, scope: !1226)
!1237 = !DILocation(line: 119, column: 27, scope: !1221)
!1238 = !DILocation(line: 119, column: 3, scope: !1221)
!1239 = distinct !{!1239, !1224, !1240}
!1240 = !DILocation(line: 122, column: 3, scope: !1218)
!1241 = !DILocation(line: 125, column: 7, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1184, file: !147, line: 125, column: 7)
!1243 = !DILocation(line: 125, column: 7, scope: !1184)
!1244 = !DILocation(line: 126, column: 26, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1242, file: !147, line: 125, column: 21)
!1246 = !DILocation(line: 126, column: 24, scope: !1245)
!1247 = !DILocation(line: 127, column: 19, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1245, file: !147, line: 127, column: 9)
!1249 = !DILocation(line: 127, column: 10, scope: !1248)
!1250 = !DILocation(line: 127, column: 9, scope: !1245)
!1251 = !DILocation(line: 128, column: 7, scope: !1248)
!1252 = !DILocation(line: 129, column: 33, scope: !1245)
!1253 = !DILocation(line: 129, column: 44, scope: !1245)
!1254 = !DILocation(line: 129, column: 5, scope: !1245)
!1255 = !DILocation(line: 130, column: 39, scope: !1245)
!1256 = !DILocation(line: 130, column: 28, scope: !1245)
!1257 = !DILocation(line: 131, column: 3, scope: !1245)
!1258 = !DILocation(line: 132, column: 27, scope: !1242)
!1259 = !DILocation(line: 134, column: 27, scope: !1184)
!1260 = !DILocation(line: 134, column: 25, scope: !1184)
!1261 = !DILocation(line: 135, column: 16, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1184, file: !147, line: 135, column: 7)
!1263 = !DILocation(line: 135, column: 7, scope: !1262)
!1264 = !DILocation(line: 135, column: 7, scope: !1184)
!1265 = !DILocation(line: 136, column: 26, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1262, file: !147, line: 135, column: 30)
!1267 = !DILocation(line: 136, column: 24, scope: !1266)
!1268 = !DILocation(line: 137, column: 27, scope: !1266)
!1269 = !DILocation(line: 137, column: 25, scope: !1266)
!1270 = !DILocation(line: 138, column: 27, scope: !1266)
!1271 = !DILocation(line: 138, column: 25, scope: !1266)
!1272 = !DILocation(line: 139, column: 31, scope: !1266)
!1273 = !DILocation(line: 139, column: 29, scope: !1266)
!1274 = !DILocation(line: 140, column: 28, scope: !1266)
!1275 = !DILocation(line: 140, column: 26, scope: !1266)
!1276 = !DILocation(line: 141, column: 20, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1266, file: !147, line: 141, column: 9)
!1278 = !DILocation(line: 141, column: 11, scope: !1277)
!1279 = !DILocation(line: 141, column: 30, scope: !1277)
!1280 = !DILocation(line: 143, column: 7, scope: !1277)
!1281 = !DILocation(line: 145, column: 33, scope: !1266)
!1282 = !DILocation(line: 145, column: 5, scope: !1266)
!1283 = !DILocation(line: 146, column: 33, scope: !1266)
!1284 = !DILocation(line: 146, column: 5, scope: !1266)
!1285 = !DILocation(line: 147, column: 33, scope: !1266)
!1286 = !DILocation(line: 147, column: 5, scope: !1266)
!1287 = !DILocation(line: 148, column: 33, scope: !1266)
!1288 = !DILocation(line: 148, column: 5, scope: !1266)
!1289 = !DILocation(line: 149, column: 33, scope: !1266)
!1290 = !DILocation(line: 149, column: 5, scope: !1266)
!1291 = !DILocation(line: 150, column: 3, scope: !1266)
!1292 = !DILocation(line: 153, column: 7, scope: !1293)
!1293 = distinct !DILexicalBlock(scope: !1184, file: !147, line: 153, column: 7)
!1294 = !DILocation(line: 153, column: 7, scope: !1184)
!1295 = !DILocation(line: 154, column: 27, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1293, file: !147, line: 153, column: 24)
!1297 = !DILocation(line: 154, column: 25, scope: !1296)
!1298 = !DILocation(line: 155, column: 19, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1296, file: !147, line: 155, column: 9)
!1300 = !DILocation(line: 155, column: 10, scope: !1299)
!1301 = !DILocation(line: 155, column: 9, scope: !1296)
!1302 = !DILocation(line: 156, column: 7, scope: !1299)
!1303 = !DILocation(line: 157, column: 33, scope: !1296)
!1304 = !DILocation(line: 157, column: 5, scope: !1296)
!1305 = !DILocation(line: 158, column: 39, scope: !1296)
!1306 = !DILocation(line: 158, column: 28, scope: !1296)
!1307 = !DILocation(line: 159, column: 28, scope: !1296)
!1308 = !DILocation(line: 160, column: 3, scope: !1296)
!1309 = !DILocation(line: 161, column: 28, scope: !1293)
!1310 = !DILocation(line: 163, column: 31, scope: !1184)
!1311 = !DILocation(line: 163, column: 29, scope: !1184)
!1312 = !DILocation(line: 164, column: 1, scope: !1184)
!1313 = distinct !DISubprogram(name: "__create_new_dfile", scope: !147, file: !147, line: 42, type: !1314, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !202, retainedNodes: !385)
!1314 = !DISubroutineType(types: !1315)
!1315 = !{null, !214, !212, !437, !222}
!1316 = !DILocalVariable(name: "dfile", arg: 1, scope: !1313, file: !147, line: 42, type: !214)
!1317 = !DILocation(line: 42, column: 49, scope: !1313)
!1318 = !DILocalVariable(name: "size", arg: 2, scope: !1313, file: !147, line: 42, type: !212)
!1319 = !DILocation(line: 42, column: 65, scope: !1313)
!1320 = !DILocalVariable(name: "name", arg: 3, scope: !1313, file: !147, line: 43, type: !437)
!1321 = !DILocation(line: 43, column: 44, scope: !1313)
!1322 = !DILocalVariable(name: "defaults", arg: 4, scope: !1313, file: !147, line: 43, type: !222)
!1323 = !DILocation(line: 43, column: 65, scope: !1313)
!1324 = !DILocalVariable(name: "s", scope: !1313, file: !147, line: 44, type: !222)
!1325 = !DILocation(line: 44, column: 18, scope: !1313)
!1326 = !DILocation(line: 44, column: 22, scope: !1313)
!1327 = !DILocation(line: 45, column: 8, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1313, file: !147, line: 45, column: 7)
!1329 = !DILocation(line: 45, column: 7, scope: !1313)
!1330 = !DILocation(line: 46, column: 5, scope: !1328)
!1331 = !DILocalVariable(name: "sp", scope: !1313, file: !147, line: 48, type: !437)
!1332 = !DILocation(line: 48, column: 15, scope: !1313)
!1333 = !DILocalVariable(name: "sname", scope: !1313, file: !147, line: 49, type: !1334)
!1334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 512, elements: !1335)
!1335 = !{!1336}
!1336 = !DISubrange(count: 64)
!1337 = !DILocation(line: 49, column: 8, scope: !1313)
!1338 = !DILocation(line: 50, column: 11, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1313, file: !147, line: 50, column: 3)
!1340 = !DILocation(line: 50, column: 10, scope: !1339)
!1341 = !DILocation(line: 50, column: 8, scope: !1339)
!1342 = !DILocation(line: 50, column: 18, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1339, file: !147, line: 50, column: 3)
!1344 = !DILocation(line: 50, column: 17, scope: !1343)
!1345 = !DILocation(line: 50, column: 3, scope: !1339)
!1346 = !DILocation(line: 51, column: 23, scope: !1343)
!1347 = !DILocation(line: 51, column: 22, scope: !1343)
!1348 = !DILocation(line: 51, column: 11, scope: !1343)
!1349 = !DILocation(line: 51, column: 14, scope: !1343)
!1350 = !DILocation(line: 51, column: 13, scope: !1343)
!1351 = !DILocation(line: 51, column: 5, scope: !1343)
!1352 = !DILocation(line: 51, column: 20, scope: !1343)
!1353 = !DILocation(line: 50, column: 22, scope: !1343)
!1354 = !DILocation(line: 50, column: 3, scope: !1343)
!1355 = distinct !{!1355, !1345, !1356}
!1356 = !DILocation(line: 51, column: 23, scope: !1339)
!1357 = !DILocation(line: 52, column: 17, scope: !1313)
!1358 = !DILocation(line: 52, column: 20, scope: !1313)
!1359 = !DILocation(line: 52, column: 19, scope: !1313)
!1360 = !DILocation(line: 52, column: 11, scope: !1313)
!1361 = !DILocation(line: 52, column: 3, scope: !1313)
!1362 = !DILocation(line: 54, column: 3, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1364, file: !147, line: 54, column: 3)
!1364 = distinct !DILexicalBlock(scope: !1313, file: !147, line: 54, column: 3)
!1365 = !DILocation(line: 54, column: 3, scope: !1364)
!1366 = !DILocation(line: 56, column: 17, scope: !1313)
!1367 = !DILocation(line: 56, column: 3, scope: !1313)
!1368 = !DILocation(line: 56, column: 10, scope: !1313)
!1369 = !DILocation(line: 56, column: 15, scope: !1313)
!1370 = !DILocation(line: 57, column: 28, scope: !1313)
!1371 = !DILocation(line: 57, column: 35, scope: !1313)
!1372 = !DILocation(line: 57, column: 21, scope: !1313)
!1373 = !DILocation(line: 57, column: 3, scope: !1313)
!1374 = !DILocation(line: 57, column: 10, scope: !1313)
!1375 = !DILocation(line: 57, column: 19, scope: !1313)
!1376 = !DILocation(line: 58, column: 8, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1313, file: !147, line: 58, column: 7)
!1378 = !DILocation(line: 58, column: 15, scope: !1377)
!1379 = !DILocation(line: 58, column: 7, scope: !1313)
!1380 = !DILocation(line: 59, column: 5, scope: !1377)
!1381 = !DILocation(line: 60, column: 22, scope: !1313)
!1382 = !DILocation(line: 60, column: 29, scope: !1313)
!1383 = !DILocation(line: 60, column: 39, scope: !1313)
!1384 = !DILocation(line: 60, column: 46, scope: !1313)
!1385 = !DILocation(line: 60, column: 52, scope: !1313)
!1386 = !DILocation(line: 60, column: 3, scope: !1313)
!1387 = !DILocation(line: 62, column: 22, scope: !1313)
!1388 = !DILocation(line: 62, column: 37, scope: !1313)
!1389 = !DILocation(line: 62, column: 3, scope: !1313)
!1390 = !DILocation(line: 65, column: 25, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1313, file: !147, line: 65, column: 7)
!1392 = !DILocation(line: 65, column: 28, scope: !1391)
!1393 = !DILocation(line: 65, column: 8, scope: !1391)
!1394 = !DILocation(line: 65, column: 36, scope: !1391)
!1395 = !DILocation(line: 66, column: 8, scope: !1391)
!1396 = !DILocation(line: 66, column: 11, scope: !1391)
!1397 = !DILocation(line: 66, column: 18, scope: !1391)
!1398 = !DILocation(line: 66, column: 32, scope: !1391)
!1399 = !DILocation(line: 65, column: 7, scope: !1313)
!1400 = !DILocation(line: 67, column: 17, scope: !1391)
!1401 = !DILocation(line: 67, column: 27, scope: !1391)
!1402 = !DILocation(line: 67, column: 5, scope: !1391)
!1403 = !DILocation(line: 67, column: 8, scope: !1391)
!1404 = !DILocation(line: 67, column: 15, scope: !1391)
!1405 = !DILocation(line: 72, column: 16, scope: !1313)
!1406 = !DILocation(line: 72, column: 19, scope: !1313)
!1407 = !DILocation(line: 72, column: 26, scope: !1313)
!1408 = !DILocation(line: 72, column: 40, scope: !1313)
!1409 = !DILocation(line: 72, column: 15, scope: !1313)
!1410 = !DILocation(line: 72, column: 3, scope: !1313)
!1411 = !DILocation(line: 76, column: 16, scope: !1313)
!1412 = !DILocation(line: 76, column: 19, scope: !1313)
!1413 = !DILocation(line: 76, column: 30, scope: !1313)
!1414 = !DILocation(line: 76, column: 41, scope: !1313)
!1415 = !DILocation(line: 76, column: 15, scope: !1313)
!1416 = !DILocation(line: 76, column: 3, scope: !1313)
!1417 = !DILocation(line: 78, column: 19, scope: !1313)
!1418 = !DILocation(line: 78, column: 24, scope: !1313)
!1419 = !DILocation(line: 78, column: 27, scope: !1313)
!1420 = !DILocation(line: 78, column: 35, scope: !1313)
!1421 = !DILocation(line: 78, column: 22, scope: !1313)
!1422 = !DILocation(line: 78, column: 3, scope: !1313)
!1423 = !DILocation(line: 79, column: 19, scope: !1313)
!1424 = !DILocation(line: 79, column: 22, scope: !1313)
!1425 = !DILocation(line: 79, column: 25, scope: !1313)
!1426 = !DILocation(line: 79, column: 35, scope: !1313)
!1427 = !DILocation(line: 79, column: 45, scope: !1313)
!1428 = !DILocation(line: 79, column: 32, scope: !1313)
!1429 = !DILocation(line: 79, column: 3, scope: !1313)
!1430 = !DILocation(line: 80, column: 19, scope: !1313)
!1431 = !DILocation(line: 80, column: 22, scope: !1313)
!1432 = !DILocation(line: 80, column: 25, scope: !1313)
!1433 = !DILocation(line: 80, column: 36, scope: !1313)
!1434 = !DILocation(line: 80, column: 46, scope: !1313)
!1435 = !DILocation(line: 80, column: 33, scope: !1313)
!1436 = !DILocation(line: 80, column: 3, scope: !1313)
!1437 = !DILocation(line: 81, column: 19, scope: !1313)
!1438 = !DILocation(line: 81, column: 23, scope: !1313)
!1439 = !DILocation(line: 81, column: 26, scope: !1313)
!1440 = !DILocation(line: 81, column: 33, scope: !1313)
!1441 = !DILocation(line: 81, column: 40, scope: !1313)
!1442 = !DILocation(line: 81, column: 22, scope: !1313)
!1443 = !DILocation(line: 81, column: 3, scope: !1313)
!1444 = !DILocation(line: 82, column: 19, scope: !1313)
!1445 = !DILocation(line: 82, column: 23, scope: !1313)
!1446 = !DILocation(line: 82, column: 26, scope: !1313)
!1447 = !DILocation(line: 82, column: 33, scope: !1313)
!1448 = !DILocation(line: 82, column: 40, scope: !1313)
!1449 = !DILocation(line: 82, column: 22, scope: !1313)
!1450 = !DILocation(line: 82, column: 3, scope: !1313)
!1451 = !DILocation(line: 83, column: 19, scope: !1313)
!1452 = !DILocation(line: 83, column: 23, scope: !1313)
!1453 = !DILocation(line: 83, column: 26, scope: !1313)
!1454 = !DILocation(line: 83, column: 33, scope: !1313)
!1455 = !DILocation(line: 83, column: 40, scope: !1313)
!1456 = !DILocation(line: 83, column: 22, scope: !1313)
!1457 = !DILocation(line: 83, column: 3, scope: !1313)
!1458 = !DILocation(line: 84, column: 19, scope: !1313)
!1459 = !DILocation(line: 84, column: 23, scope: !1313)
!1460 = !DILocation(line: 84, column: 26, scope: !1313)
!1461 = !DILocation(line: 84, column: 33, scope: !1313)
!1462 = !DILocation(line: 84, column: 42, scope: !1313)
!1463 = !DILocation(line: 84, column: 22, scope: !1313)
!1464 = !DILocation(line: 84, column: 3, scope: !1313)
!1465 = !DILocation(line: 85, column: 19, scope: !1313)
!1466 = !DILocation(line: 85, column: 22, scope: !1313)
!1467 = !DILocation(line: 85, column: 25, scope: !1313)
!1468 = !DILocation(line: 85, column: 34, scope: !1313)
!1469 = !DILocation(line: 85, column: 3, scope: !1313)
!1470 = !DILocation(line: 86, column: 19, scope: !1313)
!1471 = !DILocation(line: 86, column: 22, scope: !1313)
!1472 = !DILocation(line: 86, column: 25, scope: !1313)
!1473 = !DILocation(line: 86, column: 35, scope: !1313)
!1474 = !DILocation(line: 86, column: 45, scope: !1313)
!1475 = !DILocation(line: 86, column: 32, scope: !1313)
!1476 = !DILocation(line: 86, column: 3, scope: !1313)
!1477 = !DILocation(line: 87, column: 19, scope: !1313)
!1478 = !DILocation(line: 87, column: 22, scope: !1313)
!1479 = !DILocation(line: 87, column: 25, scope: !1313)
!1480 = !DILocation(line: 87, column: 35, scope: !1313)
!1481 = !DILocation(line: 87, column: 45, scope: !1313)
!1482 = !DILocation(line: 87, column: 32, scope: !1313)
!1483 = !DILocation(line: 87, column: 3, scope: !1313)
!1484 = !DILocation(line: 88, column: 19, scope: !1313)
!1485 = !DILocation(line: 88, column: 22, scope: !1313)
!1486 = !DILocation(line: 88, column: 25, scope: !1313)
!1487 = !DILocation(line: 88, column: 36, scope: !1313)
!1488 = !DILocation(line: 88, column: 3, scope: !1313)
!1489 = !DILocation(line: 89, column: 19, scope: !1313)
!1490 = !DILocation(line: 89, column: 22, scope: !1313)
!1491 = !DILocation(line: 89, column: 25, scope: !1313)
!1492 = !DILocation(line: 89, column: 37, scope: !1313)
!1493 = !DILocation(line: 89, column: 47, scope: !1313)
!1494 = !DILocation(line: 89, column: 34, scope: !1313)
!1495 = !DILocation(line: 89, column: 3, scope: !1313)
!1496 = !DILocation(line: 90, column: 19, scope: !1313)
!1497 = !DILocation(line: 90, column: 22, scope: !1313)
!1498 = !DILocation(line: 90, column: 25, scope: !1313)
!1499 = !DILocation(line: 90, column: 37, scope: !1313)
!1500 = !DILocation(line: 90, column: 47, scope: !1313)
!1501 = !DILocation(line: 90, column: 34, scope: !1313)
!1502 = !DILocation(line: 90, column: 3, scope: !1313)
!1503 = !DILocation(line: 91, column: 19, scope: !1313)
!1504 = !DILocation(line: 91, column: 22, scope: !1313)
!1505 = !DILocation(line: 91, column: 25, scope: !1313)
!1506 = !DILocation(line: 91, column: 37, scope: !1313)
!1507 = !DILocation(line: 91, column: 47, scope: !1313)
!1508 = !DILocation(line: 91, column: 34, scope: !1313)
!1509 = !DILocation(line: 91, column: 3, scope: !1313)
!1510 = !DILocation(line: 93, column: 16, scope: !1313)
!1511 = !DILocation(line: 93, column: 23, scope: !1313)
!1512 = !DILocation(line: 93, column: 3, scope: !1313)
!1513 = !DILocation(line: 93, column: 6, scope: !1313)
!1514 = !DILocation(line: 93, column: 14, scope: !1313)
!1515 = !DILocation(line: 94, column: 3, scope: !1313)
!1516 = !DILocation(line: 94, column: 6, scope: !1313)
!1517 = !DILocation(line: 94, column: 16, scope: !1313)
!1518 = !DILocation(line: 95, column: 17, scope: !1313)
!1519 = !DILocation(line: 95, column: 3, scope: !1313)
!1520 = !DILocation(line: 95, column: 10, scope: !1313)
!1521 = !DILocation(line: 95, column: 15, scope: !1313)
!1522 = !DILocation(line: 96, column: 1, scope: !1313)
!1523 = distinct !DISubprogram(name: "klee_range", scope: !192, file: !192, line: 12, type: !1524, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !521, retainedNodes: !385)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!241, !241, !241, !437}
!1526 = !DILocalVariable(name: "start", arg: 1, scope: !1523, file: !192, line: 12, type: !241)
!1527 = !DILocation(line: 12, column: 20, scope: !1523)
!1528 = !DILocalVariable(name: "end", arg: 2, scope: !1523, file: !192, line: 12, type: !241)
!1529 = !DILocation(line: 12, column: 31, scope: !1523)
!1530 = !DILocalVariable(name: "name", arg: 3, scope: !1523, file: !192, line: 12, type: !437)
!1531 = !DILocation(line: 12, column: 48, scope: !1523)
!1532 = !DILocalVariable(name: "x", scope: !1523, file: !192, line: 13, type: !241)
!1533 = !DILocation(line: 13, column: 7, scope: !1523)
!1534 = !DILocation(line: 15, column: 7, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1523, file: !192, line: 15, column: 7)
!1536 = !DILocation(line: 15, column: 16, scope: !1535)
!1537 = !DILocation(line: 15, column: 13, scope: !1535)
!1538 = !DILocation(line: 15, column: 7, scope: !1523)
!1539 = !DILocation(line: 16, column: 5, scope: !1535)
!1540 = !DILocation(line: 18, column: 7, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1523, file: !192, line: 18, column: 7)
!1542 = !DILocation(line: 18, column: 12, scope: !1541)
!1543 = !DILocation(line: 18, column: 16, scope: !1541)
!1544 = !DILocation(line: 18, column: 14, scope: !1541)
!1545 = !DILocation(line: 18, column: 7, scope: !1523)
!1546 = !DILocation(line: 19, column: 12, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1541, file: !192, line: 18, column: 21)
!1548 = !DILocation(line: 19, column: 5, scope: !1547)
!1549 = !DILocation(line: 21, column: 38, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1541, file: !192, line: 20, column: 10)
!1551 = !DILocation(line: 21, column: 5, scope: !1550)
!1552 = !DILocation(line: 24, column: 9, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1550, file: !192, line: 24, column: 9)
!1554 = !DILocation(line: 24, column: 14, scope: !1553)
!1555 = !DILocation(line: 24, column: 9, scope: !1550)
!1556 = !DILocation(line: 25, column: 30, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1553, file: !192, line: 24, column: 19)
!1558 = !DILocation(line: 25, column: 45, scope: !1557)
!1559 = !DILocation(line: 25, column: 32, scope: !1557)
!1560 = !DILocation(line: 25, column: 19, scope: !1557)
!1561 = !DILocation(line: 25, column: 7, scope: !1557)
!1562 = !DILocation(line: 26, column: 5, scope: !1557)
!1563 = !DILocation(line: 27, column: 19, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1553, file: !192, line: 26, column: 12)
!1565 = !DILocation(line: 27, column: 28, scope: !1564)
!1566 = !DILocation(line: 27, column: 25, scope: !1564)
!1567 = !DILocation(line: 27, column: 7, scope: !1564)
!1568 = !DILocation(line: 28, column: 19, scope: !1564)
!1569 = !DILocation(line: 28, column: 23, scope: !1564)
!1570 = !DILocation(line: 28, column: 21, scope: !1564)
!1571 = !DILocation(line: 28, column: 7, scope: !1564)
!1572 = !DILocation(line: 31, column: 12, scope: !1550)
!1573 = !DILocation(line: 31, column: 5, scope: !1550)
!1574 = !DILocation(line: 33, column: 1, scope: !1523)
!1575 = distinct !DISubprogram(name: "access", scope: !298, file: !298, line: 90, type: !1576, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!1576 = !DISubroutineType(types: !1577)
!1577 = !{!241, !437, !241}
!1578 = !DILocalVariable(name: "pathname", arg: 1, scope: !1575, file: !298, line: 90, type: !437)
!1579 = !DILocation(line: 90, column: 24, scope: !1575)
!1580 = !DILocalVariable(name: "mode", arg: 2, scope: !1575, file: !298, line: 90, type: !241)
!1581 = !DILocation(line: 90, column: 38, scope: !1575)
!1582 = !DILocalVariable(name: "dfile", scope: !1575, file: !298, line: 91, type: !1583)
!1583 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1584, size: 64)
!1584 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_disk_file_t", file: !208, line: 57, baseType: !1585)
!1585 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !208, line: 53, size: 192, elements: !1586)
!1586 = !{!1587, !1588, !1589}
!1587 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !1585, file: !208, line: 54, baseType: !212, size: 32)
!1588 = !DIDerivedType(tag: DW_TAG_member, name: "contents", scope: !1585, file: !208, line: 55, baseType: !220, size: 64, offset: 64)
!1589 = !DIDerivedType(tag: DW_TAG_member, name: "stat", scope: !1585, file: !208, line: 56, baseType: !1590, size: 64, offset: 128)
!1590 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1591, size: 64)
!1591 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat64", file: !224, line: 103, size: 1152, elements: !1592)
!1592 = !{!1593, !1594, !1595, !1596, !1597, !1598, !1599, !1600, !1601, !1602, !1603, !1604, !1605, !1606, !1607}
!1593 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !1591, file: !224, line: 108, baseType: !227, size: 64)
!1594 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !1591, file: !224, line: 110, baseType: !231, size: 64, offset: 64)
!1595 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !1591, file: !224, line: 111, baseType: !233, size: 64, offset: 128)
!1596 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !1591, file: !224, line: 112, baseType: !235, size: 32, offset: 192)
!1597 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !1591, file: !224, line: 119, baseType: !237, size: 32, offset: 224)
!1598 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !1591, file: !224, line: 120, baseType: !239, size: 32, offset: 256)
!1599 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !1591, file: !224, line: 122, baseType: !241, size: 32, offset: 288)
!1600 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !1591, file: !224, line: 123, baseType: !227, size: 64, offset: 320)
!1601 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !1591, file: !224, line: 124, baseType: !244, size: 64, offset: 384)
!1602 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !1591, file: !224, line: 130, baseType: !247, size: 64, offset: 448)
!1603 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !1591, file: !224, line: 131, baseType: !249, size: 64, offset: 512)
!1604 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !1591, file: !224, line: 139, baseType: !368, size: 128, offset: 576)
!1605 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !1591, file: !224, line: 140, baseType: !368, size: 128, offset: 704)
!1606 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !1591, file: !224, line: 141, baseType: !368, size: 128, offset: 832)
!1607 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !1591, file: !224, line: 151, baseType: !261, size: 192, offset: 960)
!1608 = !DILocation(line: 91, column: 20, scope: !1575)
!1609 = !DILocation(line: 91, column: 43, scope: !1575)
!1610 = !DILocation(line: 91, column: 28, scope: !1575)
!1611 = !DILocation(line: 93, column: 7, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1575, file: !298, line: 93, column: 7)
!1613 = !DILocation(line: 93, column: 7, scope: !1575)
!1614 = !DILocation(line: 96, column: 5, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1612, file: !298, line: 93, column: 14)
!1616 = !DILocation(line: 98, column: 51, scope: !1575)
!1617 = !DILocation(line: 98, column: 31, scope: !1575)
!1618 = !DILocation(line: 98, column: 62, scope: !1575)
!1619 = !DILocation(line: 98, column: 10, scope: !1575)
!1620 = !DILocation(line: 98, column: 3, scope: !1575)
!1621 = !DILocation(line: 99, column: 1, scope: !1575)
!1622 = distinct !DISubprogram(name: "__get_sym_file", scope: !298, file: !298, line: 37, type: !1623, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !314, retainedNodes: !385)
!1623 = !DISubroutineType(types: !1624)
!1624 = !{!1583, !437}
!1625 = !DILocalVariable(name: "pathname", arg: 1, scope: !1622, file: !298, line: 37, type: !437)
!1626 = !DILocation(line: 37, column: 52, scope: !1622)
!1627 = !DILocation(line: 38, column: 8, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1622, file: !298, line: 38, column: 7)
!1629 = !DILocation(line: 38, column: 7, scope: !1622)
!1630 = !DILocation(line: 39, column: 5, scope: !1628)
!1631 = !DILocation(line: 43, column: 7, scope: !1632)
!1632 = distinct !DILexicalBlock(scope: !1622, file: !298, line: 43, column: 7)
!1633 = !DILocation(line: 43, column: 19, scope: !1632)
!1634 = !DILocation(line: 43, column: 7, scope: !1622)
!1635 = !DILocalVariable(name: "cwd", scope: !1636, file: !298, line: 44, type: !1637)
!1636 = distinct !DILexicalBlock(scope: !1632, file: !298, line: 43, column: 27)
!1637 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 8192, elements: !595)
!1638 = !DILocation(line: 44, column: 10, scope: !1636)
!1639 = !DILocation(line: 45, column: 16, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1636, file: !298, line: 45, column: 9)
!1641 = !DILocation(line: 45, column: 9, scope: !1640)
!1642 = !DILocation(line: 45, column: 9, scope: !1636)
!1643 = !DILocalVariable(name: "cwd_len", scope: !1644, file: !298, line: 46, type: !383)
!1644 = distinct !DILexicalBlock(scope: !1640, file: !298, line: 45, column: 28)
!1645 = !DILocation(line: 46, column: 14, scope: !1644)
!1646 = !DILocation(line: 46, column: 31, scope: !1644)
!1647 = !DILocation(line: 46, column: 24, scope: !1644)
!1648 = !DILocation(line: 48, column: 11, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1644, file: !298, line: 48, column: 11)
!1650 = !DILocation(line: 48, column: 19, scope: !1649)
!1651 = !DILocation(line: 48, column: 23, scope: !1649)
!1652 = !DILocation(line: 48, column: 30, scope: !1649)
!1653 = !DILocation(line: 48, column: 38, scope: !1649)
!1654 = !DILocation(line: 48, column: 26, scope: !1649)
!1655 = !DILocation(line: 48, column: 43, scope: !1649)
!1656 = !DILocation(line: 48, column: 11, scope: !1644)
!1657 = !DILocation(line: 49, column: 13, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1649, file: !298, line: 48, column: 51)
!1659 = !DILocation(line: 49, column: 9, scope: !1658)
!1660 = !DILocation(line: 49, column: 24, scope: !1658)
!1661 = !DILocation(line: 50, column: 7, scope: !1658)
!1662 = !DILocation(line: 51, column: 19, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1644, file: !298, line: 51, column: 11)
!1664 = !DILocation(line: 51, column: 29, scope: !1663)
!1665 = !DILocation(line: 51, column: 34, scope: !1663)
!1666 = !DILocation(line: 51, column: 11, scope: !1663)
!1667 = !DILocation(line: 51, column: 43, scope: !1663)
!1668 = !DILocation(line: 51, column: 11, scope: !1644)
!1669 = !DILocation(line: 52, column: 13, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1671, file: !298, line: 52, column: 13)
!1671 = distinct !DILexicalBlock(scope: !1663, file: !298, line: 51, column: 49)
!1672 = !DILocation(line: 52, column: 22, scope: !1670)
!1673 = !DILocation(line: 52, column: 31, scope: !1670)
!1674 = !DILocation(line: 52, column: 13, scope: !1671)
!1675 = !DILocation(line: 53, column: 23, scope: !1670)
!1676 = !DILocation(line: 53, column: 31, scope: !1670)
!1677 = !DILocation(line: 53, column: 20, scope: !1670)
!1678 = !DILocation(line: 53, column: 11, scope: !1670)
!1679 = !DILocalVariable(name: "c", scope: !1622, file: !298, line: 57, type: !5)
!1680 = !DILocation(line: 57, column: 8, scope: !1622)
!1681 = !DILocation(line: 57, column: 12, scope: !1622)
!1682 = !DILocalVariable(name: "i", scope: !1622, file: !298, line: 58, type: !212)
!1683 = !DILocation(line: 58, column: 12, scope: !1622)
!1684 = !DILocation(line: 60, column: 7, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1622, file: !298, line: 60, column: 7)
!1686 = !DILocation(line: 60, column: 9, scope: !1685)
!1687 = !DILocation(line: 60, column: 14, scope: !1685)
!1688 = !DILocation(line: 60, column: 17, scope: !1685)
!1689 = !DILocation(line: 60, column: 29, scope: !1685)
!1690 = !DILocation(line: 60, column: 7, scope: !1622)
!1691 = !DILocation(line: 61, column: 5, scope: !1685)
!1692 = !DILocation(line: 63, column: 9, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1622, file: !298, line: 63, column: 3)
!1694 = !DILocation(line: 63, column: 8, scope: !1693)
!1695 = !DILocation(line: 63, column: 13, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1693, file: !298, line: 63, column: 3)
!1697 = !DILocation(line: 63, column: 24, scope: !1696)
!1698 = !DILocation(line: 63, column: 14, scope: !1696)
!1699 = !DILocation(line: 63, column: 3, scope: !1693)
!1700 = !DILocation(line: 64, column: 9, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1702, file: !298, line: 64, column: 9)
!1702 = distinct !DILexicalBlock(scope: !1696, file: !298, line: 63, column: 42)
!1703 = !DILocation(line: 64, column: 27, scope: !1701)
!1704 = !DILocation(line: 64, column: 20, scope: !1701)
!1705 = !DILocation(line: 64, column: 18, scope: !1701)
!1706 = !DILocation(line: 64, column: 11, scope: !1701)
!1707 = !DILocation(line: 64, column: 9, scope: !1702)
!1708 = !DILocalVariable(name: "df", scope: !1709, file: !298, line: 65, type: !1583)
!1709 = distinct !DILexicalBlock(scope: !1701, file: !298, line: 64, column: 30)
!1710 = !DILocation(line: 65, column: 24, scope: !1709)
!1711 = !DILocation(line: 65, column: 39, scope: !1709)
!1712 = !DILocation(line: 65, column: 49, scope: !1709)
!1713 = !DILocation(line: 65, column: 30, scope: !1709)
!1714 = !DILocation(line: 66, column: 11, scope: !1715)
!1715 = distinct !DILexicalBlock(scope: !1709, file: !298, line: 66, column: 11)
!1716 = !DILocation(line: 66, column: 15, scope: !1715)
!1717 = !DILocation(line: 66, column: 21, scope: !1715)
!1718 = !DILocation(line: 66, column: 28, scope: !1715)
!1719 = !DILocation(line: 66, column: 11, scope: !1709)
!1720 = !DILocation(line: 67, column: 9, scope: !1715)
!1721 = !DILocation(line: 68, column: 14, scope: !1709)
!1722 = !DILocation(line: 68, column: 7, scope: !1709)
!1723 = !DILocation(line: 63, column: 37, scope: !1696)
!1724 = !DILocation(line: 63, column: 3, scope: !1696)
!1725 = distinct !{!1725, !1699, !1726}
!1726 = !DILocation(line: 70, column: 3, scope: !1693)
!1727 = !DILocation(line: 72, column: 3, scope: !1622)
!1728 = !DILocation(line: 73, column: 1, scope: !1622)
!1729 = distinct !DISubprogram(name: "__concretize_string", scope: !298, file: !298, line: 1382, type: !1730, scopeLine: 1382, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !314, retainedNodes: !385)
!1730 = !DISubroutineType(types: !1731)
!1731 = !{!437, !437}
!1732 = !DILocalVariable(name: "s", arg: 1, scope: !1729, file: !298, line: 1382, type: !437)
!1733 = !DILocation(line: 1382, column: 52, scope: !1729)
!1734 = !DILocalVariable(name: "sc", scope: !1729, file: !298, line: 1383, type: !220)
!1735 = !DILocation(line: 1383, column: 9, scope: !1729)
!1736 = !DILocation(line: 1383, column: 31, scope: !1729)
!1737 = !DILocation(line: 1383, column: 14, scope: !1729)
!1738 = !DILocalVariable(name: "i", scope: !1729, file: !298, line: 1384, type: !212)
!1739 = !DILocation(line: 1384, column: 12, scope: !1729)
!1740 = !DILocation(line: 1386, column: 10, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1729, file: !298, line: 1386, column: 3)
!1742 = !DILocation(line: 1386, column: 8, scope: !1741)
!1743 = !DILocalVariable(name: "c", scope: !1744, file: !298, line: 1387, type: !5)
!1744 = distinct !DILexicalBlock(scope: !1745, file: !298, line: 1386, column: 27)
!1745 = distinct !DILexicalBlock(scope: !1741, file: !298, line: 1386, column: 3)
!1746 = !DILocation(line: 1387, column: 10, scope: !1744)
!1747 = !DILocation(line: 1387, column: 15, scope: !1744)
!1748 = !DILocation(line: 1387, column: 14, scope: !1744)
!1749 = !DILocation(line: 1389, column: 27, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1744, file: !298, line: 1389, column: 9)
!1751 = !DILocation(line: 1389, column: 10, scope: !1750)
!1752 = !DILocation(line: 1389, column: 9, scope: !1744)
!1753 = !DILocation(line: 1390, column: 12, scope: !1754)
!1754 = distinct !DILexicalBlock(scope: !1755, file: !298, line: 1390, column: 11)
!1755 = distinct !DILexicalBlock(scope: !1750, file: !298, line: 1389, column: 31)
!1756 = !DILocation(line: 1390, column: 11, scope: !1755)
!1757 = !DILocation(line: 1394, column: 11, scope: !1758)
!1758 = distinct !DILexicalBlock(scope: !1744, file: !298, line: 1394, column: 9)
!1759 = !DILocation(line: 1394, column: 14, scope: !1758)
!1760 = !DILocation(line: 1394, column: 15, scope: !1758)
!1761 = !DILocation(line: 1394, column: 12, scope: !1758)
!1762 = !DILocation(line: 1394, column: 9, scope: !1744)
!1763 = !DILocation(line: 1395, column: 12, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1765, file: !298, line: 1395, column: 11)
!1765 = distinct !DILexicalBlock(scope: !1758, file: !298, line: 1394, column: 21)
!1766 = !DILocation(line: 1395, column: 11, scope: !1765)
!1767 = !DILocation(line: 1396, column: 10, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1764, file: !298, line: 1395, column: 15)
!1769 = !DILocation(line: 1396, column: 13, scope: !1768)
!1770 = !DILocation(line: 1397, column: 9, scope: !1768)
!1771 = !DILocation(line: 1398, column: 18, scope: !1772)
!1772 = distinct !DILexicalBlock(scope: !1764, file: !298, line: 1398, column: 18)
!1773 = !DILocation(line: 1398, column: 19, scope: !1772)
!1774 = !DILocation(line: 1398, column: 18, scope: !1764)
!1775 = !DILocation(line: 1399, column: 10, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1772, file: !298, line: 1398, column: 26)
!1777 = !DILocation(line: 1399, column: 13, scope: !1776)
!1778 = !DILocation(line: 1400, column: 7, scope: !1776)
!1779 = !DILocalVariable(name: "cc", scope: !1780, file: !298, line: 1402, type: !5)
!1780 = distinct !DILexicalBlock(scope: !1758, file: !298, line: 1401, column: 12)
!1781 = !DILocation(line: 1402, column: 12, scope: !1780)
!1782 = !DILocation(line: 1402, column: 46, scope: !1780)
!1783 = !DILocation(line: 1402, column: 40, scope: !1780)
!1784 = !DILocation(line: 1402, column: 24, scope: !1780)
!1785 = !DILocation(line: 1402, column: 17, scope: !1780)
!1786 = !DILocation(line: 1403, column: 19, scope: !1780)
!1787 = !DILocation(line: 1403, column: 25, scope: !1780)
!1788 = !DILocation(line: 1403, column: 22, scope: !1780)
!1789 = !DILocation(line: 1403, column: 7, scope: !1780)
!1790 = !DILocation(line: 1404, column: 13, scope: !1780)
!1791 = !DILocation(line: 1404, column: 8, scope: !1780)
!1792 = !DILocation(line: 1404, column: 11, scope: !1780)
!1793 = !DILocation(line: 1405, column: 12, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1780, file: !298, line: 1405, column: 11)
!1795 = !DILocation(line: 1405, column: 11, scope: !1780)
!1796 = !DILocation(line: 1386, column: 16, scope: !1745)
!1797 = !DILocation(line: 1386, column: 21, scope: !1745)
!1798 = !DILocation(line: 1386, column: 3, scope: !1745)
!1799 = distinct !{!1799, !1800, !1801}
!1800 = !DILocation(line: 1386, column: 3, scope: !1741)
!1801 = !DILocation(line: 1407, column: 3, scope: !1741)
!1802 = !DILocation(line: 1409, column: 10, scope: !1729)
!1803 = !DILocation(line: 1409, column: 3, scope: !1729)
!1804 = distinct !DISubprogram(name: "__concretize_ptr", scope: !298, file: !298, line: 1369, type: !1805, scopeLine: 1369, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !314, retainedNodes: !385)
!1805 = !DISubroutineType(types: !1806)
!1806 = !{!336, !403}
!1807 = !DILocalVariable(name: "p", arg: 1, scope: !1804, file: !298, line: 1369, type: !403)
!1808 = !DILocation(line: 1369, column: 43, scope: !1804)
!1809 = !DILocalVariable(name: "pc", scope: !1804, file: !298, line: 1371, type: !220)
!1810 = !DILocation(line: 1371, column: 9, scope: !1804)
!1811 = !DILocation(line: 1371, column: 45, scope: !1804)
!1812 = !DILocation(line: 1371, column: 38, scope: !1804)
!1813 = !DILocation(line: 1371, column: 22, scope: !1804)
!1814 = !DILocation(line: 1371, column: 14, scope: !1804)
!1815 = !DILocation(line: 1372, column: 15, scope: !1804)
!1816 = !DILocation(line: 1372, column: 21, scope: !1804)
!1817 = !DILocation(line: 1372, column: 18, scope: !1804)
!1818 = !DILocation(line: 1372, column: 3, scope: !1804)
!1819 = !DILocation(line: 1373, column: 10, scope: !1804)
!1820 = !DILocation(line: 1373, column: 3, scope: !1804)
!1821 = !DILocalVariable(name: "buf", arg: 1, scope: !493, file: !298, line: 1331, type: !220)
!1822 = !DILocation(line: 1331, column: 20, scope: !493)
!1823 = !DILocalVariable(name: "size", arg: 2, scope: !493, file: !298, line: 1331, type: !383)
!1824 = !DILocation(line: 1331, column: 32, scope: !493)
!1825 = !DILocalVariable(name: "r", scope: !493, file: !298, line: 1333, type: !241)
!1826 = !DILocation(line: 1333, column: 7, scope: !493)
!1827 = !DILocation(line: 1335, column: 10, scope: !493)
!1828 = !DILocation(line: 1337, column: 16, scope: !1829)
!1829 = distinct !DILexicalBlock(scope: !493, file: !298, line: 1337, column: 7)
!1830 = !DILocation(line: 1337, column: 7, scope: !1829)
!1831 = !DILocation(line: 1337, column: 29, scope: !1829)
!1832 = !DILocation(line: 1337, column: 42, scope: !1829)
!1833 = !DILocation(line: 1337, column: 32, scope: !1829)
!1834 = !DILocation(line: 1337, column: 57, scope: !1829)
!1835 = !DILocation(line: 1337, column: 54, scope: !1829)
!1836 = !DILocation(line: 1337, column: 7, scope: !493)
!1837 = !DILocation(line: 1338, column: 26, scope: !1838)
!1838 = distinct !DILexicalBlock(scope: !1829, file: !298, line: 1337, column: 66)
!1839 = !DILocation(line: 1339, column: 5, scope: !1838)
!1840 = !DILocation(line: 1339, column: 11, scope: !1838)
!1841 = !DILocation(line: 1340, column: 5, scope: !1838)
!1842 = !DILocation(line: 1343, column: 8, scope: !1843)
!1843 = distinct !DILexicalBlock(scope: !493, file: !298, line: 1343, column: 7)
!1844 = !DILocation(line: 1343, column: 7, scope: !493)
!1845 = !DILocation(line: 1344, column: 10, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1843, file: !298, line: 1343, column: 13)
!1847 = !DILocation(line: 1345, column: 18, scope: !1846)
!1848 = !DILocation(line: 1345, column: 11, scope: !1846)
!1849 = !DILocation(line: 1345, column: 9, scope: !1846)
!1850 = !DILocation(line: 1346, column: 10, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1846, file: !298, line: 1346, column: 9)
!1852 = !DILocation(line: 1346, column: 9, scope: !1846)
!1853 = !DILocation(line: 1347, column: 7, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1851, file: !298, line: 1346, column: 15)
!1855 = !DILocation(line: 1347, column: 13, scope: !1854)
!1856 = !DILocation(line: 1348, column: 7, scope: !1854)
!1857 = !DILocation(line: 1350, column: 15, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1843, file: !298, line: 1350, column: 14)
!1859 = !DILocation(line: 1350, column: 14, scope: !1843)
!1860 = !DILocation(line: 1351, column: 5, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1858, file: !298, line: 1350, column: 21)
!1862 = !DILocation(line: 1351, column: 11, scope: !1861)
!1863 = !DILocation(line: 1352, column: 5, scope: !1861)
!1864 = !DILocation(line: 1355, column: 26, scope: !493)
!1865 = !DILocation(line: 1355, column: 9, scope: !493)
!1866 = !DILocation(line: 1355, column: 7, scope: !493)
!1867 = !DILocation(line: 1356, column: 28, scope: !493)
!1868 = !DILocation(line: 1356, column: 10, scope: !493)
!1869 = !DILocation(line: 1356, column: 8, scope: !493)
!1870 = !DILocation(line: 1360, column: 28, scope: !493)
!1871 = !DILocation(line: 1360, column: 33, scope: !493)
!1872 = !DILocation(line: 1360, column: 3, scope: !493)
!1873 = !DILocation(line: 1361, column: 28, scope: !493)
!1874 = !DILocation(line: 1361, column: 33, scope: !493)
!1875 = !DILocation(line: 1361, column: 7, scope: !493)
!1876 = !DILocation(line: 1361, column: 5, scope: !493)
!1877 = !DILocation(line: 1362, column: 7, scope: !1878)
!1878 = distinct !DILexicalBlock(scope: !493, file: !298, line: 1362, column: 7)
!1879 = !DILocation(line: 1362, column: 9, scope: !1878)
!1880 = !DILocation(line: 1362, column: 7, scope: !493)
!1881 = !DILocation(line: 1363, column: 5, scope: !1878)
!1882 = !DILocation(line: 1364, column: 10, scope: !493)
!1883 = !DILocation(line: 1364, column: 3, scope: !493)
!1884 = !DILocation(line: 1365, column: 1, scope: !493)
!1885 = distinct !DISubprogram(name: "__concretize_size", scope: !298, file: !298, line: 1376, type: !1886, scopeLine: 1376, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !314, retainedNodes: !385)
!1886 = !DISubroutineType(types: !1887)
!1887 = !{!383, !383}
!1888 = !DILocalVariable(name: "s", arg: 1, scope: !1885, file: !298, line: 1376, type: !383)
!1889 = !DILocation(line: 1376, column: 40, scope: !1885)
!1890 = !DILocalVariable(name: "sc", scope: !1885, file: !298, line: 1377, type: !383)
!1891 = !DILocation(line: 1377, column: 10, scope: !1885)
!1892 = !DILocation(line: 1377, column: 37, scope: !1885)
!1893 = !DILocation(line: 1377, column: 15, scope: !1885)
!1894 = !DILocation(line: 1378, column: 15, scope: !1885)
!1895 = !DILocation(line: 1378, column: 21, scope: !1885)
!1896 = !DILocation(line: 1378, column: 18, scope: !1885)
!1897 = !DILocation(line: 1378, column: 3, scope: !1885)
!1898 = !DILocation(line: 1379, column: 10, scope: !1885)
!1899 = !DILocation(line: 1379, column: 3, scope: !1885)
!1900 = distinct !DISubprogram(name: "umask", scope: !298, file: !298, line: 101, type: !1901, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!1901 = !DISubroutineType(types: !1902)
!1902 = !{!235, !294}
!1903 = !DILocalVariable(name: "mask", arg: 1, scope: !1900, file: !298, line: 101, type: !294)
!1904 = !DILocation(line: 101, column: 21, scope: !1900)
!1905 = !DILocalVariable(name: "r", scope: !1900, file: !298, line: 102, type: !294)
!1906 = !DILocation(line: 102, column: 10, scope: !1900)
!1907 = !DILocation(line: 102, column: 24, scope: !1900)
!1908 = !DILocation(line: 103, column: 21, scope: !1900)
!1909 = !DILocation(line: 103, column: 26, scope: !1900)
!1910 = !DILocation(line: 103, column: 19, scope: !1900)
!1911 = !DILocation(line: 104, column: 10, scope: !1900)
!1912 = !DILocation(line: 104, column: 3, scope: !1900)
!1913 = distinct !DISubprogram(name: "__fd_open", scope: !298, file: !298, line: 127, type: !1914, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!1914 = !DISubroutineType(types: !1915)
!1915 = !{!241, !437, !241, !294}
!1916 = !DILocalVariable(name: "pathname", arg: 1, scope: !1913, file: !298, line: 127, type: !437)
!1917 = !DILocation(line: 127, column: 27, scope: !1913)
!1918 = !DILocalVariable(name: "flags", arg: 2, scope: !1913, file: !298, line: 127, type: !241)
!1919 = !DILocation(line: 127, column: 41, scope: !1913)
!1920 = !DILocalVariable(name: "mode", arg: 3, scope: !1913, file: !298, line: 127, type: !294)
!1921 = !DILocation(line: 127, column: 55, scope: !1913)
!1922 = !DILocalVariable(name: "df", scope: !1913, file: !298, line: 128, type: !1583)
!1923 = !DILocation(line: 128, column: 20, scope: !1913)
!1924 = !DILocalVariable(name: "f", scope: !1913, file: !298, line: 129, type: !1925)
!1925 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1926, size: 64)
!1926 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_file_t", file: !208, line: 73, baseType: !1927)
!1927 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !208, line: 66, size: 192, elements: !1928)
!1928 = !{!1929, !1930, !1931, !1932}
!1929 = !DIDerivedType(tag: DW_TAG_member, name: "fd", scope: !1927, file: !208, line: 67, baseType: !241, size: 32)
!1930 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1927, file: !208, line: 68, baseType: !212, size: 32, offset: 32)
!1931 = !DIDerivedType(tag: DW_TAG_member, name: "off", scope: !1927, file: !208, line: 71, baseType: !287, size: 64, offset: 64)
!1932 = !DIDerivedType(tag: DW_TAG_member, name: "dfile", scope: !1927, file: !208, line: 72, baseType: !1583, size: 64, offset: 128)
!1933 = !DILocation(line: 129, column: 15, scope: !1913)
!1934 = !DILocalVariable(name: "fd", scope: !1913, file: !298, line: 130, type: !241)
!1935 = !DILocation(line: 130, column: 7, scope: !1913)
!1936 = !DILocation(line: 132, column: 11, scope: !1937)
!1937 = distinct !DILexicalBlock(scope: !1913, file: !298, line: 132, column: 3)
!1938 = !DILocation(line: 132, column: 8, scope: !1937)
!1939 = !DILocation(line: 132, column: 16, scope: !1940)
!1940 = distinct !DILexicalBlock(scope: !1937, file: !298, line: 132, column: 3)
!1941 = !DILocation(line: 132, column: 19, scope: !1940)
!1942 = !DILocation(line: 132, column: 3, scope: !1937)
!1943 = !DILocation(line: 133, column: 25, scope: !1944)
!1944 = distinct !DILexicalBlock(scope: !1940, file: !298, line: 133, column: 9)
!1945 = !DILocation(line: 133, column: 11, scope: !1944)
!1946 = !DILocation(line: 133, column: 29, scope: !1944)
!1947 = !DILocation(line: 133, column: 35, scope: !1944)
!1948 = !DILocation(line: 133, column: 9, scope: !1940)
!1949 = !DILocation(line: 132, column: 30, scope: !1940)
!1950 = !DILocation(line: 132, column: 3, scope: !1940)
!1951 = distinct !{!1951, !1942, !1952}
!1952 = !DILocation(line: 134, column: 7, scope: !1937)
!1953 = !DILocation(line: 135, column: 7, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1913, file: !298, line: 135, column: 7)
!1955 = !DILocation(line: 135, column: 10, scope: !1954)
!1956 = !DILocation(line: 135, column: 7, scope: !1913)
!1957 = !DILocation(line: 136, column: 5, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1954, file: !298, line: 135, column: 22)
!1959 = !DILocation(line: 136, column: 11, scope: !1958)
!1960 = !DILocation(line: 137, column: 5, scope: !1958)
!1961 = !DILocation(line: 140, column: 22, scope: !1913)
!1962 = !DILocation(line: 140, column: 8, scope: !1913)
!1963 = !DILocation(line: 140, column: 5, scope: !1913)
!1964 = !DILocation(line: 143, column: 10, scope: !1913)
!1965 = !DILocation(line: 143, column: 3, scope: !1913)
!1966 = !DILocation(line: 145, column: 23, scope: !1913)
!1967 = !DILocation(line: 145, column: 8, scope: !1913)
!1968 = !DILocation(line: 145, column: 6, scope: !1913)
!1969 = !DILocation(line: 146, column: 7, scope: !1970)
!1970 = distinct !DILexicalBlock(scope: !1913, file: !298, line: 146, column: 7)
!1971 = !DILocation(line: 146, column: 7, scope: !1913)
!1972 = !DILocation(line: 149, column: 16, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1970, file: !298, line: 146, column: 11)
!1974 = !DILocation(line: 149, column: 5, scope: !1973)
!1975 = !DILocation(line: 149, column: 8, scope: !1973)
!1976 = !DILocation(line: 149, column: 14, scope: !1973)
!1977 = !DILocation(line: 151, column: 10, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !1973, file: !298, line: 151, column: 9)
!1979 = !DILocation(line: 151, column: 16, scope: !1978)
!1980 = !DILocation(line: 151, column: 27, scope: !1978)
!1981 = !DILocation(line: 151, column: 31, scope: !1978)
!1982 = !DILocation(line: 151, column: 37, scope: !1978)
!1983 = !DILocation(line: 151, column: 9, scope: !1973)
!1984 = !DILocation(line: 152, column: 7, scope: !1985)
!1985 = distinct !DILexicalBlock(scope: !1978, file: !298, line: 151, column: 48)
!1986 = !DILocation(line: 152, column: 13, scope: !1985)
!1987 = !DILocation(line: 153, column: 7, scope: !1985)
!1988 = !DILocation(line: 156, column: 10, scope: !1989)
!1989 = distinct !DILexicalBlock(scope: !1973, file: !298, line: 156, column: 9)
!1990 = !DILocation(line: 156, column: 16, scope: !1989)
!1991 = !DILocation(line: 156, column: 27, scope: !1989)
!1992 = !DILocation(line: 156, column: 31, scope: !1989)
!1993 = !DILocation(line: 156, column: 37, scope: !1989)
!1994 = !DILocation(line: 156, column: 9, scope: !1973)
!1995 = !DILocation(line: 159, column: 7, scope: !1996)
!1996 = distinct !DILexicalBlock(scope: !1989, file: !298, line: 156, column: 50)
!1997 = !DILocation(line: 160, column: 7, scope: !1996)
!1998 = !DILocation(line: 160, column: 13, scope: !1996)
!1999 = !DILocation(line: 161, column: 7, scope: !1996)
!2000 = !DILocation(line: 164, column: 10, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1973, file: !298, line: 164, column: 9)
!2002 = !DILocation(line: 164, column: 16, scope: !2001)
!2003 = !DILocation(line: 164, column: 26, scope: !2001)
!2004 = !DILocation(line: 164, column: 31, scope: !2001)
!2005 = !DILocation(line: 164, column: 37, scope: !2001)
!2006 = !DILocation(line: 164, column: 9, scope: !1973)
!2007 = !DILocation(line: 167, column: 7, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !2001, file: !298, line: 164, column: 49)
!2009 = !DILocation(line: 168, column: 7, scope: !2008)
!2010 = !DILocation(line: 168, column: 13, scope: !2008)
!2011 = !DILocation(line: 169, column: 7, scope: !2008)
!2012 = !DILocation(line: 172, column: 25, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !1973, file: !298, line: 172, column: 9)
!2014 = !DILocation(line: 172, column: 32, scope: !2013)
!2015 = !DILocation(line: 172, column: 36, scope: !2013)
!2016 = !DILocation(line: 172, column: 10, scope: !2013)
!2017 = !DILocation(line: 172, column: 9, scope: !1973)
!2018 = !DILocation(line: 173, column: 2, scope: !2019)
!2019 = distinct !DILexicalBlock(scope: !2013, file: !298, line: 172, column: 43)
!2020 = !DILocation(line: 173, column: 8, scope: !2019)
!2021 = !DILocation(line: 174, column: 2, scope: !2019)
!2022 = !DILocation(line: 177, column: 35, scope: !2013)
!2023 = !DILocation(line: 177, column: 38, scope: !2013)
!2024 = !DILocation(line: 177, column: 45, scope: !2013)
!2025 = !DILocation(line: 177, column: 51, scope: !2013)
!2026 = !DILocation(line: 177, column: 59, scope: !2013)
!2027 = !DILocation(line: 178, column: 7, scope: !2013)
!2028 = !DILocation(line: 178, column: 25, scope: !2013)
!2029 = !DILocation(line: 178, column: 14, scope: !2013)
!2030 = !DILocation(line: 178, column: 12, scope: !2013)
!2031 = !DILocation(line: 177, column: 68, scope: !2013)
!2032 = !DILocation(line: 177, column: 7, scope: !2013)
!2033 = !DILocation(line: 177, column: 10, scope: !2013)
!2034 = !DILocation(line: 177, column: 17, scope: !2013)
!2035 = !DILocation(line: 177, column: 23, scope: !2013)
!2036 = !DILocation(line: 177, column: 31, scope: !2013)
!2037 = !DILocation(line: 179, column: 3, scope: !1973)
!2038 = !DILocalVariable(name: "os_fd", scope: !2039, file: !298, line: 180, type: !241)
!2039 = distinct !DILexicalBlock(scope: !1970, file: !298, line: 179, column: 10)
!2040 = !DILocation(line: 180, column: 9, scope: !2039)
!2041 = !DILocation(line: 180, column: 56, scope: !2039)
!2042 = !DILocation(line: 180, column: 36, scope: !2039)
!2043 = !DILocation(line: 180, column: 67, scope: !2039)
!2044 = !DILocation(line: 180, column: 74, scope: !2039)
!2045 = !DILocation(line: 180, column: 17, scope: !2039)
!2046 = !DILocation(line: 181, column: 9, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2039, file: !298, line: 181, column: 9)
!2048 = !DILocation(line: 181, column: 15, scope: !2047)
!2049 = !DILocation(line: 181, column: 9, scope: !2039)
!2050 = !DILocation(line: 182, column: 7, scope: !2047)
!2051 = !DILocation(line: 183, column: 13, scope: !2039)
!2052 = !DILocation(line: 183, column: 5, scope: !2039)
!2053 = !DILocation(line: 183, column: 8, scope: !2039)
!2054 = !DILocation(line: 183, column: 11, scope: !2039)
!2055 = !DILocation(line: 186, column: 3, scope: !1913)
!2056 = !DILocation(line: 186, column: 6, scope: !1913)
!2057 = !DILocation(line: 186, column: 12, scope: !1913)
!2058 = !DILocation(line: 187, column: 8, scope: !2059)
!2059 = distinct !DILexicalBlock(scope: !1913, file: !298, line: 187, column: 7)
!2060 = !DILocation(line: 187, column: 14, scope: !2059)
!2061 = !DILocation(line: 187, column: 27, scope: !2059)
!2062 = !DILocation(line: 187, column: 7, scope: !1913)
!2063 = !DILocation(line: 188, column: 5, scope: !2064)
!2064 = distinct !DILexicalBlock(scope: !2059, file: !298, line: 187, column: 40)
!2065 = !DILocation(line: 188, column: 8, scope: !2064)
!2066 = !DILocation(line: 188, column: 14, scope: !2064)
!2067 = !DILocation(line: 189, column: 3, scope: !2064)
!2068 = !DILocation(line: 189, column: 15, scope: !2069)
!2069 = distinct !DILexicalBlock(scope: !2059, file: !298, line: 189, column: 14)
!2070 = !DILocation(line: 189, column: 21, scope: !2069)
!2071 = !DILocation(line: 189, column: 34, scope: !2069)
!2072 = !DILocation(line: 189, column: 14, scope: !2059)
!2073 = !DILocation(line: 190, column: 5, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2069, file: !298, line: 189, column: 47)
!2075 = !DILocation(line: 190, column: 8, scope: !2074)
!2076 = !DILocation(line: 190, column: 14, scope: !2074)
!2077 = !DILocation(line: 191, column: 3, scope: !2074)
!2078 = !DILocation(line: 192, column: 5, scope: !2079)
!2079 = distinct !DILexicalBlock(scope: !2069, file: !298, line: 191, column: 10)
!2080 = !DILocation(line: 192, column: 8, scope: !2079)
!2081 = !DILocation(line: 192, column: 14, scope: !2079)
!2082 = !DILocation(line: 195, column: 10, scope: !1913)
!2083 = !DILocation(line: 195, column: 3, scope: !1913)
!2084 = !DILocation(line: 196, column: 1, scope: !1913)
!2085 = distinct !DISubprogram(name: "has_permission", scope: !298, file: !298, line: 112, type: !2086, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2086 = !DISubroutineType(types: !2087)
!2087 = !{!241, !241, !1590}
!2088 = !DILocalVariable(name: "flags", arg: 1, scope: !2085, file: !298, line: 112, type: !241)
!2089 = !DILocation(line: 112, column: 31, scope: !2085)
!2090 = !DILocalVariable(name: "s", arg: 2, scope: !2085, file: !298, line: 112, type: !1590)
!2091 = !DILocation(line: 112, column: 53, scope: !2085)
!2092 = !DILocalVariable(name: "mode", scope: !2085, file: !298, line: 113, type: !294)
!2093 = !DILocation(line: 113, column: 10, scope: !2085)
!2094 = !DILocation(line: 113, column: 17, scope: !2085)
!2095 = !DILocation(line: 113, column: 20, scope: !2085)
!2096 = !DILocalVariable(name: "read_request", scope: !2085, file: !298, line: 114, type: !241)
!2097 = !DILocation(line: 114, column: 7, scope: !2085)
!2098 = !DILocation(line: 114, column: 24, scope: !2085)
!2099 = !DILocation(line: 114, column: 30, scope: !2085)
!2100 = !DILocation(line: 114, column: 45, scope: !2085)
!2101 = !DILocation(line: 114, column: 51, scope: !2085)
!2102 = !DILocation(line: 114, column: 42, scope: !2085)
!2103 = !DILocation(line: 114, column: 22, scope: !2085)
!2104 = !DILocalVariable(name: "write_request", scope: !2085, file: !298, line: 115, type: !241)
!2105 = !DILocation(line: 115, column: 7, scope: !2085)
!2106 = !DILocation(line: 115, column: 25, scope: !2085)
!2107 = !DILocation(line: 115, column: 31, scope: !2085)
!2108 = !DILocation(line: 115, column: 46, scope: !2085)
!2109 = !DILocation(line: 115, column: 52, scope: !2085)
!2110 = !DILocation(line: 115, column: 43, scope: !2085)
!2111 = !DILocation(line: 115, column: 23, scope: !2085)
!2112 = !DILocation(line: 119, column: 8, scope: !2113)
!2113 = distinct !DILexicalBlock(scope: !2085, file: !298, line: 119, column: 7)
!2114 = !DILocation(line: 119, column: 27, scope: !2113)
!2115 = !DILocation(line: 119, column: 32, scope: !2113)
!2116 = !DILocation(line: 119, column: 46, scope: !2113)
!2117 = !DILocation(line: 119, column: 51, scope: !2113)
!2118 = !DILocation(line: 119, column: 43, scope: !2113)
!2119 = !DILocation(line: 119, column: 65, scope: !2113)
!2120 = !DILocation(line: 119, column: 70, scope: !2113)
!2121 = !DILocation(line: 119, column: 62, scope: !2113)
!2122 = !DILocation(line: 119, column: 24, scope: !2113)
!2123 = !DILocation(line: 119, column: 22, scope: !2113)
!2124 = !DILocation(line: 120, column: 8, scope: !2113)
!2125 = !DILocation(line: 120, column: 27, scope: !2113)
!2126 = !DILocation(line: 120, column: 32, scope: !2113)
!2127 = !DILocation(line: 120, column: 46, scope: !2113)
!2128 = !DILocation(line: 120, column: 51, scope: !2113)
!2129 = !DILocation(line: 120, column: 43, scope: !2113)
!2130 = !DILocation(line: 120, column: 65, scope: !2113)
!2131 = !DILocation(line: 120, column: 70, scope: !2113)
!2132 = !DILocation(line: 120, column: 62, scope: !2113)
!2133 = !DILocation(line: 120, column: 24, scope: !2113)
!2134 = !DILocation(line: 120, column: 22, scope: !2113)
!2135 = !DILocation(line: 119, column: 83, scope: !2113)
!2136 = !DILocation(line: 119, column: 7, scope: !2085)
!2137 = !DILocation(line: 121, column: 5, scope: !2113)
!2138 = !DILocation(line: 123, column: 3, scope: !2085)
!2139 = !DILocation(line: 124, column: 1, scope: !2085)
!2140 = distinct !DISubprogram(name: "__fd_openat", scope: !298, file: !298, line: 198, type: !2141, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2141 = !DISubroutineType(types: !2142)
!2142 = !{!241, !241, !437, !241, !294}
!2143 = !DILocalVariable(name: "basefd", arg: 1, scope: !2140, file: !298, line: 198, type: !241)
!2144 = !DILocation(line: 198, column: 21, scope: !2140)
!2145 = !DILocalVariable(name: "pathname", arg: 2, scope: !2140, file: !298, line: 198, type: !437)
!2146 = !DILocation(line: 198, column: 41, scope: !2140)
!2147 = !DILocalVariable(name: "flags", arg: 3, scope: !2140, file: !298, line: 198, type: !241)
!2148 = !DILocation(line: 198, column: 55, scope: !2140)
!2149 = !DILocalVariable(name: "mode", arg: 4, scope: !2140, file: !298, line: 198, type: !294)
!2150 = !DILocation(line: 198, column: 69, scope: !2140)
!2151 = !DILocalVariable(name: "f", scope: !2140, file: !298, line: 199, type: !1925)
!2152 = !DILocation(line: 199, column: 15, scope: !2140)
!2153 = !DILocalVariable(name: "fd", scope: !2140, file: !298, line: 200, type: !241)
!2154 = !DILocation(line: 200, column: 7, scope: !2140)
!2155 = !DILocation(line: 201, column: 7, scope: !2156)
!2156 = distinct !DILexicalBlock(scope: !2140, file: !298, line: 201, column: 7)
!2157 = !DILocation(line: 201, column: 14, scope: !2156)
!2158 = !DILocation(line: 201, column: 7, scope: !2140)
!2159 = !DILocalVariable(name: "bf", scope: !2160, file: !298, line: 202, type: !1925)
!2160 = distinct !DILexicalBlock(scope: !2156, file: !298, line: 201, column: 27)
!2161 = !DILocation(line: 202, column: 17, scope: !2160)
!2162 = !DILocation(line: 202, column: 33, scope: !2160)
!2163 = !DILocation(line: 202, column: 22, scope: !2160)
!2164 = !DILocation(line: 204, column: 10, scope: !2165)
!2165 = distinct !DILexicalBlock(scope: !2160, file: !298, line: 204, column: 9)
!2166 = !DILocation(line: 204, column: 9, scope: !2160)
!2167 = !DILocation(line: 205, column: 7, scope: !2168)
!2168 = distinct !DILexicalBlock(scope: !2165, file: !298, line: 204, column: 14)
!2169 = !DILocation(line: 205, column: 13, scope: !2168)
!2170 = !DILocation(line: 206, column: 7, scope: !2168)
!2171 = !DILocation(line: 207, column: 16, scope: !2172)
!2172 = distinct !DILexicalBlock(scope: !2165, file: !298, line: 207, column: 16)
!2173 = !DILocation(line: 207, column: 20, scope: !2172)
!2174 = !DILocation(line: 207, column: 16, scope: !2165)
!2175 = !DILocation(line: 208, column: 7, scope: !2176)
!2176 = distinct !DILexicalBlock(scope: !2172, file: !298, line: 207, column: 27)
!2177 = !DILocation(line: 209, column: 7, scope: !2176)
!2178 = !DILocation(line: 209, column: 13, scope: !2176)
!2179 = !DILocation(line: 210, column: 7, scope: !2176)
!2180 = !DILocation(line: 212, column: 14, scope: !2160)
!2181 = !DILocation(line: 212, column: 18, scope: !2160)
!2182 = !DILocation(line: 212, column: 12, scope: !2160)
!2183 = !DILocation(line: 213, column: 3, scope: !2160)
!2184 = !DILocation(line: 215, column: 22, scope: !2185)
!2185 = distinct !DILexicalBlock(scope: !2140, file: !298, line: 215, column: 7)
!2186 = !DILocation(line: 215, column: 7, scope: !2185)
!2187 = !DILocation(line: 215, column: 7, scope: !2140)
!2188 = !DILocation(line: 217, column: 22, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2185, file: !298, line: 215, column: 33)
!2190 = !DILocation(line: 217, column: 32, scope: !2189)
!2191 = !DILocation(line: 217, column: 39, scope: !2189)
!2192 = !DILocation(line: 217, column: 12, scope: !2189)
!2193 = !DILocation(line: 217, column: 5, scope: !2189)
!2194 = !DILocation(line: 220, column: 11, scope: !2195)
!2195 = distinct !DILexicalBlock(scope: !2140, file: !298, line: 220, column: 3)
!2196 = !DILocation(line: 220, column: 8, scope: !2195)
!2197 = !DILocation(line: 220, column: 16, scope: !2198)
!2198 = distinct !DILexicalBlock(scope: !2195, file: !298, line: 220, column: 3)
!2199 = !DILocation(line: 220, column: 19, scope: !2198)
!2200 = !DILocation(line: 220, column: 3, scope: !2195)
!2201 = !DILocation(line: 221, column: 25, scope: !2202)
!2202 = distinct !DILexicalBlock(scope: !2198, file: !298, line: 221, column: 9)
!2203 = !DILocation(line: 221, column: 11, scope: !2202)
!2204 = !DILocation(line: 221, column: 29, scope: !2202)
!2205 = !DILocation(line: 221, column: 35, scope: !2202)
!2206 = !DILocation(line: 221, column: 9, scope: !2198)
!2207 = !DILocation(line: 220, column: 30, scope: !2198)
!2208 = !DILocation(line: 220, column: 3, scope: !2198)
!2209 = distinct !{!2209, !2200, !2210}
!2210 = !DILocation(line: 222, column: 7, scope: !2195)
!2211 = !DILocation(line: 223, column: 7, scope: !2212)
!2212 = distinct !DILexicalBlock(scope: !2140, file: !298, line: 223, column: 7)
!2213 = !DILocation(line: 223, column: 10, scope: !2212)
!2214 = !DILocation(line: 223, column: 7, scope: !2140)
!2215 = !DILocation(line: 224, column: 5, scope: !2216)
!2216 = distinct !DILexicalBlock(scope: !2212, file: !298, line: 223, column: 22)
!2217 = !DILocation(line: 224, column: 11, scope: !2216)
!2218 = !DILocation(line: 225, column: 5, scope: !2216)
!2219 = !DILocation(line: 228, column: 22, scope: !2140)
!2220 = !DILocation(line: 228, column: 8, scope: !2140)
!2221 = !DILocation(line: 228, column: 5, scope: !2140)
!2222 = !DILocation(line: 231, column: 10, scope: !2140)
!2223 = !DILocation(line: 231, column: 3, scope: !2140)
!2224 = !DILocalVariable(name: "os_fd", scope: !2140, file: !298, line: 233, type: !241)
!2225 = !DILocation(line: 233, column: 7, scope: !2140)
!2226 = !DILocation(line: 233, column: 42, scope: !2140)
!2227 = !DILocation(line: 233, column: 36, scope: !2140)
!2228 = !DILocation(line: 233, column: 70, scope: !2140)
!2229 = !DILocation(line: 233, column: 50, scope: !2140)
!2230 = !DILocation(line: 233, column: 87, scope: !2140)
!2231 = !DILocation(line: 233, column: 81, scope: !2140)
!2232 = !DILocation(line: 233, column: 94, scope: !2140)
!2233 = !DILocation(line: 233, column: 15, scope: !2140)
!2234 = !DILocation(line: 234, column: 7, scope: !2235)
!2235 = distinct !DILexicalBlock(scope: !2140, file: !298, line: 234, column: 7)
!2236 = !DILocation(line: 234, column: 13, scope: !2235)
!2237 = !DILocation(line: 234, column: 7, scope: !2140)
!2238 = !DILocation(line: 235, column: 5, scope: !2235)
!2239 = !DILocation(line: 237, column: 11, scope: !2140)
!2240 = !DILocation(line: 237, column: 3, scope: !2140)
!2241 = !DILocation(line: 237, column: 6, scope: !2140)
!2242 = !DILocation(line: 237, column: 9, scope: !2140)
!2243 = !DILocation(line: 238, column: 3, scope: !2140)
!2244 = !DILocation(line: 238, column: 6, scope: !2140)
!2245 = !DILocation(line: 238, column: 12, scope: !2140)
!2246 = !DILocation(line: 239, column: 8, scope: !2247)
!2247 = distinct !DILexicalBlock(scope: !2140, file: !298, line: 239, column: 7)
!2248 = !DILocation(line: 239, column: 14, scope: !2247)
!2249 = !DILocation(line: 239, column: 27, scope: !2247)
!2250 = !DILocation(line: 239, column: 7, scope: !2140)
!2251 = !DILocation(line: 240, column: 5, scope: !2252)
!2252 = distinct !DILexicalBlock(scope: !2247, file: !298, line: 239, column: 40)
!2253 = !DILocation(line: 240, column: 8, scope: !2252)
!2254 = !DILocation(line: 240, column: 14, scope: !2252)
!2255 = !DILocation(line: 241, column: 3, scope: !2252)
!2256 = !DILocation(line: 241, column: 15, scope: !2257)
!2257 = distinct !DILexicalBlock(scope: !2247, file: !298, line: 241, column: 14)
!2258 = !DILocation(line: 241, column: 21, scope: !2257)
!2259 = !DILocation(line: 241, column: 34, scope: !2257)
!2260 = !DILocation(line: 241, column: 14, scope: !2247)
!2261 = !DILocation(line: 242, column: 5, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2257, file: !298, line: 241, column: 47)
!2263 = !DILocation(line: 242, column: 8, scope: !2262)
!2264 = !DILocation(line: 242, column: 14, scope: !2262)
!2265 = !DILocation(line: 243, column: 3, scope: !2262)
!2266 = !DILocation(line: 244, column: 5, scope: !2267)
!2267 = distinct !DILexicalBlock(scope: !2257, file: !298, line: 243, column: 10)
!2268 = !DILocation(line: 244, column: 8, scope: !2267)
!2269 = !DILocation(line: 244, column: 14, scope: !2267)
!2270 = !DILocation(line: 247, column: 10, scope: !2140)
!2271 = !DILocation(line: 247, column: 3, scope: !2140)
!2272 = !DILocation(line: 248, column: 1, scope: !2140)
!2273 = distinct !DISubprogram(name: "__get_file", scope: !298, file: !298, line: 80, type: !2274, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2274 = !DISubroutineType(types: !2275)
!2275 = !{!1925, !241}
!2276 = !DILocalVariable(name: "fd", arg: 1, scope: !2273, file: !298, line: 80, type: !241)
!2277 = !DILocation(line: 80, column: 35, scope: !2273)
!2278 = !DILocation(line: 81, column: 7, scope: !2279)
!2279 = distinct !DILexicalBlock(scope: !2273, file: !298, line: 81, column: 7)
!2280 = !DILocation(line: 81, column: 9, scope: !2279)
!2281 = !DILocation(line: 81, column: 13, scope: !2279)
!2282 = !DILocalVariable(name: "f", scope: !2283, file: !298, line: 82, type: !1925)
!2283 = distinct !DILexicalBlock(scope: !2279, file: !298, line: 81, column: 28)
!2284 = !DILocation(line: 82, column: 17, scope: !2283)
!2285 = !DILocation(line: 82, column: 36, scope: !2283)
!2286 = !DILocation(line: 82, column: 22, scope: !2283)
!2287 = !DILocation(line: 83, column: 9, scope: !2288)
!2288 = distinct !DILexicalBlock(scope: !2283, file: !298, line: 83, column: 9)
!2289 = !DILocation(line: 83, column: 12, scope: !2288)
!2290 = !DILocation(line: 83, column: 18, scope: !2288)
!2291 = !DILocation(line: 83, column: 9, scope: !2283)
!2292 = !DILocation(line: 84, column: 14, scope: !2288)
!2293 = !DILocation(line: 84, column: 7, scope: !2288)
!2294 = !DILocation(line: 87, column: 3, scope: !2273)
!2295 = !DILocation(line: 88, column: 1, scope: !2273)
!2296 = distinct !DISubprogram(name: "utimes", scope: !298, file: !298, line: 251, type: !2297, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2297 = !DISubroutineType(types: !2298)
!2298 = !{!241, !437, !2299}
!2299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2300, size: 64)
!2300 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2301)
!2301 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !2302, line: 8, size: 128, elements: !2303)
!2302 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "", checksumkind: CSK_MD5, checksum: "9b45d950050c215f216850b27bd1e8f3")
!2303 = !{!2304, !2305}
!2304 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !2301, file: !2302, line: 14, baseType: !255, size: 64)
!2305 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !2301, file: !2302, line: 15, baseType: !2306, size: 64, offset: 64)
!2306 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !228, line: 162, baseType: !245)
!2307 = !DILocalVariable(name: "path", arg: 1, scope: !2296, file: !298, line: 251, type: !437)
!2308 = !DILocation(line: 251, column: 24, scope: !2296)
!2309 = !DILocalVariable(name: "times", arg: 2, scope: !2296, file: !298, line: 251, type: !2299)
!2310 = !DILocation(line: 251, column: 51, scope: !2296)
!2311 = !DILocalVariable(name: "dfile", scope: !2296, file: !298, line: 252, type: !1583)
!2312 = !DILocation(line: 252, column: 20, scope: !2296)
!2313 = !DILocation(line: 252, column: 43, scope: !2296)
!2314 = !DILocation(line: 252, column: 28, scope: !2296)
!2315 = !DILocation(line: 254, column: 7, scope: !2316)
!2316 = distinct !DILexicalBlock(scope: !2296, file: !298, line: 254, column: 7)
!2317 = !DILocation(line: 254, column: 7, scope: !2296)
!2318 = !DILocation(line: 256, column: 10, scope: !2319)
!2319 = distinct !DILexicalBlock(scope: !2320, file: !298, line: 256, column: 9)
!2320 = distinct !DILexicalBlock(scope: !2316, file: !298, line: 254, column: 14)
!2321 = !DILocation(line: 256, column: 9, scope: !2320)
!2322 = !DILocalVariable(name: "newTimes", scope: !2323, file: !298, line: 257, type: !2324)
!2323 = distinct !DILexicalBlock(scope: !2319, file: !298, line: 256, column: 17)
!2324 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2301, size: 256, elements: !149)
!2325 = !DILocation(line: 257, column: 22, scope: !2323)
!2326 = !DILocation(line: 258, column: 22, scope: !2323)
!2327 = !DILocation(line: 258, column: 7, scope: !2323)
!2328 = !DILocation(line: 259, column: 7, scope: !2323)
!2329 = !DILocation(line: 259, column: 21, scope: !2323)
!2330 = !DILocation(line: 260, column: 15, scope: !2323)
!2331 = !DILocation(line: 260, column: 13, scope: !2323)
!2332 = !DILocation(line: 261, column: 5, scope: !2323)
!2333 = !DILocation(line: 264, column: 29, scope: !2320)
!2334 = !DILocation(line: 264, column: 38, scope: !2320)
!2335 = !DILocation(line: 264, column: 5, scope: !2320)
!2336 = !DILocation(line: 264, column: 12, scope: !2320)
!2337 = !DILocation(line: 264, column: 18, scope: !2320)
!2338 = !DILocation(line: 264, column: 27, scope: !2320)
!2339 = !DILocation(line: 265, column: 29, scope: !2320)
!2340 = !DILocation(line: 265, column: 38, scope: !2320)
!2341 = !DILocation(line: 265, column: 5, scope: !2320)
!2342 = !DILocation(line: 265, column: 12, scope: !2320)
!2343 = !DILocation(line: 265, column: 18, scope: !2320)
!2344 = !DILocation(line: 265, column: 27, scope: !2320)
!2345 = !DILocation(line: 270, column: 5, scope: !2320)
!2346 = !DILocation(line: 272, column: 51, scope: !2296)
!2347 = !DILocation(line: 272, column: 31, scope: !2296)
!2348 = !DILocation(line: 272, column: 58, scope: !2296)
!2349 = !DILocation(line: 272, column: 10, scope: !2296)
!2350 = !DILocation(line: 272, column: 3, scope: !2296)
!2351 = !DILocation(line: 273, column: 1, scope: !2296)
!2352 = distinct !DISubprogram(name: "futimesat", scope: !298, file: !298, line: 276, type: !2353, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2353 = !DISubroutineType(types: !2354)
!2354 = !{!241, !241, !437, !2299}
!2355 = !DILocalVariable(name: "fd", arg: 1, scope: !2352, file: !298, line: 276, type: !241)
!2356 = !DILocation(line: 276, column: 19, scope: !2352)
!2357 = !DILocalVariable(name: "path", arg: 2, scope: !2352, file: !298, line: 276, type: !437)
!2358 = !DILocation(line: 276, column: 35, scope: !2352)
!2359 = !DILocalVariable(name: "times", arg: 3, scope: !2352, file: !298, line: 276, type: !2299)
!2360 = !DILocation(line: 276, column: 62, scope: !2352)
!2361 = !DILocation(line: 277, column: 7, scope: !2362)
!2362 = distinct !DILexicalBlock(scope: !2352, file: !298, line: 277, column: 7)
!2363 = !DILocation(line: 277, column: 10, scope: !2362)
!2364 = !DILocation(line: 277, column: 7, scope: !2352)
!2365 = !DILocalVariable(name: "f", scope: !2366, file: !298, line: 278, type: !1925)
!2366 = distinct !DILexicalBlock(scope: !2362, file: !298, line: 277, column: 23)
!2367 = !DILocation(line: 278, column: 17, scope: !2366)
!2368 = !DILocation(line: 278, column: 32, scope: !2366)
!2369 = !DILocation(line: 278, column: 21, scope: !2366)
!2370 = !DILocation(line: 280, column: 10, scope: !2371)
!2371 = distinct !DILexicalBlock(scope: !2366, file: !298, line: 280, column: 9)
!2372 = !DILocation(line: 280, column: 9, scope: !2366)
!2373 = !DILocation(line: 281, column: 7, scope: !2374)
!2374 = distinct !DILexicalBlock(scope: !2371, file: !298, line: 280, column: 13)
!2375 = !DILocation(line: 281, column: 13, scope: !2374)
!2376 = !DILocation(line: 282, column: 7, scope: !2374)
!2377 = !DILocation(line: 283, column: 16, scope: !2378)
!2378 = distinct !DILexicalBlock(scope: !2371, file: !298, line: 283, column: 16)
!2379 = !DILocation(line: 283, column: 19, scope: !2378)
!2380 = !DILocation(line: 283, column: 16, scope: !2371)
!2381 = !DILocation(line: 284, column: 7, scope: !2382)
!2382 = distinct !DILexicalBlock(scope: !2378, file: !298, line: 283, column: 26)
!2383 = !DILocation(line: 285, column: 7, scope: !2382)
!2384 = !DILocation(line: 285, column: 13, scope: !2382)
!2385 = !DILocation(line: 286, column: 7, scope: !2382)
!2386 = !DILocation(line: 288, column: 10, scope: !2366)
!2387 = !DILocation(line: 288, column: 13, scope: !2366)
!2388 = !DILocation(line: 288, column: 8, scope: !2366)
!2389 = !DILocation(line: 289, column: 3, scope: !2366)
!2390 = !DILocation(line: 290, column: 22, scope: !2391)
!2391 = distinct !DILexicalBlock(scope: !2352, file: !298, line: 290, column: 7)
!2392 = !DILocation(line: 290, column: 7, scope: !2391)
!2393 = !DILocation(line: 290, column: 7, scope: !2352)
!2394 = !DILocation(line: 291, column: 19, scope: !2395)
!2395 = distinct !DILexicalBlock(scope: !2391, file: !298, line: 290, column: 29)
!2396 = !DILocation(line: 291, column: 25, scope: !2395)
!2397 = !DILocation(line: 291, column: 12, scope: !2395)
!2398 = !DILocation(line: 291, column: 5, scope: !2395)
!2399 = !DILocation(line: 294, column: 40, scope: !2352)
!2400 = !DILocation(line: 294, column: 34, scope: !2352)
!2401 = !DILocation(line: 295, column: 19, scope: !2352)
!2402 = !DILocation(line: 295, column: 46, scope: !2352)
!2403 = !DILocation(line: 295, column: 26, scope: !2352)
!2404 = !DILocation(line: 295, column: 61, scope: !2352)
!2405 = !DILocation(line: 294, column: 10, scope: !2352)
!2406 = !DILocation(line: 294, column: 3, scope: !2352)
!2407 = !DILocation(line: 296, column: 1, scope: !2352)
!2408 = !DILocalVariable(name: "fd", arg: 1, scope: !311, file: !298, line: 298, type: !241)
!2409 = !DILocation(line: 298, column: 15, scope: !311)
!2410 = !DILocalVariable(name: "f", scope: !311, file: !298, line: 300, type: !1925)
!2411 = !DILocation(line: 300, column: 15, scope: !311)
!2412 = !DILocalVariable(name: "r", scope: !311, file: !298, line: 301, type: !241)
!2413 = !DILocation(line: 301, column: 7, scope: !311)
!2414 = !DILocation(line: 303, column: 10, scope: !311)
!2415 = !DILocation(line: 305, column: 18, scope: !311)
!2416 = !DILocation(line: 305, column: 7, scope: !311)
!2417 = !DILocation(line: 305, column: 5, scope: !311)
!2418 = !DILocation(line: 306, column: 8, scope: !2419)
!2419 = distinct !DILexicalBlock(scope: !311, file: !298, line: 306, column: 7)
!2420 = !DILocation(line: 306, column: 7, scope: !311)
!2421 = !DILocation(line: 307, column: 5, scope: !2422)
!2422 = distinct !DILexicalBlock(scope: !2419, file: !298, line: 306, column: 11)
!2423 = !DILocation(line: 307, column: 11, scope: !2422)
!2424 = !DILocation(line: 308, column: 5, scope: !2422)
!2425 = !DILocation(line: 311, column: 16, scope: !2426)
!2426 = distinct !DILexicalBlock(scope: !311, file: !298, line: 311, column: 7)
!2427 = !DILocation(line: 311, column: 7, scope: !2426)
!2428 = !DILocation(line: 311, column: 29, scope: !2426)
!2429 = !DILocation(line: 311, column: 42, scope: !2426)
!2430 = !DILocation(line: 311, column: 32, scope: !2426)
!2431 = !DILocation(line: 311, column: 56, scope: !2426)
!2432 = !DILocation(line: 311, column: 53, scope: !2426)
!2433 = !DILocation(line: 311, column: 7, scope: !311)
!2434 = !DILocation(line: 312, column: 26, scope: !2435)
!2435 = distinct !DILexicalBlock(scope: !2426, file: !298, line: 311, column: 65)
!2436 = !DILocation(line: 313, column: 5, scope: !2435)
!2437 = !DILocation(line: 313, column: 11, scope: !2435)
!2438 = !DILocation(line: 314, column: 5, scope: !2435)
!2439 = !DILocation(line: 325, column: 10, scope: !311)
!2440 = !DILocation(line: 325, column: 3, scope: !311)
!2441 = !DILocation(line: 327, column: 10, scope: !311)
!2442 = !DILocation(line: 327, column: 3, scope: !311)
!2443 = !DILocation(line: 328, column: 1, scope: !311)
!2444 = !DILocalVariable(name: "fd", arg: 1, scope: !378, file: !298, line: 330, type: !241)
!2445 = !DILocation(line: 330, column: 18, scope: !378)
!2446 = !DILocalVariable(name: "buf", arg: 2, scope: !378, file: !298, line: 330, type: !336)
!2447 = !DILocation(line: 330, column: 28, scope: !378)
!2448 = !DILocalVariable(name: "count", arg: 3, scope: !378, file: !298, line: 330, type: !383)
!2449 = !DILocation(line: 330, column: 40, scope: !378)
!2450 = !DILocalVariable(name: "f", scope: !378, file: !298, line: 332, type: !1925)
!2451 = !DILocation(line: 332, column: 15, scope: !378)
!2452 = !DILocation(line: 334, column: 10, scope: !378)
!2453 = !DILocation(line: 336, column: 7, scope: !2454)
!2454 = distinct !DILexicalBlock(scope: !378, file: !298, line: 336, column: 7)
!2455 = !DILocation(line: 336, column: 13, scope: !2454)
!2456 = !DILocation(line: 336, column: 7, scope: !378)
!2457 = !DILocation(line: 337, column: 5, scope: !2454)
!2458 = !DILocation(line: 339, column: 7, scope: !2459)
!2459 = distinct !DILexicalBlock(scope: !378, file: !298, line: 339, column: 7)
!2460 = !DILocation(line: 339, column: 11, scope: !2459)
!2461 = !DILocation(line: 339, column: 7, scope: !378)
!2462 = !DILocation(line: 340, column: 5, scope: !2463)
!2463 = distinct !DILexicalBlock(scope: !2459, file: !298, line: 339, column: 20)
!2464 = !DILocation(line: 340, column: 11, scope: !2463)
!2465 = !DILocation(line: 341, column: 5, scope: !2463)
!2466 = !DILocation(line: 344, column: 18, scope: !378)
!2467 = !DILocation(line: 344, column: 7, scope: !378)
!2468 = !DILocation(line: 344, column: 5, scope: !378)
!2469 = !DILocation(line: 346, column: 8, scope: !2470)
!2470 = distinct !DILexicalBlock(scope: !378, file: !298, line: 346, column: 7)
!2471 = !DILocation(line: 346, column: 7, scope: !378)
!2472 = !DILocation(line: 347, column: 5, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2470, file: !298, line: 346, column: 11)
!2474 = !DILocation(line: 347, column: 11, scope: !2473)
!2475 = !DILocation(line: 348, column: 5, scope: !2473)
!2476 = !DILocation(line: 351, column: 16, scope: !2477)
!2477 = distinct !DILexicalBlock(scope: !378, file: !298, line: 351, column: 7)
!2478 = !DILocation(line: 351, column: 7, scope: !2477)
!2479 = !DILocation(line: 351, column: 29, scope: !2477)
!2480 = !DILocation(line: 351, column: 42, scope: !2477)
!2481 = !DILocation(line: 351, column: 32, scope: !2477)
!2482 = !DILocation(line: 351, column: 55, scope: !2477)
!2483 = !DILocation(line: 351, column: 52, scope: !2477)
!2484 = !DILocation(line: 351, column: 7, scope: !378)
!2485 = !DILocation(line: 352, column: 26, scope: !2486)
!2486 = distinct !DILexicalBlock(scope: !2477, file: !298, line: 351, column: 64)
!2487 = !DILocation(line: 353, column: 5, scope: !2486)
!2488 = !DILocation(line: 353, column: 11, scope: !2486)
!2489 = !DILocation(line: 354, column: 5, scope: !2486)
!2490 = !DILocation(line: 357, column: 8, scope: !2491)
!2491 = distinct !DILexicalBlock(scope: !378, file: !298, line: 357, column: 7)
!2492 = !DILocation(line: 357, column: 11, scope: !2491)
!2493 = !DILocation(line: 357, column: 7, scope: !378)
!2494 = !DILocalVariable(name: "r", scope: !2495, file: !298, line: 359, type: !241)
!2495 = distinct !DILexicalBlock(scope: !2491, file: !298, line: 357, column: 18)
!2496 = !DILocation(line: 359, column: 9, scope: !2495)
!2497 = !DILocation(line: 360, column: 28, scope: !2495)
!2498 = !DILocation(line: 360, column: 11, scope: !2495)
!2499 = !DILocation(line: 360, column: 9, scope: !2495)
!2500 = !DILocation(line: 361, column: 31, scope: !2495)
!2501 = !DILocation(line: 361, column: 13, scope: !2495)
!2502 = !DILocation(line: 361, column: 11, scope: !2495)
!2503 = !DILocation(line: 365, column: 30, scope: !2495)
!2504 = !DILocation(line: 365, column: 35, scope: !2495)
!2505 = !DILocation(line: 365, column: 5, scope: !2495)
!2506 = !DILocation(line: 366, column: 9, scope: !2507)
!2507 = distinct !DILexicalBlock(scope: !2495, file: !298, line: 366, column: 9)
!2508 = !DILocation(line: 366, column: 12, scope: !2507)
!2509 = !DILocation(line: 366, column: 15, scope: !2507)
!2510 = !DILocation(line: 366, column: 9, scope: !2495)
!2511 = !DILocation(line: 367, column: 30, scope: !2507)
!2512 = !DILocation(line: 367, column: 33, scope: !2507)
!2513 = !DILocation(line: 367, column: 37, scope: !2507)
!2514 = !DILocation(line: 367, column: 42, scope: !2507)
!2515 = !DILocation(line: 367, column: 11, scope: !2507)
!2516 = !DILocation(line: 367, column: 9, scope: !2507)
!2517 = !DILocation(line: 367, column: 7, scope: !2507)
!2518 = !DILocation(line: 369, column: 33, scope: !2507)
!2519 = !DILocation(line: 369, column: 36, scope: !2507)
!2520 = !DILocation(line: 369, column: 40, scope: !2507)
!2521 = !DILocation(line: 369, column: 45, scope: !2507)
!2522 = !DILocation(line: 369, column: 62, scope: !2507)
!2523 = !DILocation(line: 369, column: 65, scope: !2507)
!2524 = !DILocation(line: 369, column: 11, scope: !2507)
!2525 = !DILocation(line: 369, column: 9, scope: !2507)
!2526 = !DILocation(line: 371, column: 9, scope: !2527)
!2527 = distinct !DILexicalBlock(scope: !2495, file: !298, line: 371, column: 9)
!2528 = !DILocation(line: 371, column: 11, scope: !2527)
!2529 = !DILocation(line: 371, column: 9, scope: !2495)
!2530 = !DILocation(line: 372, column: 7, scope: !2527)
!2531 = !DILocation(line: 374, column: 9, scope: !2532)
!2532 = distinct !DILexicalBlock(scope: !2495, file: !298, line: 374, column: 9)
!2533 = !DILocation(line: 374, column: 12, scope: !2532)
!2534 = !DILocation(line: 374, column: 15, scope: !2532)
!2535 = !DILocation(line: 374, column: 9, scope: !2495)
!2536 = !DILocation(line: 375, column: 17, scope: !2532)
!2537 = !DILocation(line: 375, column: 7, scope: !2532)
!2538 = !DILocation(line: 375, column: 10, scope: !2532)
!2539 = !DILocation(line: 375, column: 14, scope: !2532)
!2540 = !DILocation(line: 376, column: 12, scope: !2495)
!2541 = !DILocation(line: 376, column: 5, scope: !2495)
!2542 = !DILocation(line: 379, column: 5, scope: !2543)
!2543 = distinct !DILexicalBlock(scope: !2544, file: !298, line: 379, column: 5)
!2544 = distinct !DILexicalBlock(scope: !2545, file: !298, line: 379, column: 5)
!2545 = distinct !DILexicalBlock(scope: !2491, file: !298, line: 378, column: 8)
!2546 = !DILocation(line: 379, column: 5, scope: !2544)
!2547 = !DILocation(line: 380, column: 19, scope: !2548)
!2548 = distinct !DILexicalBlock(scope: !2545, file: !298, line: 380, column: 9)
!2549 = !DILocation(line: 380, column: 22, scope: !2548)
!2550 = !DILocation(line: 380, column: 29, scope: !2548)
!2551 = !DILocation(line: 380, column: 10, scope: !2548)
!2552 = !DILocation(line: 380, column: 37, scope: !2548)
!2553 = !DILocation(line: 380, column: 40, scope: !2548)
!2554 = !DILocation(line: 380, column: 35, scope: !2548)
!2555 = !DILocation(line: 380, column: 9, scope: !2545)
!2556 = !DILocation(line: 381, column: 7, scope: !2548)
!2557 = !DILocation(line: 384, column: 9, scope: !2558)
!2558 = distinct !DILexicalBlock(scope: !2545, file: !298, line: 384, column: 9)
!2559 = !DILocation(line: 384, column: 12, scope: !2558)
!2560 = !DILocation(line: 384, column: 18, scope: !2558)
!2561 = !DILocation(line: 384, column: 16, scope: !2558)
!2562 = !DILocation(line: 384, column: 26, scope: !2558)
!2563 = !DILocation(line: 384, column: 29, scope: !2558)
!2564 = !DILocation(line: 384, column: 36, scope: !2558)
!2565 = !DILocation(line: 384, column: 24, scope: !2558)
!2566 = !DILocation(line: 384, column: 9, scope: !2545)
!2567 = !DILocation(line: 385, column: 15, scope: !2568)
!2568 = distinct !DILexicalBlock(scope: !2558, file: !298, line: 384, column: 42)
!2569 = !DILocation(line: 385, column: 18, scope: !2568)
!2570 = !DILocation(line: 385, column: 25, scope: !2568)
!2571 = !DILocation(line: 385, column: 32, scope: !2568)
!2572 = !DILocation(line: 385, column: 35, scope: !2568)
!2573 = !DILocation(line: 385, column: 30, scope: !2568)
!2574 = !DILocation(line: 385, column: 13, scope: !2568)
!2575 = !DILocation(line: 386, column: 5, scope: !2568)
!2576 = !DILocation(line: 388, column: 12, scope: !2545)
!2577 = !DILocation(line: 388, column: 17, scope: !2545)
!2578 = !DILocation(line: 388, column: 20, scope: !2545)
!2579 = !DILocation(line: 388, column: 27, scope: !2545)
!2580 = !DILocation(line: 388, column: 38, scope: !2545)
!2581 = !DILocation(line: 388, column: 41, scope: !2545)
!2582 = !DILocation(line: 388, column: 36, scope: !2545)
!2583 = !DILocation(line: 388, column: 46, scope: !2545)
!2584 = !DILocation(line: 388, column: 5, scope: !2545)
!2585 = !DILocation(line: 389, column: 15, scope: !2545)
!2586 = !DILocation(line: 389, column: 5, scope: !2545)
!2587 = !DILocation(line: 389, column: 8, scope: !2545)
!2588 = !DILocation(line: 389, column: 12, scope: !2545)
!2589 = !DILocation(line: 391, column: 12, scope: !2545)
!2590 = !DILocation(line: 391, column: 5, scope: !2545)
!2591 = !DILocation(line: 393, column: 1, scope: !378)
!2592 = !DILocalVariable(name: "fd", arg: 1, scope: !400, file: !298, line: 396, type: !241)
!2593 = !DILocation(line: 396, column: 19, scope: !400)
!2594 = !DILocalVariable(name: "buf", arg: 2, scope: !400, file: !298, line: 396, type: !403)
!2595 = !DILocation(line: 396, column: 35, scope: !400)
!2596 = !DILocalVariable(name: "count", arg: 3, scope: !400, file: !298, line: 396, type: !383)
!2597 = !DILocation(line: 396, column: 47, scope: !400)
!2598 = !DILocalVariable(name: "f", scope: !400, file: !298, line: 398, type: !1925)
!2599 = !DILocation(line: 398, column: 15, scope: !400)
!2600 = !DILocation(line: 400, column: 10, scope: !400)
!2601 = !DILocation(line: 402, column: 18, scope: !400)
!2602 = !DILocation(line: 402, column: 7, scope: !400)
!2603 = !DILocation(line: 402, column: 5, scope: !400)
!2604 = !DILocation(line: 404, column: 8, scope: !2605)
!2605 = distinct !DILexicalBlock(scope: !400, file: !298, line: 404, column: 7)
!2606 = !DILocation(line: 404, column: 7, scope: !400)
!2607 = !DILocation(line: 405, column: 5, scope: !2608)
!2608 = distinct !DILexicalBlock(scope: !2605, file: !298, line: 404, column: 11)
!2609 = !DILocation(line: 405, column: 11, scope: !2608)
!2610 = !DILocation(line: 406, column: 5, scope: !2608)
!2611 = !DILocation(line: 409, column: 16, scope: !2612)
!2612 = distinct !DILexicalBlock(scope: !400, file: !298, line: 409, column: 7)
!2613 = !DILocation(line: 409, column: 7, scope: !2612)
!2614 = !DILocation(line: 409, column: 29, scope: !2612)
!2615 = !DILocation(line: 409, column: 42, scope: !2612)
!2616 = !DILocation(line: 409, column: 32, scope: !2612)
!2617 = !DILocation(line: 409, column: 56, scope: !2612)
!2618 = !DILocation(line: 409, column: 53, scope: !2612)
!2619 = !DILocation(line: 409, column: 7, scope: !400)
!2620 = !DILocation(line: 410, column: 26, scope: !2621)
!2621 = distinct !DILexicalBlock(scope: !2612, file: !298, line: 409, column: 65)
!2622 = !DILocation(line: 411, column: 5, scope: !2621)
!2623 = !DILocation(line: 411, column: 11, scope: !2621)
!2624 = !DILocation(line: 412, column: 5, scope: !2621)
!2625 = !DILocation(line: 415, column: 8, scope: !2626)
!2626 = distinct !DILexicalBlock(scope: !400, file: !298, line: 415, column: 7)
!2627 = !DILocation(line: 415, column: 11, scope: !2626)
!2628 = !DILocation(line: 415, column: 7, scope: !400)
!2629 = !DILocalVariable(name: "r", scope: !2630, file: !298, line: 416, type: !241)
!2630 = distinct !DILexicalBlock(scope: !2626, file: !298, line: 415, column: 18)
!2631 = !DILocation(line: 416, column: 9, scope: !2630)
!2632 = !DILocation(line: 418, column: 28, scope: !2630)
!2633 = !DILocation(line: 418, column: 11, scope: !2630)
!2634 = !DILocation(line: 418, column: 9, scope: !2630)
!2635 = !DILocation(line: 419, column: 31, scope: !2630)
!2636 = !DILocation(line: 419, column: 13, scope: !2630)
!2637 = !DILocation(line: 419, column: 11, scope: !2630)
!2638 = !DILocation(line: 423, column: 30, scope: !2630)
!2639 = !DILocation(line: 423, column: 35, scope: !2630)
!2640 = !DILocation(line: 423, column: 5, scope: !2630)
!2641 = !DILocation(line: 424, column: 9, scope: !2642)
!2642 = distinct !DILexicalBlock(scope: !2630, file: !298, line: 424, column: 9)
!2643 = !DILocation(line: 424, column: 12, scope: !2642)
!2644 = !DILocation(line: 424, column: 15, scope: !2642)
!2645 = !DILocation(line: 424, column: 20, scope: !2642)
!2646 = !DILocation(line: 424, column: 23, scope: !2642)
!2647 = !DILocation(line: 424, column: 26, scope: !2642)
!2648 = !DILocation(line: 424, column: 29, scope: !2642)
!2649 = !DILocation(line: 424, column: 9, scope: !2630)
!2650 = !DILocation(line: 425, column: 31, scope: !2642)
!2651 = !DILocation(line: 425, column: 34, scope: !2642)
!2652 = !DILocation(line: 425, column: 38, scope: !2642)
!2653 = !DILocation(line: 425, column: 43, scope: !2642)
!2654 = !DILocation(line: 425, column: 11, scope: !2642)
!2655 = !DILocation(line: 425, column: 9, scope: !2642)
!2656 = !DILocation(line: 425, column: 7, scope: !2642)
!2657 = !DILocation(line: 426, column: 37, scope: !2642)
!2658 = !DILocation(line: 426, column: 40, scope: !2642)
!2659 = !DILocation(line: 426, column: 44, scope: !2642)
!2660 = !DILocation(line: 426, column: 49, scope: !2642)
!2661 = !DILocation(line: 426, column: 66, scope: !2642)
!2662 = !DILocation(line: 426, column: 69, scope: !2642)
!2663 = !DILocation(line: 426, column: 14, scope: !2642)
!2664 = !DILocation(line: 426, column: 12, scope: !2642)
!2665 = !DILocation(line: 428, column: 9, scope: !2666)
!2666 = distinct !DILexicalBlock(scope: !2630, file: !298, line: 428, column: 9)
!2667 = !DILocation(line: 428, column: 11, scope: !2666)
!2668 = !DILocation(line: 428, column: 9, scope: !2630)
!2669 = !DILocation(line: 429, column: 7, scope: !2666)
!2670 = !DILocation(line: 431, column: 5, scope: !2671)
!2671 = distinct !DILexicalBlock(scope: !2672, file: !298, line: 431, column: 5)
!2672 = distinct !DILexicalBlock(scope: !2630, file: !298, line: 431, column: 5)
!2673 = !DILocation(line: 431, column: 5, scope: !2672)
!2674 = !DILocation(line: 432, column: 9, scope: !2675)
!2675 = distinct !DILexicalBlock(scope: !2630, file: !298, line: 432, column: 9)
!2676 = !DILocation(line: 432, column: 12, scope: !2675)
!2677 = !DILocation(line: 432, column: 15, scope: !2675)
!2678 = !DILocation(line: 432, column: 20, scope: !2675)
!2679 = !DILocation(line: 432, column: 23, scope: !2675)
!2680 = !DILocation(line: 432, column: 26, scope: !2675)
!2681 = !DILocation(line: 432, column: 29, scope: !2675)
!2682 = !DILocation(line: 432, column: 9, scope: !2630)
!2683 = !DILocation(line: 433, column: 17, scope: !2675)
!2684 = !DILocation(line: 433, column: 7, scope: !2675)
!2685 = !DILocation(line: 433, column: 10, scope: !2675)
!2686 = !DILocation(line: 433, column: 14, scope: !2675)
!2687 = !DILocation(line: 435, column: 12, scope: !2630)
!2688 = !DILocation(line: 435, column: 5, scope: !2630)
!2689 = !DILocalVariable(name: "actual_count", scope: !2690, file: !298, line: 439, type: !383)
!2690 = distinct !DILexicalBlock(scope: !2626, file: !298, line: 437, column: 8)
!2691 = !DILocation(line: 439, column: 12, scope: !2690)
!2692 = !DILocation(line: 440, column: 9, scope: !2693)
!2693 = distinct !DILexicalBlock(scope: !2690, file: !298, line: 440, column: 9)
!2694 = !DILocation(line: 440, column: 12, scope: !2693)
!2695 = !DILocation(line: 440, column: 18, scope: !2693)
!2696 = !DILocation(line: 440, column: 16, scope: !2693)
!2697 = !DILocation(line: 440, column: 27, scope: !2693)
!2698 = !DILocation(line: 440, column: 30, scope: !2693)
!2699 = !DILocation(line: 440, column: 37, scope: !2693)
!2700 = !DILocation(line: 440, column: 24, scope: !2693)
!2701 = !DILocation(line: 440, column: 9, scope: !2690)
!2702 = !DILocation(line: 441, column: 22, scope: !2693)
!2703 = !DILocation(line: 441, column: 20, scope: !2693)
!2704 = !DILocation(line: 441, column: 7, scope: !2693)
!2705 = !DILocation(line: 443, column: 21, scope: !2706)
!2706 = distinct !DILexicalBlock(scope: !2707, file: !298, line: 443, column: 11)
!2707 = distinct !DILexicalBlock(scope: !2693, file: !298, line: 442, column: 10)
!2708 = !DILocation(line: 443, column: 11, scope: !2706)
!2709 = !DILocation(line: 443, column: 11, scope: !2707)
!2710 = !DILocation(line: 444, column: 2, scope: !2711)
!2711 = distinct !DILexicalBlock(scope: !2712, file: !298, line: 444, column: 2)
!2712 = distinct !DILexicalBlock(scope: !2706, file: !298, line: 444, column: 2)
!2713 = !DILocation(line: 446, column: 6, scope: !2714)
!2714 = distinct !DILexicalBlock(scope: !2715, file: !298, line: 446, column: 6)
!2715 = distinct !DILexicalBlock(scope: !2706, file: !298, line: 445, column: 12)
!2716 = !DILocation(line: 446, column: 9, scope: !2714)
!2717 = !DILocation(line: 446, column: 25, scope: !2714)
!2718 = !DILocation(line: 446, column: 28, scope: !2714)
!2719 = !DILocation(line: 446, column: 35, scope: !2714)
!2720 = !DILocation(line: 446, column: 15, scope: !2714)
!2721 = !DILocation(line: 446, column: 13, scope: !2714)
!2722 = !DILocation(line: 446, column: 6, scope: !2715)
!2723 = !DILocation(line: 447, column: 19, scope: !2714)
!2724 = !DILocation(line: 447, column: 22, scope: !2714)
!2725 = !DILocation(line: 447, column: 29, scope: !2714)
!2726 = !DILocation(line: 447, column: 36, scope: !2714)
!2727 = !DILocation(line: 447, column: 39, scope: !2714)
!2728 = !DILocation(line: 447, column: 34, scope: !2714)
!2729 = !DILocation(line: 447, column: 17, scope: !2714)
!2730 = !DILocation(line: 447, column: 4, scope: !2714)
!2731 = !DILocation(line: 451, column: 9, scope: !2732)
!2732 = distinct !DILexicalBlock(scope: !2690, file: !298, line: 451, column: 9)
!2733 = !DILocation(line: 451, column: 9, scope: !2690)
!2734 = !DILocation(line: 452, column: 14, scope: !2732)
!2735 = !DILocation(line: 452, column: 17, scope: !2732)
!2736 = !DILocation(line: 452, column: 24, scope: !2732)
!2737 = !DILocation(line: 452, column: 35, scope: !2732)
!2738 = !DILocation(line: 452, column: 38, scope: !2732)
!2739 = !DILocation(line: 452, column: 33, scope: !2732)
!2740 = !DILocation(line: 452, column: 43, scope: !2732)
!2741 = !DILocation(line: 452, column: 48, scope: !2732)
!2742 = !DILocation(line: 452, column: 7, scope: !2732)
!2743 = !DILocation(line: 454, column: 9, scope: !2744)
!2744 = distinct !DILexicalBlock(scope: !2690, file: !298, line: 454, column: 9)
!2745 = !DILocation(line: 454, column: 18, scope: !2744)
!2746 = !DILocation(line: 454, column: 15, scope: !2744)
!2747 = !DILocation(line: 454, column: 9, scope: !2690)
!2748 = !DILocation(line: 455, column: 7, scope: !2744)
!2749 = !DILocation(line: 457, column: 9, scope: !2750)
!2750 = distinct !DILexicalBlock(scope: !2690, file: !298, line: 457, column: 9)
!2751 = !DILocation(line: 457, column: 12, scope: !2750)
!2752 = !DILocation(line: 457, column: 30, scope: !2750)
!2753 = !DILocation(line: 457, column: 18, scope: !2750)
!2754 = !DILocation(line: 457, column: 9, scope: !2690)
!2755 = !DILocation(line: 458, column: 33, scope: !2750)
!2756 = !DILocation(line: 458, column: 30, scope: !2750)
!2757 = !DILocation(line: 458, column: 7, scope: !2750)
!2758 = !DILocation(line: 460, column: 15, scope: !2690)
!2759 = !DILocation(line: 460, column: 5, scope: !2690)
!2760 = !DILocation(line: 460, column: 8, scope: !2690)
!2761 = !DILocation(line: 460, column: 12, scope: !2690)
!2762 = !DILocation(line: 461, column: 12, scope: !2690)
!2763 = !DILocation(line: 461, column: 5, scope: !2690)
!2764 = !DILocation(line: 463, column: 1, scope: !400)
!2765 = distinct !DISubprogram(name: "__fd_lseek", scope: !298, file: !298, line: 466, type: !2766, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2766 = !DISubroutineType(types: !2767)
!2767 = !{!287, !241, !287, !241}
!2768 = !DILocalVariable(name: "fd", arg: 1, scope: !2765, file: !298, line: 466, type: !241)
!2769 = !DILocation(line: 466, column: 24, scope: !2765)
!2770 = !DILocalVariable(name: "offset", arg: 2, scope: !2765, file: !298, line: 466, type: !287)
!2771 = !DILocation(line: 466, column: 36, scope: !2765)
!2772 = !DILocalVariable(name: "whence", arg: 3, scope: !2765, file: !298, line: 466, type: !241)
!2773 = !DILocation(line: 466, column: 48, scope: !2765)
!2774 = !DILocalVariable(name: "new_off", scope: !2765, file: !298, line: 467, type: !287)
!2775 = !DILocation(line: 467, column: 11, scope: !2765)
!2776 = !DILocalVariable(name: "f", scope: !2765, file: !298, line: 468, type: !1925)
!2777 = !DILocation(line: 468, column: 15, scope: !2765)
!2778 = !DILocation(line: 468, column: 30, scope: !2765)
!2779 = !DILocation(line: 468, column: 19, scope: !2765)
!2780 = !DILocation(line: 470, column: 8, scope: !2781)
!2781 = distinct !DILexicalBlock(scope: !2765, file: !298, line: 470, column: 7)
!2782 = !DILocation(line: 470, column: 7, scope: !2765)
!2783 = !DILocation(line: 471, column: 5, scope: !2784)
!2784 = distinct !DILexicalBlock(scope: !2781, file: !298, line: 470, column: 11)
!2785 = !DILocation(line: 471, column: 11, scope: !2784)
!2786 = !DILocation(line: 472, column: 5, scope: !2784)
!2787 = !DILocation(line: 475, column: 8, scope: !2788)
!2788 = distinct !DILexicalBlock(scope: !2765, file: !298, line: 475, column: 7)
!2789 = !DILocation(line: 475, column: 11, scope: !2788)
!2790 = !DILocation(line: 475, column: 7, scope: !2765)
!2791 = !DILocation(line: 482, column: 9, scope: !2792)
!2792 = distinct !DILexicalBlock(scope: !2793, file: !298, line: 482, column: 9)
!2793 = distinct !DILexicalBlock(scope: !2788, file: !298, line: 475, column: 18)
!2794 = !DILocation(line: 482, column: 16, scope: !2792)
!2795 = !DILocation(line: 482, column: 9, scope: !2793)
!2796 = !DILocation(line: 483, column: 37, scope: !2797)
!2797 = distinct !DILexicalBlock(scope: !2792, file: !298, line: 482, column: 29)
!2798 = !DILocation(line: 483, column: 40, scope: !2797)
!2799 = !DILocation(line: 483, column: 44, scope: !2797)
!2800 = !DILocation(line: 483, column: 17, scope: !2797)
!2801 = !DILocation(line: 483, column: 15, scope: !2797)
!2802 = !DILocation(line: 484, column: 5, scope: !2797)
!2803 = !DILocation(line: 485, column: 37, scope: !2804)
!2804 = distinct !DILexicalBlock(scope: !2792, file: !298, line: 484, column: 12)
!2805 = !DILocation(line: 485, column: 40, scope: !2804)
!2806 = !DILocation(line: 485, column: 44, scope: !2804)
!2807 = !DILocation(line: 485, column: 47, scope: !2804)
!2808 = !DILocation(line: 485, column: 17, scope: !2804)
!2809 = !DILocation(line: 485, column: 15, scope: !2804)
!2810 = !DILocation(line: 489, column: 11, scope: !2811)
!2811 = distinct !DILexicalBlock(scope: !2804, file: !298, line: 489, column: 11)
!2812 = !DILocation(line: 489, column: 19, scope: !2811)
!2813 = !DILocation(line: 489, column: 11, scope: !2804)
!2814 = !DILocation(line: 490, column: 9, scope: !2815)
!2815 = distinct !DILexicalBlock(scope: !2816, file: !298, line: 490, column: 9)
!2816 = distinct !DILexicalBlock(scope: !2817, file: !298, line: 490, column: 9)
!2817 = distinct !DILexicalBlock(scope: !2811, file: !298, line: 489, column: 26)
!2818 = !DILocation(line: 490, column: 9, scope: !2816)
!2819 = !DILocation(line: 491, column: 39, scope: !2817)
!2820 = !DILocation(line: 491, column: 42, scope: !2817)
!2821 = !DILocation(line: 491, column: 46, scope: !2817)
!2822 = !DILocation(line: 491, column: 54, scope: !2817)
!2823 = !DILocation(line: 491, column: 19, scope: !2817)
!2824 = !DILocation(line: 491, column: 17, scope: !2817)
!2825 = !DILocation(line: 492, column: 7, scope: !2817)
!2826 = !DILocation(line: 495, column: 9, scope: !2827)
!2827 = distinct !DILexicalBlock(scope: !2793, file: !298, line: 495, column: 9)
!2828 = !DILocation(line: 495, column: 17, scope: !2827)
!2829 = !DILocation(line: 495, column: 9, scope: !2793)
!2830 = !DILocation(line: 496, column: 7, scope: !2827)
!2831 = !DILocation(line: 498, column: 14, scope: !2793)
!2832 = !DILocation(line: 498, column: 5, scope: !2793)
!2833 = !DILocation(line: 498, column: 8, scope: !2793)
!2834 = !DILocation(line: 498, column: 12, scope: !2793)
!2835 = !DILocation(line: 499, column: 12, scope: !2793)
!2836 = !DILocation(line: 499, column: 5, scope: !2793)
!2837 = !DILocation(line: 502, column: 11, scope: !2765)
!2838 = !DILocation(line: 502, column: 3, scope: !2765)
!2839 = !DILocation(line: 503, column: 28, scope: !2840)
!2840 = distinct !DILexicalBlock(scope: !2765, file: !298, line: 502, column: 19)
!2841 = !DILocation(line: 503, column: 26, scope: !2840)
!2842 = !DILocation(line: 503, column: 36, scope: !2840)
!2843 = !DILocation(line: 504, column: 28, scope: !2840)
!2844 = !DILocation(line: 504, column: 31, scope: !2840)
!2845 = !DILocation(line: 504, column: 37, scope: !2840)
!2846 = !DILocation(line: 504, column: 35, scope: !2840)
!2847 = !DILocation(line: 504, column: 26, scope: !2840)
!2848 = !DILocation(line: 504, column: 45, scope: !2840)
!2849 = !DILocation(line: 505, column: 28, scope: !2840)
!2850 = !DILocation(line: 505, column: 31, scope: !2840)
!2851 = !DILocation(line: 505, column: 38, scope: !2840)
!2852 = !DILocation(line: 505, column: 45, scope: !2840)
!2853 = !DILocation(line: 505, column: 43, scope: !2840)
!2854 = !DILocation(line: 505, column: 26, scope: !2840)
!2855 = !DILocation(line: 505, column: 53, scope: !2840)
!2856 = !DILocation(line: 507, column: 5, scope: !2857)
!2857 = distinct !DILexicalBlock(scope: !2840, file: !298, line: 506, column: 12)
!2858 = !DILocation(line: 507, column: 11, scope: !2857)
!2859 = !DILocation(line: 508, column: 5, scope: !2857)
!2860 = !DILocation(line: 512, column: 7, scope: !2861)
!2861 = distinct !DILexicalBlock(scope: !2765, file: !298, line: 512, column: 7)
!2862 = !DILocation(line: 512, column: 15, scope: !2861)
!2863 = !DILocation(line: 512, column: 7, scope: !2765)
!2864 = !DILocation(line: 513, column: 5, scope: !2865)
!2865 = distinct !DILexicalBlock(scope: !2861, file: !298, line: 512, column: 20)
!2866 = !DILocation(line: 513, column: 11, scope: !2865)
!2867 = !DILocation(line: 514, column: 5, scope: !2865)
!2868 = !DILocation(line: 517, column: 12, scope: !2765)
!2869 = !DILocation(line: 517, column: 3, scope: !2765)
!2870 = !DILocation(line: 517, column: 6, scope: !2765)
!2871 = !DILocation(line: 517, column: 10, scope: !2765)
!2872 = !DILocation(line: 518, column: 10, scope: !2765)
!2873 = !DILocation(line: 518, column: 13, scope: !2765)
!2874 = !DILocation(line: 518, column: 3, scope: !2765)
!2875 = !DILocation(line: 519, column: 1, scope: !2765)
!2876 = distinct !DISubprogram(name: "__fd_stat", scope: !298, file: !298, line: 521, type: !2877, scopeLine: 521, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2877 = !DISubroutineType(types: !2878)
!2878 = !{!241, !437, !1590}
!2879 = !DILocalVariable(name: "path", arg: 1, scope: !2876, file: !298, line: 521, type: !437)
!2880 = !DILocation(line: 521, column: 27, scope: !2876)
!2881 = !DILocalVariable(name: "buf", arg: 2, scope: !2876, file: !298, line: 521, type: !1590)
!2882 = !DILocation(line: 521, column: 48, scope: !2876)
!2883 = !DILocalVariable(name: "dfile", scope: !2876, file: !298, line: 522, type: !1583)
!2884 = !DILocation(line: 522, column: 20, scope: !2876)
!2885 = !DILocation(line: 522, column: 43, scope: !2876)
!2886 = !DILocation(line: 522, column: 28, scope: !2876)
!2887 = !DILocation(line: 523, column: 7, scope: !2888)
!2888 = distinct !DILexicalBlock(scope: !2876, file: !298, line: 523, column: 7)
!2889 = !DILocation(line: 523, column: 7, scope: !2876)
!2890 = !DILocation(line: 524, column: 12, scope: !2891)
!2891 = distinct !DILexicalBlock(scope: !2888, file: !298, line: 523, column: 14)
!2892 = !DILocation(line: 524, column: 17, scope: !2891)
!2893 = !DILocation(line: 524, column: 24, scope: !2891)
!2894 = !DILocation(line: 524, column: 5, scope: !2891)
!2895 = !DILocation(line: 525, column: 5, scope: !2891)
!2896 = !DILocation(line: 530, column: 51, scope: !2897)
!2897 = distinct !DILexicalBlock(scope: !2876, file: !298, line: 528, column: 3)
!2898 = !DILocation(line: 530, column: 31, scope: !2897)
!2899 = !DILocation(line: 530, column: 58, scope: !2897)
!2900 = !DILocation(line: 530, column: 12, scope: !2897)
!2901 = !DILocation(line: 530, column: 5, scope: !2897)
!2902 = !DILocation(line: 535, column: 1, scope: !2876)
!2903 = distinct !DISubprogram(name: "fstatat", scope: !298, file: !298, line: 537, type: !2904, scopeLine: 537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2904 = !DISubroutineType(types: !2905)
!2905 = !{!241, !241, !437, !351, !241}
!2906 = !DILocalVariable(name: "fd", arg: 1, scope: !2903, file: !298, line: 537, type: !241)
!2907 = !DILocation(line: 537, column: 17, scope: !2903)
!2908 = !DILocalVariable(name: "path", arg: 2, scope: !2903, file: !298, line: 537, type: !437)
!2909 = !DILocation(line: 537, column: 33, scope: !2903)
!2910 = !DILocalVariable(name: "buf", arg: 3, scope: !2903, file: !298, line: 537, type: !351)
!2911 = !DILocation(line: 537, column: 52, scope: !2903)
!2912 = !DILocalVariable(name: "flags", arg: 4, scope: !2903, file: !298, line: 537, type: !241)
!2913 = !DILocation(line: 537, column: 61, scope: !2903)
!2914 = !DILocation(line: 538, column: 7, scope: !2915)
!2915 = distinct !DILexicalBlock(scope: !2903, file: !298, line: 538, column: 7)
!2916 = !DILocation(line: 538, column: 10, scope: !2915)
!2917 = !DILocation(line: 538, column: 7, scope: !2903)
!2918 = !DILocalVariable(name: "f", scope: !2919, file: !298, line: 539, type: !1925)
!2919 = distinct !DILexicalBlock(scope: !2915, file: !298, line: 538, column: 23)
!2920 = !DILocation(line: 539, column: 17, scope: !2919)
!2921 = !DILocation(line: 539, column: 32, scope: !2919)
!2922 = !DILocation(line: 539, column: 21, scope: !2919)
!2923 = !DILocation(line: 541, column: 10, scope: !2924)
!2924 = distinct !DILexicalBlock(scope: !2919, file: !298, line: 541, column: 9)
!2925 = !DILocation(line: 541, column: 9, scope: !2919)
!2926 = !DILocation(line: 542, column: 7, scope: !2927)
!2927 = distinct !DILexicalBlock(scope: !2924, file: !298, line: 541, column: 13)
!2928 = !DILocation(line: 542, column: 13, scope: !2927)
!2929 = !DILocation(line: 543, column: 7, scope: !2927)
!2930 = !DILocation(line: 544, column: 16, scope: !2931)
!2931 = distinct !DILexicalBlock(scope: !2924, file: !298, line: 544, column: 16)
!2932 = !DILocation(line: 544, column: 19, scope: !2931)
!2933 = !DILocation(line: 544, column: 16, scope: !2924)
!2934 = !DILocation(line: 545, column: 7, scope: !2935)
!2935 = distinct !DILexicalBlock(scope: !2931, file: !298, line: 544, column: 26)
!2936 = !DILocation(line: 546, column: 7, scope: !2935)
!2937 = !DILocation(line: 546, column: 13, scope: !2935)
!2938 = !DILocation(line: 547, column: 7, scope: !2935)
!2939 = !DILocation(line: 549, column: 10, scope: !2919)
!2940 = !DILocation(line: 549, column: 13, scope: !2919)
!2941 = !DILocation(line: 549, column: 8, scope: !2919)
!2942 = !DILocation(line: 550, column: 3, scope: !2919)
!2943 = !DILocalVariable(name: "dfile", scope: !2903, file: !298, line: 551, type: !1583)
!2944 = !DILocation(line: 551, column: 20, scope: !2903)
!2945 = !DILocation(line: 551, column: 43, scope: !2903)
!2946 = !DILocation(line: 551, column: 28, scope: !2903)
!2947 = !DILocation(line: 552, column: 7, scope: !2948)
!2948 = distinct !DILexicalBlock(scope: !2903, file: !298, line: 552, column: 7)
!2949 = !DILocation(line: 552, column: 7, scope: !2903)
!2950 = !DILocation(line: 553, column: 12, scope: !2951)
!2951 = distinct !DILexicalBlock(scope: !2948, file: !298, line: 552, column: 14)
!2952 = !DILocation(line: 553, column: 17, scope: !2951)
!2953 = !DILocation(line: 553, column: 24, scope: !2951)
!2954 = !DILocation(line: 553, column: 5, scope: !2951)
!2955 = !DILocation(line: 554, column: 5, scope: !2951)
!2956 = !DILocation(line: 560, column: 3, scope: !2957)
!2957 = distinct !DILexicalBlock(scope: !2958, file: !298, line: 560, column: 3)
!2958 = distinct !DILexicalBlock(scope: !2903, file: !298, line: 560, column: 3)
!2959 = !DILocation(line: 560, column: 3, scope: !2958)
!2960 = !DILocation(line: 565, column: 41, scope: !2903)
!2961 = !DILocation(line: 565, column: 35, scope: !2903)
!2962 = !DILocation(line: 565, column: 45, scope: !2903)
!2963 = !DILocation(line: 565, column: 56, scope: !2903)
!2964 = !DILocation(line: 565, column: 67, scope: !2903)
!2965 = !DILocation(line: 565, column: 61, scope: !2903)
!2966 = !DILocation(line: 565, column: 10, scope: !2903)
!2967 = !DILocation(line: 565, column: 3, scope: !2903)
!2968 = !DILocation(line: 570, column: 1, scope: !2903)
!2969 = distinct !DISubprogram(name: "__fd_lstat", scope: !298, file: !298, line: 572, type: !2877, scopeLine: 572, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2970 = !DILocalVariable(name: "path", arg: 1, scope: !2969, file: !298, line: 572, type: !437)
!2971 = !DILocation(line: 572, column: 28, scope: !2969)
!2972 = !DILocalVariable(name: "buf", arg: 2, scope: !2969, file: !298, line: 572, type: !1590)
!2973 = !DILocation(line: 572, column: 49, scope: !2969)
!2974 = !DILocalVariable(name: "dfile", scope: !2969, file: !298, line: 573, type: !1583)
!2975 = !DILocation(line: 573, column: 20, scope: !2969)
!2976 = !DILocation(line: 573, column: 43, scope: !2969)
!2977 = !DILocation(line: 573, column: 28, scope: !2969)
!2978 = !DILocation(line: 574, column: 7, scope: !2979)
!2979 = distinct !DILexicalBlock(scope: !2969, file: !298, line: 574, column: 7)
!2980 = !DILocation(line: 574, column: 7, scope: !2969)
!2981 = !DILocation(line: 575, column: 12, scope: !2982)
!2982 = distinct !DILexicalBlock(scope: !2979, file: !298, line: 574, column: 14)
!2983 = !DILocation(line: 575, column: 17, scope: !2982)
!2984 = !DILocation(line: 575, column: 24, scope: !2982)
!2985 = !DILocation(line: 575, column: 5, scope: !2982)
!2986 = !DILocation(line: 576, column: 5, scope: !2982)
!2987 = !DILocation(line: 581, column: 52, scope: !2988)
!2988 = distinct !DILexicalBlock(scope: !2969, file: !298, line: 579, column: 3)
!2989 = !DILocation(line: 581, column: 32, scope: !2988)
!2990 = !DILocation(line: 581, column: 59, scope: !2988)
!2991 = !DILocation(line: 581, column: 12, scope: !2988)
!2992 = !DILocation(line: 581, column: 5, scope: !2988)
!2993 = !DILocation(line: 586, column: 1, scope: !2969)
!2994 = distinct !DISubprogram(name: "chdir", scope: !298, file: !298, line: 588, type: !2995, scopeLine: 588, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!2995 = !DISubroutineType(types: !2996)
!2996 = !{!241, !437}
!2997 = !DILocalVariable(name: "path", arg: 1, scope: !2994, file: !298, line: 588, type: !437)
!2998 = !DILocation(line: 588, column: 23, scope: !2994)
!2999 = !DILocalVariable(name: "dfile", scope: !2994, file: !298, line: 589, type: !1583)
!3000 = !DILocation(line: 589, column: 20, scope: !2994)
!3001 = !DILocation(line: 589, column: 43, scope: !2994)
!3002 = !DILocation(line: 589, column: 28, scope: !2994)
!3003 = !DILocation(line: 591, column: 7, scope: !3004)
!3004 = distinct !DILexicalBlock(scope: !2994, file: !298, line: 591, column: 7)
!3005 = !DILocation(line: 591, column: 7, scope: !2994)
!3006 = !DILocation(line: 593, column: 5, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !3004, file: !298, line: 591, column: 14)
!3008 = !DILocation(line: 594, column: 5, scope: !3007)
!3009 = !DILocation(line: 594, column: 11, scope: !3007)
!3010 = !DILocation(line: 595, column: 5, scope: !3007)
!3011 = !DILocation(line: 598, column: 50, scope: !2994)
!3012 = !DILocation(line: 598, column: 30, scope: !2994)
!3013 = !DILocation(line: 598, column: 10, scope: !2994)
!3014 = !DILocation(line: 598, column: 3, scope: !2994)
!3015 = !DILocation(line: 599, column: 1, scope: !2994)
!3016 = distinct !DISubprogram(name: "fchdir", scope: !298, file: !298, line: 601, type: !312, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3017 = !DILocalVariable(name: "fd", arg: 1, scope: !3016, file: !298, line: 601, type: !241)
!3018 = !DILocation(line: 601, column: 16, scope: !3016)
!3019 = !DILocalVariable(name: "f", scope: !3016, file: !298, line: 602, type: !1925)
!3020 = !DILocation(line: 602, column: 15, scope: !3016)
!3021 = !DILocation(line: 602, column: 30, scope: !3016)
!3022 = !DILocation(line: 602, column: 19, scope: !3016)
!3023 = !DILocation(line: 604, column: 8, scope: !3024)
!3024 = distinct !DILexicalBlock(scope: !3016, file: !298, line: 604, column: 7)
!3025 = !DILocation(line: 604, column: 7, scope: !3016)
!3026 = !DILocation(line: 605, column: 5, scope: !3027)
!3027 = distinct !DILexicalBlock(scope: !3024, file: !298, line: 604, column: 11)
!3028 = !DILocation(line: 605, column: 11, scope: !3027)
!3029 = !DILocation(line: 606, column: 5, scope: !3027)
!3030 = !DILocation(line: 609, column: 7, scope: !3031)
!3031 = distinct !DILexicalBlock(scope: !3016, file: !298, line: 609, column: 7)
!3032 = !DILocation(line: 609, column: 10, scope: !3031)
!3033 = !DILocation(line: 609, column: 7, scope: !3016)
!3034 = !DILocation(line: 610, column: 5, scope: !3035)
!3035 = distinct !DILexicalBlock(scope: !3031, file: !298, line: 609, column: 17)
!3036 = !DILocation(line: 611, column: 5, scope: !3035)
!3037 = !DILocation(line: 611, column: 11, scope: !3035)
!3038 = !DILocation(line: 612, column: 5, scope: !3035)
!3039 = !DILocation(line: 615, column: 31, scope: !3016)
!3040 = !DILocation(line: 615, column: 34, scope: !3016)
!3041 = !DILocation(line: 615, column: 10, scope: !3016)
!3042 = !DILocation(line: 615, column: 3, scope: !3016)
!3043 = !DILocation(line: 616, column: 1, scope: !3016)
!3044 = !DILocalVariable(name: "path", arg: 1, scope: !434, file: !298, line: 632, type: !437)
!3045 = !DILocation(line: 632, column: 23, scope: !434)
!3046 = !DILocalVariable(name: "mode", arg: 2, scope: !434, file: !298, line: 632, type: !294)
!3047 = !DILocation(line: 632, column: 36, scope: !434)
!3048 = !DILocalVariable(name: "dfile", scope: !434, file: !298, line: 635, type: !1583)
!3049 = !DILocation(line: 635, column: 20, scope: !434)
!3050 = !DILocation(line: 635, column: 43, scope: !434)
!3051 = !DILocation(line: 635, column: 28, scope: !434)
!3052 = !DILocation(line: 637, column: 10, scope: !434)
!3053 = !DILocation(line: 638, column: 16, scope: !3054)
!3054 = distinct !DILexicalBlock(scope: !434, file: !298, line: 638, column: 7)
!3055 = !DILocation(line: 638, column: 7, scope: !3054)
!3056 = !DILocation(line: 638, column: 29, scope: !3054)
!3057 = !DILocation(line: 638, column: 42, scope: !3054)
!3058 = !DILocation(line: 638, column: 32, scope: !3054)
!3059 = !DILocation(line: 638, column: 56, scope: !3054)
!3060 = !DILocation(line: 638, column: 53, scope: !3054)
!3061 = !DILocation(line: 638, column: 7, scope: !434)
!3062 = !DILocation(line: 639, column: 26, scope: !3063)
!3063 = distinct !DILexicalBlock(scope: !3054, file: !298, line: 638, column: 65)
!3064 = !DILocation(line: 640, column: 5, scope: !3063)
!3065 = !DILocation(line: 640, column: 11, scope: !3063)
!3066 = !DILocation(line: 641, column: 5, scope: !3063)
!3067 = !DILocation(line: 644, column: 7, scope: !3068)
!3068 = distinct !DILexicalBlock(scope: !434, file: !298, line: 644, column: 7)
!3069 = !DILocation(line: 644, column: 7, scope: !434)
!3070 = !DILocation(line: 645, column: 23, scope: !3071)
!3071 = distinct !DILexicalBlock(scope: !3068, file: !298, line: 644, column: 14)
!3072 = !DILocation(line: 645, column: 30, scope: !3071)
!3073 = !DILocation(line: 645, column: 12, scope: !3071)
!3074 = !DILocation(line: 645, column: 5, scope: !3071)
!3075 = !DILocation(line: 648, column: 50, scope: !434)
!3076 = !DILocation(line: 648, column: 30, scope: !434)
!3077 = !DILocation(line: 648, column: 57, scope: !434)
!3078 = !DILocation(line: 648, column: 10, scope: !434)
!3079 = !DILocation(line: 648, column: 3, scope: !434)
!3080 = !DILocation(line: 649, column: 1, scope: !434)
!3081 = distinct !DISubprogram(name: "__df_chmod", scope: !298, file: !298, line: 619, type: !3082, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3082 = !DISubroutineType(types: !3083)
!3083 = !{!241, !1583, !294}
!3084 = !DILocalVariable(name: "df", arg: 1, scope: !3081, file: !298, line: 619, type: !1583)
!3085 = !DILocation(line: 619, column: 40, scope: !3081)
!3086 = !DILocalVariable(name: "mode", arg: 2, scope: !3081, file: !298, line: 619, type: !294)
!3087 = !DILocation(line: 619, column: 51, scope: !3081)
!3088 = !DILocation(line: 620, column: 7, scope: !3089)
!3089 = distinct !DILexicalBlock(scope: !3081, file: !298, line: 620, column: 7)
!3090 = !DILocation(line: 620, column: 20, scope: !3089)
!3091 = !DILocation(line: 620, column: 24, scope: !3089)
!3092 = !DILocation(line: 620, column: 30, scope: !3089)
!3093 = !DILocation(line: 620, column: 17, scope: !3089)
!3094 = !DILocation(line: 620, column: 7, scope: !3081)
!3095 = !DILocation(line: 621, column: 9, scope: !3096)
!3096 = distinct !DILexicalBlock(scope: !3097, file: !298, line: 621, column: 9)
!3097 = distinct !DILexicalBlock(scope: !3089, file: !298, line: 620, column: 38)
!3098 = !DILocation(line: 621, column: 21, scope: !3096)
!3099 = !DILocation(line: 621, column: 25, scope: !3096)
!3100 = !DILocation(line: 621, column: 31, scope: !3096)
!3101 = !DILocation(line: 621, column: 18, scope: !3096)
!3102 = !DILocation(line: 621, column: 9, scope: !3097)
!3103 = !DILocation(line: 622, column: 12, scope: !3096)
!3104 = !DILocation(line: 622, column: 7, scope: !3096)
!3105 = !DILocation(line: 623, column: 27, scope: !3097)
!3106 = !DILocation(line: 623, column: 31, scope: !3097)
!3107 = !DILocation(line: 623, column: 37, scope: !3097)
!3108 = !DILocation(line: 623, column: 45, scope: !3097)
!3109 = !DILocation(line: 624, column: 27, scope: !3097)
!3110 = !DILocation(line: 624, column: 32, scope: !3097)
!3111 = !DILocation(line: 623, column: 55, scope: !3097)
!3112 = !DILocation(line: 623, column: 5, scope: !3097)
!3113 = !DILocation(line: 623, column: 9, scope: !3097)
!3114 = !DILocation(line: 623, column: 15, scope: !3097)
!3115 = !DILocation(line: 623, column: 23, scope: !3097)
!3116 = !DILocation(line: 625, column: 5, scope: !3097)
!3117 = !DILocation(line: 627, column: 5, scope: !3118)
!3118 = distinct !DILexicalBlock(scope: !3089, file: !298, line: 626, column: 10)
!3119 = !DILocation(line: 627, column: 11, scope: !3118)
!3120 = !DILocation(line: 628, column: 5, scope: !3118)
!3121 = !DILocation(line: 630, column: 1, scope: !3081)
!3122 = !DILocalVariable(name: "fd", arg: 1, scope: !440, file: !298, line: 651, type: !241)
!3123 = !DILocation(line: 651, column: 16, scope: !440)
!3124 = !DILocalVariable(name: "mode", arg: 2, scope: !440, file: !298, line: 651, type: !294)
!3125 = !DILocation(line: 651, column: 27, scope: !440)
!3126 = !DILocalVariable(name: "f", scope: !440, file: !298, line: 654, type: !1925)
!3127 = !DILocation(line: 654, column: 15, scope: !440)
!3128 = !DILocation(line: 654, column: 30, scope: !440)
!3129 = !DILocation(line: 654, column: 19, scope: !440)
!3130 = !DILocation(line: 656, column: 8, scope: !3131)
!3131 = distinct !DILexicalBlock(scope: !440, file: !298, line: 656, column: 7)
!3132 = !DILocation(line: 656, column: 7, scope: !440)
!3133 = !DILocation(line: 657, column: 5, scope: !3134)
!3134 = distinct !DILexicalBlock(scope: !3131, file: !298, line: 656, column: 11)
!3135 = !DILocation(line: 657, column: 11, scope: !3134)
!3136 = !DILocation(line: 658, column: 5, scope: !3134)
!3137 = !DILocation(line: 661, column: 10, scope: !440)
!3138 = !DILocation(line: 662, column: 16, scope: !3139)
!3139 = distinct !DILexicalBlock(scope: !440, file: !298, line: 662, column: 7)
!3140 = !DILocation(line: 662, column: 7, scope: !3139)
!3141 = !DILocation(line: 662, column: 29, scope: !3139)
!3142 = !DILocation(line: 662, column: 42, scope: !3139)
!3143 = !DILocation(line: 662, column: 32, scope: !3139)
!3144 = !DILocation(line: 662, column: 57, scope: !3139)
!3145 = !DILocation(line: 662, column: 54, scope: !3139)
!3146 = !DILocation(line: 662, column: 7, scope: !440)
!3147 = !DILocation(line: 663, column: 26, scope: !3148)
!3148 = distinct !DILexicalBlock(scope: !3139, file: !298, line: 662, column: 66)
!3149 = !DILocation(line: 664, column: 5, scope: !3148)
!3150 = !DILocation(line: 664, column: 11, scope: !3148)
!3151 = !DILocation(line: 665, column: 5, scope: !3148)
!3152 = !DILocation(line: 668, column: 7, scope: !3153)
!3153 = distinct !DILexicalBlock(scope: !440, file: !298, line: 668, column: 7)
!3154 = !DILocation(line: 668, column: 10, scope: !3153)
!3155 = !DILocation(line: 668, column: 7, scope: !440)
!3156 = !DILocation(line: 669, column: 23, scope: !3157)
!3157 = distinct !DILexicalBlock(scope: !3153, file: !298, line: 668, column: 17)
!3158 = !DILocation(line: 669, column: 26, scope: !3157)
!3159 = !DILocation(line: 669, column: 33, scope: !3157)
!3160 = !DILocation(line: 669, column: 12, scope: !3157)
!3161 = !DILocation(line: 669, column: 5, scope: !3157)
!3162 = !DILocation(line: 672, column: 31, scope: !440)
!3163 = !DILocation(line: 672, column: 34, scope: !440)
!3164 = !DILocation(line: 672, column: 38, scope: !440)
!3165 = !DILocation(line: 672, column: 10, scope: !440)
!3166 = !DILocation(line: 672, column: 3, scope: !440)
!3167 = !DILocation(line: 673, column: 1, scope: !440)
!3168 = distinct !DISubprogram(name: "chown", scope: !298, file: !298, line: 681, type: !3169, scopeLine: 681, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3169 = !DISubroutineType(types: !3170)
!3170 = !{!241, !437, !3171, !3172}
!3171 = !DIDerivedType(tag: DW_TAG_typedef, name: "uid_t", file: !288, line: 79, baseType: !237)
!3172 = !DIDerivedType(tag: DW_TAG_typedef, name: "gid_t", file: !288, line: 64, baseType: !239)
!3173 = !DILocalVariable(name: "path", arg: 1, scope: !3168, file: !298, line: 681, type: !437)
!3174 = !DILocation(line: 681, column: 23, scope: !3168)
!3175 = !DILocalVariable(name: "owner", arg: 2, scope: !3168, file: !298, line: 681, type: !3171)
!3176 = !DILocation(line: 681, column: 35, scope: !3168)
!3177 = !DILocalVariable(name: "group", arg: 3, scope: !3168, file: !298, line: 681, type: !3172)
!3178 = !DILocation(line: 681, column: 48, scope: !3168)
!3179 = !DILocalVariable(name: "df", scope: !3168, file: !298, line: 682, type: !1583)
!3180 = !DILocation(line: 682, column: 20, scope: !3168)
!3181 = !DILocation(line: 682, column: 40, scope: !3168)
!3182 = !DILocation(line: 682, column: 25, scope: !3168)
!3183 = !DILocation(line: 684, column: 7, scope: !3184)
!3184 = distinct !DILexicalBlock(scope: !3168, file: !298, line: 684, column: 7)
!3185 = !DILocation(line: 684, column: 7, scope: !3168)
!3186 = !DILocation(line: 685, column: 23, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3184, file: !298, line: 684, column: 11)
!3188 = !DILocation(line: 685, column: 27, scope: !3187)
!3189 = !DILocation(line: 685, column: 34, scope: !3187)
!3190 = !DILocation(line: 685, column: 12, scope: !3187)
!3191 = !DILocation(line: 685, column: 5, scope: !3187)
!3192 = !DILocation(line: 688, column: 50, scope: !3168)
!3193 = !DILocation(line: 688, column: 30, scope: !3168)
!3194 = !DILocation(line: 688, column: 57, scope: !3168)
!3195 = !DILocation(line: 688, column: 64, scope: !3168)
!3196 = !DILocation(line: 688, column: 10, scope: !3168)
!3197 = !DILocation(line: 688, column: 3, scope: !3168)
!3198 = !DILocation(line: 689, column: 1, scope: !3168)
!3199 = distinct !DISubprogram(name: "__df_chown", scope: !298, file: !298, line: 675, type: !3200, scopeLine: 675, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3200 = !DISubroutineType(types: !3201)
!3201 = !{!241, !1583, !3171, !3172}
!3202 = !DILocalVariable(name: "df", arg: 1, scope: !3199, file: !298, line: 675, type: !1583)
!3203 = !DILocation(line: 675, column: 40, scope: !3199)
!3204 = !DILocalVariable(name: "owner", arg: 2, scope: !3199, file: !298, line: 675, type: !3171)
!3205 = !DILocation(line: 675, column: 50, scope: !3199)
!3206 = !DILocalVariable(name: "group", arg: 3, scope: !3199, file: !298, line: 675, type: !3172)
!3207 = !DILocation(line: 675, column: 63, scope: !3199)
!3208 = !DILocation(line: 676, column: 3, scope: !3199)
!3209 = !DILocation(line: 677, column: 3, scope: !3199)
!3210 = !DILocation(line: 677, column: 9, scope: !3199)
!3211 = !DILocation(line: 678, column: 3, scope: !3199)
!3212 = distinct !DISubprogram(name: "fchown", scope: !298, file: !298, line: 691, type: !3213, scopeLine: 691, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3213 = !DISubroutineType(types: !3214)
!3214 = !{!241, !241, !3171, !3172}
!3215 = !DILocalVariable(name: "fd", arg: 1, scope: !3212, file: !298, line: 691, type: !241)
!3216 = !DILocation(line: 691, column: 16, scope: !3212)
!3217 = !DILocalVariable(name: "owner", arg: 2, scope: !3212, file: !298, line: 691, type: !3171)
!3218 = !DILocation(line: 691, column: 26, scope: !3212)
!3219 = !DILocalVariable(name: "group", arg: 3, scope: !3212, file: !298, line: 691, type: !3172)
!3220 = !DILocation(line: 691, column: 39, scope: !3212)
!3221 = !DILocalVariable(name: "f", scope: !3212, file: !298, line: 692, type: !1925)
!3222 = !DILocation(line: 692, column: 15, scope: !3212)
!3223 = !DILocation(line: 692, column: 30, scope: !3212)
!3224 = !DILocation(line: 692, column: 19, scope: !3212)
!3225 = !DILocation(line: 694, column: 8, scope: !3226)
!3226 = distinct !DILexicalBlock(scope: !3212, file: !298, line: 694, column: 7)
!3227 = !DILocation(line: 694, column: 7, scope: !3212)
!3228 = !DILocation(line: 695, column: 5, scope: !3229)
!3229 = distinct !DILexicalBlock(scope: !3226, file: !298, line: 694, column: 11)
!3230 = !DILocation(line: 695, column: 11, scope: !3229)
!3231 = !DILocation(line: 696, column: 5, scope: !3229)
!3232 = !DILocation(line: 699, column: 7, scope: !3233)
!3233 = distinct !DILexicalBlock(scope: !3212, file: !298, line: 699, column: 7)
!3234 = !DILocation(line: 699, column: 10, scope: !3233)
!3235 = !DILocation(line: 699, column: 7, scope: !3212)
!3236 = !DILocation(line: 700, column: 23, scope: !3237)
!3237 = distinct !DILexicalBlock(scope: !3233, file: !298, line: 699, column: 17)
!3238 = !DILocation(line: 700, column: 26, scope: !3237)
!3239 = !DILocation(line: 700, column: 33, scope: !3237)
!3240 = !DILocation(line: 700, column: 40, scope: !3237)
!3241 = !DILocation(line: 700, column: 12, scope: !3237)
!3242 = !DILocation(line: 700, column: 5, scope: !3237)
!3243 = !DILocation(line: 703, column: 31, scope: !3212)
!3244 = !DILocation(line: 703, column: 35, scope: !3212)
!3245 = !DILocation(line: 703, column: 42, scope: !3212)
!3246 = !DILocation(line: 703, column: 10, scope: !3212)
!3247 = !DILocation(line: 703, column: 3, scope: !3212)
!3248 = !DILocation(line: 704, column: 1, scope: !3212)
!3249 = distinct !DISubprogram(name: "lchown", scope: !298, file: !298, line: 706, type: !3169, scopeLine: 706, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3250 = !DILocalVariable(name: "path", arg: 1, scope: !3249, file: !298, line: 706, type: !437)
!3251 = !DILocation(line: 706, column: 24, scope: !3249)
!3252 = !DILocalVariable(name: "owner", arg: 2, scope: !3249, file: !298, line: 706, type: !3171)
!3253 = !DILocation(line: 706, column: 36, scope: !3249)
!3254 = !DILocalVariable(name: "group", arg: 3, scope: !3249, file: !298, line: 706, type: !3172)
!3255 = !DILocation(line: 706, column: 49, scope: !3249)
!3256 = !DILocalVariable(name: "df", scope: !3249, file: !298, line: 708, type: !1583)
!3257 = !DILocation(line: 708, column: 20, scope: !3249)
!3258 = !DILocation(line: 708, column: 40, scope: !3249)
!3259 = !DILocation(line: 708, column: 25, scope: !3249)
!3260 = !DILocation(line: 710, column: 7, scope: !3261)
!3261 = distinct !DILexicalBlock(scope: !3249, file: !298, line: 710, column: 7)
!3262 = !DILocation(line: 710, column: 7, scope: !3249)
!3263 = !DILocation(line: 711, column: 23, scope: !3264)
!3264 = distinct !DILexicalBlock(scope: !3261, file: !298, line: 710, column: 11)
!3265 = !DILocation(line: 711, column: 27, scope: !3264)
!3266 = !DILocation(line: 711, column: 34, scope: !3264)
!3267 = !DILocation(line: 711, column: 12, scope: !3264)
!3268 = !DILocation(line: 711, column: 5, scope: !3264)
!3269 = !DILocation(line: 714, column: 50, scope: !3249)
!3270 = !DILocation(line: 714, column: 30, scope: !3249)
!3271 = !DILocation(line: 714, column: 57, scope: !3249)
!3272 = !DILocation(line: 714, column: 64, scope: !3249)
!3273 = !DILocation(line: 714, column: 10, scope: !3249)
!3274 = !DILocation(line: 714, column: 3, scope: !3249)
!3275 = !DILocation(line: 715, column: 1, scope: !3249)
!3276 = distinct !DISubprogram(name: "__fd_fstat", scope: !298, file: !298, line: 717, type: !2086, scopeLine: 717, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3277 = !DILocalVariable(name: "fd", arg: 1, scope: !3276, file: !298, line: 717, type: !241)
!3278 = !DILocation(line: 717, column: 20, scope: !3276)
!3279 = !DILocalVariable(name: "buf", arg: 2, scope: !3276, file: !298, line: 717, type: !1590)
!3280 = !DILocation(line: 717, column: 39, scope: !3276)
!3281 = !DILocalVariable(name: "f", scope: !3276, file: !298, line: 718, type: !1925)
!3282 = !DILocation(line: 718, column: 15, scope: !3276)
!3283 = !DILocation(line: 718, column: 30, scope: !3276)
!3284 = !DILocation(line: 718, column: 19, scope: !3276)
!3285 = !DILocation(line: 720, column: 8, scope: !3286)
!3286 = distinct !DILexicalBlock(scope: !3276, file: !298, line: 720, column: 7)
!3287 = !DILocation(line: 720, column: 7, scope: !3276)
!3288 = !DILocation(line: 721, column: 5, scope: !3289)
!3289 = distinct !DILexicalBlock(scope: !3286, file: !298, line: 720, column: 11)
!3290 = !DILocation(line: 721, column: 11, scope: !3289)
!3291 = !DILocation(line: 722, column: 5, scope: !3289)
!3292 = !DILocation(line: 725, column: 8, scope: !3293)
!3293 = distinct !DILexicalBlock(scope: !3276, file: !298, line: 725, column: 7)
!3294 = !DILocation(line: 725, column: 11, scope: !3293)
!3295 = !DILocation(line: 725, column: 7, scope: !3276)
!3296 = !DILocation(line: 727, column: 32, scope: !3297)
!3297 = distinct !DILexicalBlock(scope: !3293, file: !298, line: 725, column: 18)
!3298 = !DILocation(line: 727, column: 35, scope: !3297)
!3299 = !DILocation(line: 727, column: 39, scope: !3297)
!3300 = !DILocation(line: 727, column: 12, scope: !3297)
!3301 = !DILocation(line: 727, column: 5, scope: !3297)
!3302 = !DILocation(line: 733, column: 10, scope: !3276)
!3303 = !DILocation(line: 733, column: 15, scope: !3276)
!3304 = !DILocation(line: 733, column: 18, scope: !3276)
!3305 = !DILocation(line: 733, column: 25, scope: !3276)
!3306 = !DILocation(line: 733, column: 3, scope: !3276)
!3307 = !DILocation(line: 734, column: 3, scope: !3276)
!3308 = !DILocation(line: 735, column: 1, scope: !3276)
!3309 = !DILocalVariable(name: "fd", arg: 1, scope: !445, file: !298, line: 737, type: !241)
!3310 = !DILocation(line: 737, column: 24, scope: !445)
!3311 = !DILocalVariable(name: "length", arg: 2, scope: !445, file: !298, line: 737, type: !287)
!3312 = !DILocation(line: 737, column: 36, scope: !445)
!3313 = !DILocalVariable(name: "f", scope: !445, file: !298, line: 739, type: !1925)
!3314 = !DILocation(line: 739, column: 15, scope: !445)
!3315 = !DILocation(line: 739, column: 30, scope: !445)
!3316 = !DILocation(line: 739, column: 19, scope: !445)
!3317 = !DILocation(line: 741, column: 10, scope: !445)
!3318 = !DILocation(line: 743, column: 8, scope: !3319)
!3319 = distinct !DILexicalBlock(scope: !445, file: !298, line: 743, column: 7)
!3320 = !DILocation(line: 743, column: 7, scope: !445)
!3321 = !DILocation(line: 744, column: 5, scope: !3322)
!3322 = distinct !DILexicalBlock(scope: !3319, file: !298, line: 743, column: 11)
!3323 = !DILocation(line: 744, column: 11, scope: !3322)
!3324 = !DILocation(line: 745, column: 5, scope: !3322)
!3325 = !DILocation(line: 748, column: 16, scope: !3326)
!3326 = distinct !DILexicalBlock(scope: !445, file: !298, line: 748, column: 7)
!3327 = !DILocation(line: 748, column: 7, scope: !3326)
!3328 = !DILocation(line: 748, column: 29, scope: !3326)
!3329 = !DILocation(line: 748, column: 42, scope: !3326)
!3330 = !DILocation(line: 748, column: 32, scope: !3326)
!3331 = !DILocation(line: 748, column: 60, scope: !3326)
!3332 = !DILocation(line: 748, column: 57, scope: !3326)
!3333 = !DILocation(line: 748, column: 7, scope: !445)
!3334 = !DILocation(line: 749, column: 26, scope: !3335)
!3335 = distinct !DILexicalBlock(scope: !3326, file: !298, line: 748, column: 69)
!3336 = !DILocation(line: 750, column: 5, scope: !3335)
!3337 = !DILocation(line: 750, column: 11, scope: !3335)
!3338 = !DILocation(line: 751, column: 5, scope: !3335)
!3339 = !DILocation(line: 754, column: 7, scope: !3340)
!3340 = distinct !DILexicalBlock(scope: !445, file: !298, line: 754, column: 7)
!3341 = !DILocation(line: 754, column: 10, scope: !3340)
!3342 = !DILocation(line: 754, column: 7, scope: !445)
!3343 = !DILocation(line: 755, column: 5, scope: !3344)
!3344 = distinct !DILexicalBlock(scope: !3340, file: !298, line: 754, column: 17)
!3345 = !DILocation(line: 756, column: 5, scope: !3344)
!3346 = !DILocation(line: 756, column: 11, scope: !3344)
!3347 = !DILocation(line: 757, column: 5, scope: !3344)
!3348 = !DILocation(line: 760, column: 34, scope: !445)
!3349 = !DILocation(line: 760, column: 37, scope: !445)
!3350 = !DILocation(line: 760, column: 41, scope: !445)
!3351 = !DILocation(line: 760, column: 10, scope: !445)
!3352 = !DILocation(line: 760, column: 3, scope: !445)
!3353 = !DILocation(line: 764, column: 1, scope: !445)
!3354 = distinct !DISubprogram(name: "__fd_getdents", scope: !298, file: !298, line: 766, type: !3355, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3355 = !DISubroutineType(types: !3356)
!3356 = !{!241, !212, !337, !212}
!3357 = !DILocalVariable(name: "fd", arg: 1, scope: !3354, file: !298, line: 766, type: !212)
!3358 = !DILocation(line: 766, column: 32, scope: !3354)
!3359 = !DILocalVariable(name: "dirp", arg: 2, scope: !3354, file: !298, line: 766, type: !337)
!3360 = !DILocation(line: 766, column: 53, scope: !3354)
!3361 = !DILocalVariable(name: "count", arg: 3, scope: !3354, file: !298, line: 766, type: !212)
!3362 = !DILocation(line: 766, column: 72, scope: !3354)
!3363 = !DILocalVariable(name: "f", scope: !3354, file: !298, line: 767, type: !1925)
!3364 = !DILocation(line: 767, column: 15, scope: !3354)
!3365 = !DILocation(line: 767, column: 30, scope: !3354)
!3366 = !DILocation(line: 767, column: 19, scope: !3354)
!3367 = !DILocation(line: 769, column: 8, scope: !3368)
!3368 = distinct !DILexicalBlock(scope: !3354, file: !298, line: 769, column: 7)
!3369 = !DILocation(line: 769, column: 7, scope: !3354)
!3370 = !DILocation(line: 770, column: 5, scope: !3371)
!3371 = distinct !DILexicalBlock(scope: !3368, file: !298, line: 769, column: 11)
!3372 = !DILocation(line: 770, column: 11, scope: !3371)
!3373 = !DILocation(line: 771, column: 5, scope: !3371)
!3374 = !DILocation(line: 774, column: 7, scope: !3375)
!3375 = distinct !DILexicalBlock(scope: !3354, file: !298, line: 774, column: 7)
!3376 = !DILocation(line: 774, column: 10, scope: !3375)
!3377 = !DILocation(line: 774, column: 7, scope: !3354)
!3378 = !DILocation(line: 775, column: 5, scope: !3379)
!3379 = distinct !DILexicalBlock(scope: !3375, file: !298, line: 774, column: 17)
!3380 = !DILocation(line: 776, column: 5, scope: !3379)
!3381 = !DILocation(line: 776, column: 11, scope: !3379)
!3382 = !DILocation(line: 777, column: 5, scope: !3379)
!3383 = !DILocation(line: 779, column: 25, scope: !3384)
!3384 = distinct !DILexicalBlock(scope: !3385, file: !298, line: 779, column: 9)
!3385 = distinct !DILexicalBlock(scope: !3375, file: !298, line: 778, column: 10)
!3386 = !DILocation(line: 779, column: 28, scope: !3384)
!3387 = !DILocation(line: 779, column: 32, scope: !3384)
!3388 = !DILocation(line: 779, column: 9, scope: !3385)
!3389 = !DILocalVariable(name: "i", scope: !3390, file: !298, line: 781, type: !287)
!3390 = distinct !DILexicalBlock(scope: !3384, file: !298, line: 779, column: 41)
!3391 = !DILocation(line: 781, column: 15, scope: !3390)
!3392 = !DILocalVariable(name: "pad", scope: !3390, file: !298, line: 781, type: !287)
!3393 = !DILocation(line: 781, column: 18, scope: !3390)
!3394 = !DILocalVariable(name: "bytes", scope: !3390, file: !298, line: 781, type: !287)
!3395 = !DILocation(line: 781, column: 23, scope: !3390)
!3396 = !DILocation(line: 784, column: 11, scope: !3390)
!3397 = !DILocation(line: 784, column: 14, scope: !3390)
!3398 = !DILocation(line: 784, column: 18, scope: !3390)
!3399 = !DILocation(line: 784, column: 9, scope: !3390)
!3400 = !DILocation(line: 785, column: 23, scope: !3401)
!3401 = distinct !DILexicalBlock(scope: !3390, file: !298, line: 785, column: 11)
!3402 = !DILocation(line: 785, column: 25, scope: !3401)
!3403 = !DILocation(line: 785, column: 45, scope: !3401)
!3404 = !DILocation(line: 785, column: 48, scope: !3401)
!3405 = !DILocation(line: 785, column: 42, scope: !3401)
!3406 = !DILocation(line: 785, column: 53, scope: !3401)
!3407 = !DILocation(line: 786, column: 11, scope: !3401)
!3408 = !DILocation(line: 786, column: 24, scope: !3401)
!3409 = !DILocation(line: 786, column: 15, scope: !3401)
!3410 = !DILocation(line: 786, column: 13, scope: !3401)
!3411 = !DILocation(line: 785, column: 11, scope: !3390)
!3412 = !DILocation(line: 787, column: 9, scope: !3413)
!3413 = distinct !DILexicalBlock(scope: !3401, file: !298, line: 786, column: 37)
!3414 = !DILocation(line: 787, column: 15, scope: !3413)
!3415 = !DILocation(line: 788, column: 9, scope: !3413)
!3416 = !DILocation(line: 790, column: 14, scope: !3417)
!3417 = distinct !DILexicalBlock(scope: !3418, file: !298, line: 790, column: 7)
!3418 = distinct !DILexicalBlock(scope: !3390, file: !298, line: 790, column: 7)
!3419 = !DILocation(line: 790, column: 25, scope: !3417)
!3420 = !DILocation(line: 790, column: 16, scope: !3417)
!3421 = !DILocation(line: 790, column: 15, scope: !3417)
!3422 = !DILocation(line: 790, column: 7, scope: !3418)
!3423 = !DILocalVariable(name: "df", scope: !3424, file: !298, line: 791, type: !1583)
!3424 = distinct !DILexicalBlock(scope: !3417, file: !298, line: 790, column: 43)
!3425 = !DILocation(line: 791, column: 26, scope: !3424)
!3426 = !DILocation(line: 791, column: 41, scope: !3424)
!3427 = !DILocation(line: 791, column: 51, scope: !3424)
!3428 = !DILocation(line: 791, column: 32, scope: !3424)
!3429 = !DILocation(line: 792, column: 23, scope: !3424)
!3430 = !DILocation(line: 792, column: 27, scope: !3424)
!3431 = !DILocation(line: 792, column: 33, scope: !3424)
!3432 = !DILocation(line: 792, column: 9, scope: !3424)
!3433 = !DILocation(line: 792, column: 15, scope: !3424)
!3434 = !DILocation(line: 792, column: 21, scope: !3424)
!3435 = !DILocation(line: 793, column: 9, scope: !3424)
!3436 = !DILocation(line: 793, column: 15, scope: !3424)
!3437 = !DILocation(line: 793, column: 24, scope: !3424)
!3438 = !DILocation(line: 794, column: 24, scope: !3424)
!3439 = !DILocation(line: 794, column: 9, scope: !3424)
!3440 = !DILocation(line: 794, column: 15, scope: !3424)
!3441 = !DILocation(line: 794, column: 22, scope: !3424)
!3442 = !DILocation(line: 795, column: 33, scope: !3424)
!3443 = !DILocation(line: 795, column: 31, scope: !3424)
!3444 = !DILocation(line: 795, column: 27, scope: !3424)
!3445 = !DILocation(line: 795, column: 9, scope: !3424)
!3446 = !DILocation(line: 795, column: 15, scope: !3424)
!3447 = !DILocation(line: 795, column: 25, scope: !3424)
!3448 = !DILocation(line: 796, column: 9, scope: !3424)
!3449 = !DILocation(line: 796, column: 15, scope: !3424)
!3450 = !DILocation(line: 796, column: 25, scope: !3424)
!3451 = !DILocation(line: 798, column: 24, scope: !3424)
!3452 = !DILocation(line: 798, column: 25, scope: !3424)
!3453 = !DILocation(line: 798, column: 29, scope: !3424)
!3454 = !DILocation(line: 798, column: 9, scope: !3424)
!3455 = !DILocation(line: 798, column: 15, scope: !3424)
!3456 = !DILocation(line: 798, column: 21, scope: !3424)
!3457 = !DILocation(line: 800, column: 18, scope: !3424)
!3458 = !DILocation(line: 800, column: 24, scope: !3424)
!3459 = !DILocation(line: 800, column: 15, scope: !3424)
!3460 = !DILocation(line: 801, column: 9, scope: !3424)
!3461 = !DILocation(line: 790, column: 38, scope: !3417)
!3462 = !DILocation(line: 790, column: 7, scope: !3417)
!3463 = distinct !{!3463, !3422, !3464}
!3464 = !DILocation(line: 802, column: 7, scope: !3418)
!3465 = !DILocation(line: 805, column: 13, scope: !3390)
!3466 = !DILocation(line: 805, column: 18, scope: !3390)
!3467 = !DILocation(line: 805, column: 11, scope: !3390)
!3468 = !DILocation(line: 806, column: 7, scope: !3390)
!3469 = !DILocation(line: 806, column: 13, scope: !3390)
!3470 = !DILocation(line: 806, column: 19, scope: !3390)
!3471 = !DILocation(line: 807, column: 24, scope: !3390)
!3472 = !DILocation(line: 807, column: 30, scope: !3390)
!3473 = !DILocation(line: 807, column: 28, scope: !3390)
!3474 = !DILocation(line: 807, column: 7, scope: !3390)
!3475 = !DILocation(line: 807, column: 13, scope: !3390)
!3476 = !DILocation(line: 807, column: 22, scope: !3390)
!3477 = !DILocation(line: 808, column: 7, scope: !3390)
!3478 = !DILocation(line: 808, column: 13, scope: !3390)
!3479 = !DILocation(line: 808, column: 20, scope: !3390)
!3480 = !DILocation(line: 809, column: 7, scope: !3390)
!3481 = !DILocation(line: 809, column: 13, scope: !3390)
!3482 = !DILocation(line: 809, column: 23, scope: !3390)
!3483 = !DILocation(line: 811, column: 7, scope: !3390)
!3484 = !DILocation(line: 811, column: 13, scope: !3390)
!3485 = !DILocation(line: 811, column: 19, scope: !3390)
!3486 = !DILocation(line: 813, column: 16, scope: !3390)
!3487 = !DILocation(line: 813, column: 22, scope: !3390)
!3488 = !DILocation(line: 813, column: 13, scope: !3390)
!3489 = !DILocation(line: 814, column: 16, scope: !3390)
!3490 = !DILocation(line: 814, column: 7, scope: !3390)
!3491 = !DILocation(line: 814, column: 10, scope: !3390)
!3492 = !DILocation(line: 814, column: 14, scope: !3390)
!3493 = !DILocation(line: 816, column: 14, scope: !3390)
!3494 = !DILocation(line: 816, column: 7, scope: !3390)
!3495 = !DILocalVariable(name: "os_pos", scope: !3496, file: !298, line: 818, type: !287)
!3496 = distinct !DILexicalBlock(scope: !3384, file: !298, line: 817, column: 12)
!3497 = !DILocation(line: 818, column: 15, scope: !3496)
!3498 = !DILocation(line: 818, column: 24, scope: !3496)
!3499 = !DILocation(line: 818, column: 27, scope: !3496)
!3500 = !DILocation(line: 818, column: 31, scope: !3496)
!3501 = !DILocation(line: 827, column: 14, scope: !3496)
!3502 = !DILocation(line: 827, column: 23, scope: !3496)
!3503 = !DILocation(line: 827, column: 7, scope: !3496)
!3504 = !DILocalVariable(name: "s", scope: !3496, file: !298, line: 828, type: !287)
!3505 = !DILocation(line: 828, column: 15, scope: !3496)
!3506 = !DILocation(line: 828, column: 39, scope: !3496)
!3507 = !DILocation(line: 828, column: 42, scope: !3496)
!3508 = !DILocation(line: 828, column: 46, scope: !3496)
!3509 = !DILocation(line: 828, column: 19, scope: !3496)
!3510 = !DILocation(line: 829, column: 13, scope: !3496)
!3511 = !DILocation(line: 830, column: 7, scope: !3512)
!3512 = distinct !DILexicalBlock(scope: !3513, file: !298, line: 830, column: 7)
!3513 = distinct !DILexicalBlock(scope: !3496, file: !298, line: 830, column: 7)
!3514 = !DILocation(line: 830, column: 7, scope: !3513)
!3515 = !DILocalVariable(name: "res", scope: !3496, file: !298, line: 831, type: !241)
!3516 = !DILocation(line: 831, column: 11, scope: !3496)
!3517 = !DILocation(line: 831, column: 42, scope: !3496)
!3518 = !DILocation(line: 831, column: 45, scope: !3496)
!3519 = !DILocation(line: 831, column: 49, scope: !3496)
!3520 = !DILocation(line: 831, column: 55, scope: !3496)
!3521 = !DILocation(line: 831, column: 17, scope: !3496)
!3522 = !DILocation(line: 832, column: 11, scope: !3523)
!3523 = distinct !DILexicalBlock(scope: !3496, file: !298, line: 832, column: 11)
!3524 = !DILocation(line: 832, column: 15, scope: !3523)
!3525 = !DILocation(line: 832, column: 11, scope: !3496)
!3526 = !DILocalVariable(name: "pos", scope: !3527, file: !298, line: 833, type: !241)
!3527 = distinct !DILexicalBlock(scope: !3523, file: !298, line: 832, column: 21)
!3528 = !DILocation(line: 833, column: 13, scope: !3527)
!3529 = !DILocation(line: 834, column: 38, scope: !3527)
!3530 = !DILocation(line: 834, column: 41, scope: !3527)
!3531 = !DILocation(line: 834, column: 18, scope: !3527)
!3532 = !DILocation(line: 834, column: 9, scope: !3527)
!3533 = !DILocation(line: 834, column: 12, scope: !3527)
!3534 = !DILocation(line: 834, column: 16, scope: !3527)
!3535 = !DILocation(line: 835, column: 9, scope: !3536)
!3536 = distinct !DILexicalBlock(scope: !3537, file: !298, line: 835, column: 9)
!3537 = distinct !DILexicalBlock(scope: !3527, file: !298, line: 835, column: 9)
!3538 = !DILocation(line: 835, column: 9, scope: !3537)
!3539 = !DILocation(line: 836, column: 9, scope: !3527)
!3540 = !DILocation(line: 836, column: 12, scope: !3527)
!3541 = !DILocation(line: 836, column: 16, scope: !3527)
!3542 = !DILocation(line: 839, column: 9, scope: !3527)
!3543 = !DILocation(line: 839, column: 16, scope: !3527)
!3544 = !DILocation(line: 839, column: 22, scope: !3527)
!3545 = !DILocation(line: 839, column: 20, scope: !3527)
!3546 = !DILocalVariable(name: "dp", scope: !3547, file: !298, line: 840, type: !337)
!3547 = distinct !DILexicalBlock(scope: !3527, file: !298, line: 839, column: 27)
!3548 = !DILocation(line: 840, column: 28, scope: !3547)
!3549 = !DILocation(line: 840, column: 61, scope: !3547)
!3550 = !DILocation(line: 840, column: 68, scope: !3547)
!3551 = !DILocation(line: 840, column: 66, scope: !3547)
!3552 = !DILocation(line: 842, column: 11, scope: !3547)
!3553 = !DILocation(line: 842, column: 15, scope: !3547)
!3554 = !DILocation(line: 842, column: 21, scope: !3547)
!3555 = !DILocation(line: 844, column: 18, scope: !3547)
!3556 = !DILocation(line: 844, column: 22, scope: !3547)
!3557 = !DILocation(line: 844, column: 15, scope: !3547)
!3558 = distinct !{!3558, !3542, !3559}
!3559 = !DILocation(line: 845, column: 9, scope: !3527)
!3560 = !DILocation(line: 847, column: 14, scope: !3496)
!3561 = !DILocation(line: 847, column: 7, scope: !3496)
!3562 = !DILocation(line: 850, column: 1, scope: !3354)
!3563 = distinct !DISubprogram(name: "ioctl", scope: !298, file: !298, line: 853, type: !3564, scopeLine: 853, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3564 = !DISubroutineType(types: !3565)
!3565 = !{!241, !241, !229, null}
!3566 = !DILocalVariable(name: "fd", arg: 1, scope: !3563, file: !298, line: 853, type: !241)
!3567 = !DILocation(line: 853, column: 15, scope: !3563)
!3568 = !DILocalVariable(name: "request", arg: 2, scope: !3563, file: !298, line: 853, type: !229)
!3569 = !DILocation(line: 853, column: 37, scope: !3563)
!3570 = !DILocalVariable(name: "f", scope: !3563, file: !298, line: 857, type: !1925)
!3571 = !DILocation(line: 857, column: 15, scope: !3563)
!3572 = !DILocation(line: 857, column: 30, scope: !3563)
!3573 = !DILocation(line: 857, column: 19, scope: !3563)
!3574 = !DILocalVariable(name: "ap", scope: !3563, file: !298, line: 858, type: !3575)
!3575 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !3576, line: 52, baseType: !3577)
!3576 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!3577 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !3578, line: 14, baseType: !3579)
!3578 = !DIFile(filename: "llvm-160-install_O_D_A/lib/clang/16/include/stdarg.h", directory: "/tmp", checksumkind: CSK_MD5, checksum: "4c819f80dd915987182e9ab226e27a5a")
!3579 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !3580, baseType: !3581)
!3580 = !DIFile(filename: "klee_src/runtime/POSIX/fd.c", directory: "/tmp")
!3581 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3582, size: 192, elements: !3588)
!3582 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !3583)
!3583 = !{!3584, !3585, !3586, !3587}
!3584 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !3582, file: !3580, line: 858, baseType: !212, size: 32)
!3585 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !3582, file: !3580, line: 858, baseType: !212, size: 32, offset: 32)
!3586 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !3582, file: !3580, line: 858, baseType: !336, size: 64, offset: 64)
!3587 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !3582, file: !3580, line: 858, baseType: !336, size: 64, offset: 128)
!3588 = !{!3589}
!3589 = !DISubrange(count: 1)
!3590 = !DILocation(line: 858, column: 11, scope: !3563)
!3591 = !DILocalVariable(name: "buf", scope: !3563, file: !298, line: 859, type: !336)
!3592 = !DILocation(line: 859, column: 9, scope: !3563)
!3593 = !DILocation(line: 865, column: 8, scope: !3594)
!3594 = distinct !DILexicalBlock(scope: !3563, file: !298, line: 865, column: 7)
!3595 = !DILocation(line: 865, column: 7, scope: !3563)
!3596 = !DILocation(line: 866, column: 5, scope: !3597)
!3597 = distinct !DILexicalBlock(scope: !3594, file: !298, line: 865, column: 11)
!3598 = !DILocation(line: 866, column: 11, scope: !3597)
!3599 = !DILocation(line: 867, column: 5, scope: !3597)
!3600 = !DILocation(line: 870, column: 3, scope: !3563)
!3601 = !DILocation(line: 871, column: 9, scope: !3563)
!3602 = !DILocation(line: 871, column: 7, scope: !3563)
!3603 = !DILocation(line: 872, column: 3, scope: !3563)
!3604 = !DILocation(line: 873, column: 7, scope: !3605)
!3605 = distinct !DILexicalBlock(scope: !3563, file: !298, line: 873, column: 7)
!3606 = !DILocation(line: 873, column: 10, scope: !3605)
!3607 = !DILocation(line: 873, column: 7, scope: !3563)
!3608 = !DILocalVariable(name: "stat", scope: !3609, file: !298, line: 874, type: !351)
!3609 = distinct !DILexicalBlock(scope: !3605, file: !298, line: 873, column: 17)
!3610 = !DILocation(line: 874, column: 18, scope: !3609)
!3611 = !DILocation(line: 874, column: 40, scope: !3609)
!3612 = !DILocation(line: 874, column: 43, scope: !3609)
!3613 = !DILocation(line: 874, column: 50, scope: !3609)
!3614 = !DILocation(line: 876, column: 13, scope: !3609)
!3615 = !DILocation(line: 876, column: 5, scope: !3609)
!3616 = !DILocalVariable(name: "ts", scope: !3617, file: !298, line: 878, type: !3619)
!3617 = distinct !DILexicalBlock(scope: !3618, file: !298, line: 877, column: 18)
!3618 = distinct !DILexicalBlock(scope: !3609, file: !298, line: 876, column: 22)
!3619 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3620, size: 64)
!3620 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "termios", file: !3621, line: 24, size: 480, elements: !3622)
!3621 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/termios-struct.h", directory: "", checksumkind: CSK_MD5, checksum: "a512dc8866a1d12d70982670557f907e")
!3622 = !{!3623, !3626, !3627, !3628, !3629, !3631, !3633, !3635}
!3623 = !DIDerivedType(tag: DW_TAG_member, name: "c_iflag", scope: !3620, file: !3621, line: 26, baseType: !3624, size: 32)
!3624 = !DIDerivedType(tag: DW_TAG_typedef, name: "tcflag_t", file: !3625, line: 25, baseType: !212)
!3625 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/termios.h", directory: "", checksumkind: CSK_MD5, checksum: "8fb85635ee384e33fd6386ce833e946a")
!3626 = !DIDerivedType(tag: DW_TAG_member, name: "c_oflag", scope: !3620, file: !3621, line: 27, baseType: !3624, size: 32, offset: 32)
!3627 = !DIDerivedType(tag: DW_TAG_member, name: "c_cflag", scope: !3620, file: !3621, line: 28, baseType: !3624, size: 32, offset: 64)
!3628 = !DIDerivedType(tag: DW_TAG_member, name: "c_lflag", scope: !3620, file: !3621, line: 29, baseType: !3624, size: 32, offset: 96)
!3629 = !DIDerivedType(tag: DW_TAG_member, name: "c_line", scope: !3620, file: !3621, line: 30, baseType: !3630, size: 8, offset: 128)
!3630 = !DIDerivedType(tag: DW_TAG_typedef, name: "cc_t", file: !3625, line: 23, baseType: !346)
!3631 = !DIDerivedType(tag: DW_TAG_member, name: "c_cc", scope: !3620, file: !3621, line: 31, baseType: !3632, size: 256, offset: 136)
!3632 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3630, size: 256, elements: !291)
!3633 = !DIDerivedType(tag: DW_TAG_member, name: "c_ispeed", scope: !3620, file: !3621, line: 32, baseType: !3634, size: 32, offset: 416)
!3634 = !DIDerivedType(tag: DW_TAG_typedef, name: "speed_t", file: !3625, line: 24, baseType: !212)
!3635 = !DIDerivedType(tag: DW_TAG_member, name: "c_ospeed", scope: !3620, file: !3621, line: 33, baseType: !3634, size: 32, offset: 448)
!3636 = !DILocation(line: 878, column: 23, scope: !3617)
!3637 = !DILocation(line: 878, column: 28, scope: !3617)
!3638 = !DILocation(line: 880, column: 7, scope: !3617)
!3639 = !DILocation(line: 883, column: 11, scope: !3640)
!3640 = distinct !DILexicalBlock(scope: !3617, file: !298, line: 883, column: 11)
!3641 = !DILocation(line: 883, column: 11, scope: !3617)
!3642 = !DILocation(line: 886, column: 9, scope: !3643)
!3643 = distinct !DILexicalBlock(scope: !3640, file: !298, line: 883, column: 35)
!3644 = !DILocation(line: 886, column: 13, scope: !3643)
!3645 = !DILocation(line: 886, column: 21, scope: !3643)
!3646 = !DILocation(line: 887, column: 9, scope: !3643)
!3647 = !DILocation(line: 887, column: 13, scope: !3643)
!3648 = !DILocation(line: 887, column: 21, scope: !3643)
!3649 = !DILocation(line: 888, column: 9, scope: !3643)
!3650 = !DILocation(line: 888, column: 13, scope: !3643)
!3651 = !DILocation(line: 888, column: 21, scope: !3643)
!3652 = !DILocation(line: 889, column: 9, scope: !3643)
!3653 = !DILocation(line: 889, column: 13, scope: !3643)
!3654 = !DILocation(line: 889, column: 21, scope: !3643)
!3655 = !DILocation(line: 891, column: 9, scope: !3643)
!3656 = !DILocation(line: 891, column: 13, scope: !3643)
!3657 = !DILocation(line: 891, column: 20, scope: !3643)
!3658 = !DILocation(line: 893, column: 9, scope: !3643)
!3659 = !DILocation(line: 893, column: 13, scope: !3643)
!3660 = !DILocation(line: 893, column: 21, scope: !3643)
!3661 = !DILocation(line: 894, column: 9, scope: !3643)
!3662 = !DILocation(line: 894, column: 13, scope: !3643)
!3663 = !DILocation(line: 894, column: 21, scope: !3643)
!3664 = !DILocation(line: 895, column: 9, scope: !3643)
!3665 = !DILocation(line: 895, column: 13, scope: !3643)
!3666 = !DILocation(line: 895, column: 21, scope: !3643)
!3667 = !DILocation(line: 896, column: 9, scope: !3643)
!3668 = !DILocation(line: 896, column: 13, scope: !3643)
!3669 = !DILocation(line: 896, column: 21, scope: !3643)
!3670 = !DILocation(line: 897, column: 9, scope: !3643)
!3671 = !DILocation(line: 897, column: 13, scope: !3643)
!3672 = !DILocation(line: 897, column: 21, scope: !3643)
!3673 = !DILocation(line: 898, column: 9, scope: !3643)
!3674 = !DILocation(line: 898, column: 13, scope: !3643)
!3675 = !DILocation(line: 898, column: 21, scope: !3643)
!3676 = !DILocation(line: 899, column: 9, scope: !3643)
!3677 = !DILocation(line: 899, column: 13, scope: !3643)
!3678 = !DILocation(line: 899, column: 21, scope: !3643)
!3679 = !DILocation(line: 900, column: 9, scope: !3643)
!3680 = !DILocation(line: 900, column: 13, scope: !3643)
!3681 = !DILocation(line: 900, column: 21, scope: !3643)
!3682 = !DILocation(line: 901, column: 9, scope: !3643)
!3683 = !DILocation(line: 901, column: 13, scope: !3643)
!3684 = !DILocation(line: 901, column: 21, scope: !3643)
!3685 = !DILocation(line: 902, column: 9, scope: !3643)
!3686 = !DILocation(line: 902, column: 13, scope: !3643)
!3687 = !DILocation(line: 902, column: 21, scope: !3643)
!3688 = !DILocation(line: 903, column: 9, scope: !3643)
!3689 = !DILocation(line: 903, column: 13, scope: !3643)
!3690 = !DILocation(line: 903, column: 22, scope: !3643)
!3691 = !DILocation(line: 904, column: 9, scope: !3643)
!3692 = !DILocation(line: 904, column: 13, scope: !3643)
!3693 = !DILocation(line: 904, column: 22, scope: !3643)
!3694 = !DILocation(line: 905, column: 9, scope: !3643)
!3695 = !DILocation(line: 905, column: 13, scope: !3643)
!3696 = !DILocation(line: 905, column: 22, scope: !3643)
!3697 = !DILocation(line: 906, column: 9, scope: !3643)
!3698 = !DILocation(line: 906, column: 13, scope: !3643)
!3699 = !DILocation(line: 906, column: 22, scope: !3643)
!3700 = !DILocation(line: 907, column: 9, scope: !3643)
!3701 = !DILocation(line: 907, column: 13, scope: !3643)
!3702 = !DILocation(line: 907, column: 22, scope: !3643)
!3703 = !DILocation(line: 908, column: 9, scope: !3643)
!3704 = !DILocation(line: 908, column: 13, scope: !3643)
!3705 = !DILocation(line: 908, column: 22, scope: !3643)
!3706 = !DILocation(line: 909, column: 9, scope: !3643)
!3707 = !DILocation(line: 909, column: 13, scope: !3643)
!3708 = !DILocation(line: 909, column: 22, scope: !3643)
!3709 = !DILocation(line: 910, column: 9, scope: !3643)
!3710 = !DILocation(line: 910, column: 13, scope: !3643)
!3711 = !DILocation(line: 910, column: 22, scope: !3643)
!3712 = !DILocation(line: 911, column: 9, scope: !3643)
!3713 = !DILocation(line: 911, column: 13, scope: !3643)
!3714 = !DILocation(line: 911, column: 22, scope: !3643)
!3715 = !DILocation(line: 912, column: 9, scope: !3643)
!3716 = !DILocation(line: 914, column: 9, scope: !3717)
!3717 = distinct !DILexicalBlock(scope: !3640, file: !298, line: 913, column: 14)
!3718 = !DILocation(line: 914, column: 15, scope: !3717)
!3719 = !DILocation(line: 915, column: 9, scope: !3717)
!3720 = !DILocation(line: 920, column: 7, scope: !3721)
!3721 = distinct !DILexicalBlock(scope: !3618, file: !298, line: 918, column: 18)
!3722 = !DILocation(line: 921, column: 11, scope: !3723)
!3723 = distinct !DILexicalBlock(scope: !3721, file: !298, line: 921, column: 11)
!3724 = !DILocation(line: 921, column: 11, scope: !3721)
!3725 = !DILocation(line: 922, column: 9, scope: !3726)
!3726 = distinct !DILexicalBlock(scope: !3723, file: !298, line: 921, column: 35)
!3727 = !DILocation(line: 924, column: 9, scope: !3728)
!3728 = distinct !DILexicalBlock(scope: !3723, file: !298, line: 923, column: 14)
!3729 = !DILocation(line: 924, column: 15, scope: !3728)
!3730 = !DILocation(line: 925, column: 9, scope: !3728)
!3731 = !DILocation(line: 930, column: 7, scope: !3732)
!3732 = distinct !DILexicalBlock(scope: !3618, file: !298, line: 928, column: 19)
!3733 = !DILocation(line: 931, column: 11, scope: !3734)
!3734 = distinct !DILexicalBlock(scope: !3732, file: !298, line: 931, column: 11)
!3735 = !DILocation(line: 931, column: 13, scope: !3734)
!3736 = !DILocation(line: 931, column: 11, scope: !3732)
!3737 = !DILocation(line: 932, column: 9, scope: !3738)
!3738 = distinct !DILexicalBlock(scope: !3734, file: !298, line: 931, column: 18)
!3739 = !DILocation(line: 934, column: 9, scope: !3740)
!3740 = distinct !DILexicalBlock(scope: !3734, file: !298, line: 933, column: 14)
!3741 = !DILocation(line: 934, column: 15, scope: !3740)
!3742 = !DILocation(line: 935, column: 9, scope: !3740)
!3743 = !DILocation(line: 940, column: 7, scope: !3744)
!3744 = distinct !DILexicalBlock(scope: !3618, file: !298, line: 938, column: 19)
!3745 = !DILocation(line: 941, column: 11, scope: !3746)
!3746 = distinct !DILexicalBlock(scope: !3744, file: !298, line: 941, column: 11)
!3747 = !DILocation(line: 941, column: 11, scope: !3744)
!3748 = !DILocation(line: 942, column: 9, scope: !3749)
!3749 = distinct !DILexicalBlock(scope: !3746, file: !298, line: 941, column: 35)
!3750 = !DILocation(line: 944, column: 9, scope: !3751)
!3751 = distinct !DILexicalBlock(scope: !3746, file: !298, line: 943, column: 14)
!3752 = !DILocation(line: 944, column: 15, scope: !3751)
!3753 = !DILocation(line: 945, column: 9, scope: !3751)
!3754 = !DILocalVariable(name: "ws", scope: !3755, file: !298, line: 949, type: !3756)
!3755 = distinct !DILexicalBlock(scope: !3618, file: !298, line: 948, column: 22)
!3756 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3757, size: 64)
!3757 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "winsize", file: !3758, line: 27, size: 64, elements: !3759)
!3758 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", directory: "", checksumkind: CSK_MD5, checksum: "9c5f7d5180137ced2d76aeb981aa912b")
!3759 = !{!3760, !3761, !3762, !3763}
!3760 = !DIDerivedType(tag: DW_TAG_member, name: "ws_row", scope: !3757, file: !3758, line: 29, baseType: !344, size: 16)
!3761 = !DIDerivedType(tag: DW_TAG_member, name: "ws_col", scope: !3757, file: !3758, line: 30, baseType: !344, size: 16, offset: 16)
!3762 = !DIDerivedType(tag: DW_TAG_member, name: "ws_xpixel", scope: !3757, file: !3758, line: 31, baseType: !344, size: 16, offset: 32)
!3763 = !DIDerivedType(tag: DW_TAG_member, name: "ws_ypixel", scope: !3757, file: !3758, line: 32, baseType: !344, size: 16, offset: 48)
!3764 = !DILocation(line: 949, column: 23, scope: !3755)
!3765 = !DILocation(line: 949, column: 28, scope: !3755)
!3766 = !DILocation(line: 950, column: 7, scope: !3755)
!3767 = !DILocation(line: 950, column: 11, scope: !3755)
!3768 = !DILocation(line: 950, column: 18, scope: !3755)
!3769 = !DILocation(line: 951, column: 7, scope: !3755)
!3770 = !DILocation(line: 951, column: 11, scope: !3755)
!3771 = !DILocation(line: 951, column: 18, scope: !3755)
!3772 = !DILocation(line: 952, column: 7, scope: !3755)
!3773 = !DILocation(line: 953, column: 11, scope: !3774)
!3774 = distinct !DILexicalBlock(scope: !3755, file: !298, line: 953, column: 11)
!3775 = !DILocation(line: 953, column: 11, scope: !3755)
!3776 = !DILocation(line: 954, column: 9, scope: !3777)
!3777 = distinct !DILexicalBlock(scope: !3774, file: !298, line: 953, column: 35)
!3778 = !DILocation(line: 956, column: 9, scope: !3779)
!3779 = distinct !DILexicalBlock(scope: !3774, file: !298, line: 955, column: 14)
!3780 = !DILocation(line: 956, column: 15, scope: !3779)
!3781 = !DILocation(line: 957, column: 9, scope: !3779)
!3782 = !DILocation(line: 962, column: 7, scope: !3783)
!3783 = distinct !DILexicalBlock(scope: !3618, file: !298, line: 960, column: 22)
!3784 = !DILocation(line: 963, column: 11, scope: !3785)
!3785 = distinct !DILexicalBlock(scope: !3783, file: !298, line: 963, column: 11)
!3786 = !DILocation(line: 963, column: 11, scope: !3783)
!3787 = !DILocation(line: 964, column: 9, scope: !3788)
!3788 = distinct !DILexicalBlock(scope: !3785, file: !298, line: 963, column: 35)
!3789 = !DILocation(line: 964, column: 15, scope: !3788)
!3790 = !DILocation(line: 965, column: 9, scope: !3788)
!3791 = !DILocation(line: 967, column: 9, scope: !3792)
!3792 = distinct !DILexicalBlock(scope: !3785, file: !298, line: 966, column: 14)
!3793 = !DILocation(line: 967, column: 15, scope: !3792)
!3794 = !DILocation(line: 968, column: 9, scope: !3792)
!3795 = !DILocalVariable(name: "res", scope: !3796, file: !298, line: 972, type: !269)
!3796 = distinct !DILexicalBlock(scope: !3618, file: !298, line: 971, column: 20)
!3797 = !DILocation(line: 972, column: 12, scope: !3796)
!3798 = !DILocation(line: 972, column: 18, scope: !3796)
!3799 = !DILocation(line: 973, column: 7, scope: !3796)
!3800 = !DILocation(line: 974, column: 11, scope: !3801)
!3801 = distinct !DILexicalBlock(scope: !3796, file: !298, line: 974, column: 11)
!3802 = !DILocation(line: 974, column: 11, scope: !3796)
!3803 = !DILocation(line: 975, column: 13, scope: !3804)
!3804 = distinct !DILexicalBlock(scope: !3805, file: !298, line: 975, column: 13)
!3805 = distinct !DILexicalBlock(scope: !3801, file: !298, line: 974, column: 35)
!3806 = !DILocation(line: 975, column: 16, scope: !3804)
!3807 = !DILocation(line: 975, column: 32, scope: !3804)
!3808 = !DILocation(line: 975, column: 35, scope: !3804)
!3809 = !DILocation(line: 975, column: 42, scope: !3804)
!3810 = !DILocation(line: 975, column: 22, scope: !3804)
!3811 = !DILocation(line: 975, column: 20, scope: !3804)
!3812 = !DILocation(line: 975, column: 13, scope: !3805)
!3813 = !DILocation(line: 976, column: 18, scope: !3814)
!3814 = distinct !DILexicalBlock(scope: !3804, file: !298, line: 975, column: 48)
!3815 = !DILocation(line: 976, column: 21, scope: !3814)
!3816 = !DILocation(line: 976, column: 28, scope: !3814)
!3817 = !DILocation(line: 976, column: 35, scope: !3814)
!3818 = !DILocation(line: 976, column: 38, scope: !3814)
!3819 = !DILocation(line: 976, column: 33, scope: !3814)
!3820 = !DILocation(line: 976, column: 12, scope: !3814)
!3821 = !DILocation(line: 976, column: 16, scope: !3814)
!3822 = !DILocation(line: 977, column: 9, scope: !3814)
!3823 = !DILocation(line: 978, column: 12, scope: !3824)
!3824 = distinct !DILexicalBlock(scope: !3804, file: !298, line: 977, column: 16)
!3825 = !DILocation(line: 978, column: 16, scope: !3824)
!3826 = !DILocation(line: 980, column: 9, scope: !3805)
!3827 = !DILocation(line: 982, column: 9, scope: !3828)
!3828 = distinct !DILexicalBlock(scope: !3801, file: !298, line: 981, column: 14)
!3829 = !DILocation(line: 982, column: 15, scope: !3828)
!3830 = !DILocation(line: 983, column: 9, scope: !3828)
!3831 = !DILocation(line: 987, column: 7, scope: !3832)
!3832 = distinct !DILexicalBlock(scope: !3618, file: !298, line: 986, column: 20)
!3833 = !DILocation(line: 988, column: 7, scope: !3832)
!3834 = !DILocation(line: 988, column: 13, scope: !3832)
!3835 = !DILocation(line: 989, column: 7, scope: !3832)
!3836 = !DILocation(line: 992, column: 7, scope: !3618)
!3837 = !DILocation(line: 993, column: 7, scope: !3618)
!3838 = !DILocation(line: 993, column: 13, scope: !3618)
!3839 = !DILocation(line: 994, column: 7, scope: !3618)
!3840 = !DILocation(line: 997, column: 30, scope: !3563)
!3841 = !DILocation(line: 997, column: 33, scope: !3563)
!3842 = !DILocation(line: 997, column: 37, scope: !3563)
!3843 = !DILocation(line: 997, column: 46, scope: !3563)
!3844 = !DILocation(line: 997, column: 10, scope: !3563)
!3845 = !DILocation(line: 997, column: 3, scope: !3563)
!3846 = !DILocation(line: 998, column: 1, scope: !3563)
!3847 = distinct !DISubprogram(name: "fcntl", scope: !298, file: !298, line: 1000, type: !3848, scopeLine: 1000, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3848 = !DISubroutineType(types: !3849)
!3849 = !{!241, !241, !241, null}
!3850 = !DILocalVariable(name: "fd", arg: 1, scope: !3847, file: !298, line: 1000, type: !241)
!3851 = !DILocation(line: 1000, column: 15, scope: !3847)
!3852 = !DILocalVariable(name: "cmd", arg: 2, scope: !3847, file: !298, line: 1000, type: !241)
!3853 = !DILocation(line: 1000, column: 23, scope: !3847)
!3854 = !DILocalVariable(name: "f", scope: !3847, file: !298, line: 1001, type: !1925)
!3855 = !DILocation(line: 1001, column: 15, scope: !3847)
!3856 = !DILocation(line: 1001, column: 30, scope: !3847)
!3857 = !DILocation(line: 1001, column: 19, scope: !3847)
!3858 = !DILocalVariable(name: "ap", scope: !3847, file: !298, line: 1002, type: !3575)
!3859 = !DILocation(line: 1002, column: 11, scope: !3847)
!3860 = !DILocalVariable(name: "arg", scope: !3847, file: !298, line: 1003, type: !212)
!3861 = !DILocation(line: 1003, column: 12, scope: !3847)
!3862 = !DILocalVariable(name: "lock", scope: !3847, file: !298, line: 1004, type: !3863)
!3863 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3864, size: 64)
!3864 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flock", file: !3865, line: 35, size: 256, elements: !3866)
!3865 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/fcntl.h", directory: "", checksumkind: CSK_MD5, checksum: "3ed8466d7581e54a3f782dda83e77be7")
!3866 = !{!3867, !3869, !3870, !3871, !3872}
!3867 = !DIDerivedType(tag: DW_TAG_member, name: "l_type", scope: !3864, file: !3865, line: 37, baseType: !3868, size: 16)
!3868 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!3869 = !DIDerivedType(tag: DW_TAG_member, name: "l_whence", scope: !3864, file: !3865, line: 38, baseType: !3868, size: 16, offset: 16)
!3870 = !DIDerivedType(tag: DW_TAG_member, name: "l_start", scope: !3864, file: !3865, line: 40, baseType: !244, size: 64, offset: 64)
!3871 = !DIDerivedType(tag: DW_TAG_member, name: "l_len", scope: !3864, file: !3865, line: 41, baseType: !244, size: 64, offset: 128)
!3872 = !DIDerivedType(tag: DW_TAG_member, name: "l_pid", scope: !3864, file: !3865, line: 46, baseType: !3873, size: 32, offset: 192)
!3873 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pid_t", file: !228, line: 154, baseType: !241)
!3874 = !DILocation(line: 1004, column: 17, scope: !3847)
!3875 = !DILocation(line: 1006, column: 8, scope: !3876)
!3876 = distinct !DILexicalBlock(scope: !3847, file: !298, line: 1006, column: 7)
!3877 = !DILocation(line: 1006, column: 7, scope: !3847)
!3878 = !DILocation(line: 1007, column: 5, scope: !3879)
!3879 = distinct !DILexicalBlock(scope: !3876, file: !298, line: 1006, column: 11)
!3880 = !DILocation(line: 1007, column: 11, scope: !3879)
!3881 = !DILocation(line: 1008, column: 5, scope: !3879)
!3882 = !DILocation(line: 1011, column: 7, scope: !3883)
!3883 = distinct !DILexicalBlock(scope: !3847, file: !298, line: 1011, column: 7)
!3884 = !DILocation(line: 1011, column: 10, scope: !3883)
!3885 = !DILocation(line: 1011, column: 20, scope: !3883)
!3886 = !DILocation(line: 1016, column: 9, scope: !3887)
!3887 = distinct !DILexicalBlock(scope: !3883, file: !298, line: 1012, column: 41)
!3888 = !DILocation(line: 1017, column: 3, scope: !3887)
!3889 = !DILocation(line: 1017, column: 14, scope: !3890)
!3890 = distinct !DILexicalBlock(scope: !3883, file: !298, line: 1017, column: 14)
!3891 = !DILocation(line: 1017, column: 18, scope: !3890)
!3892 = !DILocation(line: 1017, column: 29, scope: !3890)
!3893 = !DILocation(line: 1018, column: 5, scope: !3894)
!3894 = distinct !DILexicalBlock(scope: !3890, file: !298, line: 1017, column: 67)
!3895 = !DILocation(line: 1019, column: 12, scope: !3894)
!3896 = !DILocation(line: 1019, column: 10, scope: !3894)
!3897 = !DILocation(line: 1020, column: 5, scope: !3894)
!3898 = !DILocation(line: 1021, column: 3, scope: !3894)
!3899 = !DILocation(line: 1022, column: 5, scope: !3900)
!3900 = distinct !DILexicalBlock(scope: !3890, file: !298, line: 1021, column: 10)
!3901 = !DILocation(line: 1023, column: 11, scope: !3900)
!3902 = !DILocation(line: 1023, column: 9, scope: !3900)
!3903 = !DILocation(line: 1024, column: 5, scope: !3900)
!3904 = !DILocation(line: 1027, column: 7, scope: !3905)
!3905 = distinct !DILexicalBlock(scope: !3847, file: !298, line: 1027, column: 7)
!3906 = !DILocation(line: 1027, column: 10, scope: !3905)
!3907 = !DILocation(line: 1027, column: 7, scope: !3847)
!3908 = !DILocation(line: 1028, column: 12, scope: !3909)
!3909 = distinct !DILexicalBlock(scope: !3905, file: !298, line: 1027, column: 17)
!3910 = !DILocation(line: 1028, column: 5, scope: !3909)
!3911 = !DILocalVariable(name: "flags", scope: !3912, file: !298, line: 1030, type: !241)
!3912 = distinct !DILexicalBlock(scope: !3913, file: !298, line: 1029, column: 19)
!3913 = distinct !DILexicalBlock(scope: !3909, file: !298, line: 1028, column: 17)
!3914 = !DILocation(line: 1030, column: 11, scope: !3912)
!3915 = !DILocation(line: 1031, column: 11, scope: !3916)
!3916 = distinct !DILexicalBlock(scope: !3912, file: !298, line: 1031, column: 11)
!3917 = !DILocation(line: 1031, column: 14, scope: !3916)
!3918 = !DILocation(line: 1031, column: 20, scope: !3916)
!3919 = !DILocation(line: 1031, column: 11, scope: !3912)
!3920 = !DILocation(line: 1032, column: 15, scope: !3916)
!3921 = !DILocation(line: 1032, column: 9, scope: !3916)
!3922 = !DILocation(line: 1033, column: 14, scope: !3912)
!3923 = !DILocation(line: 1033, column: 7, scope: !3912)
!3924 = !DILocation(line: 1036, column: 7, scope: !3925)
!3925 = distinct !DILexicalBlock(scope: !3913, file: !298, line: 1035, column: 19)
!3926 = !DILocation(line: 1036, column: 10, scope: !3925)
!3927 = !DILocation(line: 1036, column: 16, scope: !3925)
!3928 = !DILocation(line: 1037, column: 11, scope: !3929)
!3929 = distinct !DILexicalBlock(scope: !3925, file: !298, line: 1037, column: 11)
!3930 = !DILocation(line: 1037, column: 15, scope: !3929)
!3931 = !DILocation(line: 1037, column: 11, scope: !3925)
!3932 = !DILocation(line: 1038, column: 9, scope: !3929)
!3933 = !DILocation(line: 1038, column: 12, scope: !3929)
!3934 = !DILocation(line: 1038, column: 18, scope: !3929)
!3935 = !DILocation(line: 1039, column: 7, scope: !3925)
!3936 = !DILocation(line: 1048, column: 7, scope: !3937)
!3937 = distinct !DILexicalBlock(scope: !3913, file: !298, line: 1041, column: 19)
!3938 = !DILocation(line: 1055, column: 7, scope: !3939)
!3939 = distinct !DILexicalBlock(scope: !3913, file: !298, line: 1054, column: 19)
!3940 = !DILocation(line: 1055, column: 13, scope: !3939)
!3941 = !DILocation(line: 1055, column: 20, scope: !3939)
!3942 = !DILocation(line: 1056, column: 7, scope: !3939)
!3943 = !DILocation(line: 1062, column: 7, scope: !3944)
!3944 = distinct !DILexicalBlock(scope: !3913, file: !298, line: 1061, column: 19)
!3945 = !DILocation(line: 1065, column: 7, scope: !3913)
!3946 = !DILocation(line: 1066, column: 7, scope: !3913)
!3947 = !DILocation(line: 1066, column: 13, scope: !3913)
!3948 = !DILocation(line: 1067, column: 7, scope: !3913)
!3949 = !DILocation(line: 1070, column: 30, scope: !3847)
!3950 = !DILocation(line: 1070, column: 33, scope: !3847)
!3951 = !DILocation(line: 1070, column: 37, scope: !3847)
!3952 = !DILocation(line: 1070, column: 42, scope: !3847)
!3953 = !DILocation(line: 1070, column: 10, scope: !3847)
!3954 = !DILocation(line: 1070, column: 3, scope: !3847)
!3955 = !DILocation(line: 1071, column: 1, scope: !3847)
!3956 = distinct !DISubprogram(name: "__fd_statfs", scope: !298, file: !298, line: 1073, type: !3957, scopeLine: 1073, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!3957 = !DISubroutineType(types: !3958)
!3958 = !{!241, !437, !3959}
!3959 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3960, size: 64)
!3960 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "statfs", file: !3961, line: 24, size: 960, elements: !3962)
!3961 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/statfs.h", directory: "", checksumkind: CSK_MD5, checksum: "4c379ce582232e44e7b8fa7ccdecac58")
!3962 = !{!3963, !3965, !3966, !3968, !3969, !3970, !3972, !3973, !3979, !3980, !3981, !3982}
!3963 = !DIDerivedType(tag: DW_TAG_member, name: "f_type", scope: !3960, file: !3961, line: 26, baseType: !3964, size: 64)
!3964 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsword_t", file: !228, line: 192, baseType: !245)
!3965 = !DIDerivedType(tag: DW_TAG_member, name: "f_bsize", scope: !3960, file: !3961, line: 27, baseType: !3964, size: 64, offset: 64)
!3966 = !DIDerivedType(tag: DW_TAG_member, name: "f_blocks", scope: !3960, file: !3961, line: 29, baseType: !3967, size: 64, offset: 128)
!3967 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsblkcnt_t", file: !228, line: 184, baseType: !229)
!3968 = !DIDerivedType(tag: DW_TAG_member, name: "f_bfree", scope: !3960, file: !3961, line: 30, baseType: !3967, size: 64, offset: 192)
!3969 = !DIDerivedType(tag: DW_TAG_member, name: "f_bavail", scope: !3960, file: !3961, line: 31, baseType: !3967, size: 64, offset: 256)
!3970 = !DIDerivedType(tag: DW_TAG_member, name: "f_files", scope: !3960, file: !3961, line: 32, baseType: !3971, size: 64, offset: 320)
!3971 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsfilcnt_t", file: !228, line: 188, baseType: !229)
!3972 = !DIDerivedType(tag: DW_TAG_member, name: "f_ffree", scope: !3960, file: !3961, line: 33, baseType: !3971, size: 64, offset: 384)
!3973 = !DIDerivedType(tag: DW_TAG_member, name: "f_fsid", scope: !3960, file: !3961, line: 41, baseType: !3974, size: 64, offset: 448)
!3974 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsid_t", file: !228, line: 155, baseType: !3975)
!3975 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !228, line: 155, size: 64, elements: !3976)
!3976 = !{!3977}
!3977 = !DIDerivedType(tag: DW_TAG_member, name: "__val", scope: !3975, file: !228, line: 155, baseType: !3978, size: 64)
!3978 = !DICompositeType(tag: DW_TAG_array_type, baseType: !241, size: 64, elements: !149)
!3979 = !DIDerivedType(tag: DW_TAG_member, name: "f_namelen", scope: !3960, file: !3961, line: 42, baseType: !3964, size: 64, offset: 512)
!3980 = !DIDerivedType(tag: DW_TAG_member, name: "f_frsize", scope: !3960, file: !3961, line: 43, baseType: !3964, size: 64, offset: 576)
!3981 = !DIDerivedType(tag: DW_TAG_member, name: "f_flags", scope: !3960, file: !3961, line: 44, baseType: !3964, size: 64, offset: 640)
!3982 = !DIDerivedType(tag: DW_TAG_member, name: "f_spare", scope: !3960, file: !3961, line: 45, baseType: !3983, size: 256, offset: 704)
!3983 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3964, size: 256, elements: !3984)
!3984 = !{!3985}
!3985 = !DISubrange(count: 4)
!3986 = !DILocalVariable(name: "path", arg: 1, scope: !3956, file: !298, line: 1073, type: !437)
!3987 = !DILocation(line: 1073, column: 29, scope: !3956)
!3988 = !DILocalVariable(name: "buf", arg: 2, scope: !3956, file: !298, line: 1073, type: !3959)
!3989 = !DILocation(line: 1073, column: 50, scope: !3956)
!3990 = !DILocalVariable(name: "dfile", scope: !3956, file: !298, line: 1074, type: !1583)
!3991 = !DILocation(line: 1074, column: 20, scope: !3956)
!3992 = !DILocation(line: 1074, column: 43, scope: !3956)
!3993 = !DILocation(line: 1074, column: 28, scope: !3956)
!3994 = !DILocation(line: 1075, column: 7, scope: !3995)
!3995 = distinct !DILexicalBlock(scope: !3956, file: !298, line: 1075, column: 7)
!3996 = !DILocation(line: 1075, column: 7, scope: !3956)
!3997 = !DILocation(line: 1077, column: 5, scope: !3998)
!3998 = distinct !DILexicalBlock(scope: !3995, file: !298, line: 1075, column: 14)
!3999 = !DILocation(line: 1078, column: 5, scope: !3998)
!4000 = !DILocation(line: 1078, column: 11, scope: !3998)
!4001 = !DILocation(line: 1079, column: 5, scope: !3998)
!4002 = !DILocation(line: 1082, column: 51, scope: !3956)
!4003 = !DILocation(line: 1082, column: 31, scope: !3956)
!4004 = !DILocation(line: 1082, column: 58, scope: !3956)
!4005 = !DILocation(line: 1082, column: 10, scope: !3956)
!4006 = !DILocation(line: 1082, column: 3, scope: !3956)
!4007 = !DILocation(line: 1083, column: 1, scope: !3956)
!4008 = distinct !DISubprogram(name: "fstatfs", scope: !298, file: !298, line: 1085, type: !4009, scopeLine: 1085, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4009 = !DISubroutineType(types: !4010)
!4010 = !{!241, !241, !3959}
!4011 = !DILocalVariable(name: "fd", arg: 1, scope: !4008, file: !298, line: 1085, type: !241)
!4012 = !DILocation(line: 1085, column: 17, scope: !4008)
!4013 = !DILocalVariable(name: "buf", arg: 2, scope: !4008, file: !298, line: 1085, type: !3959)
!4014 = !DILocation(line: 1085, column: 36, scope: !4008)
!4015 = !DILocalVariable(name: "f", scope: !4008, file: !298, line: 1086, type: !1925)
!4016 = !DILocation(line: 1086, column: 15, scope: !4008)
!4017 = !DILocation(line: 1086, column: 30, scope: !4008)
!4018 = !DILocation(line: 1086, column: 19, scope: !4008)
!4019 = !DILocation(line: 1088, column: 8, scope: !4020)
!4020 = distinct !DILexicalBlock(scope: !4008, file: !298, line: 1088, column: 7)
!4021 = !DILocation(line: 1088, column: 7, scope: !4008)
!4022 = !DILocation(line: 1089, column: 5, scope: !4023)
!4023 = distinct !DILexicalBlock(scope: !4020, file: !298, line: 1088, column: 11)
!4024 = !DILocation(line: 1089, column: 11, scope: !4023)
!4025 = !DILocation(line: 1090, column: 5, scope: !4023)
!4026 = !DILocation(line: 1093, column: 7, scope: !4027)
!4027 = distinct !DILexicalBlock(scope: !4008, file: !298, line: 1093, column: 7)
!4028 = !DILocation(line: 1093, column: 10, scope: !4027)
!4029 = !DILocation(line: 1093, column: 7, scope: !4008)
!4030 = !DILocation(line: 1094, column: 5, scope: !4031)
!4031 = distinct !DILexicalBlock(scope: !4027, file: !298, line: 1093, column: 17)
!4032 = !DILocation(line: 1095, column: 5, scope: !4031)
!4033 = !DILocation(line: 1095, column: 11, scope: !4031)
!4034 = !DILocation(line: 1096, column: 5, scope: !4031)
!4035 = !DILocation(line: 1098, column: 32, scope: !4008)
!4036 = !DILocation(line: 1098, column: 35, scope: !4008)
!4037 = !DILocation(line: 1098, column: 39, scope: !4008)
!4038 = !DILocation(line: 1098, column: 10, scope: !4008)
!4039 = !DILocation(line: 1098, column: 3, scope: !4008)
!4040 = !DILocation(line: 1099, column: 1, scope: !4008)
!4041 = distinct !DISubprogram(name: "fsync", scope: !298, file: !298, line: 1101, type: !312, scopeLine: 1101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4042 = !DILocalVariable(name: "fd", arg: 1, scope: !4041, file: !298, line: 1101, type: !241)
!4043 = !DILocation(line: 1101, column: 15, scope: !4041)
!4044 = !DILocalVariable(name: "f", scope: !4041, file: !298, line: 1102, type: !1925)
!4045 = !DILocation(line: 1102, column: 15, scope: !4041)
!4046 = !DILocation(line: 1102, column: 30, scope: !4041)
!4047 = !DILocation(line: 1102, column: 19, scope: !4041)
!4048 = !DILocation(line: 1104, column: 8, scope: !4049)
!4049 = distinct !DILexicalBlock(scope: !4041, file: !298, line: 1104, column: 7)
!4050 = !DILocation(line: 1104, column: 7, scope: !4041)
!4051 = !DILocation(line: 1105, column: 5, scope: !4052)
!4052 = distinct !DILexicalBlock(scope: !4049, file: !298, line: 1104, column: 11)
!4053 = !DILocation(line: 1105, column: 11, scope: !4052)
!4054 = !DILocation(line: 1106, column: 5, scope: !4052)
!4055 = !DILocation(line: 1107, column: 14, scope: !4056)
!4056 = distinct !DILexicalBlock(scope: !4049, file: !298, line: 1107, column: 14)
!4057 = !DILocation(line: 1107, column: 17, scope: !4056)
!4058 = !DILocation(line: 1107, column: 14, scope: !4049)
!4059 = !DILocation(line: 1108, column: 5, scope: !4060)
!4060 = distinct !DILexicalBlock(scope: !4056, file: !298, line: 1107, column: 24)
!4061 = !DILocation(line: 1110, column: 30, scope: !4041)
!4062 = !DILocation(line: 1110, column: 33, scope: !4041)
!4063 = !DILocation(line: 1110, column: 10, scope: !4041)
!4064 = !DILocation(line: 1110, column: 3, scope: !4041)
!4065 = !DILocation(line: 1111, column: 1, scope: !4041)
!4066 = distinct !DISubprogram(name: "dup2", scope: !298, file: !298, line: 1113, type: !4067, scopeLine: 1113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4067 = !DISubroutineType(types: !4068)
!4068 = !{!241, !241, !241}
!4069 = !DILocalVariable(name: "oldfd", arg: 1, scope: !4066, file: !298, line: 1113, type: !241)
!4070 = !DILocation(line: 1113, column: 14, scope: !4066)
!4071 = !DILocalVariable(name: "newfd", arg: 2, scope: !4066, file: !298, line: 1113, type: !241)
!4072 = !DILocation(line: 1113, column: 25, scope: !4066)
!4073 = !DILocalVariable(name: "f", scope: !4066, file: !298, line: 1114, type: !1925)
!4074 = !DILocation(line: 1114, column: 15, scope: !4066)
!4075 = !DILocation(line: 1114, column: 30, scope: !4066)
!4076 = !DILocation(line: 1114, column: 19, scope: !4066)
!4077 = !DILocation(line: 1116, column: 8, scope: !4078)
!4078 = distinct !DILexicalBlock(scope: !4066, file: !298, line: 1116, column: 7)
!4079 = !DILocation(line: 1116, column: 10, scope: !4078)
!4080 = !DILocation(line: 1117, column: 5, scope: !4081)
!4081 = distinct !DILexicalBlock(scope: !4078, file: !298, line: 1116, column: 43)
!4082 = !DILocation(line: 1117, column: 11, scope: !4081)
!4083 = !DILocation(line: 1118, column: 5, scope: !4081)
!4084 = !DILocalVariable(name: "f2", scope: !4085, file: !298, line: 1120, type: !1925)
!4085 = distinct !DILexicalBlock(scope: !4078, file: !298, line: 1119, column: 10)
!4086 = !DILocation(line: 1120, column: 17, scope: !4085)
!4087 = !DILocation(line: 1120, column: 37, scope: !4085)
!4088 = !DILocation(line: 1120, column: 23, scope: !4085)
!4089 = !DILocation(line: 1121, column: 9, scope: !4090)
!4090 = distinct !DILexicalBlock(scope: !4085, file: !298, line: 1121, column: 9)
!4091 = !DILocation(line: 1121, column: 13, scope: !4090)
!4092 = !DILocation(line: 1121, column: 19, scope: !4090)
!4093 = !DILocation(line: 1121, column: 9, scope: !4085)
!4094 = !DILocation(line: 1121, column: 34, scope: !4090)
!4095 = !DILocation(line: 1121, column: 28, scope: !4090)
!4096 = !DILocation(line: 1125, column: 6, scope: !4085)
!4097 = !DILocation(line: 1125, column: 12, scope: !4085)
!4098 = !DILocation(line: 1125, column: 11, scope: !4085)
!4099 = !DILocation(line: 1127, column: 5, scope: !4085)
!4100 = !DILocation(line: 1127, column: 9, scope: !4085)
!4101 = !DILocation(line: 1127, column: 15, scope: !4085)
!4102 = !DILocation(line: 1134, column: 12, scope: !4085)
!4103 = !DILocation(line: 1134, column: 5, scope: !4085)
!4104 = !DILocation(line: 1136, column: 1, scope: !4066)
!4105 = distinct !DISubprogram(name: "dup", scope: !298, file: !298, line: 1138, type: !312, scopeLine: 1138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4106 = !DILocalVariable(name: "oldfd", arg: 1, scope: !4105, file: !298, line: 1138, type: !241)
!4107 = !DILocation(line: 1138, column: 13, scope: !4105)
!4108 = !DILocalVariable(name: "f", scope: !4105, file: !298, line: 1139, type: !1925)
!4109 = !DILocation(line: 1139, column: 15, scope: !4105)
!4110 = !DILocation(line: 1139, column: 30, scope: !4105)
!4111 = !DILocation(line: 1139, column: 19, scope: !4105)
!4112 = !DILocation(line: 1140, column: 8, scope: !4113)
!4113 = distinct !DILexicalBlock(scope: !4105, file: !298, line: 1140, column: 7)
!4114 = !DILocation(line: 1140, column: 7, scope: !4105)
!4115 = !DILocation(line: 1141, column: 5, scope: !4116)
!4116 = distinct !DILexicalBlock(scope: !4113, file: !298, line: 1140, column: 11)
!4117 = !DILocation(line: 1141, column: 11, scope: !4116)
!4118 = !DILocation(line: 1142, column: 5, scope: !4116)
!4119 = !DILocalVariable(name: "fd", scope: !4120, file: !298, line: 1144, type: !241)
!4120 = distinct !DILexicalBlock(scope: !4113, file: !298, line: 1143, column: 10)
!4121 = !DILocation(line: 1144, column: 9, scope: !4120)
!4122 = !DILocation(line: 1145, column: 13, scope: !4123)
!4123 = distinct !DILexicalBlock(scope: !4120, file: !298, line: 1145, column: 5)
!4124 = !DILocation(line: 1145, column: 10, scope: !4123)
!4125 = !DILocation(line: 1145, column: 18, scope: !4126)
!4126 = distinct !DILexicalBlock(scope: !4123, file: !298, line: 1145, column: 5)
!4127 = !DILocation(line: 1145, column: 21, scope: !4126)
!4128 = !DILocation(line: 1145, column: 5, scope: !4123)
!4129 = !DILocation(line: 1146, column: 27, scope: !4130)
!4130 = distinct !DILexicalBlock(scope: !4126, file: !298, line: 1146, column: 11)
!4131 = !DILocation(line: 1146, column: 13, scope: !4130)
!4132 = !DILocation(line: 1146, column: 31, scope: !4130)
!4133 = !DILocation(line: 1146, column: 37, scope: !4130)
!4134 = !DILocation(line: 1146, column: 11, scope: !4126)
!4135 = !DILocation(line: 1145, column: 32, scope: !4126)
!4136 = !DILocation(line: 1145, column: 5, scope: !4126)
!4137 = distinct !{!4137, !4128, !4138}
!4138 = !DILocation(line: 1147, column: 9, scope: !4123)
!4139 = !DILocation(line: 1148, column: 9, scope: !4140)
!4140 = distinct !DILexicalBlock(scope: !4120, file: !298, line: 1148, column: 9)
!4141 = !DILocation(line: 1148, column: 12, scope: !4140)
!4142 = !DILocation(line: 1148, column: 9, scope: !4120)
!4143 = !DILocation(line: 1149, column: 7, scope: !4144)
!4144 = distinct !DILexicalBlock(scope: !4140, file: !298, line: 1148, column: 24)
!4145 = !DILocation(line: 1149, column: 13, scope: !4144)
!4146 = !DILocation(line: 1150, column: 7, scope: !4144)
!4147 = !DILocation(line: 1152, column: 19, scope: !4148)
!4148 = distinct !DILexicalBlock(scope: !4140, file: !298, line: 1151, column: 12)
!4149 = !DILocation(line: 1152, column: 26, scope: !4148)
!4150 = !DILocation(line: 1152, column: 14, scope: !4148)
!4151 = !DILocation(line: 1152, column: 7, scope: !4148)
!4152 = !DILocation(line: 1155, column: 1, scope: !4105)
!4153 = distinct !DISubprogram(name: "rmdir", scope: !298, file: !298, line: 1157, type: !2995, scopeLine: 1157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4154 = !DILocalVariable(name: "pathname", arg: 1, scope: !4153, file: !298, line: 1157, type: !437)
!4155 = !DILocation(line: 1157, column: 23, scope: !4153)
!4156 = !DILocalVariable(name: "dfile", scope: !4153, file: !298, line: 1158, type: !1583)
!4157 = !DILocation(line: 1158, column: 20, scope: !4153)
!4158 = !DILocation(line: 1158, column: 43, scope: !4153)
!4159 = !DILocation(line: 1158, column: 28, scope: !4153)
!4160 = !DILocation(line: 1159, column: 7, scope: !4161)
!4161 = distinct !DILexicalBlock(scope: !4153, file: !298, line: 1159, column: 7)
!4162 = !DILocation(line: 1159, column: 7, scope: !4153)
!4163 = !DILocation(line: 1161, column: 9, scope: !4164)
!4164 = distinct !DILexicalBlock(scope: !4165, file: !298, line: 1161, column: 9)
!4165 = distinct !DILexicalBlock(scope: !4161, file: !298, line: 1159, column: 14)
!4166 = !DILocation(line: 1161, column: 9, scope: !4165)
!4167 = !DILocation(line: 1162, column: 7, scope: !4168)
!4168 = distinct !DILexicalBlock(scope: !4164, file: !298, line: 1161, column: 40)
!4169 = !DILocation(line: 1162, column: 14, scope: !4168)
!4170 = !DILocation(line: 1162, column: 20, scope: !4168)
!4171 = !DILocation(line: 1162, column: 27, scope: !4168)
!4172 = !DILocation(line: 1163, column: 7, scope: !4168)
!4173 = !DILocation(line: 1165, column: 7, scope: !4174)
!4174 = distinct !DILexicalBlock(scope: !4164, file: !298, line: 1164, column: 12)
!4175 = !DILocation(line: 1165, column: 13, scope: !4174)
!4176 = !DILocation(line: 1166, column: 7, scope: !4174)
!4177 = !DILocation(line: 1170, column: 3, scope: !4153)
!4178 = !DILocation(line: 1171, column: 3, scope: !4153)
!4179 = !DILocation(line: 1171, column: 9, scope: !4153)
!4180 = !DILocation(line: 1172, column: 3, scope: !4153)
!4181 = !DILocation(line: 1173, column: 1, scope: !4153)
!4182 = distinct !DISubprogram(name: "unlink", scope: !298, file: !298, line: 1175, type: !2995, scopeLine: 1175, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4183 = !DILocalVariable(name: "pathname", arg: 1, scope: !4182, file: !298, line: 1175, type: !437)
!4184 = !DILocation(line: 1175, column: 24, scope: !4182)
!4185 = !DILocalVariable(name: "dfile", scope: !4182, file: !298, line: 1176, type: !1583)
!4186 = !DILocation(line: 1176, column: 20, scope: !4182)
!4187 = !DILocation(line: 1176, column: 43, scope: !4182)
!4188 = !DILocation(line: 1176, column: 28, scope: !4182)
!4189 = !DILocation(line: 1177, column: 7, scope: !4190)
!4190 = distinct !DILexicalBlock(scope: !4182, file: !298, line: 1177, column: 7)
!4191 = !DILocation(line: 1177, column: 7, scope: !4182)
!4192 = !DILocation(line: 1179, column: 9, scope: !4193)
!4193 = distinct !DILexicalBlock(scope: !4194, file: !298, line: 1179, column: 9)
!4194 = distinct !DILexicalBlock(scope: !4190, file: !298, line: 1177, column: 14)
!4195 = !DILocation(line: 1179, column: 9, scope: !4194)
!4196 = !DILocation(line: 1180, column: 7, scope: !4197)
!4197 = distinct !DILexicalBlock(scope: !4193, file: !298, line: 1179, column: 40)
!4198 = !DILocation(line: 1180, column: 14, scope: !4197)
!4199 = !DILocation(line: 1180, column: 20, scope: !4197)
!4200 = !DILocation(line: 1180, column: 27, scope: !4197)
!4201 = !DILocation(line: 1181, column: 7, scope: !4197)
!4202 = !DILocation(line: 1182, column: 16, scope: !4203)
!4203 = distinct !DILexicalBlock(scope: !4193, file: !298, line: 1182, column: 16)
!4204 = !DILocation(line: 1182, column: 16, scope: !4193)
!4205 = !DILocation(line: 1183, column: 7, scope: !4206)
!4206 = distinct !DILexicalBlock(scope: !4203, file: !298, line: 1182, column: 47)
!4207 = !DILocation(line: 1183, column: 13, scope: !4206)
!4208 = !DILocation(line: 1184, column: 7, scope: !4206)
!4209 = !DILocation(line: 1186, column: 7, scope: !4210)
!4210 = distinct !DILexicalBlock(scope: !4203, file: !298, line: 1185, column: 12)
!4211 = !DILocation(line: 1186, column: 13, scope: !4210)
!4212 = !DILocation(line: 1187, column: 7, scope: !4210)
!4213 = !DILocation(line: 1191, column: 3, scope: !4182)
!4214 = !DILocation(line: 1192, column: 3, scope: !4182)
!4215 = !DILocation(line: 1192, column: 9, scope: !4182)
!4216 = !DILocation(line: 1193, column: 3, scope: !4182)
!4217 = !DILocation(line: 1194, column: 1, scope: !4182)
!4218 = distinct !DISubprogram(name: "unlinkat", scope: !298, file: !298, line: 1196, type: !4219, scopeLine: 1196, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4219 = !DISubroutineType(types: !4220)
!4220 = !{!241, !241, !437, !241}
!4221 = !DILocalVariable(name: "dirfd", arg: 1, scope: !4218, file: !298, line: 1196, type: !241)
!4222 = !DILocation(line: 1196, column: 18, scope: !4218)
!4223 = !DILocalVariable(name: "pathname", arg: 2, scope: !4218, file: !298, line: 1196, type: !437)
!4224 = !DILocation(line: 1196, column: 37, scope: !4218)
!4225 = !DILocalVariable(name: "flags", arg: 3, scope: !4218, file: !298, line: 1196, type: !241)
!4226 = !DILocation(line: 1196, column: 51, scope: !4218)
!4227 = !DILocalVariable(name: "dfile", scope: !4218, file: !298, line: 1199, type: !1583)
!4228 = !DILocation(line: 1199, column: 20, scope: !4218)
!4229 = !DILocation(line: 1199, column: 43, scope: !4218)
!4230 = !DILocation(line: 1199, column: 28, scope: !4218)
!4231 = !DILocation(line: 1200, column: 7, scope: !4232)
!4232 = distinct !DILexicalBlock(scope: !4218, file: !298, line: 1200, column: 7)
!4233 = !DILocation(line: 1200, column: 7, scope: !4218)
!4234 = !DILocation(line: 1202, column: 9, scope: !4235)
!4235 = distinct !DILexicalBlock(scope: !4236, file: !298, line: 1202, column: 9)
!4236 = distinct !DILexicalBlock(scope: !4232, file: !298, line: 1200, column: 14)
!4237 = !DILocation(line: 1202, column: 9, scope: !4236)
!4238 = !DILocation(line: 1203, column: 7, scope: !4239)
!4239 = distinct !DILexicalBlock(scope: !4235, file: !298, line: 1202, column: 40)
!4240 = !DILocation(line: 1203, column: 14, scope: !4239)
!4241 = !DILocation(line: 1203, column: 20, scope: !4239)
!4242 = !DILocation(line: 1203, column: 27, scope: !4239)
!4243 = !DILocation(line: 1204, column: 7, scope: !4239)
!4244 = !DILocation(line: 1205, column: 16, scope: !4245)
!4245 = distinct !DILexicalBlock(scope: !4235, file: !298, line: 1205, column: 16)
!4246 = !DILocation(line: 1205, column: 16, scope: !4235)
!4247 = !DILocation(line: 1206, column: 7, scope: !4248)
!4248 = distinct !DILexicalBlock(scope: !4245, file: !298, line: 1205, column: 47)
!4249 = !DILocation(line: 1206, column: 13, scope: !4248)
!4250 = !DILocation(line: 1207, column: 7, scope: !4248)
!4251 = !DILocation(line: 1209, column: 7, scope: !4252)
!4252 = distinct !DILexicalBlock(scope: !4245, file: !298, line: 1208, column: 12)
!4253 = !DILocation(line: 1209, column: 13, scope: !4252)
!4254 = !DILocation(line: 1210, column: 7, scope: !4252)
!4255 = !DILocation(line: 1214, column: 3, scope: !4218)
!4256 = !DILocation(line: 1215, column: 3, scope: !4218)
!4257 = !DILocation(line: 1215, column: 9, scope: !4218)
!4258 = !DILocation(line: 1216, column: 3, scope: !4218)
!4259 = !DILocation(line: 1217, column: 1, scope: !4218)
!4260 = distinct !DISubprogram(name: "readlink", scope: !298, file: !298, line: 1219, type: !4261, scopeLine: 1219, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4261 = !DISubroutineType(types: !4262)
!4262 = !{!381, !437, !220, !383}
!4263 = !DILocalVariable(name: "path", arg: 1, scope: !4260, file: !298, line: 1219, type: !437)
!4264 = !DILocation(line: 1219, column: 30, scope: !4260)
!4265 = !DILocalVariable(name: "buf", arg: 2, scope: !4260, file: !298, line: 1219, type: !220)
!4266 = !DILocation(line: 1219, column: 42, scope: !4260)
!4267 = !DILocalVariable(name: "bufsize", arg: 3, scope: !4260, file: !298, line: 1219, type: !383)
!4268 = !DILocation(line: 1219, column: 54, scope: !4260)
!4269 = !DILocalVariable(name: "dfile", scope: !4260, file: !298, line: 1220, type: !1583)
!4270 = !DILocation(line: 1220, column: 20, scope: !4260)
!4271 = !DILocation(line: 1220, column: 43, scope: !4260)
!4272 = !DILocation(line: 1220, column: 28, scope: !4260)
!4273 = !DILocation(line: 1221, column: 7, scope: !4274)
!4274 = distinct !DILexicalBlock(scope: !4260, file: !298, line: 1221, column: 7)
!4275 = !DILocation(line: 1221, column: 7, scope: !4260)
!4276 = !DILocation(line: 1224, column: 9, scope: !4277)
!4277 = distinct !DILexicalBlock(scope: !4278, file: !298, line: 1224, column: 9)
!4278 = distinct !DILexicalBlock(scope: !4274, file: !298, line: 1221, column: 14)
!4279 = !DILocation(line: 1224, column: 9, scope: !4278)
!4280 = !DILocation(line: 1225, column: 16, scope: !4281)
!4281 = distinct !DILexicalBlock(scope: !4277, file: !298, line: 1224, column: 40)
!4282 = !DILocation(line: 1225, column: 7, scope: !4281)
!4283 = !DILocation(line: 1225, column: 14, scope: !4281)
!4284 = !DILocation(line: 1226, column: 11, scope: !4285)
!4285 = distinct !DILexicalBlock(scope: !4281, file: !298, line: 1226, column: 11)
!4286 = !DILocation(line: 1226, column: 18, scope: !4285)
!4287 = !DILocation(line: 1226, column: 11, scope: !4281)
!4288 = !DILocation(line: 1226, column: 22, scope: !4285)
!4289 = !DILocation(line: 1226, column: 29, scope: !4285)
!4290 = !DILocation(line: 1227, column: 11, scope: !4291)
!4291 = distinct !DILexicalBlock(scope: !4281, file: !298, line: 1227, column: 11)
!4292 = !DILocation(line: 1227, column: 18, scope: !4291)
!4293 = !DILocation(line: 1227, column: 11, scope: !4281)
!4294 = !DILocation(line: 1227, column: 22, scope: !4291)
!4295 = !DILocation(line: 1227, column: 29, scope: !4291)
!4296 = !DILocation(line: 1228, column: 11, scope: !4297)
!4297 = distinct !DILexicalBlock(scope: !4281, file: !298, line: 1228, column: 11)
!4298 = !DILocation(line: 1228, column: 18, scope: !4297)
!4299 = !DILocation(line: 1228, column: 11, scope: !4281)
!4300 = !DILocation(line: 1228, column: 22, scope: !4297)
!4301 = !DILocation(line: 1228, column: 29, scope: !4297)
!4302 = !DILocation(line: 1229, column: 11, scope: !4303)
!4303 = distinct !DILexicalBlock(scope: !4281, file: !298, line: 1229, column: 11)
!4304 = !DILocation(line: 1229, column: 18, scope: !4303)
!4305 = !DILocation(line: 1229, column: 11, scope: !4281)
!4306 = !DILocation(line: 1229, column: 22, scope: !4303)
!4307 = !DILocation(line: 1229, column: 29, scope: !4303)
!4308 = !DILocation(line: 1230, column: 15, scope: !4281)
!4309 = !DILocation(line: 1230, column: 22, scope: !4281)
!4310 = !DILocation(line: 1230, column: 14, scope: !4281)
!4311 = !DILocation(line: 1230, column: 7, scope: !4281)
!4312 = !DILocation(line: 1232, column: 7, scope: !4313)
!4313 = distinct !DILexicalBlock(scope: !4277, file: !298, line: 1231, column: 12)
!4314 = !DILocation(line: 1232, column: 13, scope: !4313)
!4315 = !DILocation(line: 1233, column: 7, scope: !4313)
!4316 = !DILocation(line: 1236, column: 33, scope: !4260)
!4317 = !DILocation(line: 1236, column: 39, scope: !4260)
!4318 = !DILocation(line: 1236, column: 44, scope: !4260)
!4319 = !DILocation(line: 1236, column: 10, scope: !4260)
!4320 = !DILocation(line: 1236, column: 3, scope: !4260)
!4321 = !DILocation(line: 1237, column: 1, scope: !4260)
!4322 = distinct !DISubprogram(name: "select", scope: !298, file: !298, line: 1247, type: !4323, scopeLine: 1248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4323 = !DISubroutineType(types: !4324)
!4324 = !{!241, !241, !4325, !4325, !4325, !4333}
!4325 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4326, size: 64)
!4326 = !DIDerivedType(tag: DW_TAG_typedef, name: "fd_set", file: !4327, line: 70, baseType: !4328)
!4327 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/select.h", directory: "", checksumkind: CSK_MD5, checksum: "5ab727ca201ba12ae255687119da3fa7")
!4328 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !4327, line: 59, size: 1024, elements: !4329)
!4329 = !{!4330}
!4330 = !DIDerivedType(tag: DW_TAG_member, name: "fds_bits", scope: !4328, file: !4327, line: 64, baseType: !4331, size: 1024)
!4331 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4332, size: 1024, elements: !509)
!4332 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fd_mask", file: !4327, line: 49, baseType: !245)
!4333 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2301, size: 64)
!4334 = !DILocalVariable(name: "nfds", arg: 1, scope: !4322, file: !298, line: 1247, type: !241)
!4335 = !DILocation(line: 1247, column: 16, scope: !4322)
!4336 = !DILocalVariable(name: "read", arg: 2, scope: !4322, file: !298, line: 1247, type: !4325)
!4337 = !DILocation(line: 1247, column: 30, scope: !4322)
!4338 = !DILocalVariable(name: "write", arg: 3, scope: !4322, file: !298, line: 1247, type: !4325)
!4339 = !DILocation(line: 1247, column: 44, scope: !4322)
!4340 = !DILocalVariable(name: "except", arg: 4, scope: !4322, file: !298, line: 1248, type: !4325)
!4341 = !DILocation(line: 1248, column: 20, scope: !4322)
!4342 = !DILocalVariable(name: "timeout", arg: 5, scope: !4322, file: !298, line: 1248, type: !4333)
!4343 = !DILocation(line: 1248, column: 44, scope: !4322)
!4344 = !DILocalVariable(name: "in_read", scope: !4322, file: !298, line: 1249, type: !4326)
!4345 = !DILocation(line: 1249, column: 10, scope: !4322)
!4346 = !DILocalVariable(name: "in_write", scope: !4322, file: !298, line: 1249, type: !4326)
!4347 = !DILocation(line: 1249, column: 19, scope: !4322)
!4348 = !DILocalVariable(name: "in_except", scope: !4322, file: !298, line: 1249, type: !4326)
!4349 = !DILocation(line: 1249, column: 29, scope: !4322)
!4350 = !DILocalVariable(name: "os_read", scope: !4322, file: !298, line: 1249, type: !4326)
!4351 = !DILocation(line: 1249, column: 40, scope: !4322)
!4352 = !DILocalVariable(name: "os_write", scope: !4322, file: !298, line: 1249, type: !4326)
!4353 = !DILocation(line: 1249, column: 49, scope: !4322)
!4354 = !DILocalVariable(name: "os_except", scope: !4322, file: !298, line: 1249, type: !4326)
!4355 = !DILocation(line: 1249, column: 59, scope: !4322)
!4356 = !DILocalVariable(name: "i", scope: !4322, file: !298, line: 1250, type: !241)
!4357 = !DILocation(line: 1250, column: 7, scope: !4322)
!4358 = !DILocalVariable(name: "count", scope: !4322, file: !298, line: 1250, type: !241)
!4359 = !DILocation(line: 1250, column: 10, scope: !4322)
!4360 = !DILocalVariable(name: "os_nfds", scope: !4322, file: !298, line: 1250, type: !241)
!4361 = !DILocation(line: 1250, column: 21, scope: !4322)
!4362 = !DILocation(line: 1252, column: 7, scope: !4363)
!4363 = distinct !DILexicalBlock(scope: !4322, file: !298, line: 1252, column: 7)
!4364 = !DILocation(line: 1252, column: 7, scope: !4322)
!4365 = !DILocation(line: 1253, column: 16, scope: !4366)
!4366 = distinct !DILexicalBlock(scope: !4363, file: !298, line: 1252, column: 13)
!4367 = !DILocation(line: 1253, column: 15, scope: !4366)
!4368 = !DILocation(line: 1254, column: 5, scope: !4366)
!4369 = !DILocation(line: 1255, column: 3, scope: !4366)
!4370 = !DILocation(line: 1256, column: 5, scope: !4371)
!4371 = distinct !DILexicalBlock(scope: !4363, file: !298, line: 1255, column: 10)
!4372 = !DILocation(line: 1259, column: 7, scope: !4373)
!4373 = distinct !DILexicalBlock(scope: !4322, file: !298, line: 1259, column: 7)
!4374 = !DILocation(line: 1259, column: 7, scope: !4322)
!4375 = !DILocation(line: 1260, column: 17, scope: !4376)
!4376 = distinct !DILexicalBlock(scope: !4373, file: !298, line: 1259, column: 14)
!4377 = !DILocation(line: 1260, column: 16, scope: !4376)
!4378 = !DILocation(line: 1261, column: 5, scope: !4376)
!4379 = !DILocation(line: 1262, column: 3, scope: !4376)
!4380 = !DILocation(line: 1263, column: 5, scope: !4381)
!4381 = distinct !DILexicalBlock(scope: !4373, file: !298, line: 1262, column: 10)
!4382 = !DILocation(line: 1266, column: 7, scope: !4383)
!4383 = distinct !DILexicalBlock(scope: !4322, file: !298, line: 1266, column: 7)
!4384 = !DILocation(line: 1266, column: 7, scope: !4322)
!4385 = !DILocation(line: 1267, column: 18, scope: !4386)
!4386 = distinct !DILexicalBlock(scope: !4383, file: !298, line: 1266, column: 15)
!4387 = !DILocation(line: 1267, column: 17, scope: !4386)
!4388 = !DILocation(line: 1268, column: 5, scope: !4386)
!4389 = !DILocation(line: 1269, column: 3, scope: !4386)
!4390 = !DILocation(line: 1270, column: 5, scope: !4391)
!4391 = distinct !DILexicalBlock(scope: !4383, file: !298, line: 1269, column: 10)
!4392 = !DILocation(line: 1273, column: 3, scope: !4322)
!4393 = !DILocation(line: 1274, column: 3, scope: !4322)
!4394 = !DILocation(line: 1275, column: 3, scope: !4322)
!4395 = !DILocation(line: 1278, column: 9, scope: !4396)
!4396 = distinct !DILexicalBlock(scope: !4322, file: !298, line: 1278, column: 3)
!4397 = !DILocation(line: 1278, column: 8, scope: !4396)
!4398 = !DILocation(line: 1278, column: 13, scope: !4399)
!4399 = distinct !DILexicalBlock(scope: !4396, file: !298, line: 1278, column: 3)
!4400 = !DILocation(line: 1278, column: 15, scope: !4399)
!4401 = !DILocation(line: 1278, column: 14, scope: !4399)
!4402 = !DILocation(line: 1278, column: 3, scope: !4396)
!4403 = !DILocation(line: 1279, column: 9, scope: !4404)
!4404 = distinct !DILexicalBlock(scope: !4405, file: !298, line: 1279, column: 9)
!4405 = distinct !DILexicalBlock(scope: !4399, file: !298, line: 1278, column: 26)
!4406 = !{!"True"}
!4407 = !DILocation(line: 1279, column: 31, scope: !4404)
!4408 = !DILocation(line: 1279, column: 34, scope: !4404)
!4409 = !DILocation(line: 1279, column: 57, scope: !4404)
!4410 = !DILocation(line: 1279, column: 60, scope: !4404)
!4411 = !DILocation(line: 1279, column: 9, scope: !4405)
!4412 = !DILocalVariable(name: "f", scope: !4413, file: !298, line: 1280, type: !1925)
!4413 = distinct !DILexicalBlock(scope: !4404, file: !298, line: 1279, column: 85)
!4414 = !DILocation(line: 1280, column: 19, scope: !4413)
!4415 = !DILocation(line: 1280, column: 34, scope: !4413)
!4416 = !DILocation(line: 1280, column: 23, scope: !4413)
!4417 = !DILocation(line: 1281, column: 12, scope: !4418)
!4418 = distinct !DILexicalBlock(scope: !4413, file: !298, line: 1281, column: 11)
!4419 = !DILocation(line: 1281, column: 11, scope: !4413)
!4420 = !DILocation(line: 1282, column: 9, scope: !4421)
!4421 = distinct !DILexicalBlock(scope: !4418, file: !298, line: 1281, column: 15)
!4422 = !DILocation(line: 1282, column: 15, scope: !4421)
!4423 = !DILocation(line: 1283, column: 9, scope: !4421)
!4424 = !DILocation(line: 1284, column: 18, scope: !4425)
!4425 = distinct !DILexicalBlock(scope: !4418, file: !298, line: 1284, column: 18)
!4426 = !DILocation(line: 1284, column: 21, scope: !4425)
!4427 = !DILocation(line: 1284, column: 18, scope: !4418)
!4428 = !DILocation(line: 1286, column: 13, scope: !4429)
!4429 = distinct !DILexicalBlock(scope: !4430, file: !298, line: 1286, column: 13)
!4430 = distinct !DILexicalBlock(scope: !4425, file: !298, line: 1284, column: 28)
!4431 = !DILocation(line: 1286, column: 13, scope: !4430)
!4432 = !DILocation(line: 1286, column: 36, scope: !4429)
!4433 = !DILocation(line: 1287, column: 13, scope: !4434)
!4434 = distinct !DILexicalBlock(scope: !4430, file: !298, line: 1287, column: 13)
!4435 = !DILocation(line: 1287, column: 13, scope: !4430)
!4436 = !DILocation(line: 1287, column: 37, scope: !4434)
!4437 = !DILocation(line: 1288, column: 13, scope: !4438)
!4438 = distinct !DILexicalBlock(scope: !4430, file: !298, line: 1288, column: 13)
!4439 = !DILocation(line: 1288, column: 13, scope: !4430)
!4440 = !DILocation(line: 1288, column: 38, scope: !4438)
!4441 = !DILocation(line: 1289, column: 9, scope: !4430)
!4442 = !DILocation(line: 1290, column: 7, scope: !4430)
!4443 = !DILocation(line: 1291, column: 13, scope: !4444)
!4444 = distinct !DILexicalBlock(scope: !4445, file: !298, line: 1291, column: 13)
!4445 = distinct !DILexicalBlock(scope: !4425, file: !298, line: 1290, column: 14)
!4446 = !DILocation(line: 1291, column: 13, scope: !4445)
!4447 = !DILocation(line: 1291, column: 36, scope: !4444)
!4448 = !DILocation(line: 1292, column: 13, scope: !4449)
!4449 = distinct !DILexicalBlock(scope: !4445, file: !298, line: 1292, column: 13)
!4450 = !DILocation(line: 1292, column: 13, scope: !4445)
!4451 = !DILocation(line: 1292, column: 37, scope: !4449)
!4452 = !DILocation(line: 1293, column: 13, scope: !4453)
!4453 = distinct !DILexicalBlock(scope: !4445, file: !298, line: 1293, column: 13)
!4454 = !DILocation(line: 1293, column: 13, scope: !4445)
!4455 = !DILocation(line: 1293, column: 38, scope: !4453)
!4456 = !DILocation(line: 1294, column: 13, scope: !4457)
!4457 = distinct !DILexicalBlock(scope: !4445, file: !298, line: 1294, column: 13)
!4458 = !DILocation(line: 1294, column: 16, scope: !4457)
!4459 = !DILocation(line: 1294, column: 22, scope: !4457)
!4460 = !DILocation(line: 1294, column: 19, scope: !4457)
!4461 = !DILocation(line: 1294, column: 13, scope: !4445)
!4462 = !DILocation(line: 1294, column: 41, scope: !4457)
!4463 = !DILocation(line: 1294, column: 44, scope: !4457)
!4464 = !DILocation(line: 1294, column: 47, scope: !4457)
!4465 = !DILocation(line: 1294, column: 39, scope: !4457)
!4466 = !DILocation(line: 1294, column: 31, scope: !4457)
!4467 = !DILocation(line: 1278, column: 22, scope: !4399)
!4468 = !DILocation(line: 1278, column: 3, scope: !4399)
!4469 = distinct !{!4469, !4402, !4470}
!4470 = !DILocation(line: 1297, column: 3, scope: !4396)
!4471 = !DILocation(line: 1299, column: 7, scope: !4472)
!4472 = distinct !DILexicalBlock(scope: !4322, file: !298, line: 1299, column: 7)
!4473 = !DILocation(line: 1299, column: 15, scope: !4472)
!4474 = !DILocation(line: 1299, column: 7, scope: !4322)
!4475 = !DILocalVariable(name: "tv", scope: !4476, file: !298, line: 1302, type: !2301)
!4476 = distinct !DILexicalBlock(scope: !4472, file: !298, line: 1299, column: 20)
!4477 = !DILocation(line: 1302, column: 20, scope: !4476)
!4478 = !DILocalVariable(name: "r", scope: !4476, file: !298, line: 1303, type: !241)
!4479 = !DILocation(line: 1303, column: 9, scope: !4476)
!4480 = !DILocation(line: 1303, column: 34, scope: !4476)
!4481 = !DILocation(line: 1303, column: 13, scope: !4476)
!4482 = !DILocation(line: 1306, column: 9, scope: !4483)
!4483 = distinct !DILexicalBlock(scope: !4476, file: !298, line: 1306, column: 9)
!4484 = !DILocation(line: 1306, column: 11, scope: !4483)
!4485 = !DILocation(line: 1306, column: 9, scope: !4476)
!4486 = !DILocation(line: 1309, column: 12, scope: !4487)
!4487 = distinct !DILexicalBlock(scope: !4488, file: !298, line: 1309, column: 11)
!4488 = distinct !DILexicalBlock(scope: !4483, file: !298, line: 1306, column: 18)
!4489 = !DILocation(line: 1309, column: 11, scope: !4488)
!4490 = !DILocation(line: 1310, column: 9, scope: !4487)
!4491 = !DILocation(line: 1312, column: 16, scope: !4492)
!4492 = distinct !DILexicalBlock(scope: !4483, file: !298, line: 1311, column: 12)
!4493 = !DILocation(line: 1312, column: 13, scope: !4492)
!4494 = !DILocation(line: 1315, column: 13, scope: !4495)
!4495 = distinct !DILexicalBlock(scope: !4492, file: !298, line: 1315, column: 7)
!4496 = !DILocation(line: 1315, column: 12, scope: !4495)
!4497 = !DILocation(line: 1315, column: 17, scope: !4498)
!4498 = distinct !DILexicalBlock(scope: !4495, file: !298, line: 1315, column: 7)
!4499 = !DILocation(line: 1315, column: 19, scope: !4498)
!4500 = !DILocation(line: 1315, column: 18, scope: !4498)
!4501 = !DILocation(line: 1315, column: 7, scope: !4495)
!4502 = !DILocalVariable(name: "f", scope: !4503, file: !298, line: 1316, type: !1925)
!4503 = distinct !DILexicalBlock(scope: !4498, file: !298, line: 1315, column: 30)
!4504 = !DILocation(line: 1316, column: 21, scope: !4503)
!4505 = !DILocation(line: 1316, column: 36, scope: !4503)
!4506 = !DILocation(line: 1316, column: 25, scope: !4503)
!4507 = !DILocation(line: 1317, column: 13, scope: !4508)
!4508 = distinct !DILexicalBlock(scope: !4503, file: !298, line: 1317, column: 13)
!4509 = !DILocation(line: 1317, column: 15, scope: !4508)
!4510 = !DILocation(line: 1317, column: 19, scope: !4508)
!4511 = !DILocation(line: 1317, column: 22, scope: !4508)
!4512 = !DILocation(line: 1317, column: 13, scope: !4503)
!4513 = !DILocation(line: 1318, column: 15, scope: !4514)
!4514 = distinct !DILexicalBlock(scope: !4515, file: !298, line: 1318, column: 15)
!4515 = distinct !DILexicalBlock(scope: !4508, file: !298, line: 1317, column: 29)
!4516 = !DILocation(line: 1318, column: 20, scope: !4514)
!4517 = !DILocation(line: 1318, column: 23, scope: !4514)
!4518 = !DILocation(line: 1318, column: 15, scope: !4515)
!4519 = !DILocation(line: 1318, column: 50, scope: !4514)
!4520 = !DILocation(line: 1319, column: 15, scope: !4521)
!4521 = distinct !DILexicalBlock(scope: !4515, file: !298, line: 1319, column: 15)
!4522 = !DILocation(line: 1319, column: 21, scope: !4521)
!4523 = !DILocation(line: 1319, column: 24, scope: !4521)
!4524 = !DILocation(line: 1319, column: 15, scope: !4515)
!4525 = !DILocation(line: 1319, column: 52, scope: !4521)
!4526 = !DILocation(line: 1320, column: 15, scope: !4527)
!4527 = distinct !DILexicalBlock(scope: !4515, file: !298, line: 1320, column: 15)
!4528 = !DILocation(line: 1320, column: 22, scope: !4527)
!4529 = !DILocation(line: 1320, column: 25, scope: !4527)
!4530 = !DILocation(line: 1320, column: 15, scope: !4515)
!4531 = !DILocation(line: 1320, column: 54, scope: !4527)
!4532 = !DILocation(line: 1315, column: 26, scope: !4498)
!4533 = !DILocation(line: 1315, column: 7, scope: !4498)
!4534 = distinct !{!4534, !4501, !4535}
!4535 = !DILocation(line: 1322, column: 7, scope: !4495)
!4536 = !DILocation(line: 1326, column: 10, scope: !4322)
!4537 = !DILocation(line: 1326, column: 3, scope: !4322)
!4538 = !DILocation(line: 1327, column: 1, scope: !4322)
!4539 = distinct !DISubprogram(name: "chroot", scope: !298, file: !298, line: 1417, type: !2995, scopeLine: 1417, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !314, retainedNodes: !385)
!4540 = !DILocalVariable(name: "path", arg: 1, scope: !4539, file: !298, line: 1417, type: !437)
!4541 = !DILocation(line: 1417, column: 24, scope: !4539)
!4542 = !DILocation(line: 1418, column: 7, scope: !4543)
!4543 = distinct !DILexicalBlock(scope: !4539, file: !298, line: 1418, column: 7)
!4544 = !DILocation(line: 1418, column: 15, scope: !4543)
!4545 = !DILocation(line: 1418, column: 7, scope: !4539)
!4546 = !DILocation(line: 1419, column: 5, scope: !4547)
!4547 = distinct !DILexicalBlock(scope: !4543, file: !298, line: 1418, column: 24)
!4548 = !DILocation(line: 1419, column: 11, scope: !4547)
!4549 = !DILocation(line: 1420, column: 5, scope: !4547)
!4550 = !DILocation(line: 1423, column: 7, scope: !4551)
!4551 = distinct !DILexicalBlock(scope: !4539, file: !298, line: 1423, column: 7)
!4552 = !DILocation(line: 1423, column: 15, scope: !4551)
!4553 = !DILocation(line: 1423, column: 22, scope: !4551)
!4554 = !DILocation(line: 1423, column: 25, scope: !4551)
!4555 = !DILocation(line: 1423, column: 33, scope: !4551)
!4556 = !DILocation(line: 1423, column: 7, scope: !4539)
!4557 = !DILocation(line: 1424, column: 5, scope: !4558)
!4558 = distinct !DILexicalBlock(scope: !4551, file: !298, line: 1423, column: 42)
!4559 = !DILocation(line: 1427, column: 3, scope: !4539)
!4560 = !DILocation(line: 1428, column: 3, scope: !4539)
!4561 = !DILocation(line: 1428, column: 9, scope: !4539)
!4562 = !DILocation(line: 1429, column: 3, scope: !4539)
!4563 = !DILocation(line: 1430, column: 1, scope: !4539)
!4564 = distinct !DISubprogram(name: "open", linkageName: "open64", scope: !4565, file: !4565, line: 48, type: !4566, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4565 = !DIFile(filename: "klee_src/runtime/POSIX/fd_64.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "cc9a465ed9cbb2f7acded7c1ccec6e43")
!4566 = !DISubroutineType(types: !4567)
!4567 = !{!241, !437, !241, null}
!4568 = !DILocalVariable(name: "pathname", arg: 1, scope: !4564, file: !4565, line: 48, type: !437)
!4569 = !DILocation(line: 48, column: 22, scope: !4564)
!4570 = !DILocalVariable(name: "flags", arg: 2, scope: !4564, file: !4565, line: 48, type: !241)
!4571 = !DILocation(line: 48, column: 36, scope: !4564)
!4572 = !DILocalVariable(name: "mode", scope: !4564, file: !4565, line: 49, type: !294)
!4573 = !DILocation(line: 49, column: 10, scope: !4564)
!4574 = !DILocation(line: 51, column: 7, scope: !4575)
!4575 = distinct !DILexicalBlock(scope: !4564, file: !4565, line: 51, column: 7)
!4576 = !DILocation(line: 51, column: 13, scope: !4575)
!4577 = !DILocation(line: 51, column: 7, scope: !4564)
!4578 = !DILocalVariable(name: "ap", scope: !4579, file: !4565, line: 53, type: !4580)
!4579 = distinct !DILexicalBlock(scope: !4575, file: !4565, line: 51, column: 24)
!4580 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !3576, line: 52, baseType: !4581)
!4581 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !3578, line: 14, baseType: !4582)
!4582 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !4583, baseType: !4584)
!4583 = !DIFile(filename: "klee_src/runtime/POSIX/fd_64.c", directory: "/tmp")
!4584 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4585, size: 192, elements: !3588)
!4585 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !4586)
!4586 = !{!4587, !4588, !4589, !4590}
!4587 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !4585, file: !4583, line: 53, baseType: !212, size: 32)
!4588 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !4585, file: !4583, line: 53, baseType: !212, size: 32, offset: 32)
!4589 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !4585, file: !4583, line: 53, baseType: !336, size: 64, offset: 64)
!4590 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !4585, file: !4583, line: 53, baseType: !336, size: 64, offset: 128)
!4591 = !DILocation(line: 53, column: 13, scope: !4579)
!4592 = !DILocation(line: 54, column: 5, scope: !4579)
!4593 = !DILocation(line: 55, column: 12, scope: !4579)
!4594 = !DILocation(line: 55, column: 10, scope: !4579)
!4595 = !DILocation(line: 56, column: 5, scope: !4579)
!4596 = !DILocation(line: 57, column: 3, scope: !4579)
!4597 = !DILocation(line: 59, column: 20, scope: !4564)
!4598 = !DILocation(line: 59, column: 30, scope: !4564)
!4599 = !DILocation(line: 59, column: 37, scope: !4564)
!4600 = !DILocation(line: 59, column: 10, scope: !4564)
!4601 = !DILocation(line: 59, column: 3, scope: !4564)
!4602 = distinct !DISubprogram(name: "openat", linkageName: "openat64", scope: !4565, file: !4565, line: 62, type: !4603, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4603 = !DISubroutineType(types: !4604)
!4604 = !{!241, !241, !437, !241, null}
!4605 = !DILocalVariable(name: "fd", arg: 1, scope: !4602, file: !4565, line: 62, type: !241)
!4606 = !DILocation(line: 62, column: 16, scope: !4602)
!4607 = !DILocalVariable(name: "pathname", arg: 2, scope: !4602, file: !4565, line: 62, type: !437)
!4608 = !DILocation(line: 62, column: 32, scope: !4602)
!4609 = !DILocalVariable(name: "flags", arg: 3, scope: !4602, file: !4565, line: 62, type: !241)
!4610 = !DILocation(line: 62, column: 46, scope: !4602)
!4611 = !DILocalVariable(name: "mode", scope: !4602, file: !4565, line: 63, type: !294)
!4612 = !DILocation(line: 63, column: 10, scope: !4602)
!4613 = !DILocation(line: 65, column: 7, scope: !4614)
!4614 = distinct !DILexicalBlock(scope: !4602, file: !4565, line: 65, column: 7)
!4615 = !DILocation(line: 65, column: 13, scope: !4614)
!4616 = !DILocation(line: 65, column: 7, scope: !4602)
!4617 = !DILocalVariable(name: "ap", scope: !4618, file: !4565, line: 67, type: !4580)
!4618 = distinct !DILexicalBlock(scope: !4614, file: !4565, line: 65, column: 24)
!4619 = !DILocation(line: 67, column: 13, scope: !4618)
!4620 = !DILocation(line: 68, column: 5, scope: !4618)
!4621 = !DILocation(line: 69, column: 12, scope: !4618)
!4622 = !DILocation(line: 69, column: 10, scope: !4618)
!4623 = !DILocation(line: 70, column: 5, scope: !4618)
!4624 = !DILocation(line: 71, column: 3, scope: !4618)
!4625 = !DILocation(line: 73, column: 22, scope: !4602)
!4626 = !DILocation(line: 73, column: 26, scope: !4602)
!4627 = !DILocation(line: 73, column: 36, scope: !4602)
!4628 = !DILocation(line: 73, column: 43, scope: !4602)
!4629 = !DILocation(line: 73, column: 10, scope: !4602)
!4630 = !DILocation(line: 73, column: 3, scope: !4602)
!4631 = distinct !DISubprogram(name: "lseek", linkageName: "lseek64", scope: !4565, file: !4565, line: 86, type: !4632, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4632 = !DISubroutineType(types: !4633)
!4633 = !{!289, !241, !287, !241}
!4634 = !DILocalVariable(name: "fd", arg: 1, scope: !4631, file: !4565, line: 86, type: !241)
!4635 = !DILocation(line: 86, column: 19, scope: !4631)
!4636 = !DILocalVariable(name: "offset", arg: 2, scope: !4631, file: !4565, line: 86, type: !287)
!4637 = !DILocation(line: 86, column: 31, scope: !4631)
!4638 = !DILocalVariable(name: "whence", arg: 3, scope: !4631, file: !4565, line: 86, type: !241)
!4639 = !DILocation(line: 86, column: 43, scope: !4631)
!4640 = !DILocation(line: 87, column: 21, scope: !4631)
!4641 = !DILocation(line: 87, column: 25, scope: !4631)
!4642 = !DILocation(line: 87, column: 33, scope: !4631)
!4643 = !DILocation(line: 87, column: 10, scope: !4631)
!4644 = !DILocation(line: 87, column: 3, scope: !4631)
!4645 = distinct !DISubprogram(name: "__xstat", linkageName: "__xstat64", scope: !4565, file: !4565, line: 90, type: !4646, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4646 = !DISubroutineType(types: !4647)
!4647 = !{!241, !241, !437, !4648}
!4648 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4649, size: 64)
!4649 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !224, line: 26, size: 1152, elements: !4650)
!4650 = !{!4651, !4652, !4653, !4654, !4655, !4656, !4657, !4658, !4659, !4660, !4661, !4662, !4663, !4664, !4665}
!4651 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !4649, file: !224, line: 31, baseType: !227, size: 64)
!4652 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !4649, file: !224, line: 36, baseType: !356, size: 64, offset: 64)
!4653 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !4649, file: !224, line: 44, baseType: !233, size: 64, offset: 128)
!4654 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !4649, file: !224, line: 45, baseType: !235, size: 32, offset: 192)
!4655 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !4649, file: !224, line: 47, baseType: !237, size: 32, offset: 224)
!4656 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !4649, file: !224, line: 48, baseType: !239, size: 32, offset: 256)
!4657 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !4649, file: !224, line: 50, baseType: !241, size: 32, offset: 288)
!4658 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !4649, file: !224, line: 52, baseType: !227, size: 64, offset: 320)
!4659 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !4649, file: !224, line: 57, baseType: !244, size: 64, offset: 384)
!4660 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !4649, file: !224, line: 61, baseType: !247, size: 64, offset: 448)
!4661 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !4649, file: !224, line: 63, baseType: !366, size: 64, offset: 512)
!4662 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !4649, file: !224, line: 74, baseType: !543, size: 128, offset: 576)
!4663 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !4649, file: !224, line: 75, baseType: !543, size: 128, offset: 704)
!4664 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !4649, file: !224, line: 76, baseType: !543, size: 128, offset: 832)
!4665 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !4649, file: !224, line: 89, baseType: !261, size: 192, offset: 960)
!4666 = !DILocalVariable(name: "vers", arg: 1, scope: !4645, file: !4565, line: 90, type: !241)
!4667 = !DILocation(line: 90, column: 17, scope: !4645)
!4668 = !DILocalVariable(name: "path", arg: 2, scope: !4645, file: !4565, line: 90, type: !437)
!4669 = !DILocation(line: 90, column: 35, scope: !4645)
!4670 = !DILocalVariable(name: "buf", arg: 3, scope: !4645, file: !4565, line: 90, type: !4648)
!4671 = !DILocation(line: 90, column: 54, scope: !4645)
!4672 = !DILocation(line: 91, column: 20, scope: !4645)
!4673 = !DILocation(line: 91, column: 43, scope: !4645)
!4674 = !DILocation(line: 91, column: 10, scope: !4645)
!4675 = !DILocation(line: 91, column: 3, scope: !4645)
!4676 = distinct !DISubprogram(name: "stat", linkageName: "stat64", scope: !4565, file: !4565, line: 94, type: !4677, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4677 = !DISubroutineType(types: !4678)
!4678 = !{!241, !437, !4648}
!4679 = !DILocalVariable(name: "path", arg: 1, scope: !4676, file: !4565, line: 94, type: !437)
!4680 = !DILocation(line: 94, column: 22, scope: !4676)
!4681 = !DILocalVariable(name: "buf", arg: 2, scope: !4676, file: !4565, line: 94, type: !4648)
!4682 = !DILocation(line: 94, column: 41, scope: !4676)
!4683 = !DILocation(line: 95, column: 20, scope: !4676)
!4684 = !DILocation(line: 95, column: 43, scope: !4676)
!4685 = !DILocation(line: 95, column: 10, scope: !4676)
!4686 = !DILocation(line: 95, column: 3, scope: !4676)
!4687 = distinct !DISubprogram(name: "__lxstat", linkageName: "__lxstat64", scope: !4565, file: !4565, line: 98, type: !4646, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4688 = !DILocalVariable(name: "vers", arg: 1, scope: !4687, file: !4565, line: 98, type: !241)
!4689 = !DILocation(line: 98, column: 18, scope: !4687)
!4690 = !DILocalVariable(name: "path", arg: 2, scope: !4687, file: !4565, line: 98, type: !437)
!4691 = !DILocation(line: 98, column: 36, scope: !4687)
!4692 = !DILocalVariable(name: "buf", arg: 3, scope: !4687, file: !4565, line: 98, type: !4648)
!4693 = !DILocation(line: 98, column: 55, scope: !4687)
!4694 = !DILocation(line: 99, column: 21, scope: !4687)
!4695 = !DILocation(line: 99, column: 44, scope: !4687)
!4696 = !DILocation(line: 99, column: 10, scope: !4687)
!4697 = !DILocation(line: 99, column: 3, scope: !4687)
!4698 = distinct !DISubprogram(name: "lstat", linkageName: "lstat64", scope: !4565, file: !4565, line: 102, type: !4677, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4699 = !DILocalVariable(name: "path", arg: 1, scope: !4698, file: !4565, line: 102, type: !437)
!4700 = !DILocation(line: 102, column: 23, scope: !4698)
!4701 = !DILocalVariable(name: "buf", arg: 2, scope: !4698, file: !4565, line: 102, type: !4648)
!4702 = !DILocation(line: 102, column: 42, scope: !4698)
!4703 = !DILocation(line: 103, column: 21, scope: !4698)
!4704 = !DILocation(line: 103, column: 44, scope: !4698)
!4705 = !DILocation(line: 103, column: 10, scope: !4698)
!4706 = !DILocation(line: 103, column: 3, scope: !4698)
!4707 = distinct !DISubprogram(name: "__fxstat", linkageName: "__fxstat64", scope: !4565, file: !4565, line: 106, type: !4708, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4708 = !DISubroutineType(types: !4709)
!4709 = !{!241, !241, !241, !4648}
!4710 = !DILocalVariable(name: "vers", arg: 1, scope: !4707, file: !4565, line: 106, type: !241)
!4711 = !DILocation(line: 106, column: 18, scope: !4707)
!4712 = !DILocalVariable(name: "fd", arg: 2, scope: !4707, file: !4565, line: 106, type: !241)
!4713 = !DILocation(line: 106, column: 28, scope: !4707)
!4714 = !DILocalVariable(name: "buf", arg: 3, scope: !4707, file: !4565, line: 106, type: !4648)
!4715 = !DILocation(line: 106, column: 45, scope: !4707)
!4716 = !DILocation(line: 107, column: 21, scope: !4707)
!4717 = !DILocation(line: 107, column: 42, scope: !4707)
!4718 = !DILocation(line: 107, column: 10, scope: !4707)
!4719 = !DILocation(line: 107, column: 3, scope: !4707)
!4720 = distinct !DISubprogram(name: "fstat", linkageName: "fstat64", scope: !4565, file: !4565, line: 110, type: !4721, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4721 = !DISubroutineType(types: !4722)
!4722 = !{!241, !241, !4648}
!4723 = !DILocalVariable(name: "fd", arg: 1, scope: !4720, file: !4565, line: 110, type: !241)
!4724 = !DILocation(line: 110, column: 15, scope: !4720)
!4725 = !DILocalVariable(name: "buf", arg: 2, scope: !4720, file: !4565, line: 110, type: !4648)
!4726 = !DILocation(line: 110, column: 32, scope: !4720)
!4727 = !DILocation(line: 111, column: 21, scope: !4720)
!4728 = !DILocation(line: 111, column: 42, scope: !4720)
!4729 = !DILocation(line: 111, column: 10, scope: !4720)
!4730 = !DILocation(line: 111, column: 3, scope: !4720)
!4731 = distinct !DISubprogram(name: "ftruncate64", scope: !4565, file: !4565, line: 114, type: !446, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4732 = !DILocalVariable(name: "fd", arg: 1, scope: !4731, file: !4565, line: 114, type: !241)
!4733 = !DILocation(line: 114, column: 21, scope: !4731)
!4734 = !DILocalVariable(name: "length", arg: 2, scope: !4731, file: !4565, line: 114, type: !287)
!4735 = !DILocation(line: 114, column: 33, scope: !4731)
!4736 = !DILocation(line: 115, column: 25, scope: !4731)
!4737 = !DILocation(line: 115, column: 29, scope: !4731)
!4738 = !DILocation(line: 115, column: 10, scope: !4731)
!4739 = !DILocation(line: 115, column: 3, scope: !4731)
!4740 = distinct !DISubprogram(name: "statfs", linkageName: "statfs64", scope: !4565, file: !4565, line: 119, type: !4741, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4741 = !DISubroutineType(types: !4742)
!4742 = !{!241, !437, !4743}
!4743 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4744, size: 64)
!4744 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "statfs", file: !3961, line: 24, size: 960, elements: !4745)
!4745 = !{!4746, !4747, !4748, !4750, !4751, !4752, !4754, !4755, !4760, !4761, !4762, !4763}
!4746 = !DIDerivedType(tag: DW_TAG_member, name: "f_type", scope: !4744, file: !3961, line: 26, baseType: !3964, size: 64)
!4747 = !DIDerivedType(tag: DW_TAG_member, name: "f_bsize", scope: !4744, file: !3961, line: 27, baseType: !3964, size: 64, offset: 64)
!4748 = !DIDerivedType(tag: DW_TAG_member, name: "f_blocks", scope: !4744, file: !3961, line: 35, baseType: !4749, size: 64, offset: 128)
!4749 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsblkcnt64_t", file: !228, line: 185, baseType: !229)
!4750 = !DIDerivedType(tag: DW_TAG_member, name: "f_bfree", scope: !4744, file: !3961, line: 36, baseType: !4749, size: 64, offset: 192)
!4751 = !DIDerivedType(tag: DW_TAG_member, name: "f_bavail", scope: !4744, file: !3961, line: 37, baseType: !4749, size: 64, offset: 256)
!4752 = !DIDerivedType(tag: DW_TAG_member, name: "f_files", scope: !4744, file: !3961, line: 38, baseType: !4753, size: 64, offset: 320)
!4753 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsfilcnt64_t", file: !228, line: 189, baseType: !229)
!4754 = !DIDerivedType(tag: DW_TAG_member, name: "f_ffree", scope: !4744, file: !3961, line: 39, baseType: !4753, size: 64, offset: 384)
!4755 = !DIDerivedType(tag: DW_TAG_member, name: "f_fsid", scope: !4744, file: !3961, line: 41, baseType: !4756, size: 64, offset: 448)
!4756 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsid_t", file: !228, line: 155, baseType: !4757)
!4757 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !228, line: 155, size: 64, elements: !4758)
!4758 = !{!4759}
!4759 = !DIDerivedType(tag: DW_TAG_member, name: "__val", scope: !4757, file: !228, line: 155, baseType: !3978, size: 64)
!4760 = !DIDerivedType(tag: DW_TAG_member, name: "f_namelen", scope: !4744, file: !3961, line: 42, baseType: !3964, size: 64, offset: 512)
!4761 = !DIDerivedType(tag: DW_TAG_member, name: "f_frsize", scope: !4744, file: !3961, line: 43, baseType: !3964, size: 64, offset: 576)
!4762 = !DIDerivedType(tag: DW_TAG_member, name: "f_flags", scope: !4744, file: !3961, line: 44, baseType: !3964, size: 64, offset: 640)
!4763 = !DIDerivedType(tag: DW_TAG_member, name: "f_spare", scope: !4744, file: !3961, line: 45, baseType: !3983, size: 256, offset: 704)
!4764 = !DILocalVariable(name: "path", arg: 1, scope: !4740, file: !4565, line: 119, type: !437)
!4765 = !DILocation(line: 119, column: 24, scope: !4740)
!4766 = !DILocalVariable(name: "buf", arg: 2, scope: !4740, file: !4565, line: 119, type: !4743)
!4767 = !DILocation(line: 119, column: 45, scope: !4740)
!4768 = !DILocation(line: 120, column: 22, scope: !4740)
!4769 = !DILocation(line: 120, column: 28, scope: !4740)
!4770 = !DILocation(line: 120, column: 10, scope: !4740)
!4771 = !DILocation(line: 120, column: 3, scope: !4740)
!4772 = distinct !DISubprogram(name: "getdents64", scope: !4565, file: !4565, line: 123, type: !4773, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !525, retainedNodes: !385)
!4773 = !DISubroutineType(types: !4774)
!4774 = !{!382, !241, !336, !383}
!4775 = !DILocalVariable(name: "fd", arg: 1, scope: !4772, file: !4565, line: 123, type: !241)
!4776 = !DILocation(line: 123, column: 24, scope: !4772)
!4777 = !DILocalVariable(name: "dirp", arg: 2, scope: !4772, file: !4565, line: 123, type: !336)
!4778 = !DILocation(line: 123, column: 34, scope: !4772)
!4779 = !DILocalVariable(name: "count", arg: 3, scope: !4772, file: !4565, line: 123, type: !383)
!4780 = !DILocation(line: 123, column: 47, scope: !4772)
!4781 = !DILocation(line: 124, column: 24, scope: !4772)
!4782 = !DILocation(line: 124, column: 47, scope: !4772)
!4783 = !DILocation(line: 124, column: 53, scope: !4772)
!4784 = !DILocation(line: 124, column: 10, scope: !4772)
!4785 = !DILocation(line: 124, column: 3, scope: !4772)
!4786 = distinct !DISubprogram(name: "memcpy", scope: !4787, file: !4787, line: 12, type: !4788, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !558, retainedNodes: !385)
!4787 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!4788 = !DISubroutineType(types: !4789)
!4789 = !{!336, !336, !403, !383}
!4790 = !DILocalVariable(name: "destaddr", arg: 1, scope: !4786, file: !4787, line: 12, type: !336)
!4791 = !DILocation(line: 12, column: 20, scope: !4786)
!4792 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !4786, file: !4787, line: 12, type: !403)
!4793 = !DILocation(line: 12, column: 42, scope: !4786)
!4794 = !DILocalVariable(name: "len", arg: 3, scope: !4786, file: !4787, line: 12, type: !383)
!4795 = !DILocation(line: 12, column: 58, scope: !4786)
!4796 = !DILocalVariable(name: "dest", scope: !4786, file: !4787, line: 13, type: !220)
!4797 = !DILocation(line: 13, column: 9, scope: !4786)
!4798 = !DILocation(line: 13, column: 16, scope: !4786)
!4799 = !DILocalVariable(name: "src", scope: !4786, file: !4787, line: 14, type: !437)
!4800 = !DILocation(line: 14, column: 15, scope: !4786)
!4801 = !DILocation(line: 14, column: 21, scope: !4786)
!4802 = !DILocation(line: 16, column: 3, scope: !4786)
!4803 = !DILocation(line: 16, column: 13, scope: !4786)
!4804 = !DILocation(line: 16, column: 16, scope: !4786)
!4805 = !DILocation(line: 17, column: 19, scope: !4786)
!4806 = !DILocation(line: 17, column: 15, scope: !4786)
!4807 = !DILocation(line: 17, column: 10, scope: !4786)
!4808 = !DILocation(line: 17, column: 13, scope: !4786)
!4809 = distinct !{!4809, !4802, !4805, !4810}
!4810 = !{!"llvm.loop.mustprogress"}
!4811 = !DILocation(line: 18, column: 10, scope: !4786)
!4812 = !DILocation(line: 18, column: 3, scope: !4786)
!4813 = distinct !DISubprogram(name: "memset", scope: !4814, file: !4814, line: 12, type: !4815, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !560, retainedNodes: !385)
!4814 = !DIFile(filename: "klee_src/runtime/Freestanding/memset.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "f66ef9ef9131ab198e93a41b1a9ae1fc")
!4815 = !DISubroutineType(types: !4816)
!4816 = !{!336, !336, !241, !383}
!4817 = !DILocalVariable(name: "dst", arg: 1, scope: !4813, file: !4814, line: 12, type: !336)
!4818 = !DILocation(line: 12, column: 20, scope: !4813)
!4819 = !DILocalVariable(name: "s", arg: 2, scope: !4813, file: !4814, line: 12, type: !241)
!4820 = !DILocation(line: 12, column: 29, scope: !4813)
!4821 = !DILocalVariable(name: "count", arg: 3, scope: !4813, file: !4814, line: 12, type: !383)
!4822 = !DILocation(line: 12, column: 39, scope: !4813)
!4823 = !DILocalVariable(name: "a", scope: !4813, file: !4814, line: 13, type: !220)
!4824 = !DILocation(line: 13, column: 9, scope: !4813)
!4825 = !DILocation(line: 13, column: 13, scope: !4813)
!4826 = !DILocation(line: 14, column: 3, scope: !4813)
!4827 = !DILocation(line: 14, column: 15, scope: !4813)
!4828 = !DILocation(line: 14, column: 18, scope: !4813)
!4829 = !DILocation(line: 15, column: 12, scope: !4813)
!4830 = !DILocation(line: 15, column: 7, scope: !4813)
!4831 = !DILocation(line: 15, column: 10, scope: !4813)
!4832 = distinct !{!4832, !4826, !4829, !4810}
!4833 = !DILocation(line: 16, column: 10, scope: !4813)
!4834 = !DILocation(line: 16, column: 3, scope: !4813)
!4835 = distinct !DISubprogram(name: "klee_overshift_check", scope: !502, file: !502, line: 20, type: !4836, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !562, retainedNodes: !385)
!4836 = !DISubroutineType(types: !4837)
!4837 = !{null, !4838, !4838}
!4838 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!4839 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4835, file: !502, line: 20, type: !4838)
!4840 = !DILocation(line: 20, column: 46, scope: !4835)
!4841 = !DILocalVariable(name: "shift", arg: 2, scope: !4835, file: !502, line: 20, type: !4838)
!4842 = !DILocation(line: 20, column: 75, scope: !4835)
!4843 = !DILocation(line: 21, column: 7, scope: !4844)
!4844 = distinct !DILexicalBlock(scope: !4835, file: !502, line: 21, column: 7)
!4845 = !DILocation(line: 21, column: 16, scope: !4844)
!4846 = !DILocation(line: 21, column: 13, scope: !4844)
!4847 = !DILocation(line: 21, column: 7, scope: !4835)
!4848 = !DILocation(line: 27, column: 5, scope: !4849)
!4849 = distinct !DILexicalBlock(scope: !4844, file: !502, line: 21, column: 26)
!4850 = !DILocation(line: 29, column: 1, scope: !4835)
