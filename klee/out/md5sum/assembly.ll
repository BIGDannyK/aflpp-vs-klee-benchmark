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
@__const.klee_init_fds.name = private unnamed_addr constant [7 x i8] c"?_data\00", align 1
@.str.35 = private unnamed_addr constant [2 x i8] c".\00", align 1, !dbg !139
@.str.1.36 = private unnamed_addr constant [38 x i8] c"/tmp/klee_src/runtime/POSIX/fd_init.c\00", align 1, !dbg !145
@.str.2.37 = private unnamed_addr constant [31 x i8] c"out of memory in klee_init_env\00", align 1, !dbg !150
@.str.3.38 = private unnamed_addr constant [9 x i8] c"user.err\00", align 1, !dbg !152
@.str.4.39 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1, !dbg !154
@.str.5.40 = private unnamed_addr constant [10 x i8] c"read_fail\00", align 1, !dbg !159
@.str.6.41 = private unnamed_addr constant [11 x i8] c"write_fail\00", align 1, !dbg !161
@.str.7.42 = private unnamed_addr constant [11 x i8] c"close_fail\00", align 1, !dbg !163
@.str.8.43 = private unnamed_addr constant [15 x i8] c"ftruncate_fail\00", align 1, !dbg !165
@.str.9.44 = private unnamed_addr constant [12 x i8] c"getcwd_fail\00", align 1, !dbg !170
@.str.10.45 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1, !dbg !172
@.str.11.46 = private unnamed_addr constant [6 x i8] c"_stat\00", align 1, !dbg !174
@.str.12.47 = private unnamed_addr constant [5 x i8] c"size\00", align 1, !dbg !176
@__PRETTY_FUNCTION__.__create_new_dfile = private unnamed_addr constant [88 x i8] c"void __create_new_dfile(exe_disk_file_t *, unsigned int, const char *, struct stat64 *)\00", align 1, !dbg !181
@.str.50 = private unnamed_addr constant [45 x i8] c"/tmp/klee_src/runtime/Intrinsic/klee_range.c\00", align 1, !dbg !186
@.str.1.51 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1, !dbg !189
@.str.2.52 = private unnamed_addr constant [5 x i8] c"user\00", align 1, !dbg !194
@__exe_env = dso_local global { <{ %struct.exe_file_t.6, %struct.exe_file_t.6, %struct.exe_file_t.6, [29 x %struct.exe_file_t.6] }>, i32, i32 } { <{ %struct.exe_file_t.6, %struct.exe_file_t.6, %struct.exe_file_t.6, [29 x %struct.exe_file_t.6] }> <{ %struct.exe_file_t.6 { i32 0, i32 5, i64 0, ptr null }, %struct.exe_file_t.6 { i32 1, i32 9, i64 0, ptr null }, %struct.exe_file_t.6 { i32 2, i32 9, i64 0, ptr null }, [29 x %struct.exe_file_t.6] zeroinitializer }>, i32 18, i32 0 }, align 8, !dbg !196
@.str.53 = private unnamed_addr constant [46 x i8] c"Undefined call to open(): O_TRUNC | O_RDONLY\0A\00", align 1, !dbg !292
@.str.1.54 = private unnamed_addr constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 1, !dbg !298
@.str.2.55 = private unnamed_addr constant [44 x i8] c"symbolic file descriptor, ignoring (ENOENT)\00", align 1, !dbg !303
@close.n_calls = internal global i32 0, align 4, !dbg !305
@__exe_fs = dso_local global %struct.exe_file_system_t.7 zeroinitializer, align 8, !dbg !201
@read.n_calls = internal global i32 0, align 4, !dbg !372
@.str.3.58 = private unnamed_addr constant [12 x i8] c"f->off >= 0\00", align 1, !dbg !382
@.str.4.59 = private unnamed_addr constant [33 x i8] c"/tmp/klee_src/runtime/POSIX/fd.c\00", align 1, !dbg !384
@__PRETTY_FUNCTION__.read = private unnamed_addr constant [34 x i8] c"ssize_t read(int, void *, size_t)\00", align 1, !dbg !389
@write.n_calls = internal global i32 0, align 4, !dbg !394
@.str.5.60 = private unnamed_addr constant [7 x i8] c"r >= 0\00", align 1, !dbg !401
@__PRETTY_FUNCTION__.write = private unnamed_addr constant [41 x i8] c"ssize_t write(int, const void *, size_t)\00", align 1, !dbg !403
@.str.6.61 = private unnamed_addr constant [2 x i8] c"0\00", align 1, !dbg !408
@.str.7.62 = private unnamed_addr constant [24 x i8] c"write() ignores bytes.\0A\00", align 1, !dbg !410
@.str.8.63 = private unnamed_addr constant [18 x i8] c"new_off == f->off\00", align 1, !dbg !415
@__PRETTY_FUNCTION__.__fd_lseek = private unnamed_addr constant [38 x i8] c"off64_t __fd_lseek(int, off64_t, int)\00", align 1, !dbg !417
@.str.9.64 = private unnamed_addr constant [5 x i8] c"path\00", align 1, !dbg !419
@__PRETTY_FUNCTION__.fstatat = private unnamed_addr constant [51 x i8] c"int fstatat(int, const char *, struct stat *, int)\00", align 1, !dbg !421
@.str.10.65 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (ENOENT)\00", align 1, !dbg !426
@chmod.n_calls = internal global i32 0, align 4, !dbg !428
@fchmod.n_calls = internal global i32 0, align 4, !dbg !434
@__fd_ftruncate.n_calls = internal global i32 0, align 4, !dbg !439
@.str.11.67 = private unnamed_addr constant [30 x i8] c"symbolic file, ignoring (EIO)\00", align 1, !dbg !444
@.str.12.68 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 1, !dbg !449
@.str.13.69 = private unnamed_addr constant [18 x i8] c"s != (off64_t) -1\00", align 1, !dbg !451
@__PRETTY_FUNCTION__.__fd_getdents = private unnamed_addr constant [65 x i8] c"int __fd_getdents(unsigned int, struct dirent64 *, unsigned int)\00", align 1, !dbg !453
@.str.14.70 = private unnamed_addr constant [22 x i8] c"f->off != (off64_t)-1\00", align 1, !dbg !455
@.str.15.71 = private unnamed_addr constant [41 x i8] c"(TCGETS) symbolic file, incomplete model\00", align 1, !dbg !460
@.str.16.72 = private unnamed_addr constant [42 x i8] c"(TCSETS) symbolic file, silently ignoring\00", align 1, !dbg !462
@.str.17.73 = private unnamed_addr constant [43 x i8] c"(TCSETSW) symbolic file, silently ignoring\00", align 1, !dbg !467
@.str.18.74 = private unnamed_addr constant [43 x i8] c"(TCSETSF) symbolic file, silently ignoring\00", align 1, !dbg !472
@.str.19.75 = private unnamed_addr constant [45 x i8] c"(TIOCGWINSZ) symbolic file, incomplete model\00", align 1, !dbg !474
@.str.20.76 = private unnamed_addr constant [46 x i8] c"(TIOCSWINSZ) symbolic file, ignoring (EINVAL)\00", align 1, !dbg !476
@.str.21.77 = private unnamed_addr constant [43 x i8] c"(FIONREAD) symbolic file, incomplete model\00", align 1, !dbg !478
@.str.22.78 = private unnamed_addr constant [44 x i8] c"(MTIOCGET) symbolic file, ignoring (EINVAL)\00", align 1, !dbg !480
@.str.23.79 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EBADF)\00", align 1, !dbg !482
@.str.24.80 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1, !dbg !485
@getcwd.n_calls = internal global i32 0, align 4, !dbg !487
@.str.25.81 = private unnamed_addr constant [18 x i8] c"ignoring (ENOENT)\00", align 1, !dbg !492
@.str.26.66 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 1, !dbg !494
@.str.90 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1, !dbg !496
@.str.1.91 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1, !dbg !502
@.str.2.92 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1, !dbg !507

@__getdents64 = dso_local alias i64 (i32, ptr, i64), ptr @getdents64

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_init_env(ptr noundef %argcPtr, ptr noundef %argvPtr) #0 !dbg !568 {
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
  call void @llvm.dbg.declare(metadata ptr %argcPtr.addr, metadata !572, metadata !DIExpression()), !dbg !573
  store ptr %argvPtr, ptr %argvPtr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argvPtr.addr, metadata !574, metadata !DIExpression()), !dbg !575
  call void @llvm.dbg.declare(metadata ptr %argc, metadata !576, metadata !DIExpression()), !dbg !577
  %0 = load ptr, ptr %argcPtr.addr, align 8, !dbg !578
  %1 = load i32, ptr %0, align 4, !dbg !579
  store i32 %1, ptr %argc, align 4, !dbg !577
  call void @llvm.dbg.declare(metadata ptr %argv, metadata !580, metadata !DIExpression()), !dbg !581
  %2 = load ptr, ptr %argvPtr.addr, align 8, !dbg !582
  %3 = load ptr, ptr %2, align 8, !dbg !583
  store ptr %3, ptr %argv, align 8, !dbg !581
  call void @llvm.dbg.declare(metadata ptr %new_argc, metadata !584, metadata !DIExpression()), !dbg !585
  store i32 0, ptr %new_argc, align 4, !dbg !585
  call void @llvm.dbg.declare(metadata ptr %n_args, metadata !586, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.declare(metadata ptr %new_argv, metadata !588, metadata !DIExpression()), !dbg !592
  call void @llvm.dbg.declare(metadata ptr %max_len, metadata !593, metadata !DIExpression()), !dbg !594
  call void @llvm.dbg.declare(metadata ptr %min_argvs, metadata !595, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.declare(metadata ptr %max_argvs, metadata !597, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.declare(metadata ptr %sym_files, metadata !599, metadata !DIExpression()), !dbg !600
  store i32 0, ptr %sym_files, align 4, !dbg !600
  call void @llvm.dbg.declare(metadata ptr %sym_file_len, metadata !601, metadata !DIExpression()), !dbg !602
  store i32 0, ptr %sym_file_len, align 4, !dbg !602
  call void @llvm.dbg.declare(metadata ptr %sym_stdin_len, metadata !603, metadata !DIExpression()), !dbg !604
  store i32 0, ptr %sym_stdin_len, align 4, !dbg !604
  call void @llvm.dbg.declare(metadata ptr %sym_stdout_flag, metadata !605, metadata !DIExpression()), !dbg !606
  store i32 0, ptr %sym_stdout_flag, align 4, !dbg !606
  call void @llvm.dbg.declare(metadata ptr %save_all_writes_flag, metadata !607, metadata !DIExpression()), !dbg !608
  store i32 0, ptr %save_all_writes_flag, align 4, !dbg !608
  call void @llvm.dbg.declare(metadata ptr %fd_fail, metadata !609, metadata !DIExpression()), !dbg !610
  store i32 0, ptr %fd_fail, align 4, !dbg !610
  call void @llvm.dbg.declare(metadata ptr %final_argv, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.declare(metadata ptr %sym_arg_name, metadata !613, metadata !DIExpression()), !dbg !615
  %4 = call ptr @memcpy(ptr %sym_arg_name, ptr @__const.klee_init_env.sym_arg_name, i64 6), !dbg !615
  call void @llvm.dbg.declare(metadata ptr %sym_arg_num, metadata !616, metadata !DIExpression()), !dbg !617
  store i32 0, ptr %sym_arg_num, align 4, !dbg !617
  call void @llvm.dbg.declare(metadata ptr %k, metadata !618, metadata !DIExpression()), !dbg !619
  store i32 0, ptr %k, align 4, !dbg !619
  call void @llvm.dbg.declare(metadata ptr %i, metadata !620, metadata !DIExpression()), !dbg !621
  %arrayidx = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 5, !dbg !622
  store i8 0, ptr %arrayidx, align 1, !dbg !623
  %5 = load i32, ptr %argc, align 4, !dbg !624
  %cmp = icmp eq i32 %5, 2, !dbg !626
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !627

land.lhs.true:                                    ; preds = %entry
  %6 = load ptr, ptr %argv, align 8, !dbg !628
  %arrayidx1 = getelementptr inbounds ptr, ptr %6, i64 1, !dbg !628
  %7 = load ptr, ptr %arrayidx1, align 8, !dbg !628
  %call = call i32 @__streq(ptr noundef %7, ptr noundef @.str), !dbg !629
  %tobool = icmp ne i32 %call, 0, !dbg !629
  br i1 %tobool, label %if.then, label %if.end, !dbg !630

if.then:                                          ; preds = %land.lhs.true
  call void @__emit_error(ptr noundef @.str.1), !dbg !631
  br label %if.end, !dbg !633

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  br label %while.cond, !dbg !634

while.cond:                                       ; preds = %if.end239, %if.end
  %8 = load i32, ptr %k, align 4, !dbg !635
  %9 = load i32, ptr %argc, align 4, !dbg !636
  %cmp2 = icmp slt i32 %8, %9, !dbg !637
  br i1 %cmp2, label %while.body, label %while.end, !dbg !634

while.body:                                       ; preds = %while.cond
  %10 = load ptr, ptr %argv, align 8, !dbg !638
  %11 = load i32, ptr %k, align 4, !dbg !641
  %idxprom = sext i32 %11 to i64, !dbg !638
  %arrayidx3 = getelementptr inbounds ptr, ptr %10, i64 %idxprom, !dbg !638
  %12 = load ptr, ptr %arrayidx3, align 8, !dbg !638
  %call4 = call i32 @__streq(ptr noundef %12, ptr noundef @.str.2), !dbg !642
  %tobool5 = icmp ne i32 %call4, 0, !dbg !642
  br i1 %tobool5, label %if.then10, label %lor.lhs.false, !dbg !643

lor.lhs.false:                                    ; preds = %while.body
  %13 = load ptr, ptr %argv, align 8, !dbg !644
  %14 = load i32, ptr %k, align 4, !dbg !645
  %idxprom6 = sext i32 %14 to i64, !dbg !644
  %arrayidx7 = getelementptr inbounds ptr, ptr %13, i64 %idxprom6, !dbg !644
  %15 = load ptr, ptr %arrayidx7, align 8, !dbg !644
  %call8 = call i32 @__streq(ptr noundef %15, ptr noundef @.str.3), !dbg !646
  %tobool9 = icmp ne i32 %call8, 0, !dbg !646
  br i1 %tobool9, label %if.then10, label %if.else, !dbg !647

if.then10:                                        ; preds = %lor.lhs.false, %while.body
  call void @llvm.dbg.declare(metadata ptr %msg, metadata !648, metadata !DIExpression()), !dbg !650
  store ptr @.str.4, ptr %msg, align 8, !dbg !650
  %16 = load i32, ptr %k, align 4, !dbg !651
  %inc = add nsw i32 %16, 1, !dbg !651
  store i32 %inc, ptr %k, align 4, !dbg !651
  %17 = load i32, ptr %argc, align 4, !dbg !653
  %cmp11 = icmp eq i32 %inc, %17, !dbg !654
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !655

if.then12:                                        ; preds = %if.then10
  %18 = load ptr, ptr %msg, align 8, !dbg !656
  call void @__emit_error(ptr noundef %18), !dbg !657
  br label %if.end13, !dbg !657

if.end13:                                         ; preds = %if.then12, %if.then10
  %19 = load ptr, ptr %argv, align 8, !dbg !658
  %20 = load i32, ptr %k, align 4, !dbg !659
  %inc14 = add nsw i32 %20, 1, !dbg !659
  store i32 %inc14, ptr %k, align 4, !dbg !659
  %idxprom15 = sext i32 %20 to i64, !dbg !658
  %arrayidx16 = getelementptr inbounds ptr, ptr %19, i64 %idxprom15, !dbg !658
  %21 = load ptr, ptr %arrayidx16, align 8, !dbg !658
  %22 = load ptr, ptr %msg, align 8, !dbg !660
  %call17 = call i64 @__str_to_int(ptr noundef %21, ptr noundef %22), !dbg !661
  %conv = trunc i64 %call17 to i32, !dbg !661
  store i32 %conv, ptr %max_len, align 4, !dbg !662
  %23 = load i32, ptr %sym_arg_num, align 4, !dbg !663
  %cmp18 = icmp ugt i32 %23, 99, !dbg !665
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !666

if.then20:                                        ; preds = %if.end13
  call void @__emit_error(ptr noundef @.str.5), !dbg !667
  br label %if.end21, !dbg !667

if.end21:                                         ; preds = %if.then20, %if.end13
  %24 = load i32, ptr %sym_arg_num, align 4, !dbg !668
  %div = udiv i32 %24, 10, !dbg !669
  %add = add i32 48, %div, !dbg !670
  %conv22 = trunc i32 %add to i8, !dbg !671
  %arrayidx23 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 3, !dbg !672
  store i8 %conv22, ptr %arrayidx23, align 1, !dbg !673
  %25 = load i32, ptr %sym_arg_num, align 4, !dbg !674
  %rem = urem i32 %25, 10, !dbg !675
  %add24 = add i32 48, %rem, !dbg !676
  %conv25 = trunc i32 %add24 to i8, !dbg !677
  %arrayidx26 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 4, !dbg !678
  store i8 %conv25, ptr %arrayidx26, align 1, !dbg !679
  %26 = load i32, ptr %sym_arg_num, align 4, !dbg !680
  %inc27 = add i32 %26, 1, !dbg !680
  store i32 %inc27, ptr %sym_arg_num, align 4, !dbg !680
  %arraydecay = getelementptr inbounds [1024 x ptr], ptr %new_argv, i64 0, i64 0, !dbg !681
  %27 = load i32, ptr %max_len, align 4, !dbg !682
  %arraydecay28 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 0, !dbg !683
  %call29 = call ptr @__get_sym_str(i32 noundef %27, ptr noundef %arraydecay28), !dbg !684
  call void @__add_arg(ptr noundef %new_argc, ptr noundef %arraydecay, ptr noundef %call29, i32 noundef 1024), !dbg !685
  br label %if.end239, !dbg !686

if.else:                                          ; preds = %lor.lhs.false
  %28 = load ptr, ptr %argv, align 8, !dbg !687
  %29 = load i32, ptr %k, align 4, !dbg !689
  %idxprom30 = sext i32 %29 to i64, !dbg !687
  %arrayidx31 = getelementptr inbounds ptr, ptr %28, i64 %idxprom30, !dbg !687
  %30 = load ptr, ptr %arrayidx31, align 8, !dbg !687
  %call32 = call i32 @__streq(ptr noundef %30, ptr noundef @.str.6), !dbg !690
  %tobool33 = icmp ne i32 %call32, 0, !dbg !690
  br i1 %tobool33, label %if.then39, label %lor.lhs.false34, !dbg !691

lor.lhs.false34:                                  ; preds = %if.else
  %31 = load ptr, ptr %argv, align 8, !dbg !692
  %32 = load i32, ptr %k, align 4, !dbg !693
  %idxprom35 = sext i32 %32 to i64, !dbg !692
  %arrayidx36 = getelementptr inbounds ptr, ptr %31, i64 %idxprom35, !dbg !692
  %33 = load ptr, ptr %arrayidx36, align 8, !dbg !692
  %call37 = call i32 @__streq(ptr noundef %33, ptr noundef @.str.7), !dbg !694
  %tobool38 = icmp ne i32 %call37, 0, !dbg !694
  br i1 %tobool38, label %if.then39, label %if.else94, !dbg !695

if.then39:                                        ; preds = %lor.lhs.false34, %if.else
  call void @llvm.dbg.declare(metadata ptr %msg40, metadata !696, metadata !DIExpression()), !dbg !698
  store ptr @.str.8, ptr %msg40, align 8, !dbg !698
  %34 = load i32, ptr %k, align 4, !dbg !699
  %add41 = add nsw i32 %34, 3, !dbg !701
  %35 = load i32, ptr %argc, align 4, !dbg !702
  %cmp42 = icmp sge i32 %add41, %35, !dbg !703
  br i1 %cmp42, label %if.then44, label %if.end45, !dbg !704

if.then44:                                        ; preds = %if.then39
  %36 = load ptr, ptr %msg40, align 8, !dbg !705
  call void @__emit_error(ptr noundef %36), !dbg !706
  br label %if.end45, !dbg !706

if.end45:                                         ; preds = %if.then44, %if.then39
  %37 = load i32, ptr %k, align 4, !dbg !707
  %inc46 = add nsw i32 %37, 1, !dbg !707
  store i32 %inc46, ptr %k, align 4, !dbg !707
  %38 = load ptr, ptr %argv, align 8, !dbg !708
  %39 = load i32, ptr %k, align 4, !dbg !709
  %inc47 = add nsw i32 %39, 1, !dbg !709
  store i32 %inc47, ptr %k, align 4, !dbg !709
  %idxprom48 = sext i32 %39 to i64, !dbg !708
  %arrayidx49 = getelementptr inbounds ptr, ptr %38, i64 %idxprom48, !dbg !708
  %40 = load ptr, ptr %arrayidx49, align 8, !dbg !708
  %41 = load ptr, ptr %msg40, align 8, !dbg !710
  %call50 = call i64 @__str_to_int(ptr noundef %40, ptr noundef %41), !dbg !711
  %conv51 = trunc i64 %call50 to i32, !dbg !711
  store i32 %conv51, ptr %min_argvs, align 4, !dbg !712
  %42 = load ptr, ptr %argv, align 8, !dbg !713
  %43 = load i32, ptr %k, align 4, !dbg !714
  %inc52 = add nsw i32 %43, 1, !dbg !714
  store i32 %inc52, ptr %k, align 4, !dbg !714
  %idxprom53 = sext i32 %43 to i64, !dbg !713
  %arrayidx54 = getelementptr inbounds ptr, ptr %42, i64 %idxprom53, !dbg !713
  %44 = load ptr, ptr %arrayidx54, align 8, !dbg !713
  %45 = load ptr, ptr %msg40, align 8, !dbg !715
  %call55 = call i64 @__str_to_int(ptr noundef %44, ptr noundef %45), !dbg !716
  %conv56 = trunc i64 %call55 to i32, !dbg !716
  store i32 %conv56, ptr %max_argvs, align 4, !dbg !717
  %46 = load ptr, ptr %argv, align 8, !dbg !718
  %47 = load i32, ptr %k, align 4, !dbg !719
  %inc57 = add nsw i32 %47, 1, !dbg !719
  store i32 %inc57, ptr %k, align 4, !dbg !719
  %idxprom58 = sext i32 %47 to i64, !dbg !718
  %arrayidx59 = getelementptr inbounds ptr, ptr %46, i64 %idxprom58, !dbg !718
  %48 = load ptr, ptr %arrayidx59, align 8, !dbg !718
  %49 = load ptr, ptr %msg40, align 8, !dbg !720
  %call60 = call i64 @__str_to_int(ptr noundef %48, ptr noundef %49), !dbg !721
  %conv61 = trunc i64 %call60 to i32, !dbg !721
  store i32 %conv61, ptr %max_len, align 4, !dbg !722
  %50 = load i32, ptr %min_argvs, align 4, !dbg !723
  %51 = load i32, ptr %max_argvs, align 4, !dbg !725
  %cmp62 = icmp ugt i32 %50, %51, !dbg !726
  br i1 %cmp62, label %if.then70, label %lor.lhs.false64, !dbg !727

lor.lhs.false64:                                  ; preds = %if.end45
  %52 = load i32, ptr %min_argvs, align 4, !dbg !728
  %cmp65 = icmp eq i32 %52, 0, !dbg !729
  %53 = load i32, ptr %max_argvs, align 4
  %cmp68 = icmp eq i32 %53, 0
  %or.cond = select i1 %cmp65, i1 %cmp68, i1 false, !dbg !730
  br i1 %or.cond, label %if.then70, label %if.end71, !dbg !730

if.then70:                                        ; preds = %lor.lhs.false64, %if.end45
  call void @__emit_error(ptr noundef @.str.9), !dbg !731
  br label %if.end71, !dbg !731

if.end71:                                         ; preds = %if.then70, %lor.lhs.false64
  %54 = load i32, ptr %min_argvs, align 4, !dbg !732
  %55 = load i32, ptr %max_argvs, align 4, !dbg !733
  %add72 = add i32 %55, 1, !dbg !734
  %call73 = call i32 @klee_range(i32 noundef %54, i32 noundef %add72, ptr noundef @.str.10), !dbg !735
  store i32 %call73, ptr %n_args, align 4, !dbg !736
  %56 = load i32, ptr %sym_arg_num, align 4, !dbg !737
  %57 = load i32, ptr %max_argvs, align 4, !dbg !739
  %add74 = add i32 %56, %57, !dbg !740
  %cmp75 = icmp ugt i32 %add74, 99, !dbg !741
  br i1 %cmp75, label %if.then77, label %if.end78, !dbg !742

if.then77:                                        ; preds = %if.end71
  call void @__emit_error(ptr noundef @.str.5), !dbg !743
  br label %if.end78, !dbg !743

if.end78:                                         ; preds = %if.then77, %if.end71
  store i32 0, ptr %i, align 4, !dbg !744
  br label %for.cond, !dbg !746

for.cond:                                         ; preds = %for.body, %if.end78
  %58 = load i32, ptr %i, align 4, !dbg !747
  %59 = load i32, ptr %n_args, align 4, !dbg !749
  %cmp79 = icmp slt i32 %58, %59, !dbg !750
  br i1 %cmp79, label %for.body, label %if.end239, !dbg !751

for.body:                                         ; preds = %for.cond
  %60 = load i32, ptr %sym_arg_num, align 4, !dbg !752
  %div81 = udiv i32 %60, 10, !dbg !754
  %add82 = add i32 48, %div81, !dbg !755
  %conv83 = trunc i32 %add82 to i8, !dbg !756
  %arrayidx84 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 3, !dbg !757
  store i8 %conv83, ptr %arrayidx84, align 1, !dbg !758
  %61 = load i32, ptr %sym_arg_num, align 4, !dbg !759
  %rem85 = urem i32 %61, 10, !dbg !760
  %add86 = add i32 48, %rem85, !dbg !761
  %conv87 = trunc i32 %add86 to i8, !dbg !762
  %arrayidx88 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 4, !dbg !763
  store i8 %conv87, ptr %arrayidx88, align 1, !dbg !764
  %62 = load i32, ptr %sym_arg_num, align 4, !dbg !765
  %inc89 = add i32 %62, 1, !dbg !765
  store i32 %inc89, ptr %sym_arg_num, align 4, !dbg !765
  %arraydecay90 = getelementptr inbounds [1024 x ptr], ptr %new_argv, i64 0, i64 0, !dbg !766
  %63 = load i32, ptr %max_len, align 4, !dbg !767
  %arraydecay91 = getelementptr inbounds [6 x i8], ptr %sym_arg_name, i64 0, i64 0, !dbg !768
  %call92 = call ptr @__get_sym_str(i32 noundef %63, ptr noundef %arraydecay91), !dbg !769
  call void @__add_arg(ptr noundef %new_argc, ptr noundef %arraydecay90, ptr noundef %call92, i32 noundef 1024), !dbg !770
  %64 = load i32, ptr %i, align 4, !dbg !771
  %inc93 = add nsw i32 %64, 1, !dbg !771
  store i32 %inc93, ptr %i, align 4, !dbg !771
  br label %for.cond, !dbg !772, !llvm.loop !773

if.else94:                                        ; preds = %lor.lhs.false34
  %65 = load ptr, ptr %argv, align 8, !dbg !775
  %66 = load i32, ptr %k, align 4, !dbg !777
  %idxprom95 = sext i32 %66 to i64, !dbg !775
  %arrayidx96 = getelementptr inbounds ptr, ptr %65, i64 %idxprom95, !dbg !775
  %67 = load ptr, ptr %arrayidx96, align 8, !dbg !775
  %call97 = call i32 @__streq(ptr noundef %67, ptr noundef @.str.11), !dbg !778
  %tobool98 = icmp ne i32 %call97, 0, !dbg !778
  br i1 %tobool98, label %if.then104, label %lor.lhs.false99, !dbg !779

lor.lhs.false99:                                  ; preds = %if.else94
  %68 = load ptr, ptr %argv, align 8, !dbg !780
  %69 = load i32, ptr %k, align 4, !dbg !781
  %idxprom100 = sext i32 %69 to i64, !dbg !780
  %arrayidx101 = getelementptr inbounds ptr, ptr %68, i64 %idxprom100, !dbg !780
  %70 = load ptr, ptr %arrayidx101, align 8, !dbg !780
  %call102 = call i32 @__streq(ptr noundef %70, ptr noundef @.str.12), !dbg !782
  %tobool103 = icmp ne i32 %call102, 0, !dbg !782
  br i1 %tobool103, label %if.then104, label %if.else134, !dbg !783

if.then104:                                       ; preds = %lor.lhs.false99, %if.else94
  call void @llvm.dbg.declare(metadata ptr %msg105, metadata !784, metadata !DIExpression()), !dbg !786
  store ptr @.str.13, ptr %msg105, align 8, !dbg !786
  %71 = load i32, ptr %k, align 4, !dbg !787
  %add106 = add nsw i32 %71, 2, !dbg !789
  %72 = load i32, ptr %argc, align 4, !dbg !790
  %cmp107 = icmp sge i32 %add106, %72, !dbg !791
  br i1 %cmp107, label %if.then109, label %if.end110, !dbg !792

if.then109:                                       ; preds = %if.then104
  %73 = load ptr, ptr %msg105, align 8, !dbg !793
  call void @__emit_error(ptr noundef %73), !dbg !794
  br label %if.end110, !dbg !794

if.end110:                                        ; preds = %if.then109, %if.then104
  %74 = load i32, ptr %sym_files, align 4, !dbg !795
  %cmp111 = icmp ne i32 %74, 0, !dbg !797
  br i1 %cmp111, label %if.then113, label %if.end114, !dbg !798

if.then113:                                       ; preds = %if.end110
  call void @__emit_error(ptr noundef @.str.14), !dbg !799
  br label %if.end114, !dbg !799

if.end114:                                        ; preds = %if.then113, %if.end110
  %75 = load i32, ptr %k, align 4, !dbg !800
  %inc115 = add nsw i32 %75, 1, !dbg !800
  store i32 %inc115, ptr %k, align 4, !dbg !800
  %76 = load ptr, ptr %argv, align 8, !dbg !801
  %77 = load i32, ptr %k, align 4, !dbg !802
  %inc116 = add nsw i32 %77, 1, !dbg !802
  store i32 %inc116, ptr %k, align 4, !dbg !802
  %idxprom117 = sext i32 %77 to i64, !dbg !801
  %arrayidx118 = getelementptr inbounds ptr, ptr %76, i64 %idxprom117, !dbg !801
  %78 = load ptr, ptr %arrayidx118, align 8, !dbg !801
  %79 = load ptr, ptr %msg105, align 8, !dbg !803
  %call119 = call i64 @__str_to_int(ptr noundef %78, ptr noundef %79), !dbg !804
  %conv120 = trunc i64 %call119 to i32, !dbg !804
  store i32 %conv120, ptr %sym_files, align 4, !dbg !805
  %80 = load ptr, ptr %argv, align 8, !dbg !806
  %81 = load i32, ptr %k, align 4, !dbg !807
  %inc121 = add nsw i32 %81, 1, !dbg !807
  store i32 %inc121, ptr %k, align 4, !dbg !807
  %idxprom122 = sext i32 %81 to i64, !dbg !806
  %arrayidx123 = getelementptr inbounds ptr, ptr %80, i64 %idxprom122, !dbg !806
  %82 = load ptr, ptr %arrayidx123, align 8, !dbg !806
  %83 = load ptr, ptr %msg105, align 8, !dbg !808
  %call124 = call i64 @__str_to_int(ptr noundef %82, ptr noundef %83), !dbg !809
  %conv125 = trunc i64 %call124 to i32, !dbg !809
  store i32 %conv125, ptr %sym_file_len, align 4, !dbg !810
  %84 = load i32, ptr %sym_files, align 4, !dbg !811
  %cmp126 = icmp eq i32 %84, 0, !dbg !813
  br i1 %cmp126, label %if.then128, label %if.end129, !dbg !814

if.then128:                                       ; preds = %if.end114
  call void @__emit_error(ptr noundef @.str.15), !dbg !815
  br label %if.end129, !dbg !815

if.end129:                                        ; preds = %if.then128, %if.end114
  %85 = load i32, ptr %sym_file_len, align 4, !dbg !816
  %cmp130 = icmp eq i32 %85, 0, !dbg !818
  br i1 %cmp130, label %if.then132, label %if.end239, !dbg !819

if.then132:                                       ; preds = %if.end129
  call void @__emit_error(ptr noundef @.str.16), !dbg !820
  br label %if.end239, !dbg !820

if.else134:                                       ; preds = %lor.lhs.false99
  %86 = load ptr, ptr %argv, align 8, !dbg !821
  %87 = load i32, ptr %k, align 4, !dbg !823
  %idxprom135 = sext i32 %87 to i64, !dbg !821
  %arrayidx136 = getelementptr inbounds ptr, ptr %86, i64 %idxprom135, !dbg !821
  %88 = load ptr, ptr %arrayidx136, align 8, !dbg !821
  %call137 = call i32 @__streq(ptr noundef %88, ptr noundef @.str.17), !dbg !824
  %tobool138 = icmp ne i32 %call137, 0, !dbg !824
  br i1 %tobool138, label %if.then144, label %lor.lhs.false139, !dbg !825

lor.lhs.false139:                                 ; preds = %if.else134
  %89 = load ptr, ptr %argv, align 8, !dbg !826
  %90 = load i32, ptr %k, align 4, !dbg !827
  %idxprom140 = sext i32 %90 to i64, !dbg !826
  %arrayidx141 = getelementptr inbounds ptr, ptr %89, i64 %idxprom140, !dbg !826
  %91 = load ptr, ptr %arrayidx141, align 8, !dbg !826
  %call142 = call i32 @__streq(ptr noundef %91, ptr noundef @.str.18), !dbg !828
  %tobool143 = icmp ne i32 %call142, 0, !dbg !828
  br i1 %tobool143, label %if.then144, label %if.else156, !dbg !829

if.then144:                                       ; preds = %lor.lhs.false139, %if.else134
  call void @llvm.dbg.declare(metadata ptr %msg145, metadata !830, metadata !DIExpression()), !dbg !832
  store ptr @.str.19, ptr %msg145, align 8, !dbg !832
  %92 = load i32, ptr %k, align 4, !dbg !833
  %inc146 = add nsw i32 %92, 1, !dbg !833
  store i32 %inc146, ptr %k, align 4, !dbg !833
  %93 = load i32, ptr %argc, align 4, !dbg !835
  %cmp147 = icmp eq i32 %inc146, %93, !dbg !836
  br i1 %cmp147, label %if.then149, label %if.end150, !dbg !837

if.then149:                                       ; preds = %if.then144
  %94 = load ptr, ptr %msg145, align 8, !dbg !838
  call void @__emit_error(ptr noundef %94), !dbg !839
  br label %if.end150, !dbg !839

if.end150:                                        ; preds = %if.then149, %if.then144
  %95 = load ptr, ptr %argv, align 8, !dbg !840
  %96 = load i32, ptr %k, align 4, !dbg !841
  %inc151 = add nsw i32 %96, 1, !dbg !841
  store i32 %inc151, ptr %k, align 4, !dbg !841
  %idxprom152 = sext i32 %96 to i64, !dbg !840
  %arrayidx153 = getelementptr inbounds ptr, ptr %95, i64 %idxprom152, !dbg !840
  %97 = load ptr, ptr %arrayidx153, align 8, !dbg !840
  %98 = load ptr, ptr %msg145, align 8, !dbg !842
  %call154 = call i64 @__str_to_int(ptr noundef %97, ptr noundef %98), !dbg !843
  %conv155 = trunc i64 %call154 to i32, !dbg !843
  store i32 %conv155, ptr %sym_stdin_len, align 4, !dbg !844
  br label %if.end239, !dbg !845

if.else156:                                       ; preds = %lor.lhs.false139
  %99 = load ptr, ptr %argv, align 8, !dbg !846
  %100 = load i32, ptr %k, align 4, !dbg !848
  %idxprom157 = sext i32 %100 to i64, !dbg !846
  %arrayidx158 = getelementptr inbounds ptr, ptr %99, i64 %idxprom157, !dbg !846
  %101 = load ptr, ptr %arrayidx158, align 8, !dbg !846
  %call159 = call i32 @__streq(ptr noundef %101, ptr noundef @.str.20), !dbg !849
  %tobool160 = icmp ne i32 %call159, 0, !dbg !849
  br i1 %tobool160, label %if.then166, label %lor.lhs.false161, !dbg !850

lor.lhs.false161:                                 ; preds = %if.else156
  %102 = load ptr, ptr %argv, align 8, !dbg !851
  %103 = load i32, ptr %k, align 4, !dbg !852
  %idxprom162 = sext i32 %103 to i64, !dbg !851
  %arrayidx163 = getelementptr inbounds ptr, ptr %102, i64 %idxprom162, !dbg !851
  %104 = load ptr, ptr %arrayidx163, align 8, !dbg !851
  %call164 = call i32 @__streq(ptr noundef %104, ptr noundef @.str.21), !dbg !853
  %tobool165 = icmp ne i32 %call164, 0, !dbg !853
  br i1 %tobool165, label %if.then166, label %if.else168, !dbg !854

if.then166:                                       ; preds = %lor.lhs.false161, %if.else156
  store i32 1, ptr %sym_stdout_flag, align 4, !dbg !855
  %105 = load i32, ptr %k, align 4, !dbg !857
  %inc167 = add nsw i32 %105, 1, !dbg !857
  store i32 %inc167, ptr %k, align 4, !dbg !857
  br label %if.end239, !dbg !858

if.else168:                                       ; preds = %lor.lhs.false161
  %106 = load ptr, ptr %argv, align 8, !dbg !859
  %107 = load i32, ptr %k, align 4, !dbg !861
  %idxprom169 = sext i32 %107 to i64, !dbg !859
  %arrayidx170 = getelementptr inbounds ptr, ptr %106, i64 %idxprom169, !dbg !859
  %108 = load ptr, ptr %arrayidx170, align 8, !dbg !859
  %call171 = call i32 @__streq(ptr noundef %108, ptr noundef @.str.22), !dbg !862
  %tobool172 = icmp ne i32 %call171, 0, !dbg !862
  br i1 %tobool172, label %if.then178, label %lor.lhs.false173, !dbg !863

lor.lhs.false173:                                 ; preds = %if.else168
  %109 = load ptr, ptr %argv, align 8, !dbg !864
  %110 = load i32, ptr %k, align 4, !dbg !865
  %idxprom174 = sext i32 %110 to i64, !dbg !864
  %arrayidx175 = getelementptr inbounds ptr, ptr %109, i64 %idxprom174, !dbg !864
  %111 = load ptr, ptr %arrayidx175, align 8, !dbg !864
  %call176 = call i32 @__streq(ptr noundef %111, ptr noundef @.str.23), !dbg !866
  %tobool177 = icmp ne i32 %call176, 0, !dbg !866
  br i1 %tobool177, label %if.then178, label %if.else180, !dbg !867

if.then178:                                       ; preds = %lor.lhs.false173, %if.else168
  store i32 1, ptr %save_all_writes_flag, align 4, !dbg !868
  %112 = load i32, ptr %k, align 4, !dbg !870
  %inc179 = add nsw i32 %112, 1, !dbg !870
  store i32 %inc179, ptr %k, align 4, !dbg !870
  br label %if.end239, !dbg !871

if.else180:                                       ; preds = %lor.lhs.false173
  %113 = load ptr, ptr %argv, align 8, !dbg !872
  %114 = load i32, ptr %k, align 4, !dbg !874
  %idxprom181 = sext i32 %114 to i64, !dbg !872
  %arrayidx182 = getelementptr inbounds ptr, ptr %113, i64 %idxprom181, !dbg !872
  %115 = load ptr, ptr %arrayidx182, align 8, !dbg !872
  %call183 = call i32 @__streq(ptr noundef %115, ptr noundef @.str.24), !dbg !875
  %tobool184 = icmp ne i32 %call183, 0, !dbg !875
  br i1 %tobool184, label %if.then190, label %lor.lhs.false185, !dbg !876

lor.lhs.false185:                                 ; preds = %if.else180
  %116 = load ptr, ptr %argv, align 8, !dbg !877
  %117 = load i32, ptr %k, align 4, !dbg !878
  %idxprom186 = sext i32 %117 to i64, !dbg !877
  %arrayidx187 = getelementptr inbounds ptr, ptr %116, i64 %idxprom186, !dbg !877
  %118 = load ptr, ptr %arrayidx187, align 8, !dbg !877
  %call188 = call i32 @__streq(ptr noundef %118, ptr noundef @.str.25), !dbg !879
  %tobool189 = icmp ne i32 %call188, 0, !dbg !879
  br i1 %tobool189, label %if.then190, label %if.else192, !dbg !880

if.then190:                                       ; preds = %lor.lhs.false185, %if.else180
  store i32 1, ptr %fd_fail, align 4, !dbg !881
  %119 = load i32, ptr %k, align 4, !dbg !883
  %inc191 = add nsw i32 %119, 1, !dbg !883
  store i32 %inc191, ptr %k, align 4, !dbg !883
  br label %if.end239, !dbg !884

if.else192:                                       ; preds = %lor.lhs.false185
  %120 = load ptr, ptr %argv, align 8, !dbg !885
  %121 = load i32, ptr %k, align 4, !dbg !887
  %idxprom193 = sext i32 %121 to i64, !dbg !885
  %arrayidx194 = getelementptr inbounds ptr, ptr %120, i64 %idxprom193, !dbg !885
  %122 = load ptr, ptr %arrayidx194, align 8, !dbg !885
  %call195 = call i32 @__streq(ptr noundef %122, ptr noundef @.str.26), !dbg !888
  %tobool196 = icmp ne i32 %call195, 0, !dbg !888
  br i1 %tobool196, label %if.then202, label %lor.lhs.false197, !dbg !889

lor.lhs.false197:                                 ; preds = %if.else192
  %123 = load ptr, ptr %argv, align 8, !dbg !890
  %124 = load i32, ptr %k, align 4, !dbg !891
  %idxprom198 = sext i32 %124 to i64, !dbg !890
  %arrayidx199 = getelementptr inbounds ptr, ptr %123, i64 %idxprom198, !dbg !890
  %125 = load ptr, ptr %arrayidx199, align 8, !dbg !890
  %call200 = call i32 @__streq(ptr noundef %125, ptr noundef @.str.27), !dbg !892
  %tobool201 = icmp ne i32 %call200, 0, !dbg !892
  br i1 %tobool201, label %if.then202, label %if.else204, !dbg !893

if.then202:                                       ; preds = %lor.lhs.false197, %if.else192
  %126 = load i32, ptr %k, align 4, !dbg !894
  %add203 = add nsw i32 %126, 2, !dbg !894
  store i32 %add203, ptr %k, align 4, !dbg !894
  br label %if.end239, !dbg !896

if.else204:                                       ; preds = %lor.lhs.false197
  %127 = load ptr, ptr %argv, align 8, !dbg !897
  %128 = load i32, ptr %k, align 4, !dbg !899
  %idxprom205 = sext i32 %128 to i64, !dbg !897
  %arrayidx206 = getelementptr inbounds ptr, ptr %127, i64 %idxprom205, !dbg !897
  %129 = load ptr, ptr %arrayidx206, align 8, !dbg !897
  %call207 = call i32 @__streq(ptr noundef %129, ptr noundef @.str.28), !dbg !900
  %tobool208 = icmp ne i32 %call207, 0, !dbg !900
  br i1 %tobool208, label %if.then214, label %lor.lhs.false209, !dbg !901

lor.lhs.false209:                                 ; preds = %if.else204
  %130 = load ptr, ptr %argv, align 8, !dbg !902
  %131 = load i32, ptr %k, align 4, !dbg !903
  %idxprom210 = sext i32 %131 to i64, !dbg !902
  %arrayidx211 = getelementptr inbounds ptr, ptr %130, i64 %idxprom210, !dbg !902
  %132 = load ptr, ptr %arrayidx211, align 8, !dbg !902
  %call212 = call i32 @__streq(ptr noundef %132, ptr noundef @.str.29), !dbg !904
  %tobool213 = icmp ne i32 %call212, 0, !dbg !904
  br i1 %tobool213, label %if.then214, label %if.else226, !dbg !905

if.then214:                                       ; preds = %lor.lhs.false209, %if.else204
  call void @llvm.dbg.declare(metadata ptr %msg215, metadata !906, metadata !DIExpression()), !dbg !908
  store ptr @.str.30, ptr %msg215, align 8, !dbg !908
  %133 = load i32, ptr %k, align 4, !dbg !909
  %inc216 = add nsw i32 %133, 1, !dbg !909
  store i32 %inc216, ptr %k, align 4, !dbg !909
  %134 = load i32, ptr %argc, align 4, !dbg !911
  %cmp217 = icmp eq i32 %inc216, %134, !dbg !912
  br i1 %cmp217, label %if.then219, label %if.end220, !dbg !913

if.then219:                                       ; preds = %if.then214
  %135 = load ptr, ptr %msg215, align 8, !dbg !914
  call void @__emit_error(ptr noundef %135), !dbg !915
  br label %if.end220, !dbg !915

if.end220:                                        ; preds = %if.then219, %if.then214
  %136 = load ptr, ptr %argv, align 8, !dbg !916
  %137 = load i32, ptr %k, align 4, !dbg !917
  %inc221 = add nsw i32 %137, 1, !dbg !917
  store i32 %inc221, ptr %k, align 4, !dbg !917
  %idxprom222 = sext i32 %137 to i64, !dbg !916
  %arrayidx223 = getelementptr inbounds ptr, ptr %136, i64 %idxprom222, !dbg !916
  %138 = load ptr, ptr %arrayidx223, align 8, !dbg !916
  %139 = load ptr, ptr %msg215, align 8, !dbg !918
  %call224 = call i64 @__str_to_int(ptr noundef %138, ptr noundef %139), !dbg !919
  %conv225 = trunc i64 %call224 to i32, !dbg !919
  store i32 %conv225, ptr %fd_fail, align 4, !dbg !920
  br label %if.end239, !dbg !921

if.else226:                                       ; preds = %lor.lhs.false209
  %arraydecay227 = getelementptr inbounds [1024 x ptr], ptr %new_argv, i64 0, i64 0, !dbg !922
  %140 = load ptr, ptr %argv, align 8, !dbg !924
  %141 = load i32, ptr %k, align 4, !dbg !925
  %inc228 = add nsw i32 %141, 1, !dbg !925
  store i32 %inc228, ptr %k, align 4, !dbg !925
  %idxprom229 = sext i32 %141 to i64, !dbg !924
  %arrayidx230 = getelementptr inbounds ptr, ptr %140, i64 %idxprom229, !dbg !924
  %142 = load ptr, ptr %arrayidx230, align 8, !dbg !924
  call void @__add_arg(ptr noundef %new_argc, ptr noundef %arraydecay227, ptr noundef %142, i32 noundef 1024), !dbg !926
  br label %if.end239

if.end239:                                        ; preds = %for.cond, %if.end150, %if.then178, %if.then202, %if.else226, %if.end220, %if.then190, %if.then166, %if.end129, %if.then132, %if.end21
  br label %while.cond, !dbg !634, !llvm.loop !927

while.end:                                        ; preds = %while.cond
  %143 = load i32, ptr %new_argc, align 4, !dbg !929
  %add240 = add nsw i32 %143, 1, !dbg !930
  %conv241 = sext i32 %add240 to i64, !dbg !931
  %mul = mul i64 %conv241, 8, !dbg !932
  %call242 = call noalias ptr @malloc(i64 noundef %mul) #12, !dbg !933
  store ptr %call242, ptr %final_argv, align 8, !dbg !934
  %144 = load ptr, ptr %final_argv, align 8, !dbg !935
  %tobool243 = icmp ne ptr %144, null, !dbg !935
  br i1 %tobool243, label %if.end245, label %if.then244, !dbg !937

if.then244:                                       ; preds = %while.end
  call void @__emit_error(ptr noundef @.str.31), !dbg !938
  br label %if.end245, !dbg !938

if.end245:                                        ; preds = %if.then244, %while.end
  %145 = load ptr, ptr %final_argv, align 8, !dbg !939
  call void @klee_mark_global(ptr noundef %145), !dbg !940
  %146 = load ptr, ptr %final_argv, align 8, !dbg !941
  %arraydecay246 = getelementptr inbounds [1024 x ptr], ptr %new_argv, i64 0, i64 0, !dbg !942
  %147 = load i32, ptr %new_argc, align 4, !dbg !943
  %conv247 = sext i32 %147 to i64, !dbg !943
  %mul248 = mul i64 %conv247, 8, !dbg !944
  %148 = call ptr @memcpy(ptr %146, ptr %arraydecay246, i64 %mul248), !dbg !942
  %149 = load ptr, ptr %final_argv, align 8, !dbg !945
  %150 = load i32, ptr %new_argc, align 4, !dbg !946
  %idxprom249 = sext i32 %150 to i64, !dbg !945
  %arrayidx250 = getelementptr inbounds ptr, ptr %149, i64 %idxprom249, !dbg !945
  store ptr null, ptr %arrayidx250, align 8, !dbg !947
  %151 = load i32, ptr %new_argc, align 4, !dbg !948
  %152 = load ptr, ptr %argcPtr.addr, align 8, !dbg !949
  store i32 %151, ptr %152, align 4, !dbg !950
  %153 = load ptr, ptr %final_argv, align 8, !dbg !951
  %154 = load ptr, ptr %argvPtr.addr, align 8, !dbg !952
  store ptr %153, ptr %154, align 8, !dbg !953
  %155 = load i32, ptr %sym_files, align 4, !dbg !954
  %156 = load i32, ptr %sym_file_len, align 4, !dbg !955
  %157 = load i32, ptr %sym_stdin_len, align 4, !dbg !956
  %158 = load i32, ptr %sym_stdout_flag, align 4, !dbg !957
  %159 = load i32, ptr %save_all_writes_flag, align 4, !dbg !958
  %160 = load i32, ptr %fd_fail, align 4, !dbg !959
  call void @klee_init_fds(i32 noundef %155, i32 noundef %156, i32 noundef %157, i32 noundef %158, i32 noundef %159, i32 noundef %160), !dbg !960
  ret void, !dbg !961
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @__streq(ptr noundef %a, ptr noundef %b) #0 !dbg !962 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca ptr, align 8
  %b.addr = alloca ptr, align 8
  store ptr %a, ptr %a.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %a.addr, metadata !965, metadata !DIExpression()), !dbg !966
  store ptr %b, ptr %b.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %b.addr, metadata !967, metadata !DIExpression()), !dbg !968
  br label %while.cond, !dbg !969

while.cond:                                       ; preds = %if.end, %entry
  %0 = load ptr, ptr %a.addr, align 8, !dbg !970
  %1 = load i8, ptr %0, align 1, !dbg !971
  %conv = sext i8 %1 to i32, !dbg !971
  %2 = load ptr, ptr %b.addr, align 8, !dbg !972
  %3 = load i8, ptr %2, align 1, !dbg !973
  %conv1 = sext i8 %3 to i32, !dbg !973
  %cmp = icmp eq i32 %conv, %conv1, !dbg !974
  br i1 %cmp, label %while.body, label %while.end, !dbg !969

while.body:                                       ; preds = %while.cond
  %4 = load ptr, ptr %a.addr, align 8, !dbg !975
  %5 = load i8, ptr %4, align 1, !dbg !978
  %tobool = icmp ne i8 %5, 0, !dbg !978
  br i1 %tobool, label %if.end, label %if.then, !dbg !979

if.then:                                          ; preds = %while.body
  store i32 1, ptr %retval, align 4, !dbg !980
  br label %return, !dbg !980

if.end:                                           ; preds = %while.body
  %6 = load ptr, ptr %a.addr, align 8, !dbg !981
  %incdec.ptr = getelementptr inbounds i8, ptr %6, i32 1, !dbg !981
  store ptr %incdec.ptr, ptr %a.addr, align 8, !dbg !981
  %7 = load ptr, ptr %b.addr, align 8, !dbg !982
  %incdec.ptr3 = getelementptr inbounds i8, ptr %7, i32 1, !dbg !982
  store ptr %incdec.ptr3, ptr %b.addr, align 8, !dbg !982
  br label %while.cond, !dbg !969, !llvm.loop !983

while.end:                                        ; preds = %while.cond
  store i32 0, ptr %retval, align 4, !dbg !985
  br label %return, !dbg !985

return:                                           ; preds = %while.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !986
  ret i32 %8, !dbg !986
}

; Function Attrs: noinline nounwind uwtable
define internal void @__emit_error(ptr noundef %msg) #0 !dbg !987 {
entry:
  %msg.addr = alloca ptr, align 8
  store ptr %msg, ptr %msg.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %msg.addr, metadata !990, metadata !DIExpression()), !dbg !991
  %0 = load ptr, ptr %msg.addr, align 8, !dbg !992
  call void @klee_report_error(ptr noundef @.str.32, i32 noundef 20, ptr noundef %0, ptr noundef @.str.33) #13, !dbg !993
  unreachable, !dbg !993
}

; Function Attrs: noinline nounwind uwtable
define internal i64 @__str_to_int(ptr noundef %s, ptr noundef %error_msg) #0 !dbg !994 {
entry:
  %s.addr = alloca ptr, align 8
  %error_msg.addr = alloca ptr, align 8
  %res = alloca i64, align 8
  %c = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !997, metadata !DIExpression()), !dbg !998
  store ptr %error_msg, ptr %error_msg.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %error_msg.addr, metadata !999, metadata !DIExpression()), !dbg !1000
  call void @llvm.dbg.declare(metadata ptr %res, metadata !1001, metadata !DIExpression()), !dbg !1002
  store i64 0, ptr %res, align 8, !dbg !1002
  call void @llvm.dbg.declare(metadata ptr %c, metadata !1003, metadata !DIExpression()), !dbg !1004
  %0 = load ptr, ptr %s.addr, align 8, !dbg !1005
  %1 = load i8, ptr %0, align 1, !dbg !1007
  %tobool = icmp ne i8 %1, 0, !dbg !1007
  br i1 %tobool, label %if.end, label %if.then, !dbg !1008

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %error_msg.addr, align 8, !dbg !1009
  call void @__emit_error(ptr noundef %2), !dbg !1010
  br label %if.end, !dbg !1010

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !1011

while.cond:                                       ; preds = %if.end9, %if.end
  %3 = load ptr, ptr %s.addr, align 8, !dbg !1012
  %incdec.ptr = getelementptr inbounds i8, ptr %3, i32 1, !dbg !1012
  store ptr %incdec.ptr, ptr %s.addr, align 8, !dbg !1012
  %4 = load i8, ptr %3, align 1, !dbg !1013
  store i8 %4, ptr %c, align 1, !dbg !1014
  %tobool1 = icmp ne i8 %4, 0, !dbg !1011
  br i1 %tobool1, label %while.body, label %while.end, !dbg !1011

while.body:                                       ; preds = %while.cond
  %5 = load i8, ptr %c, align 1, !dbg !1015
  %conv = sext i8 %5 to i32, !dbg !1015
  %cmp = icmp sge i32 %conv, 48, !dbg !1018
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !1019

land.lhs.true:                                    ; preds = %while.body
  %6 = load i8, ptr %c, align 1, !dbg !1020
  %conv3 = sext i8 %6 to i32, !dbg !1020
  %cmp4 = icmp sle i32 %conv3, 57, !dbg !1021
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1022

if.then6:                                         ; preds = %land.lhs.true
  %7 = load i64, ptr %res, align 8, !dbg !1023
  %mul = mul nsw i64 %7, 10, !dbg !1025
  %8 = load i8, ptr %c, align 1, !dbg !1026
  %conv7 = sext i8 %8 to i32, !dbg !1026
  %sub = sub nsw i32 %conv7, 48, !dbg !1027
  %conv8 = sext i32 %sub to i64, !dbg !1028
  %add = add nsw i64 %mul, %conv8, !dbg !1029
  store i64 %add, ptr %res, align 8, !dbg !1030
  br label %if.end9, !dbg !1031

if.else:                                          ; preds = %land.lhs.true, %while.body
  %9 = load ptr, ptr %error_msg.addr, align 8, !dbg !1032
  call void @__emit_error(ptr noundef %9), !dbg !1034
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then6
  br label %while.cond, !dbg !1011, !llvm.loop !1035

while.end:                                        ; preds = %while.cond
  %10 = load i64, ptr %res, align 8, !dbg !1037
  ret i64 %10, !dbg !1038
}

; Function Attrs: noinline nounwind uwtable
define internal void @__add_arg(ptr noundef %argc, ptr noundef %argv, ptr noundef %arg, i32 noundef %argcMax) #0 !dbg !1039 {
entry:
  %argc.addr = alloca ptr, align 8
  %argv.addr = alloca ptr, align 8
  %arg.addr = alloca ptr, align 8
  %argcMax.addr = alloca i32, align 4
  store ptr %argc, ptr %argc.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argc.addr, metadata !1042, metadata !DIExpression()), !dbg !1043
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argv.addr, metadata !1044, metadata !DIExpression()), !dbg !1045
  store ptr %arg, ptr %arg.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %arg.addr, metadata !1046, metadata !DIExpression()), !dbg !1047
  store i32 %argcMax, ptr %argcMax.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argcMax.addr, metadata !1048, metadata !DIExpression()), !dbg !1049
  %0 = load ptr, ptr %argc.addr, align 8, !dbg !1050
  %1 = load i32, ptr %0, align 4, !dbg !1052
  %2 = load i32, ptr %argcMax.addr, align 4, !dbg !1053
  %cmp = icmp eq i32 %1, %2, !dbg !1054
  br i1 %cmp, label %if.then, label %if.else, !dbg !1055

if.then:                                          ; preds = %entry
  call void @__emit_error(ptr noundef @.str.34), !dbg !1056
  br label %if.end, !dbg !1058

if.else:                                          ; preds = %entry
  %3 = load ptr, ptr %arg.addr, align 8, !dbg !1059
  %4 = load ptr, ptr %argv.addr, align 8, !dbg !1061
  %5 = load ptr, ptr %argc.addr, align 8, !dbg !1062
  %6 = load i32, ptr %5, align 4, !dbg !1063
  %idxprom = sext i32 %6 to i64, !dbg !1061
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 %idxprom, !dbg !1061
  store ptr %3, ptr %arrayidx, align 8, !dbg !1064
  %7 = load ptr, ptr %argc.addr, align 8, !dbg !1065
  %8 = load i32, ptr %7, align 4, !dbg !1066
  %inc = add nsw i32 %8, 1, !dbg !1066
  store i32 %inc, ptr %7, align 4, !dbg !1066
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !1067
}

; Function Attrs: noinline nounwind uwtable
define internal ptr @__get_sym_str(i32 noundef %numChars, ptr noundef %name) #0 !dbg !1068 {
entry:
  %numChars.addr = alloca i32, align 4
  %name.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  %s = alloca ptr, align 8
  store i32 %numChars, ptr %numChars.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %numChars.addr, metadata !1071, metadata !DIExpression()), !dbg !1072
  store ptr %name, ptr %name.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %name.addr, metadata !1073, metadata !DIExpression()), !dbg !1074
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1075, metadata !DIExpression()), !dbg !1076
  call void @llvm.dbg.declare(metadata ptr %s, metadata !1077, metadata !DIExpression()), !dbg !1078
  %0 = load i32, ptr %numChars.addr, align 4, !dbg !1079
  %add = add nsw i32 %0, 1, !dbg !1080
  %conv = sext i32 %add to i64, !dbg !1079
  %call = call noalias ptr @malloc(i64 noundef %conv) #12, !dbg !1081
  store ptr %call, ptr %s, align 8, !dbg !1078
  %1 = load ptr, ptr %s, align 8, !dbg !1082
  %tobool = icmp ne ptr %1, null, !dbg !1082
  br i1 %tobool, label %if.end, label %if.then, !dbg !1084

if.then:                                          ; preds = %entry
  call void @__emit_error(ptr noundef @.str.31), !dbg !1085
  br label %if.end, !dbg !1085

if.end:                                           ; preds = %if.then, %entry
  %2 = load ptr, ptr %s, align 8, !dbg !1086
  call void @klee_mark_global(ptr noundef %2), !dbg !1087
  %3 = load ptr, ptr %s, align 8, !dbg !1088
  %4 = load i32, ptr %numChars.addr, align 4, !dbg !1089
  %add1 = add nsw i32 %4, 1, !dbg !1090
  %conv2 = sext i32 %add1 to i64, !dbg !1089
  %5 = load ptr, ptr %name.addr, align 8, !dbg !1091
  call void @klee_make_symbolic(ptr noundef %3, i64 noundef %conv2, ptr noundef %5), !dbg !1092
  store i32 0, ptr %i, align 4, !dbg !1093
  br label %for.cond, !dbg !1095

for.cond:                                         ; preds = %for.body, %if.end
  %6 = load i32, ptr %i, align 4, !dbg !1096
  %7 = load i32, ptr %numChars.addr, align 4, !dbg !1098
  %cmp = icmp slt i32 %6, %7, !dbg !1099
  br i1 %cmp, label %for.body, label %for.end, !dbg !1100

for.body:                                         ; preds = %for.cond
  %8 = load ptr, ptr %s, align 8, !dbg !1101
  %9 = load ptr, ptr %s, align 8, !dbg !1102
  %10 = load i32, ptr %i, align 4, !dbg !1103
  %idxprom = sext i32 %10 to i64, !dbg !1102
  %arrayidx = getelementptr inbounds i8, ptr %9, i64 %idxprom, !dbg !1102
  %11 = load i8, ptr %arrayidx, align 1, !dbg !1102
  %call4 = call i32 @__isprint(i8 noundef signext %11), !dbg !1104
  %conv5 = sext i32 %call4 to i64, !dbg !1104
  call void @klee_posix_prefer_cex(ptr noundef %8, i64 noundef %conv5), !dbg !1105
  %12 = load i32, ptr %i, align 4, !dbg !1106
  %inc = add nsw i32 %12, 1, !dbg !1106
  store i32 %inc, ptr %i, align 4, !dbg !1106
  br label %for.cond, !dbg !1107, !llvm.loop !1108

for.end:                                          ; preds = %for.cond
  %13 = load ptr, ptr %s, align 8, !dbg !1110
  %14 = load i32, ptr %numChars.addr, align 4, !dbg !1111
  %idxprom6 = sext i32 %14 to i64, !dbg !1110
  %arrayidx7 = getelementptr inbounds i8, ptr %13, i64 %idxprom6, !dbg !1110
  store i8 0, ptr %arrayidx7, align 1, !dbg !1112
  %15 = load ptr, ptr %s, align 8, !dbg !1113
  ret ptr %15, !dbg !1114
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

declare void @klee_mark_global(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argcPtr, ptr noundef %argvPtr, ptr noundef %envp) #0 !dbg !1115 {
entry:
  %argcPtr.addr = alloca i32, align 4
  %argvPtr.addr = alloca ptr, align 8
  %envp.addr = alloca ptr, align 8
  store i32 %argcPtr, ptr %argcPtr.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argcPtr.addr, metadata !1118, metadata !DIExpression()), !dbg !1119
  store ptr %argvPtr, ptr %argvPtr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argvPtr.addr, metadata !1120, metadata !DIExpression()), !dbg !1121
  store ptr %envp, ptr %envp.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %envp.addr, metadata !1122, metadata !DIExpression()), !dbg !1123
  call void @klee_init_env(ptr noundef %argcPtr.addr, ptr noundef %argvPtr.addr), !dbg !1124
  %0 = load i32, ptr %argcPtr.addr, align 4, !dbg !1125
  %1 = load ptr, ptr %argvPtr.addr, align 8, !dbg !1126
  %2 = load ptr, ptr %envp.addr, align 8, !dbg !1127
  %call = call i32 @__klee_posix_wrapped_main(i32 noundef %0, ptr noundef %1, ptr noundef %2), !dbg !1128
  ret i32 %call, !dbg !1129
}

; Function Attrs: noreturn
declare void @klee_report_error(ptr noundef, i32 noundef, ptr noundef, ptr noundef) #5

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #4

declare void @klee_posix_prefer_cex(ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @__isprint(i8 noundef signext %c) #0 !dbg !1130 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, ptr %c.addr, align 1
  call void @llvm.dbg.declare(metadata ptr %c.addr, metadata !1133, metadata !DIExpression()), !dbg !1134
  %0 = load i8, ptr %c.addr, align 1, !dbg !1135
  %conv = sext i8 %0 to i32, !dbg !1135
  %cmp = icmp sle i32 32, %conv, !dbg !1136
  %1 = load i8, ptr %c.addr, align 1, !dbg !1137
  %conv2 = sext i8 %1 to i32, !dbg !1137
  %cmp3 = icmp sle i32 %conv2, 126, !dbg !1137
  %2 = select i1 %cmp, i1 %cmp3, i1 false, !dbg !1137
  %land.ext = zext i1 %2 to i32, !dbg !1137
  ret i32 %land.ext, !dbg !1138
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @check_hash(ptr noundef %in, i64 noundef %len) #0 !dbg !1139 {
entry:
  %in.addr = alloca ptr, align 8
  %len.addr = alloca i64, align 8
  store ptr %in, ptr %in.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %in.addr, metadata !1145, metadata !DIExpression()), !dbg !1146
  store i64 %len, ptr %len.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %len.addr, metadata !1147, metadata !DIExpression()), !dbg !1148
  %0 = load i64, ptr %len.addr, align 8, !dbg !1149
  %cmp = icmp ult i64 %0, 4, !dbg !1151
  br i1 %cmp, label %if.end18, label %if.end, !dbg !1152

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %in.addr, align 8, !dbg !1153
  %arrayidx = getelementptr inbounds i8, ptr %1, i64 0, !dbg !1153
  %2 = load i8, ptr %arrayidx, align 1, !dbg !1153
  %conv = sext i8 %2 to i32, !dbg !1153
  %cmp1 = icmp eq i32 %conv, 77, !dbg !1155
  br i1 %cmp1, label %land.lhs.true, label %if.end18, !dbg !1156

land.lhs.true:                                    ; preds = %if.end
  %3 = load ptr, ptr %in.addr, align 8, !dbg !1157
  %arrayidx3 = getelementptr inbounds i8, ptr %3, i64 1, !dbg !1157
  %4 = load i8, ptr %arrayidx3, align 1, !dbg !1157
  %conv4 = sext i8 %4 to i32, !dbg !1157
  %cmp5 = icmp eq i32 %conv4, 68, !dbg !1158
  br i1 %cmp5, label %land.lhs.true7, label %if.end18, !dbg !1159

land.lhs.true7:                                   ; preds = %land.lhs.true
  %5 = load ptr, ptr %in.addr, align 8, !dbg !1160
  %arrayidx8 = getelementptr inbounds i8, ptr %5, i64 2, !dbg !1160
  %6 = load i8, ptr %arrayidx8, align 1, !dbg !1160
  %conv9 = sext i8 %6 to i32, !dbg !1160
  %cmp10 = icmp eq i32 %conv9, 53, !dbg !1161
  br i1 %cmp10, label %land.lhs.true12, label %if.end18, !dbg !1162

land.lhs.true12:                                  ; preds = %land.lhs.true7
  %7 = load ptr, ptr %in.addr, align 8, !dbg !1163
  %arrayidx13 = getelementptr inbounds i8, ptr %7, i64 3, !dbg !1163
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !1163
  %conv14 = sext i8 %8 to i32, !dbg !1163
  %cmp15 = icmp eq i32 %conv14, 33, !dbg !1164
  br i1 %cmp15, label %if.then17, label %if.end18, !dbg !1165

if.then17:                                        ; preds = %land.lhs.true12
  call void @abort() #14, !dbg !1166
  unreachable, !dbg !1166

if.end18:                                         ; preds = %entry, %land.lhs.true12, %land.lhs.true7, %land.lhs.true, %if.end
  ret void, !dbg !1168
}

; Function Attrs: noreturn nounwind
declare void @abort() #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__klee_posix_wrapped_main(i32 noundef %argc, ptr noundef %argv) #0 !dbg !1169 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %buf = alloca [128 x i8], align 16
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argc.addr, metadata !1172, metadata !DIExpression()), !dbg !1173
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argv.addr, metadata !1174, metadata !DIExpression()), !dbg !1175
  call void @llvm.dbg.declare(metadata ptr %buf, metadata !1176, metadata !DIExpression()), !dbg !1180
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i64 0, i64 0, !dbg !1181
  %0 = call ptr @memset(ptr %arraydecay, i32 0, i64 128), !dbg !1181
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i64 0, i64 0, !dbg !1182
  %call = call i64 @read(i32 noundef 0, ptr noundef %arraydecay1, i64 noundef 127), !dbg !1184
  %cmp = icmp sgt i64 %call, 0, !dbg !1185
  br i1 %cmp, label %if.then, label %if.end, !dbg !1186

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [128 x i8], ptr %buf, i64 0, i64 0, !dbg !1187
  %arraydecay3 = getelementptr inbounds [128 x i8], ptr %buf, i64 0, i64 0, !dbg !1189
  %call4 = call i64 @strlen(ptr noundef %arraydecay3) #15, !dbg !1190
  call void @check_hash(ptr noundef %arraydecay2, i64 noundef %call4), !dbg !1191
  br label %if.end, !dbg !1192

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !1193
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #7

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #8

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_init_fds(i32 noundef %n_files, i32 noundef %file_length, i32 noundef %stdin_length, i32 noundef %sym_stdout_flag, i32 noundef %save_all_writes_flag, i32 noundef %max_failures) #0 !dbg !1194 {
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
  call void @llvm.dbg.declare(metadata ptr %n_files.addr, metadata !1197, metadata !DIExpression()), !dbg !1198
  store i32 %file_length, ptr %file_length.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %file_length.addr, metadata !1199, metadata !DIExpression()), !dbg !1200
  store i32 %stdin_length, ptr %stdin_length.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %stdin_length.addr, metadata !1201, metadata !DIExpression()), !dbg !1202
  store i32 %sym_stdout_flag, ptr %sym_stdout_flag.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %sym_stdout_flag.addr, metadata !1203, metadata !DIExpression()), !dbg !1204
  store i32 %save_all_writes_flag, ptr %save_all_writes_flag.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %save_all_writes_flag.addr, metadata !1205, metadata !DIExpression()), !dbg !1206
  store i32 %max_failures, ptr %max_failures.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %max_failures.addr, metadata !1207, metadata !DIExpression()), !dbg !1208
  call void @llvm.dbg.declare(metadata ptr %k, metadata !1209, metadata !DIExpression()), !dbg !1210
  call void @llvm.dbg.declare(metadata ptr %name, metadata !1211, metadata !DIExpression()), !dbg !1213
  %0 = call ptr @memcpy(ptr %name, ptr @__const.klee_init_fds.name, i64 7), !dbg !1213
  call void @llvm.dbg.declare(metadata ptr %s, metadata !1214, metadata !DIExpression()), !dbg !1215
  %call = call i32 @stat64(ptr noundef @.str.35, ptr noundef %s) #16, !dbg !1216
  %1 = load i32, ptr %n_files.addr, align 4, !dbg !1217
  store i32 %1, ptr @__exe_fs, align 8, !dbg !1218
  %2 = load i32, ptr %n_files.addr, align 4, !dbg !1219
  %conv = zext i32 %2 to i64, !dbg !1219
  %mul = mul i64 24, %conv, !dbg !1220
  %call1 = call noalias ptr @malloc(i64 noundef %mul) #12, !dbg !1221
  store ptr %call1, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8, !dbg !1222
  %3 = load i32, ptr %n_files.addr, align 4, !dbg !1223
  %tobool = icmp eq i32 %3, 0, !dbg !1223
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8
  %tobool2 = icmp ne ptr %4, null
  %or.cond = select i1 %tobool, i1 true, i1 %tobool2, !dbg !1225
  br i1 %or.cond, label %if.end, label %if.then, !dbg !1225

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.1.36, i32 noundef 117, ptr noundef @.str.2.37, ptr noundef @.str.3.38) #13, !dbg !1226
  unreachable, !dbg !1226

if.end:                                           ; preds = %entry
  store i32 0, ptr %k, align 4, !dbg !1227
  br label %for.cond, !dbg !1229

for.cond:                                         ; preds = %for.body, %if.end
  %5 = load i32, ptr %k, align 4, !dbg !1230
  %6 = load i32, ptr %n_files.addr, align 4, !dbg !1232
  %cmp = icmp ult i32 %5, %6, !dbg !1233
  br i1 %cmp, label %for.body, label %for.end, !dbg !1234

for.body:                                         ; preds = %for.cond
  %7 = load i32, ptr %k, align 4, !dbg !1235
  %add = add i32 65, %7, !dbg !1237
  %conv4 = trunc i32 %add to i8, !dbg !1238
  %arrayidx = getelementptr inbounds [7 x i8], ptr %name, i64 0, i64 0, !dbg !1239
  store i8 %conv4, ptr %arrayidx, align 1, !dbg !1240
  %8 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8, !dbg !1241
  %9 = load i32, ptr %k, align 4, !dbg !1242
  %idxprom = zext i32 %9 to i64, !dbg !1243
  %arrayidx5 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %8, i64 %idxprom, !dbg !1243
  %10 = load i32, ptr %file_length.addr, align 4, !dbg !1244
  %arraydecay = getelementptr inbounds [7 x i8], ptr %name, i64 0, i64 0, !dbg !1245
  call void @__create_new_dfile(ptr noundef %arrayidx5, i32 noundef %10, ptr noundef %arraydecay, ptr noundef %s), !dbg !1246
  %11 = load i32, ptr %k, align 4, !dbg !1247
  %inc = add i32 %11, 1, !dbg !1247
  store i32 %inc, ptr %k, align 4, !dbg !1247
  br label %for.cond, !dbg !1248, !llvm.loop !1249

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %stdin_length.addr, align 4, !dbg !1251
  %tobool6 = icmp ne i32 %12, 0, !dbg !1251
  br i1 %tobool6, label %if.then7, label %if.else, !dbg !1253

if.then7:                                         ; preds = %for.end
  %call8 = call noalias ptr @malloc(i64 noundef 24) #12, !dbg !1254
  store ptr %call8, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1256
  %13 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1257
  %tobool9 = icmp ne ptr %13, null, !dbg !1259
  br i1 %tobool9, label %if.end11, label %if.then10, !dbg !1260

if.then10:                                        ; preds = %if.then7
  call void @klee_report_error(ptr noundef @.str.1.36, i32 noundef 128, ptr noundef @.str.2.37, ptr noundef @.str.3.38) #13, !dbg !1261
  unreachable, !dbg !1261

if.end11:                                         ; preds = %if.then7
  %14 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1262
  %15 = load i32, ptr %stdin_length.addr, align 4, !dbg !1263
  call void @__create_new_dfile(ptr noundef %14, i32 noundef %15, ptr noundef @.str.4.39, ptr noundef %s), !dbg !1264
  %16 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1265
  store ptr %16, ptr getelementptr inbounds (%struct.exe_file_t.6, ptr @__exe_env, i32 0, i32 3), align 8, !dbg !1266
  br label %if.end12, !dbg !1267

if.else:                                          ; preds = %for.end
  store ptr null, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 1), align 8, !dbg !1268
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.end11
  %17 = load i32, ptr %max_failures.addr, align 4, !dbg !1269
  store i32 %17, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1270
  %18 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1271
  %tobool13 = icmp ne i32 %18, 0, !dbg !1273
  br i1 %tobool13, label %if.then14, label %if.end31, !dbg !1274

if.then14:                                        ; preds = %if.end12
  %call15 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1275
  store ptr %call15, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 6), align 8, !dbg !1277
  %call16 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1278
  store ptr %call16, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 7), align 8, !dbg !1279
  %call17 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1280
  store ptr %call17, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 8), align 8, !dbg !1281
  %call18 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1282
  store ptr %call18, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 9), align 8, !dbg !1283
  %call19 = call noalias ptr @malloc(i64 noundef 4) #12, !dbg !1284
  store ptr %call19, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 10), align 8, !dbg !1285
  %19 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 6), align 8, !dbg !1286
  %tobool20 = icmp ne ptr %19, null, !dbg !1288
  %20 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 7), align 8
  %tobool22 = icmp ne ptr %20, null
  %or.cond1 = select i1 %tobool20, i1 %tobool22, i1 false, !dbg !1289
  %21 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 8), align 8
  %tobool24 = icmp ne ptr %21, null
  %or.cond2 = select i1 %or.cond1, i1 %tobool24, i1 false, !dbg !1289
  %22 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 9), align 8
  %tobool26 = icmp ne ptr %22, null
  %or.cond3 = select i1 %or.cond2, i1 %tobool26, i1 false, !dbg !1289
  %23 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 10), align 8
  %tobool28 = icmp ne ptr %23, null
  %or.cond4 = select i1 %or.cond3, i1 %tobool28, i1 false, !dbg !1289
  br i1 %or.cond4, label %if.end30, label %if.then29, !dbg !1289

if.then29:                                        ; preds = %if.then14
  call void @klee_report_error(ptr noundef @.str.1.36, i32 noundef 143, ptr noundef @.str.2.37, ptr noundef @.str.3.38) #13, !dbg !1290
  unreachable, !dbg !1290

if.end30:                                         ; preds = %if.then14
  %24 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 6), align 8, !dbg !1291
  call void @klee_make_symbolic(ptr noundef %24, i64 noundef 4, ptr noundef @.str.5.40), !dbg !1292
  %25 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 7), align 8, !dbg !1293
  call void @klee_make_symbolic(ptr noundef %25, i64 noundef 4, ptr noundef @.str.6.41), !dbg !1294
  %26 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 8), align 8, !dbg !1295
  call void @klee_make_symbolic(ptr noundef %26, i64 noundef 4, ptr noundef @.str.7.42), !dbg !1296
  %27 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 9), align 8, !dbg !1297
  call void @klee_make_symbolic(ptr noundef %27, i64 noundef 4, ptr noundef @.str.8.43), !dbg !1298
  %28 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 10), align 8, !dbg !1299
  call void @klee_make_symbolic(ptr noundef %28, i64 noundef 4, ptr noundef @.str.9.44), !dbg !1300
  br label %if.end31, !dbg !1301

if.end31:                                         ; preds = %if.end30, %if.end12
  %29 = load i32, ptr %sym_stdout_flag.addr, align 4, !dbg !1302
  %tobool32 = icmp ne i32 %29, 0, !dbg !1302
  br i1 %tobool32, label %if.then33, label %if.else38, !dbg !1304

if.then33:                                        ; preds = %if.end31
  %call34 = call noalias ptr @malloc(i64 noundef 24) #12, !dbg !1305
  store ptr %call34, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1307
  %30 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1308
  %tobool35 = icmp ne ptr %30, null, !dbg !1310
  br i1 %tobool35, label %if.end37, label %if.then36, !dbg !1311

if.then36:                                        ; preds = %if.then33
  call void @klee_report_error(ptr noundef @.str.1.36, i32 noundef 156, ptr noundef @.str.2.37, ptr noundef @.str.3.38) #13, !dbg !1312
  unreachable, !dbg !1312

if.end37:                                         ; preds = %if.then33
  %31 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1313
  call void @__create_new_dfile(ptr noundef %31, i32 noundef 1024, ptr noundef @.str.10.45, ptr noundef %s), !dbg !1314
  %32 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1315
  store ptr %32, ptr getelementptr inbounds ([32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 1, i32 3), align 8, !dbg !1316
  store i32 0, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 3), align 8, !dbg !1317
  br label %if.end39, !dbg !1318

if.else38:                                        ; preds = %if.end31
  store ptr null, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !1319
  br label %if.end39

if.end39:                                         ; preds = %if.else38, %if.end37
  %33 = load i32, ptr %save_all_writes_flag.addr, align 4, !dbg !1320
  store i32 %33, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 2), align 4, !dbg !1321
  ret void, !dbg !1322
}

; Function Attrs: noinline nounwind uwtable
define internal void @__create_new_dfile(ptr noundef %dfile, i32 noundef %size, ptr noundef %name, ptr noundef %defaults) #0 !dbg !1323 {
entry:
  %dfile.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %name.addr = alloca ptr, align 8
  %defaults.addr = alloca ptr, align 8
  %s = alloca ptr, align 8
  %sp = alloca ptr, align 8
  %sname = alloca [64 x i8], align 16
  store ptr %dfile, ptr %dfile.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %dfile.addr, metadata !1326, metadata !DIExpression()), !dbg !1327
  store i32 %size, ptr %size.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !1328, metadata !DIExpression()), !dbg !1329
  store ptr %name, ptr %name.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %name.addr, metadata !1330, metadata !DIExpression()), !dbg !1331
  store ptr %defaults, ptr %defaults.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %defaults.addr, metadata !1332, metadata !DIExpression()), !dbg !1333
  call void @llvm.dbg.declare(metadata ptr %s, metadata !1334, metadata !DIExpression()), !dbg !1335
  %call = call noalias ptr @malloc(i64 noundef 144) #12, !dbg !1336
  store ptr %call, ptr %s, align 8, !dbg !1335
  %0 = load ptr, ptr %s, align 8, !dbg !1337
  %tobool = icmp ne ptr %0, null, !dbg !1337
  br i1 %tobool, label %if.end, label %if.then, !dbg !1339

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.1.36, i32 noundef 46, ptr noundef @.str.2.37, ptr noundef @.str.3.38) #13, !dbg !1340
  unreachable, !dbg !1340

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %sp, metadata !1341, metadata !DIExpression()), !dbg !1342
  call void @llvm.dbg.declare(metadata ptr %sname, metadata !1343, metadata !DIExpression()), !dbg !1347
  %1 = load ptr, ptr %name.addr, align 8, !dbg !1348
  store ptr %1, ptr %sp, align 8, !dbg !1350
  br label %for.cond, !dbg !1351

for.cond:                                         ; preds = %for.body, %if.end
  %2 = load ptr, ptr %sp, align 8, !dbg !1352
  %3 = load i8, ptr %2, align 1, !dbg !1354
  %tobool1 = icmp ne i8 %3, 0, !dbg !1355
  br i1 %tobool1, label %for.body, label %for.end, !dbg !1355

for.body:                                         ; preds = %for.cond
  %4 = load ptr, ptr %sp, align 8, !dbg !1356
  %5 = load i8, ptr %4, align 1, !dbg !1357
  %6 = load ptr, ptr %sp, align 8, !dbg !1358
  %7 = load ptr, ptr %name.addr, align 8, !dbg !1359
  %sub.ptr.lhs.cast = ptrtoint ptr %6 to i64, !dbg !1360
  %sub.ptr.rhs.cast = ptrtoint ptr %7 to i64, !dbg !1360
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !1360
  %arrayidx = getelementptr inbounds [64 x i8], ptr %sname, i64 0, i64 %sub.ptr.sub, !dbg !1361
  store i8 %5, ptr %arrayidx, align 1, !dbg !1362
  %8 = load ptr, ptr %sp, align 8, !dbg !1363
  %incdec.ptr = getelementptr inbounds i8, ptr %8, i32 1, !dbg !1363
  store ptr %incdec.ptr, ptr %sp, align 8, !dbg !1363
  br label %for.cond, !dbg !1364, !llvm.loop !1365

for.end:                                          ; preds = %for.cond
  %9 = load ptr, ptr %sp, align 8, !dbg !1367
  %10 = load ptr, ptr %name.addr, align 8, !dbg !1368
  %sub.ptr.lhs.cast2 = ptrtoint ptr %9 to i64, !dbg !1369
  %sub.ptr.rhs.cast3 = ptrtoint ptr %10 to i64, !dbg !1369
  %sub.ptr.sub4 = sub i64 %sub.ptr.lhs.cast2, %sub.ptr.rhs.cast3, !dbg !1369
  %arrayidx5 = getelementptr inbounds [64 x i8], ptr %sname, i64 0, i64 %sub.ptr.sub4, !dbg !1370
  %11 = call ptr @memcpy(ptr %arrayidx5, ptr @.str.11.46, i64 6), !dbg !1371
  %12 = load i32, ptr %size.addr, align 4, !dbg !1372
  %tobool6 = icmp ne i32 %12, 0, !dbg !1372
  br i1 %tobool6, label %if.end8, label %if.else, !dbg !1375

if.else:                                          ; preds = %for.end
  call void @__assert_fail(ptr noundef @.str.12.47, ptr noundef @.str.1.36, i32 noundef 54, ptr noundef @__PRETTY_FUNCTION__.__create_new_dfile) #14, !dbg !1372
  unreachable, !dbg !1372

if.end8:                                          ; preds = %for.end
  %13 = load i32, ptr %size.addr, align 4, !dbg !1376
  %14 = load ptr, ptr %dfile.addr, align 8, !dbg !1377
  %size9 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %14, i32 0, i32 0, !dbg !1378
  store i32 %13, ptr %size9, align 8, !dbg !1379
  %15 = load ptr, ptr %dfile.addr, align 8, !dbg !1380
  %size10 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %15, i32 0, i32 0, !dbg !1381
  %16 = load i32, ptr %size10, align 8, !dbg !1381
  %conv = zext i32 %16 to i64, !dbg !1380
  %call11 = call noalias ptr @malloc(i64 noundef %conv) #12, !dbg !1382
  %17 = load ptr, ptr %dfile.addr, align 8, !dbg !1383
  %contents = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %17, i32 0, i32 1, !dbg !1384
  store ptr %call11, ptr %contents, align 8, !dbg !1385
  %18 = load ptr, ptr %dfile.addr, align 8, !dbg !1386
  %contents12 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %18, i32 0, i32 1, !dbg !1388
  %19 = load ptr, ptr %contents12, align 8, !dbg !1388
  %tobool13 = icmp ne ptr %19, null, !dbg !1386
  br i1 %tobool13, label %if.end15, label %if.then14, !dbg !1389

if.then14:                                        ; preds = %if.end8
  call void @klee_report_error(ptr noundef @.str.1.36, i32 noundef 59, ptr noundef @.str.2.37, ptr noundef @.str.3.38) #13, !dbg !1390
  unreachable, !dbg !1390

if.end15:                                         ; preds = %if.end8
  %20 = load ptr, ptr %dfile.addr, align 8, !dbg !1391
  %contents16 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %20, i32 0, i32 1, !dbg !1392
  %21 = load ptr, ptr %contents16, align 8, !dbg !1392
  %22 = load ptr, ptr %dfile.addr, align 8, !dbg !1393
  %size17 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %22, i32 0, i32 0, !dbg !1394
  %23 = load i32, ptr %size17, align 8, !dbg !1394
  %conv18 = zext i32 %23 to i64, !dbg !1393
  %24 = load ptr, ptr %name.addr, align 8, !dbg !1395
  call void @klee_make_symbolic(ptr noundef %21, i64 noundef %conv18, ptr noundef %24), !dbg !1396
  %25 = load ptr, ptr %s, align 8, !dbg !1397
  %arraydecay = getelementptr inbounds [64 x i8], ptr %sname, i64 0, i64 0, !dbg !1398
  call void @klee_make_symbolic(ptr noundef %25, i64 noundef 144, ptr noundef %arraydecay), !dbg !1399
  %26 = load ptr, ptr %s, align 8, !dbg !1400
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %26, i32 0, i32 1, !dbg !1402
  %27 = load i64, ptr %st_ino, align 8, !dbg !1402
  %call19 = call i32 @klee_is_symbolic(i64 noundef %27), !dbg !1403
  %tobool20 = icmp ne i32 %call19, 0, !dbg !1403
  br i1 %tobool20, label %if.end26, label %land.lhs.true, !dbg !1404

land.lhs.true:                                    ; preds = %if.end15
  %28 = load ptr, ptr %s, align 8, !dbg !1405
  %st_ino21 = getelementptr inbounds %struct.stat64.9, ptr %28, i32 0, i32 1, !dbg !1406
  %29 = load i64, ptr %st_ino21, align 8, !dbg !1406
  %and = and i64 %29, 2147483647, !dbg !1407
  %cmp = icmp eq i64 %and, 0, !dbg !1408
  br i1 %cmp, label %if.then23, label %if.end26, !dbg !1409

if.then23:                                        ; preds = %land.lhs.true
  %30 = load ptr, ptr %defaults.addr, align 8, !dbg !1410
  %st_ino24 = getelementptr inbounds %struct.stat64.9, ptr %30, i32 0, i32 1, !dbg !1411
  %31 = load i64, ptr %st_ino24, align 8, !dbg !1411
  %32 = load ptr, ptr %s, align 8, !dbg !1412
  %st_ino25 = getelementptr inbounds %struct.stat64.9, ptr %32, i32 0, i32 1, !dbg !1413
  store i64 %31, ptr %st_ino25, align 8, !dbg !1414
  br label %if.end26, !dbg !1412

if.end26:                                         ; preds = %if.then23, %land.lhs.true, %if.end15
  %33 = load ptr, ptr %s, align 8, !dbg !1415
  %st_ino27 = getelementptr inbounds %struct.stat64.9, ptr %33, i32 0, i32 1, !dbg !1416
  %34 = load i64, ptr %st_ino27, align 8, !dbg !1416
  %and28 = and i64 %34, 2147483647, !dbg !1417
  %cmp29 = icmp ne i64 %and28, 0, !dbg !1418
  %conv30 = zext i1 %cmp29 to i32, !dbg !1418
  %conv31 = sext i32 %conv30 to i64, !dbg !1419
  call void @klee_assume(i64 noundef %conv31), !dbg !1420
  %35 = load ptr, ptr %s, align 8, !dbg !1421
  %st_blksize = getelementptr inbounds %struct.stat64.9, ptr %35, i32 0, i32 9, !dbg !1422
  %36 = load i64, ptr %st_blksize, align 8, !dbg !1422
  %and32 = and i64 %36, -65536, !dbg !1423
  %cmp33 = icmp eq i64 %and32, 0, !dbg !1424
  %conv34 = zext i1 %cmp33 to i32, !dbg !1424
  %conv35 = sext i32 %conv34 to i64, !dbg !1425
  call void @klee_assume(i64 noundef %conv35), !dbg !1426
  %37 = load ptr, ptr %s, align 8, !dbg !1427
  %38 = load ptr, ptr %s, align 8, !dbg !1428
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %38, i32 0, i32 3, !dbg !1429
  %39 = load i32, ptr %st_mode, align 8, !dbg !1429
  %and36 = and i32 %39, -61952, !dbg !1430
  %tobool37 = icmp ne i32 %and36, 0, !dbg !1431
  %lnot = xor i1 %tobool37, true, !dbg !1431
  %lnot.ext = zext i1 %lnot to i32, !dbg !1431
  %conv38 = sext i32 %lnot.ext to i64, !dbg !1431
  call void @klee_prefer_cex(ptr noundef %37, i64 noundef %conv38), !dbg !1432
  %40 = load ptr, ptr %s, align 8, !dbg !1433
  %41 = load ptr, ptr %s, align 8, !dbg !1434
  %st_dev = getelementptr inbounds %struct.stat64.9, ptr %41, i32 0, i32 0, !dbg !1435
  %42 = load i64, ptr %st_dev, align 8, !dbg !1435
  %43 = load ptr, ptr %defaults.addr, align 8, !dbg !1436
  %st_dev39 = getelementptr inbounds %struct.stat64.9, ptr %43, i32 0, i32 0, !dbg !1437
  %44 = load i64, ptr %st_dev39, align 8, !dbg !1437
  %cmp40 = icmp eq i64 %42, %44, !dbg !1438
  %conv41 = zext i1 %cmp40 to i32, !dbg !1438
  %conv42 = sext i32 %conv41 to i64, !dbg !1434
  call void @klee_prefer_cex(ptr noundef %40, i64 noundef %conv42), !dbg !1439
  %45 = load ptr, ptr %s, align 8, !dbg !1440
  %46 = load ptr, ptr %s, align 8, !dbg !1441
  %st_rdev = getelementptr inbounds %struct.stat64.9, ptr %46, i32 0, i32 7, !dbg !1442
  %47 = load i64, ptr %st_rdev, align 8, !dbg !1442
  %48 = load ptr, ptr %defaults.addr, align 8, !dbg !1443
  %st_rdev43 = getelementptr inbounds %struct.stat64.9, ptr %48, i32 0, i32 7, !dbg !1444
  %49 = load i64, ptr %st_rdev43, align 8, !dbg !1444
  %cmp44 = icmp eq i64 %47, %49, !dbg !1445
  %conv45 = zext i1 %cmp44 to i32, !dbg !1445
  %conv46 = sext i32 %conv45 to i64, !dbg !1441
  call void @klee_prefer_cex(ptr noundef %45, i64 noundef %conv46), !dbg !1446
  %50 = load ptr, ptr %s, align 8, !dbg !1447
  %51 = load ptr, ptr %s, align 8, !dbg !1448
  %st_mode47 = getelementptr inbounds %struct.stat64.9, ptr %51, i32 0, i32 3, !dbg !1449
  %52 = load i32, ptr %st_mode47, align 8, !dbg !1449
  %and48 = and i32 %52, 448, !dbg !1450
  %cmp49 = icmp eq i32 %and48, 384, !dbg !1451
  %conv50 = zext i1 %cmp49 to i32, !dbg !1451
  %conv51 = sext i32 %conv50 to i64, !dbg !1452
  call void @klee_prefer_cex(ptr noundef %50, i64 noundef %conv51), !dbg !1453
  %53 = load ptr, ptr %s, align 8, !dbg !1454
  %54 = load ptr, ptr %s, align 8, !dbg !1455
  %st_mode52 = getelementptr inbounds %struct.stat64.9, ptr %54, i32 0, i32 3, !dbg !1456
  %55 = load i32, ptr %st_mode52, align 8, !dbg !1456
  %and53 = and i32 %55, 56, !dbg !1457
  %cmp54 = icmp eq i32 %and53, 32, !dbg !1458
  %conv55 = zext i1 %cmp54 to i32, !dbg !1458
  %conv56 = sext i32 %conv55 to i64, !dbg !1459
  call void @klee_prefer_cex(ptr noundef %53, i64 noundef %conv56), !dbg !1460
  %56 = load ptr, ptr %s, align 8, !dbg !1461
  %57 = load ptr, ptr %s, align 8, !dbg !1462
  %st_mode57 = getelementptr inbounds %struct.stat64.9, ptr %57, i32 0, i32 3, !dbg !1463
  %58 = load i32, ptr %st_mode57, align 8, !dbg !1463
  %and58 = and i32 %58, 7, !dbg !1464
  %cmp59 = icmp eq i32 %and58, 4, !dbg !1465
  %conv60 = zext i1 %cmp59 to i32, !dbg !1465
  %conv61 = sext i32 %conv60 to i64, !dbg !1466
  call void @klee_prefer_cex(ptr noundef %56, i64 noundef %conv61), !dbg !1467
  %59 = load ptr, ptr %s, align 8, !dbg !1468
  %60 = load ptr, ptr %s, align 8, !dbg !1469
  %st_mode62 = getelementptr inbounds %struct.stat64.9, ptr %60, i32 0, i32 3, !dbg !1470
  %61 = load i32, ptr %st_mode62, align 8, !dbg !1470
  %and63 = and i32 %61, 61440, !dbg !1471
  %cmp64 = icmp eq i32 %and63, 32768, !dbg !1472
  %conv65 = zext i1 %cmp64 to i32, !dbg !1472
  %conv66 = sext i32 %conv65 to i64, !dbg !1473
  call void @klee_prefer_cex(ptr noundef %59, i64 noundef %conv66), !dbg !1474
  %62 = load ptr, ptr %s, align 8, !dbg !1475
  %63 = load ptr, ptr %s, align 8, !dbg !1476
  %st_nlink = getelementptr inbounds %struct.stat64.9, ptr %63, i32 0, i32 2, !dbg !1477
  %64 = load i64, ptr %st_nlink, align 8, !dbg !1477
  %cmp67 = icmp eq i64 %64, 1, !dbg !1478
  %conv68 = zext i1 %cmp67 to i32, !dbg !1478
  %conv69 = sext i32 %conv68 to i64, !dbg !1476
  call void @klee_prefer_cex(ptr noundef %62, i64 noundef %conv69), !dbg !1479
  %65 = load ptr, ptr %s, align 8, !dbg !1480
  %66 = load ptr, ptr %s, align 8, !dbg !1481
  %st_uid = getelementptr inbounds %struct.stat64.9, ptr %66, i32 0, i32 4, !dbg !1482
  %67 = load i32, ptr %st_uid, align 4, !dbg !1482
  %68 = load ptr, ptr %defaults.addr, align 8, !dbg !1483
  %st_uid70 = getelementptr inbounds %struct.stat64.9, ptr %68, i32 0, i32 4, !dbg !1484
  %69 = load i32, ptr %st_uid70, align 4, !dbg !1484
  %cmp71 = icmp eq i32 %67, %69, !dbg !1485
  %conv72 = zext i1 %cmp71 to i32, !dbg !1485
  %conv73 = sext i32 %conv72 to i64, !dbg !1481
  call void @klee_prefer_cex(ptr noundef %65, i64 noundef %conv73), !dbg !1486
  %70 = load ptr, ptr %s, align 8, !dbg !1487
  %71 = load ptr, ptr %s, align 8, !dbg !1488
  %st_gid = getelementptr inbounds %struct.stat64.9, ptr %71, i32 0, i32 5, !dbg !1489
  %72 = load i32, ptr %st_gid, align 8, !dbg !1489
  %73 = load ptr, ptr %defaults.addr, align 8, !dbg !1490
  %st_gid74 = getelementptr inbounds %struct.stat64.9, ptr %73, i32 0, i32 5, !dbg !1491
  %74 = load i32, ptr %st_gid74, align 8, !dbg !1491
  %cmp75 = icmp eq i32 %72, %74, !dbg !1492
  %conv76 = zext i1 %cmp75 to i32, !dbg !1492
  %conv77 = sext i32 %conv76 to i64, !dbg !1488
  call void @klee_prefer_cex(ptr noundef %70, i64 noundef %conv77), !dbg !1493
  %75 = load ptr, ptr %s, align 8, !dbg !1494
  %76 = load ptr, ptr %s, align 8, !dbg !1495
  %st_blksize78 = getelementptr inbounds %struct.stat64.9, ptr %76, i32 0, i32 9, !dbg !1496
  %77 = load i64, ptr %st_blksize78, align 8, !dbg !1496
  %cmp79 = icmp eq i64 %77, 4096, !dbg !1497
  %conv80 = zext i1 %cmp79 to i32, !dbg !1497
  %conv81 = sext i32 %conv80 to i64, !dbg !1495
  call void @klee_prefer_cex(ptr noundef %75, i64 noundef %conv81), !dbg !1498
  %78 = load ptr, ptr %s, align 8, !dbg !1499
  %79 = load ptr, ptr %s, align 8, !dbg !1500
  %st_atim = getelementptr inbounds %struct.stat64.9, ptr %79, i32 0, i32 11, !dbg !1501
  %tv_sec = getelementptr inbounds %struct.timespec.8, ptr %st_atim, i32 0, i32 0, !dbg !1501
  %80 = load i64, ptr %tv_sec, align 8, !dbg !1501
  %81 = load ptr, ptr %defaults.addr, align 8, !dbg !1502
  %st_atim82 = getelementptr inbounds %struct.stat64.9, ptr %81, i32 0, i32 11, !dbg !1503
  %tv_sec83 = getelementptr inbounds %struct.timespec.8, ptr %st_atim82, i32 0, i32 0, !dbg !1503
  %82 = load i64, ptr %tv_sec83, align 8, !dbg !1503
  %cmp84 = icmp eq i64 %80, %82, !dbg !1504
  %conv85 = zext i1 %cmp84 to i32, !dbg !1504
  %conv86 = sext i32 %conv85 to i64, !dbg !1500
  call void @klee_prefer_cex(ptr noundef %78, i64 noundef %conv86), !dbg !1505
  %83 = load ptr, ptr %s, align 8, !dbg !1506
  %84 = load ptr, ptr %s, align 8, !dbg !1507
  %st_mtim = getelementptr inbounds %struct.stat64.9, ptr %84, i32 0, i32 12, !dbg !1508
  %tv_sec87 = getelementptr inbounds %struct.timespec.8, ptr %st_mtim, i32 0, i32 0, !dbg !1508
  %85 = load i64, ptr %tv_sec87, align 8, !dbg !1508
  %86 = load ptr, ptr %defaults.addr, align 8, !dbg !1509
  %st_mtim88 = getelementptr inbounds %struct.stat64.9, ptr %86, i32 0, i32 12, !dbg !1510
  %tv_sec89 = getelementptr inbounds %struct.timespec.8, ptr %st_mtim88, i32 0, i32 0, !dbg !1510
  %87 = load i64, ptr %tv_sec89, align 8, !dbg !1510
  %cmp90 = icmp eq i64 %85, %87, !dbg !1511
  %conv91 = zext i1 %cmp90 to i32, !dbg !1511
  %conv92 = sext i32 %conv91 to i64, !dbg !1507
  call void @klee_prefer_cex(ptr noundef %83, i64 noundef %conv92), !dbg !1512
  %88 = load ptr, ptr %s, align 8, !dbg !1513
  %89 = load ptr, ptr %s, align 8, !dbg !1514
  %st_ctim = getelementptr inbounds %struct.stat64.9, ptr %89, i32 0, i32 13, !dbg !1515
  %tv_sec93 = getelementptr inbounds %struct.timespec.8, ptr %st_ctim, i32 0, i32 0, !dbg !1515
  %90 = load i64, ptr %tv_sec93, align 8, !dbg !1515
  %91 = load ptr, ptr %defaults.addr, align 8, !dbg !1516
  %st_ctim94 = getelementptr inbounds %struct.stat64.9, ptr %91, i32 0, i32 13, !dbg !1517
  %tv_sec95 = getelementptr inbounds %struct.timespec.8, ptr %st_ctim94, i32 0, i32 0, !dbg !1517
  %92 = load i64, ptr %tv_sec95, align 8, !dbg !1517
  %cmp96 = icmp eq i64 %90, %92, !dbg !1518
  %conv97 = zext i1 %cmp96 to i32, !dbg !1518
  %conv98 = sext i32 %conv97 to i64, !dbg !1514
  call void @klee_prefer_cex(ptr noundef %88, i64 noundef %conv98), !dbg !1519
  %93 = load ptr, ptr %dfile.addr, align 8, !dbg !1520
  %size99 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %93, i32 0, i32 0, !dbg !1521
  %94 = load i32, ptr %size99, align 8, !dbg !1521
  %conv100 = zext i32 %94 to i64, !dbg !1520
  %95 = load ptr, ptr %s, align 8, !dbg !1522
  %st_size = getelementptr inbounds %struct.stat64.9, ptr %95, i32 0, i32 8, !dbg !1523
  store i64 %conv100, ptr %st_size, align 8, !dbg !1524
  %96 = load ptr, ptr %s, align 8, !dbg !1525
  %st_blocks = getelementptr inbounds %struct.stat64.9, ptr %96, i32 0, i32 10, !dbg !1526
  store i64 8, ptr %st_blocks, align 8, !dbg !1527
  %97 = load ptr, ptr %s, align 8, !dbg !1528
  %98 = load ptr, ptr %dfile.addr, align 8, !dbg !1529
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %98, i32 0, i32 2, !dbg !1530
  store ptr %97, ptr %stat, align 8, !dbg !1531
  ret void, !dbg !1532
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #6

declare i32 @klee_is_symbolic(i64 noundef) #4

declare void @klee_assume(i64 noundef) #4

declare void @klee_prefer_cex(ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @klee_range(i32 noundef %start, i32 noundef %end, ptr noundef %name) #0 !dbg !1533 {
entry:
  %retval = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %name.addr = alloca ptr, align 8
  %x = alloca i32, align 4
  store i32 %start, ptr %start.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %start.addr, metadata !1536, metadata !DIExpression()), !dbg !1537
  store i32 %end, ptr %end.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %end.addr, metadata !1538, metadata !DIExpression()), !dbg !1539
  store ptr %name, ptr %name.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %name.addr, metadata !1540, metadata !DIExpression()), !dbg !1541
  call void @llvm.dbg.declare(metadata ptr %x, metadata !1542, metadata !DIExpression()), !dbg !1543
  %0 = load i32, ptr %start.addr, align 4, !dbg !1544
  %1 = load i32, ptr %end.addr, align 4, !dbg !1546
  %cmp = icmp sge i32 %0, %1, !dbg !1547
  br i1 %cmp, label %if.then, label %if.end, !dbg !1548

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.50, i32 noundef 16, ptr noundef @.str.1.51, ptr noundef @.str.2.52) #13, !dbg !1549
  unreachable, !dbg !1549

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %start.addr, align 4, !dbg !1550
  %add = add nsw i32 %2, 1, !dbg !1552
  %3 = load i32, ptr %end.addr, align 4, !dbg !1553
  %cmp1 = icmp eq i32 %add, %3, !dbg !1554
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1555

if.then2:                                         ; preds = %if.end
  %4 = load i32, ptr %start.addr, align 4, !dbg !1556
  store i32 %4, ptr %retval, align 4, !dbg !1558
  br label %return, !dbg !1558

if.else:                                          ; preds = %if.end
  %5 = load ptr, ptr %name.addr, align 8, !dbg !1559
  call void @klee_make_symbolic(ptr noundef %x, i64 noundef 4, ptr noundef %5), !dbg !1561
  %6 = load i32, ptr %start.addr, align 4, !dbg !1562
  %cmp3 = icmp eq i32 %6, 0, !dbg !1564
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1565

if.then4:                                         ; preds = %if.else
  %7 = load i32, ptr %x, align 4, !dbg !1566
  %8 = load i32, ptr %end.addr, align 4, !dbg !1568
  %cmp5 = icmp ult i32 %7, %8, !dbg !1569
  %conv = zext i1 %cmp5 to i32, !dbg !1569
  %conv6 = sext i32 %conv to i64, !dbg !1570
  call void @klee_assume(i64 noundef %conv6), !dbg !1571
  br label %if.end14, !dbg !1572

if.else7:                                         ; preds = %if.else
  %9 = load i32, ptr %start.addr, align 4, !dbg !1573
  %10 = load i32, ptr %x, align 4, !dbg !1575
  %cmp8 = icmp sle i32 %9, %10, !dbg !1576
  %conv9 = zext i1 %cmp8 to i32, !dbg !1576
  %conv10 = sext i32 %conv9 to i64, !dbg !1573
  call void @klee_assume(i64 noundef %conv10), !dbg !1577
  %11 = load i32, ptr %x, align 4, !dbg !1578
  %12 = load i32, ptr %end.addr, align 4, !dbg !1579
  %cmp11 = icmp slt i32 %11, %12, !dbg !1580
  %conv12 = zext i1 %cmp11 to i32, !dbg !1580
  %conv13 = sext i32 %conv12 to i64, !dbg !1578
  call void @klee_assume(i64 noundef %conv13), !dbg !1581
  br label %if.end14

if.end14:                                         ; preds = %if.else7, %if.then4
  %13 = load i32, ptr %x, align 4, !dbg !1582
  store i32 %13, ptr %retval, align 4, !dbg !1583
  br label %return, !dbg !1583

return:                                           ; preds = %if.end14, %if.then2
  %14 = load i32, ptr %retval, align 4, !dbg !1584
  ret i32 %14, !dbg !1584
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @access(ptr noundef nonnull %pathname, i32 noundef %mode) #0 !dbg !1585 {
entry:
  %retval = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %mode.addr = alloca i32, align 4
  %dfile = alloca ptr, align 8
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !1588, metadata !DIExpression()), !dbg !1589
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !1590, metadata !DIExpression()), !dbg !1591
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !1592, metadata !DIExpression()), !dbg !1618
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !1619
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !1620
  store ptr %call, ptr %dfile, align 8, !dbg !1618
  %1 = load ptr, ptr %dfile, align 8, !dbg !1621
  %tobool = icmp ne ptr %1, null, !dbg !1621
  br i1 %tobool, label %if.then, label %if.end, !dbg !1623

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4, !dbg !1624
  br label %return, !dbg !1624

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %pathname.addr, align 8, !dbg !1626
  %call1 = call ptr @__concretize_string(ptr noundef %2), !dbg !1627
  %3 = load i32, ptr %mode.addr, align 4, !dbg !1628
  %call2 = call i64 (i64, ...) @syscall(i64 noundef 21, ptr noundef %call1, i32 noundef %3) #16, !dbg !1629
  %conv = trunc i64 %call2 to i32, !dbg !1629
  store i32 %conv, ptr %retval, align 4, !dbg !1630
  br label %return, !dbg !1630

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, ptr %retval, align 4, !dbg !1631
  ret i32 %4, !dbg !1631
}

; Function Attrs: noinline nounwind uwtable
define internal ptr @__get_sym_file(ptr noundef %pathname) #0 !dbg !1632 {
entry:
  %retval = alloca ptr, align 8
  %pathname.addr = alloca ptr, align 8
  %cwd = alloca [1024 x i8], align 16
  %cwd_len = alloca i64, align 8
  %c = alloca i8, align 1
  %i = alloca i32, align 4
  %df = alloca ptr, align 8
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !1635, metadata !DIExpression()), !dbg !1636
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !1637
  %tobool = icmp ne ptr %0, null, !dbg !1637
  br i1 %tobool, label %if.end, label %if.then, !dbg !1639

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8, !dbg !1640
  br label %return, !dbg !1640

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pathname.addr, align 8, !dbg !1641
  %arrayidx = getelementptr inbounds i8, ptr %1, i64 0, !dbg !1641
  %2 = load i8, ptr %arrayidx, align 1, !dbg !1641
  %conv = sext i8 %2 to i32, !dbg !1641
  %cmp = icmp eq i32 %conv, 47, !dbg !1643
  br i1 %cmp, label %if.then2, label %if.end29, !dbg !1644

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata ptr %cwd, metadata !1645, metadata !DIExpression()), !dbg !1648
  %3 = call ptr @memset(ptr %cwd, i32 0, i64 1024), !dbg !1648
  %arraydecay = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 0, !dbg !1649
  %call = call ptr @getcwd(ptr noundef %arraydecay, i64 noundef 1024) #16, !dbg !1651
  %tobool3 = icmp ne ptr %call, null, !dbg !1651
  br i1 %tobool3, label %if.then4, label %if.end29, !dbg !1652

if.then4:                                         ; preds = %if.then2
  call void @llvm.dbg.declare(metadata ptr %cwd_len, metadata !1653, metadata !DIExpression()), !dbg !1655
  %arraydecay5 = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 0, !dbg !1656
  %call6 = call i64 @strlen(ptr noundef %arraydecay5) #15, !dbg !1657
  store i64 %call6, ptr %cwd_len, align 8, !dbg !1655
  %4 = load i64, ptr %cwd_len, align 8, !dbg !1658
  %cmp7 = icmp ugt i64 %4, 0, !dbg !1660
  br i1 %cmp7, label %land.lhs.true, label %if.end15, !dbg !1661

land.lhs.true:                                    ; preds = %if.then4
  %5 = load i64, ptr %cwd_len, align 8, !dbg !1662
  %sub = sub i64 %5, 1, !dbg !1663
  %arrayidx9 = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 %sub, !dbg !1664
  %6 = load i8, ptr %arrayidx9, align 1, !dbg !1664
  %conv10 = sext i8 %6 to i32, !dbg !1664
  %cmp11 = icmp eq i32 %conv10, 47, !dbg !1665
  br i1 %cmp11, label %if.then13, label %if.end15, !dbg !1666

if.then13:                                        ; preds = %land.lhs.true
  %7 = load i64, ptr %cwd_len, align 8, !dbg !1667
  %dec = add i64 %7, -1, !dbg !1667
  store i64 %dec, ptr %cwd_len, align 8, !dbg !1667
  %arrayidx14 = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 %dec, !dbg !1669
  store i8 0, ptr %arrayidx14, align 1, !dbg !1670
  br label %if.end15, !dbg !1671

if.end15:                                         ; preds = %if.then13, %land.lhs.true, %if.then4
  %8 = load ptr, ptr %pathname.addr, align 8, !dbg !1672
  %arraydecay16 = getelementptr inbounds [1024 x i8], ptr %cwd, i64 0, i64 0, !dbg !1674
  %9 = load i64, ptr %cwd_len, align 8, !dbg !1675
  %call17 = call i32 @strncmp(ptr noundef %8, ptr noundef %arraydecay16, i64 noundef %9) #15, !dbg !1676
  %cmp18 = icmp eq i32 %call17, 0, !dbg !1677
  br i1 %cmp18, label %if.then20, label %if.end29, !dbg !1678

if.then20:                                        ; preds = %if.end15
  %10 = load ptr, ptr %pathname.addr, align 8, !dbg !1679
  %11 = load i64, ptr %cwd_len, align 8, !dbg !1682
  %arrayidx21 = getelementptr inbounds i8, ptr %10, i64 %11, !dbg !1679
  %12 = load i8, ptr %arrayidx21, align 1, !dbg !1679
  %conv22 = sext i8 %12 to i32, !dbg !1679
  %cmp23 = icmp ne i32 %conv22, 0, !dbg !1683
  br i1 %cmp23, label %if.then25, label %if.end29, !dbg !1684

if.then25:                                        ; preds = %if.then20
  %13 = load i64, ptr %cwd_len, align 8, !dbg !1685
  %add = add i64 %13, 1, !dbg !1686
  %14 = load ptr, ptr %pathname.addr, align 8, !dbg !1687
  %add.ptr = getelementptr inbounds i8, ptr %14, i64 %add, !dbg !1687
  store ptr %add.ptr, ptr %pathname.addr, align 8, !dbg !1687
  br label %if.end29, !dbg !1688

if.end29:                                         ; preds = %if.then2, %if.then20, %if.then25, %if.end15, %if.end
  call void @llvm.dbg.declare(metadata ptr %c, metadata !1689, metadata !DIExpression()), !dbg !1690
  %15 = load ptr, ptr %pathname.addr, align 8, !dbg !1691
  %arrayidx30 = getelementptr inbounds i8, ptr %15, i64 0, !dbg !1691
  %16 = load i8, ptr %arrayidx30, align 1, !dbg !1691
  store i8 %16, ptr %c, align 1, !dbg !1690
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1692, metadata !DIExpression()), !dbg !1693
  %17 = load i8, ptr %c, align 1, !dbg !1694
  %conv31 = sext i8 %17 to i32, !dbg !1694
  %cmp32 = icmp eq i32 %conv31, 0, !dbg !1696
  br i1 %cmp32, label %if.then38, label %lor.lhs.false, !dbg !1697

lor.lhs.false:                                    ; preds = %if.end29
  %18 = load ptr, ptr %pathname.addr, align 8, !dbg !1698
  %arrayidx34 = getelementptr inbounds i8, ptr %18, i64 1, !dbg !1698
  %19 = load i8, ptr %arrayidx34, align 1, !dbg !1698
  %conv35 = sext i8 %19 to i32, !dbg !1698
  %cmp36 = icmp ne i32 %conv35, 0, !dbg !1699
  br i1 %cmp36, label %if.then38, label %if.end39, !dbg !1700

if.then38:                                        ; preds = %lor.lhs.false, %if.end29
  store ptr null, ptr %retval, align 8, !dbg !1701
  br label %return, !dbg !1701

if.end39:                                         ; preds = %lor.lhs.false
  store i32 0, ptr %i, align 4, !dbg !1702
  br label %for.cond, !dbg !1704

for.cond:                                         ; preds = %for.inc, %if.end39
  %20 = load i32, ptr %i, align 4, !dbg !1705
  %21 = load i32, ptr @__exe_fs, align 8, !dbg !1707
  %cmp40 = icmp ult i32 %20, %21, !dbg !1708
  br i1 %cmp40, label %for.body, label %for.end, !dbg !1709

for.body:                                         ; preds = %for.cond
  %22 = load i8, ptr %c, align 1, !dbg !1710
  %conv42 = sext i8 %22 to i32, !dbg !1710
  %23 = load i32, ptr %i, align 4, !dbg !1713
  %conv43 = trunc i32 %23 to i8, !dbg !1714
  %conv44 = sext i8 %conv43 to i32, !dbg !1714
  %add45 = add nsw i32 65, %conv44, !dbg !1715
  %cmp46 = icmp eq i32 %conv42, %add45, !dbg !1716
  br i1 %cmp46, label %if.then48, label %for.inc, !dbg !1717

if.then48:                                        ; preds = %for.body
  call void @llvm.dbg.declare(metadata ptr %df, metadata !1718, metadata !DIExpression()), !dbg !1720
  %24 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8, !dbg !1721
  %25 = load i32, ptr %i, align 4, !dbg !1722
  %idxprom = zext i32 %25 to i64, !dbg !1723
  %arrayidx49 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %24, i64 %idxprom, !dbg !1723
  store ptr %arrayidx49, ptr %df, align 8, !dbg !1720
  %26 = load ptr, ptr %df, align 8, !dbg !1724
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %26, i32 0, i32 2, !dbg !1726
  %27 = load ptr, ptr %stat, align 8, !dbg !1726
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %27, i32 0, i32 1, !dbg !1727
  %28 = load i64, ptr %st_ino, align 8, !dbg !1727
  %cmp50 = icmp eq i64 %28, 0, !dbg !1728
  br i1 %cmp50, label %if.then52, label %if.end53, !dbg !1729

if.then52:                                        ; preds = %if.then48
  store ptr null, ptr %retval, align 8, !dbg !1730
  br label %return, !dbg !1730

if.end53:                                         ; preds = %if.then48
  %29 = load ptr, ptr %df, align 8, !dbg !1731
  store ptr %29, ptr %retval, align 8, !dbg !1732
  br label %return, !dbg !1732

for.inc:                                          ; preds = %for.body
  %30 = load i32, ptr %i, align 4, !dbg !1733
  %inc = add i32 %30, 1, !dbg !1733
  store i32 %inc, ptr %i, align 4, !dbg !1733
  br label %for.cond, !dbg !1734, !llvm.loop !1735

for.end:                                          ; preds = %for.cond
  store ptr null, ptr %retval, align 8, !dbg !1737
  br label %return, !dbg !1737

return:                                           ; preds = %for.end, %if.end53, %if.then52, %if.then38, %if.then
  %31 = load ptr, ptr %retval, align 8, !dbg !1738
  ret ptr %31, !dbg !1738
}

; Function Attrs: noinline nounwind uwtable
define internal ptr @__concretize_string(ptr noundef %s) #0 !dbg !1739 {
entry:
  %s.addr = alloca ptr, align 8
  %sc = alloca ptr, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %cc = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !1742, metadata !DIExpression()), !dbg !1743
  call void @llvm.dbg.declare(metadata ptr %sc, metadata !1744, metadata !DIExpression()), !dbg !1745
  %0 = load ptr, ptr %s.addr, align 8, !dbg !1746
  %call = call ptr @__concretize_ptr(ptr noundef %0), !dbg !1747
  store ptr %call, ptr %sc, align 8, !dbg !1745
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1748, metadata !DIExpression()), !dbg !1749
  store i32 0, ptr %i, align 4, !dbg !1750
  br label %for.cond, !dbg !1752

for.cond:                                         ; preds = %for.inc, %entry
  call void @llvm.dbg.declare(metadata ptr %c, metadata !1753, metadata !DIExpression()), !dbg !1756
  %1 = load ptr, ptr %sc, align 8, !dbg !1757
  %2 = load i8, ptr %1, align 1, !dbg !1758
  store i8 %2, ptr %c, align 1, !dbg !1756
  %3 = load i8, ptr %c, align 1, !dbg !1759
  %conv = sext i8 %3 to i64, !dbg !1759
  %call1 = call i32 @klee_is_symbolic(i64 noundef %conv), !dbg !1761
  %tobool = icmp ne i32 %call1, 0, !dbg !1761
  br i1 %tobool, label %if.end4, label %if.then, !dbg !1762

if.then:                                          ; preds = %for.cond
  %4 = load i8, ptr %c, align 1, !dbg !1763
  %tobool2 = icmp ne i8 %4, 0, !dbg !1763
  br i1 %tobool2, label %for.inc, label %for.end, !dbg !1766

if.end4:                                          ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !1767
  %6 = load i32, ptr %i, align 4, !dbg !1769
  %sub = sub i32 %6, 1, !dbg !1770
  %and = and i32 %5, %sub, !dbg !1771
  %tobool5 = icmp ne i32 %and, 0, !dbg !1771
  br i1 %tobool5, label %if.else14, label %if.then6, !dbg !1772

if.then6:                                         ; preds = %if.end4
  %7 = load i8, ptr %c, align 1, !dbg !1773
  %tobool7 = icmp ne i8 %7, 0, !dbg !1773
  br i1 %tobool7, label %if.else, label %if.then8, !dbg !1776

if.then8:                                         ; preds = %if.then6
  %8 = load ptr, ptr %sc, align 8, !dbg !1777
  store i8 0, ptr %8, align 1, !dbg !1779
  br label %for.end, !dbg !1780

if.else:                                          ; preds = %if.then6
  %9 = load i8, ptr %c, align 1, !dbg !1781
  %conv9 = sext i8 %9 to i32, !dbg !1781
  %cmp = icmp eq i32 %conv9, 47, !dbg !1783
  br i1 %cmp, label %if.then11, label %for.inc, !dbg !1784

if.then11:                                        ; preds = %if.else
  %10 = load ptr, ptr %sc, align 8, !dbg !1785
  store i8 47, ptr %10, align 1, !dbg !1787
  br label %for.inc, !dbg !1788

if.else14:                                        ; preds = %if.end4
  call void @llvm.dbg.declare(metadata ptr %cc, metadata !1789, metadata !DIExpression()), !dbg !1791
  %11 = load i8, ptr %c, align 1, !dbg !1792
  %conv15 = sext i8 %11 to i64, !dbg !1793
  %call16 = call i64 @klee_get_valuel(i64 noundef %conv15), !dbg !1794
  %conv17 = trunc i64 %call16 to i8, !dbg !1795
  store i8 %conv17, ptr %cc, align 1, !dbg !1791
  %12 = load i8, ptr %cc, align 1, !dbg !1796
  %conv18 = sext i8 %12 to i32, !dbg !1796
  %13 = load i8, ptr %c, align 1, !dbg !1797
  %conv19 = sext i8 %13 to i32, !dbg !1797
  %cmp20 = icmp eq i32 %conv18, %conv19, !dbg !1798
  %conv21 = zext i1 %cmp20 to i32, !dbg !1798
  %conv22 = sext i32 %conv21 to i64, !dbg !1796
  call void @klee_assume(i64 noundef %conv22), !dbg !1799
  %14 = load i8, ptr %cc, align 1, !dbg !1800
  %15 = load ptr, ptr %sc, align 8, !dbg !1801
  store i8 %14, ptr %15, align 1, !dbg !1802
  %16 = load i8, ptr %cc, align 1, !dbg !1803
  %tobool23 = icmp ne i8 %16, 0, !dbg !1803
  br i1 %tobool23, label %for.inc, label %for.end, !dbg !1805

for.inc:                                          ; preds = %if.else, %if.then11, %if.else14, %if.then
  %17 = load i32, ptr %i, align 4, !dbg !1806
  %inc = add i32 %17, 1, !dbg !1806
  store i32 %inc, ptr %i, align 4, !dbg !1806
  %18 = load ptr, ptr %sc, align 8, !dbg !1807
  %incdec.ptr = getelementptr inbounds i8, ptr %18, i32 1, !dbg !1807
  store ptr %incdec.ptr, ptr %sc, align 8, !dbg !1807
  br label %for.cond, !dbg !1808, !llvm.loop !1809

for.end:                                          ; preds = %if.else14, %if.then, %if.then8
  %19 = load ptr, ptr %s.addr, align 8, !dbg !1812
  ret ptr %19, !dbg !1813
}

; Function Attrs: nounwind
declare i64 @syscall(i64 noundef, ...) #9

; Function Attrs: noinline nounwind uwtable
define internal ptr @__concretize_ptr(ptr noundef %p) #0 !dbg !1814 {
entry:
  %p.addr = alloca ptr, align 8
  %pc = alloca ptr, align 8
  store ptr %p, ptr %p.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %p.addr, metadata !1817, metadata !DIExpression()), !dbg !1818
  call void @llvm.dbg.declare(metadata ptr %pc, metadata !1819, metadata !DIExpression()), !dbg !1820
  %0 = load ptr, ptr %p.addr, align 8, !dbg !1821
  %1 = ptrtoint ptr %0 to i64, !dbg !1822
  %call = call i64 @klee_get_valuel(i64 noundef %1), !dbg !1823
  %2 = inttoptr i64 %call to ptr, !dbg !1824
  store ptr %2, ptr %pc, align 8, !dbg !1820
  %3 = load ptr, ptr %pc, align 8, !dbg !1825
  %4 = load ptr, ptr %p.addr, align 8, !dbg !1826
  %cmp = icmp eq ptr %3, %4, !dbg !1827
  %conv = zext i1 %cmp to i32, !dbg !1827
  %conv1 = sext i32 %conv to i64, !dbg !1825
  call void @klee_assume(i64 noundef %conv1), !dbg !1828
  %5 = load ptr, ptr %pc, align 8, !dbg !1829
  ret ptr %5, !dbg !1830
}

declare i64 @klee_get_valuel(i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @getcwd(ptr noundef %buf, i64 noundef %size) #0 !dbg !489 {
entry:
  %retval = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %r = alloca i32, align 4
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !1831, metadata !DIExpression()), !dbg !1832
  store i64 %size, ptr %size.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !1833, metadata !DIExpression()), !dbg !1834
  call void @llvm.dbg.declare(metadata ptr %r, metadata !1835, metadata !DIExpression()), !dbg !1836
  %0 = load i32, ptr @getcwd.n_calls, align 4, !dbg !1837
  %inc = add nsw i32 %0, 1, !dbg !1837
  store i32 %inc, ptr @getcwd.n_calls, align 4, !dbg !1837
  %1 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1838
  %tobool = icmp ne i32 %1, 0, !dbg !1840
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !1841

land.lhs.true:                                    ; preds = %entry
  %2 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 10), align 8, !dbg !1842
  %3 = load i32, ptr %2, align 4, !dbg !1843
  %4 = load i32, ptr @getcwd.n_calls, align 4, !dbg !1844
  %cmp = icmp eq i32 %3, %4, !dbg !1845
  br i1 %cmp, label %if.then, label %if.end, !dbg !1846

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1847
  %dec = add i32 %5, -1, !dbg !1847
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !1847
  %call = call ptr @__errno_location() #17, !dbg !1849
  store i32 34, ptr %call, align 4, !dbg !1850
  store ptr null, ptr %retval, align 8, !dbg !1851
  br label %return, !dbg !1851

if.end:                                           ; preds = %land.lhs.true, %entry
  %6 = load ptr, ptr %buf.addr, align 8, !dbg !1852
  %tobool1 = icmp ne ptr %6, null, !dbg !1852
  br i1 %tobool1, label %if.else, label %if.then2, !dbg !1854

if.then2:                                         ; preds = %if.end
  store i64 1024, ptr %size.addr, align 8, !dbg !1855
  %7 = load i64, ptr %size.addr, align 8, !dbg !1857
  %call3 = call noalias ptr @malloc(i64 noundef %7) #12, !dbg !1858
  store ptr %call3, ptr %buf.addr, align 8, !dbg !1859
  %8 = load ptr, ptr %buf.addr, align 8, !dbg !1860
  %tobool4 = icmp ne ptr %8, null, !dbg !1860
  br i1 %tobool4, label %if.end12, label %if.then5, !dbg !1862

if.then5:                                         ; preds = %if.then2
  %call6 = call ptr @__errno_location() #17, !dbg !1863
  store i32 12, ptr %call6, align 4, !dbg !1865
  store ptr null, ptr %retval, align 8, !dbg !1866
  br label %return, !dbg !1866

if.else:                                          ; preds = %if.end
  %9 = load i64, ptr %size.addr, align 8, !dbg !1867
  %tobool8 = icmp ne i64 %9, 0, !dbg !1867
  br i1 %tobool8, label %if.end12, label %if.then9, !dbg !1869

if.then9:                                         ; preds = %if.else
  %call10 = call ptr @__errno_location() #17, !dbg !1870
  store i32 22, ptr %call10, align 4, !dbg !1872
  store ptr null, ptr %retval, align 8, !dbg !1873
  br label %return, !dbg !1873

if.end12:                                         ; preds = %if.else, %if.then2
  %10 = load ptr, ptr %buf.addr, align 8, !dbg !1874
  %call13 = call ptr @__concretize_ptr(ptr noundef %10), !dbg !1875
  store ptr %call13, ptr %buf.addr, align 8, !dbg !1876
  %11 = load i64, ptr %size.addr, align 8, !dbg !1877
  %call14 = call i64 @__concretize_size(i64 noundef %11), !dbg !1878
  store i64 %call14, ptr %size.addr, align 8, !dbg !1879
  %12 = load ptr, ptr %buf.addr, align 8, !dbg !1880
  %13 = load i64, ptr %size.addr, align 8, !dbg !1881
  call void @klee_check_memory_access(ptr noundef %12, i64 noundef %13), !dbg !1882
  %14 = load ptr, ptr %buf.addr, align 8, !dbg !1883
  %15 = load i64, ptr %size.addr, align 8, !dbg !1884
  %call15 = call i64 (i64, ...) @syscall(i64 noundef 79, ptr noundef %14, i64 noundef %15) #16, !dbg !1885
  %conv = trunc i64 %call15 to i32, !dbg !1885
  store i32 %conv, ptr %r, align 4, !dbg !1886
  %16 = load i32, ptr %r, align 4, !dbg !1887
  %cmp16 = icmp eq i32 %16, -1, !dbg !1889
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !1890

if.then18:                                        ; preds = %if.end12
  store ptr null, ptr %retval, align 8, !dbg !1891
  br label %return, !dbg !1891

if.end19:                                         ; preds = %if.end12
  %17 = load ptr, ptr %buf.addr, align 8, !dbg !1892
  store ptr %17, ptr %retval, align 8, !dbg !1893
  br label %return, !dbg !1893

return:                                           ; preds = %if.end19, %if.then18, %if.then9, %if.then5, %if.then
  %18 = load ptr, ptr %retval, align 8, !dbg !1894
  ret ptr %18, !dbg !1894
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #8

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #10

; Function Attrs: noinline nounwind uwtable
define internal i64 @__concretize_size(i64 noundef %s) #0 !dbg !1895 {
entry:
  %s.addr = alloca i64, align 8
  %sc = alloca i64, align 8
  store i64 %s, ptr %s.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !1898, metadata !DIExpression()), !dbg !1899
  call void @llvm.dbg.declare(metadata ptr %sc, metadata !1900, metadata !DIExpression()), !dbg !1901
  %0 = load i64, ptr %s.addr, align 8, !dbg !1902
  %call = call i64 @klee_get_valuel(i64 noundef %0), !dbg !1903
  store i64 %call, ptr %sc, align 8, !dbg !1901
  %1 = load i64, ptr %sc, align 8, !dbg !1904
  %2 = load i64, ptr %s.addr, align 8, !dbg !1905
  %cmp = icmp eq i64 %1, %2, !dbg !1906
  %conv = zext i1 %cmp to i32, !dbg !1906
  %conv1 = sext i32 %conv to i64, !dbg !1904
  call void @klee_assume(i64 noundef %conv1), !dbg !1907
  %3 = load i64, ptr %sc, align 8, !dbg !1908
  ret i64 %3, !dbg !1909
}

declare void @klee_check_memory_access(ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @umask(i32 noundef %mask) #0 !dbg !1910 {
entry:
  %mask.addr = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %mask, ptr %mask.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mask.addr, metadata !1913, metadata !DIExpression()), !dbg !1914
  call void @llvm.dbg.declare(metadata ptr %r, metadata !1915, metadata !DIExpression()), !dbg !1916
  %0 = load i32, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 1), align 8, !dbg !1917
  store i32 %0, ptr %r, align 4, !dbg !1916
  %1 = load i32, ptr %mask.addr, align 4, !dbg !1918
  %and = and i32 %1, 511, !dbg !1919
  store i32 %and, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 1), align 8, !dbg !1920
  %2 = load i32, ptr %r, align 4, !dbg !1921
  ret i32 %2, !dbg !1922
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_open(ptr noundef %pathname, i32 noundef %flags, i32 noundef %mode) #0 !dbg !1923 {
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
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !1926, metadata !DIExpression()), !dbg !1927
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !1928, metadata !DIExpression()), !dbg !1929
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !1930, metadata !DIExpression()), !dbg !1931
  call void @llvm.dbg.declare(metadata ptr %df, metadata !1932, metadata !DIExpression()), !dbg !1933
  call void @llvm.dbg.declare(metadata ptr %f, metadata !1934, metadata !DIExpression()), !dbg !1943
  call void @llvm.dbg.declare(metadata ptr %fd, metadata !1944, metadata !DIExpression()), !dbg !1945
  store i32 0, ptr %fd, align 4, !dbg !1946
  br label %for.cond, !dbg !1948

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %fd, align 4, !dbg !1949
  %cmp = icmp slt i32 %0, 32, !dbg !1951
  br i1 %cmp, label %for.body, label %for.end, !dbg !1952

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %fd, align 4, !dbg !1953
  %idxprom = sext i32 %1 to i64, !dbg !1955
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !1955
  %flags1 = getelementptr inbounds %struct.exe_file_t.6, ptr %arrayidx, i32 0, i32 1, !dbg !1956
  %2 = load i32, ptr %flags1, align 4, !dbg !1956
  %and = and i32 %2, 1, !dbg !1957
  %tobool = icmp ne i32 %and, 0, !dbg !1957
  br i1 %tobool, label %for.inc, label %for.end, !dbg !1958

for.inc:                                          ; preds = %for.body
  %3 = load i32, ptr %fd, align 4, !dbg !1959
  %inc = add nsw i32 %3, 1, !dbg !1959
  store i32 %inc, ptr %fd, align 4, !dbg !1959
  br label %for.cond, !dbg !1960, !llvm.loop !1961

for.end:                                          ; preds = %for.body, %for.cond
  %4 = load i32, ptr %fd, align 4, !dbg !1963
  %cmp2 = icmp eq i32 %4, 32, !dbg !1965
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !1966

if.then3:                                         ; preds = %for.end
  %call = call ptr @__errno_location() #17, !dbg !1967
  store i32 24, ptr %call, align 4, !dbg !1969
  store i32 -1, ptr %retval, align 4, !dbg !1970
  br label %return, !dbg !1970

if.end4:                                          ; preds = %for.end
  %5 = load i32, ptr %fd, align 4, !dbg !1971
  %idxprom5 = sext i32 %5 to i64, !dbg !1972
  %arrayidx6 = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom5, !dbg !1972
  store ptr %arrayidx6, ptr %f, align 8, !dbg !1973
  %6 = load ptr, ptr %f, align 8, !dbg !1974
  %7 = call ptr @memset(ptr %6, i32 0, i64 24), !dbg !1975
  %8 = load ptr, ptr %pathname.addr, align 8, !dbg !1976
  %call7 = call ptr @__get_sym_file(ptr noundef %8), !dbg !1977
  store ptr %call7, ptr %df, align 8, !dbg !1978
  %9 = load ptr, ptr %df, align 8, !dbg !1979
  %tobool8 = icmp ne ptr %9, null, !dbg !1979
  br i1 %tobool8, label %if.then9, label %if.else45, !dbg !1981

if.then9:                                         ; preds = %if.end4
  %10 = load ptr, ptr %df, align 8, !dbg !1982
  %11 = load ptr, ptr %f, align 8, !dbg !1984
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %11, i32 0, i32 3, !dbg !1985
  store ptr %10, ptr %dfile, align 8, !dbg !1986
  %12 = load i32, ptr %flags.addr, align 4, !dbg !1987
  %and10 = and i32 %12, 64, !dbg !1989
  %tobool11 = icmp ne i32 %and10, 0, !dbg !1989
  br i1 %tobool11, label %land.lhs.true, label %if.end16, !dbg !1990

land.lhs.true:                                    ; preds = %if.then9
  %13 = load i32, ptr %flags.addr, align 4, !dbg !1991
  %and12 = and i32 %13, 128, !dbg !1992
  %tobool13 = icmp ne i32 %and12, 0, !dbg !1992
  br i1 %tobool13, label %if.then14, label %if.end16, !dbg !1993

if.then14:                                        ; preds = %land.lhs.true
  %call15 = call ptr @__errno_location() #17, !dbg !1994
  store i32 17, ptr %call15, align 4, !dbg !1996
  store i32 -1, ptr %retval, align 4, !dbg !1997
  br label %return, !dbg !1997

if.end16:                                         ; preds = %land.lhs.true, %if.then9
  %14 = load i32, ptr %flags.addr, align 4, !dbg !1998
  %and17 = and i32 %14, 512, !dbg !2000
  %tobool18 = icmp ne i32 %and17, 0, !dbg !2000
  br i1 %tobool18, label %land.lhs.true19, label %if.end24, !dbg !2001

land.lhs.true19:                                  ; preds = %if.end16
  %15 = load i32, ptr %flags.addr, align 4, !dbg !2002
  %and20 = and i32 %15, 0, !dbg !2003
  %tobool21 = icmp ne i32 %and20, 0, !dbg !2003
  br i1 %tobool21, label %if.then22, label %if.end24, !dbg !2004

if.then22:                                        ; preds = %land.lhs.true19
  call void @klee_warning(ptr noundef @.str.53), !dbg !2005
  %call23 = call ptr @__errno_location() #17, !dbg !2007
  store i32 13, ptr %call23, align 4, !dbg !2008
  store i32 -1, ptr %retval, align 4, !dbg !2009
  br label %return, !dbg !2009

if.end24:                                         ; preds = %land.lhs.true19, %if.end16
  %16 = load i32, ptr %flags.addr, align 4, !dbg !2010
  %and25 = and i32 %16, 128, !dbg !2012
  %tobool26 = icmp ne i32 %and25, 0, !dbg !2012
  br i1 %tobool26, label %land.lhs.true27, label %if.end32, !dbg !2013

land.lhs.true27:                                  ; preds = %if.end24
  %17 = load i32, ptr %flags.addr, align 4, !dbg !2014
  %and28 = and i32 %17, 64, !dbg !2015
  %tobool29 = icmp ne i32 %and28, 0, !dbg !2015
  br i1 %tobool29, label %if.end32, label %if.then30, !dbg !2016

if.then30:                                        ; preds = %land.lhs.true27
  call void @klee_warning(ptr noundef @.str.1.54), !dbg !2017
  %call31 = call ptr @__errno_location() #17, !dbg !2019
  store i32 13, ptr %call31, align 4, !dbg !2020
  store i32 -1, ptr %retval, align 4, !dbg !2021
  br label %return, !dbg !2021

if.end32:                                         ; preds = %land.lhs.true27, %if.end24
  %18 = load i32, ptr %flags.addr, align 4, !dbg !2022
  %19 = load ptr, ptr %df, align 8, !dbg !2024
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %19, i32 0, i32 2, !dbg !2025
  %20 = load ptr, ptr %stat, align 8, !dbg !2025
  %call33 = call i32 @has_permission(i32 noundef %18, ptr noundef %20), !dbg !2026
  %tobool34 = icmp ne i32 %call33, 0, !dbg !2026
  br i1 %tobool34, label %if.else, label %if.then35, !dbg !2027

if.then35:                                        ; preds = %if.end32
  %call36 = call ptr @__errno_location() #17, !dbg !2028
  store i32 13, ptr %call36, align 4, !dbg !2030
  store i32 -1, ptr %retval, align 4, !dbg !2031
  br label %return, !dbg !2031

if.else:                                          ; preds = %if.end32
  %21 = load ptr, ptr %f, align 8, !dbg !2032
  %dfile37 = getelementptr inbounds %struct.exe_file_t.6, ptr %21, i32 0, i32 3, !dbg !2033
  %22 = load ptr, ptr %dfile37, align 8, !dbg !2033
  %stat38 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %22, i32 0, i32 2, !dbg !2034
  %23 = load ptr, ptr %stat38, align 8, !dbg !2034
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %23, i32 0, i32 3, !dbg !2035
  %24 = load i32, ptr %st_mode, align 8, !dbg !2035
  %and39 = and i32 %24, -512, !dbg !2036
  %25 = load i32, ptr %mode.addr, align 4, !dbg !2037
  %26 = load i32, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 1), align 8, !dbg !2038
  %not = xor i32 %26, -1, !dbg !2039
  %and40 = and i32 %25, %not, !dbg !2040
  %or = or i32 %and39, %and40, !dbg !2041
  %27 = load ptr, ptr %f, align 8, !dbg !2042
  %dfile41 = getelementptr inbounds %struct.exe_file_t.6, ptr %27, i32 0, i32 3, !dbg !2043
  %28 = load ptr, ptr %dfile41, align 8, !dbg !2043
  %stat42 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %28, i32 0, i32 2, !dbg !2044
  %29 = load ptr, ptr %stat42, align 8, !dbg !2044
  %st_mode43 = getelementptr inbounds %struct.stat64.9, ptr %29, i32 0, i32 3, !dbg !2045
  store i32 %or, ptr %st_mode43, align 8, !dbg !2046
  br label %if.end53, !dbg !2047

if.else45:                                        ; preds = %if.end4
  call void @llvm.dbg.declare(metadata ptr %os_fd, metadata !2048, metadata !DIExpression()), !dbg !2050
  %30 = load ptr, ptr %pathname.addr, align 8, !dbg !2051
  %call46 = call ptr @__concretize_string(ptr noundef %30), !dbg !2052
  %31 = load i32, ptr %flags.addr, align 4, !dbg !2053
  %32 = load i32, ptr %mode.addr, align 4, !dbg !2054
  %call47 = call i64 (i64, ...) @syscall(i64 noundef 2, ptr noundef %call46, i32 noundef %31, i32 noundef %32) #16, !dbg !2055
  %conv = trunc i64 %call47 to i32, !dbg !2055
  store i32 %conv, ptr %os_fd, align 4, !dbg !2050
  %33 = load i32, ptr %os_fd, align 4, !dbg !2056
  %cmp48 = icmp eq i32 %33, -1, !dbg !2058
  br i1 %cmp48, label %if.then50, label %if.end51, !dbg !2059

if.then50:                                        ; preds = %if.else45
  store i32 -1, ptr %retval, align 4, !dbg !2060
  br label %return, !dbg !2060

if.end51:                                         ; preds = %if.else45
  %34 = load i32, ptr %os_fd, align 4, !dbg !2061
  %35 = load ptr, ptr %f, align 8, !dbg !2062
  %fd52 = getelementptr inbounds %struct.exe_file_t.6, ptr %35, i32 0, i32 0, !dbg !2063
  store i32 %34, ptr %fd52, align 8, !dbg !2064
  br label %if.end53

if.end53:                                         ; preds = %if.end51, %if.else
  %36 = load ptr, ptr %f, align 8, !dbg !2065
  %flags54 = getelementptr inbounds %struct.exe_file_t.6, ptr %36, i32 0, i32 1, !dbg !2066
  store i32 1, ptr %flags54, align 4, !dbg !2067
  %37 = load i32, ptr %flags.addr, align 4, !dbg !2068
  %and55 = and i32 %37, 3, !dbg !2070
  %cmp56 = icmp eq i32 %and55, 0, !dbg !2071
  br i1 %cmp56, label %if.then58, label %if.else61, !dbg !2072

if.then58:                                        ; preds = %if.end53
  %38 = load ptr, ptr %f, align 8, !dbg !2073
  %flags59 = getelementptr inbounds %struct.exe_file_t.6, ptr %38, i32 0, i32 1, !dbg !2075
  %39 = load i32, ptr %flags59, align 4, !dbg !2076
  %or60 = or i32 %39, 4, !dbg !2076
  store i32 %or60, ptr %flags59, align 4, !dbg !2076
  br label %if.end72, !dbg !2077

if.else61:                                        ; preds = %if.end53
  %40 = load i32, ptr %flags.addr, align 4, !dbg !2078
  %and62 = and i32 %40, 3, !dbg !2080
  %cmp63 = icmp eq i32 %and62, 1, !dbg !2081
  br i1 %cmp63, label %if.then65, label %if.else68, !dbg !2082

if.then65:                                        ; preds = %if.else61
  %41 = load ptr, ptr %f, align 8, !dbg !2083
  %flags66 = getelementptr inbounds %struct.exe_file_t.6, ptr %41, i32 0, i32 1, !dbg !2085
  %42 = load i32, ptr %flags66, align 4, !dbg !2086
  %or67 = or i32 %42, 8, !dbg !2086
  store i32 %or67, ptr %flags66, align 4, !dbg !2086
  br label %if.end72, !dbg !2087

if.else68:                                        ; preds = %if.else61
  %43 = load ptr, ptr %f, align 8, !dbg !2088
  %flags69 = getelementptr inbounds %struct.exe_file_t.6, ptr %43, i32 0, i32 1, !dbg !2090
  %44 = load i32, ptr %flags69, align 4, !dbg !2091
  %or70 = or i32 %44, 12, !dbg !2091
  store i32 %or70, ptr %flags69, align 4, !dbg !2091
  br label %if.end72

if.end72:                                         ; preds = %if.then65, %if.else68, %if.then58
  %45 = load i32, ptr %fd, align 4, !dbg !2092
  store i32 %45, ptr %retval, align 4, !dbg !2093
  br label %return, !dbg !2093

return:                                           ; preds = %if.end72, %if.then50, %if.then35, %if.then30, %if.then22, %if.then14, %if.then3
  %46 = load i32, ptr %retval, align 4, !dbg !2094
  ret i32 %46, !dbg !2094
}

declare void @klee_warning(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @has_permission(i32 noundef %flags, ptr noundef %s) #0 !dbg !2095 {
entry:
  %retval = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %s.addr = alloca ptr, align 8
  %mode = alloca i32, align 4
  %read_request = alloca i32, align 4
  %write_request = alloca i32, align 4
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !2098, metadata !DIExpression()), !dbg !2099
  store ptr %s, ptr %s.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !2100, metadata !DIExpression()), !dbg !2101
  call void @llvm.dbg.declare(metadata ptr %mode, metadata !2102, metadata !DIExpression()), !dbg !2103
  %0 = load ptr, ptr %s.addr, align 8, !dbg !2104
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %0, i32 0, i32 3, !dbg !2105
  %1 = load i32, ptr %st_mode, align 8, !dbg !2105
  store i32 %1, ptr %mode, align 4, !dbg !2103
  call void @llvm.dbg.declare(metadata ptr %read_request, metadata !2106, metadata !DIExpression()), !dbg !2107
  %2 = load i32, ptr %flags.addr, align 4, !dbg !2108
  %and = and i32 %2, 0, !dbg !2109
  %3 = load i32, ptr %flags.addr, align 4, !dbg !2110
  %and1 = and i32 %3, 2, !dbg !2111
  %or = or i32 %and, %and1, !dbg !2112
  %tobool = icmp ne i32 %or, 0, !dbg !2113
  %4 = zext i1 %tobool to i64, !dbg !2113
  %cond = select i1 %tobool, i32 1, i32 0, !dbg !2113
  store i32 %cond, ptr %read_request, align 4, !dbg !2107
  call void @llvm.dbg.declare(metadata ptr %write_request, metadata !2114, metadata !DIExpression()), !dbg !2115
  %5 = load i32, ptr %flags.addr, align 4, !dbg !2116
  %and2 = and i32 %5, 1, !dbg !2117
  %6 = load i32, ptr %flags.addr, align 4, !dbg !2118
  %and3 = and i32 %6, 2, !dbg !2119
  %or4 = or i32 %and2, %and3, !dbg !2120
  %tobool5 = icmp ne i32 %or4, 0, !dbg !2121
  %7 = zext i1 %tobool5 to i64, !dbg !2121
  %cond6 = select i1 %tobool5, i32 1, i32 0, !dbg !2121
  store i32 %cond6, ptr %write_request, align 4, !dbg !2115
  %8 = load i32, ptr %read_request, align 4, !dbg !2122
  %9 = load i32, ptr %mode, align 4, !dbg !2124
  %and7 = and i32 %9, 256, !dbg !2125
  %10 = load i32, ptr %mode, align 4, !dbg !2126
  %and8 = and i32 %10, 32, !dbg !2127
  %or9 = or i32 %and7, %and8, !dbg !2128
  %11 = load i32, ptr %mode, align 4, !dbg !2129
  %and10 = and i32 %11, 4, !dbg !2130
  %or11 = or i32 %or9, %and10, !dbg !2131
  %tobool12 = icmp ne i32 %or11, 0, !dbg !2132
  %lnot = xor i1 %tobool12, true, !dbg !2132
  %lnot.ext = zext i1 %lnot to i32, !dbg !2132
  %and13 = and i32 %8, %lnot.ext, !dbg !2133
  %12 = load i32, ptr %write_request, align 4, !dbg !2134
  %13 = load i32, ptr %mode, align 4, !dbg !2135
  %and14 = and i32 %13, 128, !dbg !2136
  %14 = load i32, ptr %mode, align 4, !dbg !2137
  %and15 = and i32 %14, 16, !dbg !2138
  %or16 = or i32 %and14, %and15, !dbg !2139
  %15 = load i32, ptr %mode, align 4, !dbg !2140
  %and17 = and i32 %15, 2, !dbg !2141
  %or18 = or i32 %or16, %and17, !dbg !2142
  %tobool19 = icmp ne i32 %or18, 0, !dbg !2143
  %lnot20 = xor i1 %tobool19, true, !dbg !2143
  %lnot.ext21 = zext i1 %lnot20 to i32, !dbg !2143
  %and22 = and i32 %12, %lnot.ext21, !dbg !2144
  %or23 = or i32 %and13, %and22, !dbg !2145
  %tobool24 = icmp ne i32 %or23, 0, !dbg !2145
  br i1 %tobool24, label %if.then, label %if.end, !dbg !2146

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4, !dbg !2147
  br label %return, !dbg !2147

if.end:                                           ; preds = %entry
  store i32 1, ptr %retval, align 4, !dbg !2148
  br label %return, !dbg !2148

return:                                           ; preds = %if.end, %if.then
  %16 = load i32, ptr %retval, align 4, !dbg !2149
  ret i32 %16, !dbg !2149
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_openat(i32 noundef %basefd, ptr noundef %pathname, i32 noundef %flags, i32 noundef %mode) #0 !dbg !2150 {
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
  call void @llvm.dbg.declare(metadata ptr %basefd.addr, metadata !2153, metadata !DIExpression()), !dbg !2154
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !2155, metadata !DIExpression()), !dbg !2156
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !2157, metadata !DIExpression()), !dbg !2158
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !2159, metadata !DIExpression()), !dbg !2160
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2161, metadata !DIExpression()), !dbg !2162
  call void @llvm.dbg.declare(metadata ptr %fd, metadata !2163, metadata !DIExpression()), !dbg !2164
  %0 = load i32, ptr %basefd.addr, align 4, !dbg !2165
  %cmp = icmp ne i32 %0, -100, !dbg !2167
  br i1 %cmp, label %if.then, label %if.end8, !dbg !2168

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %bf, metadata !2169, metadata !DIExpression()), !dbg !2171
  %1 = load i32, ptr %basefd.addr, align 4, !dbg !2172
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2173
  store ptr %call, ptr %bf, align 8, !dbg !2171
  %2 = load ptr, ptr %bf, align 8, !dbg !2174
  %tobool = icmp ne ptr %2, null, !dbg !2174
  br i1 %tobool, label %if.else, label %if.then1, !dbg !2176

if.then1:                                         ; preds = %if.then
  %call2 = call ptr @__errno_location() #17, !dbg !2177
  store i32 9, ptr %call2, align 4, !dbg !2179
  store i32 -1, ptr %retval, align 4, !dbg !2180
  br label %return, !dbg !2180

if.else:                                          ; preds = %if.then
  %3 = load ptr, ptr %bf, align 8, !dbg !2181
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %3, i32 0, i32 3, !dbg !2183
  %4 = load ptr, ptr %dfile, align 8, !dbg !2183
  %tobool3 = icmp ne ptr %4, null, !dbg !2181
  br i1 %tobool3, label %if.then4, label %if.end6, !dbg !2184

if.then4:                                         ; preds = %if.else
  call void @klee_warning(ptr noundef @.str.2.55), !dbg !2185
  %call5 = call ptr @__errno_location() #17, !dbg !2187
  store i32 2, ptr %call5, align 4, !dbg !2188
  store i32 -1, ptr %retval, align 4, !dbg !2189
  br label %return, !dbg !2189

if.end6:                                          ; preds = %if.else
  %5 = load ptr, ptr %bf, align 8, !dbg !2190
  %fd7 = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 0, !dbg !2191
  %6 = load i32, ptr %fd7, align 8, !dbg !2191
  store i32 %6, ptr %basefd.addr, align 4, !dbg !2192
  br label %if.end8, !dbg !2193

if.end8:                                          ; preds = %if.end6, %entry
  %7 = load ptr, ptr %pathname.addr, align 8, !dbg !2194
  %call9 = call ptr @__get_sym_file(ptr noundef %7), !dbg !2196
  %tobool10 = icmp ne ptr %call9, null, !dbg !2196
  br i1 %tobool10, label %if.then11, label %if.end13, !dbg !2197

if.then11:                                        ; preds = %if.end8
  %8 = load ptr, ptr %pathname.addr, align 8, !dbg !2198
  %9 = load i32, ptr %flags.addr, align 4, !dbg !2200
  %10 = load i32, ptr %mode.addr, align 4, !dbg !2201
  %call12 = call i32 @__fd_open(ptr noundef %8, i32 noundef %9, i32 noundef %10), !dbg !2202
  store i32 %call12, ptr %retval, align 4, !dbg !2203
  br label %return, !dbg !2203

if.end13:                                         ; preds = %if.end8
  store i32 0, ptr %fd, align 4, !dbg !2204
  br label %for.cond, !dbg !2206

for.cond:                                         ; preds = %for.inc, %if.end13
  %11 = load i32, ptr %fd, align 4, !dbg !2207
  %cmp14 = icmp slt i32 %11, 32, !dbg !2209
  br i1 %cmp14, label %for.body, label %for.end, !dbg !2210

for.body:                                         ; preds = %for.cond
  %12 = load i32, ptr %fd, align 4, !dbg !2211
  %idxprom = sext i32 %12 to i64, !dbg !2213
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !2213
  %flags15 = getelementptr inbounds %struct.exe_file_t.6, ptr %arrayidx, i32 0, i32 1, !dbg !2214
  %13 = load i32, ptr %flags15, align 4, !dbg !2214
  %and = and i32 %13, 1, !dbg !2215
  %tobool16 = icmp ne i32 %and, 0, !dbg !2215
  br i1 %tobool16, label %for.inc, label %for.end, !dbg !2216

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %fd, align 4, !dbg !2217
  %inc = add nsw i32 %14, 1, !dbg !2217
  store i32 %inc, ptr %fd, align 4, !dbg !2217
  br label %for.cond, !dbg !2218, !llvm.loop !2219

for.end:                                          ; preds = %for.body, %for.cond
  %15 = load i32, ptr %fd, align 4, !dbg !2221
  %cmp19 = icmp eq i32 %15, 32, !dbg !2223
  br i1 %cmp19, label %if.then20, label %if.end22, !dbg !2224

if.then20:                                        ; preds = %for.end
  %call21 = call ptr @__errno_location() #17, !dbg !2225
  store i32 24, ptr %call21, align 4, !dbg !2227
  store i32 -1, ptr %retval, align 4, !dbg !2228
  br label %return, !dbg !2228

if.end22:                                         ; preds = %for.end
  %16 = load i32, ptr %fd, align 4, !dbg !2229
  %idxprom23 = sext i32 %16 to i64, !dbg !2230
  %arrayidx24 = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom23, !dbg !2230
  store ptr %arrayidx24, ptr %f, align 8, !dbg !2231
  %17 = load ptr, ptr %f, align 8, !dbg !2232
  %18 = call ptr @memset(ptr %17, i32 0, i64 24), !dbg !2233
  call void @llvm.dbg.declare(metadata ptr %os_fd, metadata !2234, metadata !DIExpression()), !dbg !2235
  %19 = load i32, ptr %basefd.addr, align 4, !dbg !2236
  %conv = sext i32 %19 to i64, !dbg !2237
  %20 = load ptr, ptr %pathname.addr, align 8, !dbg !2238
  %call25 = call ptr @__concretize_string(ptr noundef %20), !dbg !2239
  %21 = load i32, ptr %flags.addr, align 4, !dbg !2240
  %conv26 = sext i32 %21 to i64, !dbg !2241
  %22 = load i32, ptr %mode.addr, align 4, !dbg !2242
  %call27 = call i64 (i64, ...) @syscall(i64 noundef 257, i64 noundef %conv, ptr noundef %call25, i64 noundef %conv26, i32 noundef %22) #16, !dbg !2243
  %conv28 = trunc i64 %call27 to i32, !dbg !2243
  store i32 %conv28, ptr %os_fd, align 4, !dbg !2235
  %23 = load i32, ptr %os_fd, align 4, !dbg !2244
  %cmp29 = icmp eq i32 %23, -1, !dbg !2246
  br i1 %cmp29, label %if.then31, label %if.end32, !dbg !2247

if.then31:                                        ; preds = %if.end22
  store i32 -1, ptr %retval, align 4, !dbg !2248
  br label %return, !dbg !2248

if.end32:                                         ; preds = %if.end22
  %24 = load i32, ptr %os_fd, align 4, !dbg !2249
  %25 = load ptr, ptr %f, align 8, !dbg !2250
  %fd33 = getelementptr inbounds %struct.exe_file_t.6, ptr %25, i32 0, i32 0, !dbg !2251
  store i32 %24, ptr %fd33, align 8, !dbg !2252
  %26 = load ptr, ptr %f, align 8, !dbg !2253
  %flags34 = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 1, !dbg !2254
  store i32 1, ptr %flags34, align 4, !dbg !2255
  %27 = load i32, ptr %flags.addr, align 4, !dbg !2256
  %and35 = and i32 %27, 3, !dbg !2258
  %cmp36 = icmp eq i32 %and35, 0, !dbg !2259
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2260

if.then38:                                        ; preds = %if.end32
  %28 = load ptr, ptr %f, align 8, !dbg !2261
  %flags39 = getelementptr inbounds %struct.exe_file_t.6, ptr %28, i32 0, i32 1, !dbg !2263
  %29 = load i32, ptr %flags39, align 4, !dbg !2264
  %or = or i32 %29, 4, !dbg !2264
  store i32 %or, ptr %flags39, align 4, !dbg !2264
  br label %if.end51, !dbg !2265

if.else40:                                        ; preds = %if.end32
  %30 = load i32, ptr %flags.addr, align 4, !dbg !2266
  %and41 = and i32 %30, 3, !dbg !2268
  %cmp42 = icmp eq i32 %and41, 1, !dbg !2269
  br i1 %cmp42, label %if.then44, label %if.else47, !dbg !2270

if.then44:                                        ; preds = %if.else40
  %31 = load ptr, ptr %f, align 8, !dbg !2271
  %flags45 = getelementptr inbounds %struct.exe_file_t.6, ptr %31, i32 0, i32 1, !dbg !2273
  %32 = load i32, ptr %flags45, align 4, !dbg !2274
  %or46 = or i32 %32, 8, !dbg !2274
  store i32 %or46, ptr %flags45, align 4, !dbg !2274
  br label %if.end51, !dbg !2275

if.else47:                                        ; preds = %if.else40
  %33 = load ptr, ptr %f, align 8, !dbg !2276
  %flags48 = getelementptr inbounds %struct.exe_file_t.6, ptr %33, i32 0, i32 1, !dbg !2278
  %34 = load i32, ptr %flags48, align 4, !dbg !2279
  %or49 = or i32 %34, 12, !dbg !2279
  store i32 %or49, ptr %flags48, align 4, !dbg !2279
  br label %if.end51

if.end51:                                         ; preds = %if.then44, %if.else47, %if.then38
  %35 = load i32, ptr %fd, align 4, !dbg !2280
  store i32 %35, ptr %retval, align 4, !dbg !2281
  br label %return, !dbg !2281

return:                                           ; preds = %if.end51, %if.then31, %if.then20, %if.then11, %if.then4, %if.then1
  %36 = load i32, ptr %retval, align 4, !dbg !2282
  ret i32 %36, !dbg !2282
}

; Function Attrs: noinline nounwind uwtable
define internal ptr @__get_file(i32 noundef %fd) #0 !dbg !2283 {
entry:
  %retval = alloca ptr, align 8
  %fd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2286, metadata !DIExpression()), !dbg !2287
  %0 = load i32, ptr %fd.addr, align 4, !dbg !2288
  %cmp = icmp sge i32 %0, 0, !dbg !2290
  %1 = load i32, ptr %fd.addr, align 4
  %cmp1 = icmp slt i32 %1, 32
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2291
  br i1 %or.cond, label %if.then, label %if.end3, !dbg !2291

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2292, metadata !DIExpression()), !dbg !2294
  %2 = load i32, ptr %fd.addr, align 4, !dbg !2295
  %idxprom = sext i32 %2 to i64, !dbg !2296
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !2296
  store ptr %arrayidx, ptr %f, align 8, !dbg !2294
  %3 = load ptr, ptr %f, align 8, !dbg !2297
  %flags = getelementptr inbounds %struct.exe_file_t.6, ptr %3, i32 0, i32 1, !dbg !2299
  %4 = load i32, ptr %flags, align 4, !dbg !2299
  %and = and i32 %4, 1, !dbg !2300
  %tobool = icmp ne i32 %and, 0, !dbg !2300
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !2301

if.then2:                                         ; preds = %if.then
  %5 = load ptr, ptr %f, align 8, !dbg !2302
  store ptr %5, ptr %retval, align 8, !dbg !2303
  br label %return, !dbg !2303

if.end3:                                          ; preds = %if.then, %entry
  store ptr null, ptr %retval, align 8, !dbg !2304
  br label %return, !dbg !2304

return:                                           ; preds = %if.end3, %if.then2
  %6 = load ptr, ptr %retval, align 8, !dbg !2305
  ret ptr %6, !dbg !2305
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @utimes(ptr noundef nonnull %path, ptr noundef %times) #0 !dbg !2306 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %times.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  %newTimes = alloca [2 x %struct.timespec.8], align 16
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2317, metadata !DIExpression()), !dbg !2318
  store ptr %times, ptr %times.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %times.addr, metadata !2319, metadata !DIExpression()), !dbg !2320
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !2321, metadata !DIExpression()), !dbg !2322
  %0 = load ptr, ptr %path.addr, align 8, !dbg !2323
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !2324
  store ptr %call, ptr %dfile, align 8, !dbg !2322
  %1 = load ptr, ptr %dfile, align 8, !dbg !2325
  %tobool = icmp ne ptr %1, null, !dbg !2325
  br i1 %tobool, label %if.then, label %if.end12, !dbg !2327

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %times.addr, align 8, !dbg !2328
  %tobool1 = icmp ne ptr %2, null, !dbg !2328
  br i1 %tobool1, label %if.end, label %if.then2, !dbg !2331

if.then2:                                         ; preds = %if.then
  call void @llvm.dbg.declare(metadata ptr %newTimes, metadata !2332, metadata !DIExpression()), !dbg !2335
  %arrayidx = getelementptr inbounds [2 x %struct.timespec.8], ptr %newTimes, i64 0, i64 0, !dbg !2336
  %call3 = call i32 @gettimeofday(ptr noundef %arrayidx, ptr noundef null) #16, !dbg !2337
  %arrayidx4 = getelementptr inbounds [2 x %struct.timespec.8], ptr %newTimes, i64 0, i64 1, !dbg !2338
  %arrayidx5 = getelementptr inbounds [2 x %struct.timespec.8], ptr %newTimes, i64 0, i64 0, !dbg !2339
  %3 = call ptr @memcpy(ptr %arrayidx4, ptr %arrayidx5, i64 16), !dbg !2339
  %arraydecay = getelementptr inbounds [2 x %struct.timespec.8], ptr %newTimes, i64 0, i64 0, !dbg !2340
  store ptr %arraydecay, ptr %times.addr, align 8, !dbg !2341
  br label %if.end, !dbg !2342

if.end:                                           ; preds = %if.then2, %if.then
  %4 = load ptr, ptr %times.addr, align 8, !dbg !2343
  %arrayidx6 = getelementptr inbounds %struct.timespec.8, ptr %4, i64 0, !dbg !2343
  %tv_sec = getelementptr inbounds %struct.timespec.8, ptr %arrayidx6, i32 0, i32 0, !dbg !2344
  %5 = load i64, ptr %tv_sec, align 8, !dbg !2344
  %6 = load ptr, ptr %dfile, align 8, !dbg !2345
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %6, i32 0, i32 2, !dbg !2346
  %7 = load ptr, ptr %stat, align 8, !dbg !2346
  %st_atim = getelementptr inbounds %struct.stat64.9, ptr %7, i32 0, i32 11, !dbg !2347
  %tv_sec7 = getelementptr inbounds %struct.timespec.8, ptr %st_atim, i32 0, i32 0, !dbg !2347
  store i64 %5, ptr %tv_sec7, align 8, !dbg !2348
  %8 = load ptr, ptr %times.addr, align 8, !dbg !2349
  %arrayidx8 = getelementptr inbounds %struct.timespec.8, ptr %8, i64 1, !dbg !2349
  %tv_sec9 = getelementptr inbounds %struct.timespec.8, ptr %arrayidx8, i32 0, i32 0, !dbg !2350
  %9 = load i64, ptr %tv_sec9, align 8, !dbg !2350
  %10 = load ptr, ptr %dfile, align 8, !dbg !2351
  %stat10 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %10, i32 0, i32 2, !dbg !2352
  %11 = load ptr, ptr %stat10, align 8, !dbg !2352
  %st_mtim = getelementptr inbounds %struct.stat64.9, ptr %11, i32 0, i32 12, !dbg !2353
  %tv_sec11 = getelementptr inbounds %struct.timespec.8, ptr %st_mtim, i32 0, i32 0, !dbg !2353
  store i64 %9, ptr %tv_sec11, align 8, !dbg !2354
  store i32 0, ptr %retval, align 4, !dbg !2355
  br label %return, !dbg !2355

if.end12:                                         ; preds = %entry
  %12 = load ptr, ptr %path.addr, align 8, !dbg !2356
  %call13 = call ptr @__concretize_string(ptr noundef %12), !dbg !2357
  %13 = load ptr, ptr %times.addr, align 8, !dbg !2358
  %call14 = call i64 (i64, ...) @syscall(i64 noundef 235, ptr noundef %call13, ptr noundef %13) #16, !dbg !2359
  %conv = trunc i64 %call14 to i32, !dbg !2359
  store i32 %conv, ptr %retval, align 4, !dbg !2360
  br label %return, !dbg !2360

return:                                           ; preds = %if.end12, %if.end
  %14 = load i32, ptr %retval, align 4, !dbg !2361
  ret i32 %14, !dbg !2361
}

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #9

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @futimesat(i32 noundef %fd, ptr noundef %path, ptr noundef %times) #0 !dbg !2362 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %times.addr = alloca ptr, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2365, metadata !DIExpression()), !dbg !2366
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2367, metadata !DIExpression()), !dbg !2368
  store ptr %times, ptr %times.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %times.addr, metadata !2369, metadata !DIExpression()), !dbg !2370
  %0 = load i32, ptr %fd.addr, align 4, !dbg !2371
  %cmp = icmp ne i32 %0, -100, !dbg !2373
  br i1 %cmp, label %if.then, label %if.end8, !dbg !2374

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2375, metadata !DIExpression()), !dbg !2377
  %1 = load i32, ptr %fd.addr, align 4, !dbg !2378
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2379
  store ptr %call, ptr %f, align 8, !dbg !2377
  %2 = load ptr, ptr %f, align 8, !dbg !2380
  %tobool = icmp ne ptr %2, null, !dbg !2380
  br i1 %tobool, label %if.else, label %if.then1, !dbg !2382

if.then1:                                         ; preds = %if.then
  %call2 = call ptr @__errno_location() #17, !dbg !2383
  store i32 9, ptr %call2, align 4, !dbg !2385
  store i32 -1, ptr %retval, align 4, !dbg !2386
  br label %return, !dbg !2386

if.else:                                          ; preds = %if.then
  %3 = load ptr, ptr %f, align 8, !dbg !2387
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %3, i32 0, i32 3, !dbg !2389
  %4 = load ptr, ptr %dfile, align 8, !dbg !2389
  %tobool3 = icmp ne ptr %4, null, !dbg !2387
  br i1 %tobool3, label %if.then4, label %if.end6, !dbg !2390

if.then4:                                         ; preds = %if.else
  call void @klee_warning(ptr noundef @.str.2.55), !dbg !2391
  %call5 = call ptr @__errno_location() #17, !dbg !2393
  store i32 2, ptr %call5, align 4, !dbg !2394
  store i32 -1, ptr %retval, align 4, !dbg !2395
  br label %return, !dbg !2395

if.end6:                                          ; preds = %if.else
  %5 = load ptr, ptr %f, align 8, !dbg !2396
  %fd7 = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 0, !dbg !2397
  %6 = load i32, ptr %fd7, align 8, !dbg !2397
  store i32 %6, ptr %fd.addr, align 4, !dbg !2398
  br label %if.end8, !dbg !2399

if.end8:                                          ; preds = %if.end6, %entry
  %7 = load ptr, ptr %path.addr, align 8, !dbg !2400
  %call9 = call ptr @__get_sym_file(ptr noundef %7), !dbg !2402
  %tobool10 = icmp ne ptr %call9, null, !dbg !2402
  br i1 %tobool10, label %if.then11, label %if.end13, !dbg !2403

if.then11:                                        ; preds = %if.end8
  %8 = load ptr, ptr %path.addr, align 8, !dbg !2404
  %9 = load ptr, ptr %times.addr, align 8, !dbg !2406
  %call12 = call i32 @utimes(ptr noundef %8, ptr noundef %9) #16, !dbg !2407
  store i32 %call12, ptr %retval, align 4, !dbg !2408
  br label %return, !dbg !2408

if.end13:                                         ; preds = %if.end8
  %10 = load i32, ptr %fd.addr, align 4, !dbg !2409
  %conv = sext i32 %10 to i64, !dbg !2410
  %11 = load ptr, ptr %path.addr, align 8, !dbg !2411
  %tobool14 = icmp ne ptr %11, null, !dbg !2411
  br i1 %tobool14, label %cond.true, label %cond.end, !dbg !2411

cond.true:                                        ; preds = %if.end13
  %12 = load ptr, ptr %path.addr, align 8, !dbg !2412
  %call15 = call ptr @__concretize_string(ptr noundef %12), !dbg !2413
  br label %cond.end, !dbg !2411

cond.end:                                         ; preds = %if.end13, %cond.true
  %cond = phi ptr [ %call15, %cond.true ], [ null, %if.end13 ], !dbg !2411
  %13 = load ptr, ptr %times.addr, align 8, !dbg !2414
  %call16 = call i64 (i64, ...) @syscall(i64 noundef 261, i64 noundef %conv, ptr noundef %cond, ptr noundef %13) #16, !dbg !2415
  %conv17 = trunc i64 %call16 to i32, !dbg !2415
  store i32 %conv17, ptr %retval, align 4, !dbg !2416
  br label %return, !dbg !2416

return:                                           ; preds = %cond.end, %if.then11, %if.then4, %if.then1
  %14 = load i32, ptr %retval, align 4, !dbg !2417
  ret i32 %14, !dbg !2417
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @close(i32 noundef %fd) #0 !dbg !307 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %r = alloca i32, align 4
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2418, metadata !DIExpression()), !dbg !2419
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2420, metadata !DIExpression()), !dbg !2421
  call void @llvm.dbg.declare(metadata ptr %r, metadata !2422, metadata !DIExpression()), !dbg !2423
  store i32 0, ptr %r, align 4, !dbg !2423
  %0 = load i32, ptr @close.n_calls, align 4, !dbg !2424
  %inc = add nsw i32 %0, 1, !dbg !2424
  store i32 %inc, ptr @close.n_calls, align 4, !dbg !2424
  %1 = load i32, ptr %fd.addr, align 4, !dbg !2425
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2426
  store ptr %call, ptr %f, align 8, !dbg !2427
  %2 = load ptr, ptr %f, align 8, !dbg !2428
  %tobool = icmp ne ptr %2, null, !dbg !2428
  br i1 %tobool, label %if.end, label %if.then, !dbg !2430

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !2431
  store i32 9, ptr %call1, align 4, !dbg !2433
  store i32 -1, ptr %retval, align 4, !dbg !2434
  br label %return, !dbg !2434

if.end:                                           ; preds = %entry
  %3 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2435
  %tobool2 = icmp ne i32 %3, 0, !dbg !2437
  br i1 %tobool2, label %land.lhs.true, label %if.end5, !dbg !2438

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 8), align 8, !dbg !2439
  %5 = load i32, ptr %4, align 4, !dbg !2440
  %6 = load i32, ptr @close.n_calls, align 4, !dbg !2441
  %cmp = icmp eq i32 %5, %6, !dbg !2442
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !2443

if.then3:                                         ; preds = %land.lhs.true
  %7 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2444
  %dec = add i32 %7, -1, !dbg !2444
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2444
  %call4 = call ptr @__errno_location() #17, !dbg !2446
  store i32 5, ptr %call4, align 4, !dbg !2447
  store i32 -1, ptr %retval, align 4, !dbg !2448
  br label %return, !dbg !2448

if.end5:                                          ; preds = %land.lhs.true, %if.end
  %8 = load ptr, ptr %f, align 8, !dbg !2449
  %9 = call ptr @memset(ptr %8, i32 0, i64 24), !dbg !2450
  %10 = load i32, ptr %r, align 4, !dbg !2451
  store i32 %10, ptr %retval, align 4, !dbg !2452
  br label %return, !dbg !2452

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %11 = load i32, ptr %retval, align 4, !dbg !2453
  ret i32 %11, !dbg !2453
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @read(i32 noundef %fd, ptr noundef %buf, i64 noundef %count) #0 !dbg !374 {
entry:
  %retval = alloca i64, align 8
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %count.addr = alloca i64, align 8
  %f = alloca ptr, align 8
  %r = alloca i32, align 4
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2454, metadata !DIExpression()), !dbg !2455
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2456, metadata !DIExpression()), !dbg !2457
  store i64 %count, ptr %count.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !2458, metadata !DIExpression()), !dbg !2459
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2460, metadata !DIExpression()), !dbg !2461
  %0 = load i32, ptr @read.n_calls, align 4, !dbg !2462
  %inc = add nsw i32 %0, 1, !dbg !2462
  store i32 %inc, ptr @read.n_calls, align 4, !dbg !2462
  %1 = load i64, ptr %count.addr, align 8, !dbg !2463
  %cmp = icmp eq i64 %1, 0, !dbg !2465
  br i1 %cmp, label %if.then, label %if.end, !dbg !2466

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8, !dbg !2467
  br label %return, !dbg !2467

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %buf.addr, align 8, !dbg !2468
  %cmp1 = icmp eq ptr %2, null, !dbg !2470
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !2471

if.then2:                                         ; preds = %if.end
  %call = call ptr @__errno_location() #17, !dbg !2472
  store i32 14, ptr %call, align 4, !dbg !2474
  store i64 -1, ptr %retval, align 8, !dbg !2475
  br label %return, !dbg !2475

if.end3:                                          ; preds = %if.end
  %3 = load i32, ptr %fd.addr, align 4, !dbg !2476
  %call4 = call ptr @__get_file(i32 noundef %3), !dbg !2477
  store ptr %call4, ptr %f, align 8, !dbg !2478
  %4 = load ptr, ptr %f, align 8, !dbg !2479
  %tobool = icmp ne ptr %4, null, !dbg !2479
  br i1 %tobool, label %if.end7, label %if.then5, !dbg !2481

if.then5:                                         ; preds = %if.end3
  %call6 = call ptr @__errno_location() #17, !dbg !2482
  store i32 9, ptr %call6, align 4, !dbg !2484
  store i64 -1, ptr %retval, align 8, !dbg !2485
  br label %return, !dbg !2485

if.end7:                                          ; preds = %if.end3
  %5 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2486
  %tobool8 = icmp ne i32 %5, 0, !dbg !2488
  br i1 %tobool8, label %land.lhs.true, label %if.end12, !dbg !2489

land.lhs.true:                                    ; preds = %if.end7
  %6 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 6), align 8, !dbg !2490
  %7 = load i32, ptr %6, align 4, !dbg !2491
  %8 = load i32, ptr @read.n_calls, align 4, !dbg !2492
  %cmp9 = icmp eq i32 %7, %8, !dbg !2493
  br i1 %cmp9, label %if.then10, label %if.end12, !dbg !2494

if.then10:                                        ; preds = %land.lhs.true
  %9 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2495
  %dec = add i32 %9, -1, !dbg !2495
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2495
  %call11 = call ptr @__errno_location() #17, !dbg !2497
  store i32 5, ptr %call11, align 4, !dbg !2498
  store i64 -1, ptr %retval, align 8, !dbg !2499
  br label %return, !dbg !2499

if.end12:                                         ; preds = %land.lhs.true, %if.end7
  %10 = load ptr, ptr %f, align 8, !dbg !2500
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %10, i32 0, i32 3, !dbg !2502
  %11 = load ptr, ptr %dfile, align 8, !dbg !2502
  %tobool13 = icmp ne ptr %11, null, !dbg !2500
  br i1 %tobool13, label %if.else38, label %if.then14, !dbg !2503

if.then14:                                        ; preds = %if.end12
  call void @llvm.dbg.declare(metadata ptr %r, metadata !2504, metadata !DIExpression()), !dbg !2506
  %12 = load ptr, ptr %buf.addr, align 8, !dbg !2507
  %call15 = call ptr @__concretize_ptr(ptr noundef %12), !dbg !2508
  store ptr %call15, ptr %buf.addr, align 8, !dbg !2509
  %13 = load i64, ptr %count.addr, align 8, !dbg !2510
  %call16 = call i64 @__concretize_size(i64 noundef %13), !dbg !2511
  store i64 %call16, ptr %count.addr, align 8, !dbg !2512
  %14 = load ptr, ptr %buf.addr, align 8, !dbg !2513
  %15 = load i64, ptr %count.addr, align 8, !dbg !2514
  call void @klee_check_memory_access(ptr noundef %14, i64 noundef %15), !dbg !2515
  %16 = load ptr, ptr %f, align 8, !dbg !2516
  %fd17 = getelementptr inbounds %struct.exe_file_t.6, ptr %16, i32 0, i32 0, !dbg !2518
  %17 = load i32, ptr %fd17, align 8, !dbg !2518
  %cmp18 = icmp eq i32 %17, 0, !dbg !2519
  br i1 %cmp18, label %if.then19, label %if.else, !dbg !2520

if.then19:                                        ; preds = %if.then14
  %18 = load ptr, ptr %f, align 8, !dbg !2521
  %fd20 = getelementptr inbounds %struct.exe_file_t.6, ptr %18, i32 0, i32 0, !dbg !2522
  %19 = load i32, ptr %fd20, align 8, !dbg !2522
  %20 = load ptr, ptr %buf.addr, align 8, !dbg !2523
  %21 = load i64, ptr %count.addr, align 8, !dbg !2524
  %call21 = call i64 (i64, ...) @syscall(i64 noundef 0, i32 noundef %19, ptr noundef %20, i64 noundef %21) #16, !dbg !2525
  %conv = trunc i64 %call21 to i32, !dbg !2525
  store i32 %conv, ptr %r, align 4, !dbg !2526
  br label %if.end25, !dbg !2527

if.else:                                          ; preds = %if.then14
  %22 = load ptr, ptr %f, align 8, !dbg !2528
  %fd22 = getelementptr inbounds %struct.exe_file_t.6, ptr %22, i32 0, i32 0, !dbg !2529
  %23 = load i32, ptr %fd22, align 8, !dbg !2529
  %24 = load ptr, ptr %buf.addr, align 8, !dbg !2530
  %25 = load i64, ptr %count.addr, align 8, !dbg !2531
  %26 = load ptr, ptr %f, align 8, !dbg !2532
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 2, !dbg !2533
  %27 = load i64, ptr %off, align 8, !dbg !2533
  %call23 = call i64 (i64, ...) @syscall(i64 noundef 17, i32 noundef %23, ptr noundef %24, i64 noundef %25, i64 noundef %27) #16, !dbg !2534
  %conv24 = trunc i64 %call23 to i32, !dbg !2534
  store i32 %conv24, ptr %r, align 4, !dbg !2535
  br label %if.end25

if.end25:                                         ; preds = %if.else, %if.then19
  %28 = load i32, ptr %r, align 4, !dbg !2536
  %cmp26 = icmp eq i32 %28, -1, !dbg !2538
  br i1 %cmp26, label %if.then28, label %if.end29, !dbg !2539

if.then28:                                        ; preds = %if.end25
  store i64 -1, ptr %retval, align 8, !dbg !2540
  br label %return, !dbg !2540

if.end29:                                         ; preds = %if.end25
  %29 = load ptr, ptr %f, align 8, !dbg !2541
  %fd30 = getelementptr inbounds %struct.exe_file_t.6, ptr %29, i32 0, i32 0, !dbg !2543
  %30 = load i32, ptr %fd30, align 8, !dbg !2543
  %cmp31 = icmp ne i32 %30, 0, !dbg !2544
  br i1 %cmp31, label %if.then33, label %if.end36, !dbg !2545

if.then33:                                        ; preds = %if.end29
  %31 = load i32, ptr %r, align 4, !dbg !2546
  %conv34 = sext i32 %31 to i64, !dbg !2546
  %32 = load ptr, ptr %f, align 8, !dbg !2547
  %off35 = getelementptr inbounds %struct.exe_file_t.6, ptr %32, i32 0, i32 2, !dbg !2548
  %33 = load i64, ptr %off35, align 8, !dbg !2549
  %add = add nsw i64 %33, %conv34, !dbg !2549
  store i64 %add, ptr %off35, align 8, !dbg !2549
  br label %if.end36, !dbg !2547

if.end36:                                         ; preds = %if.then33, %if.end29
  %34 = load i32, ptr %r, align 4, !dbg !2550
  %conv37 = sext i32 %34 to i64, !dbg !2550
  store i64 %conv37, ptr %retval, align 8, !dbg !2551
  br label %return, !dbg !2551

if.else38:                                        ; preds = %if.end12
  %35 = load ptr, ptr %f, align 8, !dbg !2552
  %off39 = getelementptr inbounds %struct.exe_file_t.6, ptr %35, i32 0, i32 2, !dbg !2552
  %36 = load i64, ptr %off39, align 8, !dbg !2552
  %cmp40 = icmp sge i64 %36, 0, !dbg !2552
  br i1 %cmp40, label %if.end44, label %if.else43, !dbg !2556

if.else43:                                        ; preds = %if.else38
  call void @__assert_fail(ptr noundef @.str.3.58, ptr noundef @.str.4.59, i32 noundef 379, ptr noundef @__PRETTY_FUNCTION__.read) #14, !dbg !2552
  unreachable, !dbg !2552

if.end44:                                         ; preds = %if.else38
  %37 = load ptr, ptr %f, align 8, !dbg !2557
  %dfile45 = getelementptr inbounds %struct.exe_file_t.6, ptr %37, i32 0, i32 3, !dbg !2559
  %38 = load ptr, ptr %dfile45, align 8, !dbg !2559
  %size = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %38, i32 0, i32 0, !dbg !2560
  %39 = load i32, ptr %size, align 8, !dbg !2560
  %conv46 = zext i32 %39 to i64, !dbg !2561
  %40 = load ptr, ptr %f, align 8, !dbg !2562
  %off47 = getelementptr inbounds %struct.exe_file_t.6, ptr %40, i32 0, i32 2, !dbg !2563
  %41 = load i64, ptr %off47, align 8, !dbg !2563
  %cmp48 = icmp slt i64 %conv46, %41, !dbg !2564
  br i1 %cmp48, label %if.then50, label %if.end51, !dbg !2565

if.then50:                                        ; preds = %if.end44
  store i64 0, ptr %retval, align 8, !dbg !2566
  br label %return, !dbg !2566

if.end51:                                         ; preds = %if.end44
  %42 = load ptr, ptr %f, align 8, !dbg !2567
  %off52 = getelementptr inbounds %struct.exe_file_t.6, ptr %42, i32 0, i32 2, !dbg !2569
  %43 = load i64, ptr %off52, align 8, !dbg !2569
  %44 = load i64, ptr %count.addr, align 8, !dbg !2570
  %add53 = add i64 %43, %44, !dbg !2571
  %45 = load ptr, ptr %f, align 8, !dbg !2572
  %dfile54 = getelementptr inbounds %struct.exe_file_t.6, ptr %45, i32 0, i32 3, !dbg !2573
  %46 = load ptr, ptr %dfile54, align 8, !dbg !2573
  %size55 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %46, i32 0, i32 0, !dbg !2574
  %47 = load i32, ptr %size55, align 8, !dbg !2574
  %conv56 = zext i32 %47 to i64, !dbg !2572
  %cmp57 = icmp ugt i64 %add53, %conv56, !dbg !2575
  br i1 %cmp57, label %if.then59, label %if.end64, !dbg !2576

if.then59:                                        ; preds = %if.end51
  %48 = load ptr, ptr %f, align 8, !dbg !2577
  %dfile60 = getelementptr inbounds %struct.exe_file_t.6, ptr %48, i32 0, i32 3, !dbg !2579
  %49 = load ptr, ptr %dfile60, align 8, !dbg !2579
  %size61 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %49, i32 0, i32 0, !dbg !2580
  %50 = load i32, ptr %size61, align 8, !dbg !2580
  %conv62 = zext i32 %50 to i64, !dbg !2577
  %51 = load ptr, ptr %f, align 8, !dbg !2581
  %off63 = getelementptr inbounds %struct.exe_file_t.6, ptr %51, i32 0, i32 2, !dbg !2582
  %52 = load i64, ptr %off63, align 8, !dbg !2582
  %sub = sub nsw i64 %conv62, %52, !dbg !2583
  store i64 %sub, ptr %count.addr, align 8, !dbg !2584
  br label %if.end64, !dbg !2585

if.end64:                                         ; preds = %if.then59, %if.end51
  %53 = load ptr, ptr %buf.addr, align 8, !dbg !2586
  %54 = load ptr, ptr %f, align 8, !dbg !2587
  %dfile65 = getelementptr inbounds %struct.exe_file_t.6, ptr %54, i32 0, i32 3, !dbg !2588
  %55 = load ptr, ptr %dfile65, align 8, !dbg !2588
  %contents = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %55, i32 0, i32 1, !dbg !2589
  %56 = load ptr, ptr %contents, align 8, !dbg !2589
  %57 = load ptr, ptr %f, align 8, !dbg !2590
  %off66 = getelementptr inbounds %struct.exe_file_t.6, ptr %57, i32 0, i32 2, !dbg !2591
  %58 = load i64, ptr %off66, align 8, !dbg !2591
  %add.ptr = getelementptr inbounds i8, ptr %56, i64 %58, !dbg !2592
  %59 = load i64, ptr %count.addr, align 8, !dbg !2593
  %60 = call ptr @memcpy(ptr %53, ptr %add.ptr, i64 %59), !dbg !2594
  %61 = load i64, ptr %count.addr, align 8, !dbg !2595
  %62 = load ptr, ptr %f, align 8, !dbg !2596
  %off67 = getelementptr inbounds %struct.exe_file_t.6, ptr %62, i32 0, i32 2, !dbg !2597
  %63 = load i64, ptr %off67, align 8, !dbg !2598
  %add68 = add i64 %63, %61, !dbg !2598
  store i64 %add68, ptr %off67, align 8, !dbg !2598
  %64 = load i64, ptr %count.addr, align 8, !dbg !2599
  store i64 %64, ptr %retval, align 8, !dbg !2600
  br label %return, !dbg !2600

return:                                           ; preds = %if.end64, %if.then50, %if.end36, %if.then28, %if.then10, %if.then5, %if.then2, %if.then
  %65 = load i64, ptr %retval, align 8, !dbg !2601
  ret i64 %65, !dbg !2601
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @write(i32 noundef %fd, ptr noundef %buf, i64 noundef %count) #0 !dbg !396 {
entry:
  %retval = alloca i64, align 8
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %count.addr = alloca i64, align 8
  %f = alloca ptr, align 8
  %r = alloca i32, align 4
  %actual_count = alloca i64, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2602, metadata !DIExpression()), !dbg !2603
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2604, metadata !DIExpression()), !dbg !2605
  store i64 %count, ptr %count.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !2606, metadata !DIExpression()), !dbg !2607
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2608, metadata !DIExpression()), !dbg !2609
  %0 = load i32, ptr @write.n_calls, align 4, !dbg !2610
  %inc = add nsw i32 %0, 1, !dbg !2610
  store i32 %inc, ptr @write.n_calls, align 4, !dbg !2610
  %1 = load i32, ptr %fd.addr, align 4, !dbg !2611
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2612
  store ptr %call, ptr %f, align 8, !dbg !2613
  %2 = load ptr, ptr %f, align 8, !dbg !2614
  %tobool = icmp ne ptr %2, null, !dbg !2614
  br i1 %tobool, label %if.end, label %if.then, !dbg !2616

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !2617
  store i32 9, ptr %call1, align 4, !dbg !2619
  store i64 -1, ptr %retval, align 8, !dbg !2620
  br label %return, !dbg !2620

if.end:                                           ; preds = %entry
  %3 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2621
  %tobool2 = icmp ne i32 %3, 0, !dbg !2623
  br i1 %tobool2, label %land.lhs.true, label %if.end5, !dbg !2624

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 7), align 8, !dbg !2625
  %5 = load i32, ptr %4, align 4, !dbg !2626
  %6 = load i32, ptr @write.n_calls, align 4, !dbg !2627
  %cmp = icmp eq i32 %5, %6, !dbg !2628
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !2629

if.then3:                                         ; preds = %land.lhs.true
  %7 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2630
  %dec = add i32 %7, -1, !dbg !2630
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !2630
  %call4 = call ptr @__errno_location() #17, !dbg !2632
  store i32 5, ptr %call4, align 4, !dbg !2633
  store i64 -1, ptr %retval, align 8, !dbg !2634
  br label %return, !dbg !2634

if.end5:                                          ; preds = %land.lhs.true, %if.end
  %8 = load ptr, ptr %f, align 8, !dbg !2635
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !2637
  %9 = load ptr, ptr %dfile, align 8, !dbg !2637
  %tobool6 = icmp ne ptr %9, null, !dbg !2635
  br i1 %tobool6, label %if.else42, label %if.then7, !dbg !2638

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata ptr %r, metadata !2639, metadata !DIExpression()), !dbg !2641
  %10 = load ptr, ptr %buf.addr, align 8, !dbg !2642
  %call8 = call ptr @__concretize_ptr(ptr noundef %10), !dbg !2643
  store ptr %call8, ptr %buf.addr, align 8, !dbg !2644
  %11 = load i64, ptr %count.addr, align 8, !dbg !2645
  %call9 = call i64 @__concretize_size(i64 noundef %11), !dbg !2646
  store i64 %call9, ptr %count.addr, align 8, !dbg !2647
  %12 = load ptr, ptr %buf.addr, align 8, !dbg !2648
  %13 = load i64, ptr %count.addr, align 8, !dbg !2649
  call void @klee_check_memory_access(ptr noundef %12, i64 noundef %13), !dbg !2650
  %14 = load ptr, ptr %f, align 8, !dbg !2651
  %fd10 = getelementptr inbounds %struct.exe_file_t.6, ptr %14, i32 0, i32 0, !dbg !2653
  %15 = load i32, ptr %fd10, align 8, !dbg !2653
  %cmp11 = icmp eq i32 %15, 1, !dbg !2654
  br i1 %cmp11, label %if.then14, label %lor.lhs.false, !dbg !2655

lor.lhs.false:                                    ; preds = %if.then7
  %16 = load ptr, ptr %f, align 8, !dbg !2656
  %fd12 = getelementptr inbounds %struct.exe_file_t.6, ptr %16, i32 0, i32 0, !dbg !2657
  %17 = load i32, ptr %fd12, align 8, !dbg !2657
  %cmp13 = icmp eq i32 %17, 2, !dbg !2658
  br i1 %cmp13, label %if.then14, label %if.else, !dbg !2659

if.then14:                                        ; preds = %lor.lhs.false, %if.then7
  %18 = load ptr, ptr %f, align 8, !dbg !2660
  %fd15 = getelementptr inbounds %struct.exe_file_t.6, ptr %18, i32 0, i32 0, !dbg !2661
  %19 = load i32, ptr %fd15, align 8, !dbg !2661
  %20 = load ptr, ptr %buf.addr, align 8, !dbg !2662
  %21 = load i64, ptr %count.addr, align 8, !dbg !2663
  %call16 = call i64 (i64, ...) @syscall(i64 noundef 1, i32 noundef %19, ptr noundef %20, i64 noundef %21) #16, !dbg !2664
  %conv = trunc i64 %call16 to i32, !dbg !2664
  store i32 %conv, ptr %r, align 4, !dbg !2665
  br label %if.end20, !dbg !2666

if.else:                                          ; preds = %lor.lhs.false
  %22 = load ptr, ptr %f, align 8, !dbg !2667
  %fd17 = getelementptr inbounds %struct.exe_file_t.6, ptr %22, i32 0, i32 0, !dbg !2668
  %23 = load i32, ptr %fd17, align 8, !dbg !2668
  %24 = load ptr, ptr %buf.addr, align 8, !dbg !2669
  %25 = load i64, ptr %count.addr, align 8, !dbg !2670
  %26 = load ptr, ptr %f, align 8, !dbg !2671
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 2, !dbg !2672
  %27 = load i64, ptr %off, align 8, !dbg !2672
  %call18 = call i64 (i64, ...) @syscall(i64 noundef 18, i32 noundef %23, ptr noundef %24, i64 noundef %25, i64 noundef %27) #16, !dbg !2673
  %conv19 = trunc i64 %call18 to i32, !dbg !2673
  store i32 %conv19, ptr %r, align 4, !dbg !2674
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then14
  %28 = load i32, ptr %r, align 4, !dbg !2675
  %cmp21 = icmp eq i32 %28, -1, !dbg !2677
  br i1 %cmp21, label %if.then23, label %if.end24, !dbg !2678

if.then23:                                        ; preds = %if.end20
  store i64 -1, ptr %retval, align 8, !dbg !2679
  br label %return, !dbg !2679

if.end24:                                         ; preds = %if.end20
  %29 = load i32, ptr %r, align 4, !dbg !2680
  %cmp25 = icmp sge i32 %29, 0, !dbg !2680
  br i1 %cmp25, label %if.end29, label %if.else28, !dbg !2683

if.else28:                                        ; preds = %if.end24
  call void @__assert_fail(ptr noundef @.str.5.60, ptr noundef @.str.4.59, i32 noundef 431, ptr noundef @__PRETTY_FUNCTION__.write) #14, !dbg !2680
  unreachable, !dbg !2680

if.end29:                                         ; preds = %if.end24
  %30 = load ptr, ptr %f, align 8, !dbg !2684
  %fd30 = getelementptr inbounds %struct.exe_file_t.6, ptr %30, i32 0, i32 0, !dbg !2686
  %31 = load i32, ptr %fd30, align 8, !dbg !2686
  %cmp31 = icmp ne i32 %31, 1, !dbg !2687
  br i1 %cmp31, label %land.lhs.true33, label %if.end40, !dbg !2688

land.lhs.true33:                                  ; preds = %if.end29
  %32 = load ptr, ptr %f, align 8, !dbg !2689
  %fd34 = getelementptr inbounds %struct.exe_file_t.6, ptr %32, i32 0, i32 0, !dbg !2690
  %33 = load i32, ptr %fd34, align 8, !dbg !2690
  %cmp35 = icmp ne i32 %33, 2, !dbg !2691
  br i1 %cmp35, label %if.then37, label %if.end40, !dbg !2692

if.then37:                                        ; preds = %land.lhs.true33
  %34 = load i32, ptr %r, align 4, !dbg !2693
  %conv38 = sext i32 %34 to i64, !dbg !2693
  %35 = load ptr, ptr %f, align 8, !dbg !2694
  %off39 = getelementptr inbounds %struct.exe_file_t.6, ptr %35, i32 0, i32 2, !dbg !2695
  %36 = load i64, ptr %off39, align 8, !dbg !2696
  %add = add nsw i64 %36, %conv38, !dbg !2696
  store i64 %add, ptr %off39, align 8, !dbg !2696
  br label %if.end40, !dbg !2694

if.end40:                                         ; preds = %if.then37, %land.lhs.true33, %if.end29
  %37 = load i32, ptr %r, align 4, !dbg !2697
  %conv41 = sext i32 %37 to i64, !dbg !2697
  store i64 %conv41, ptr %retval, align 8, !dbg !2698
  br label %return, !dbg !2698

if.else42:                                        ; preds = %if.end5
  call void @llvm.dbg.declare(metadata ptr %actual_count, metadata !2699, metadata !DIExpression()), !dbg !2701
  store i64 0, ptr %actual_count, align 8, !dbg !2701
  %38 = load ptr, ptr %f, align 8, !dbg !2702
  %off43 = getelementptr inbounds %struct.exe_file_t.6, ptr %38, i32 0, i32 2, !dbg !2704
  %39 = load i64, ptr %off43, align 8, !dbg !2704
  %40 = load i64, ptr %count.addr, align 8, !dbg !2705
  %add44 = add i64 %39, %40, !dbg !2706
  %41 = load ptr, ptr %f, align 8, !dbg !2707
  %dfile45 = getelementptr inbounds %struct.exe_file_t.6, ptr %41, i32 0, i32 3, !dbg !2708
  %42 = load ptr, ptr %dfile45, align 8, !dbg !2708
  %size = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %42, i32 0, i32 0, !dbg !2709
  %43 = load i32, ptr %size, align 8, !dbg !2709
  %conv46 = zext i32 %43 to i64, !dbg !2707
  %cmp47 = icmp ule i64 %add44, %conv46, !dbg !2710
  br i1 %cmp47, label %if.then49, label %if.else50, !dbg !2711

if.then49:                                        ; preds = %if.else42
  %44 = load i64, ptr %count.addr, align 8, !dbg !2712
  store i64 %44, ptr %actual_count, align 8, !dbg !2713
  br label %if.end67, !dbg !2714

if.else50:                                        ; preds = %if.else42
  %45 = load i32, ptr getelementptr inbounds (%struct.exe_sym_env_t.11, ptr @__exe_env, i32 0, i32 2), align 4, !dbg !2715
  %tobool51 = icmp ne i32 %45, 0, !dbg !2718
  br i1 %tobool51, label %if.then52, label %if.else53, !dbg !2719

if.then52:                                        ; preds = %if.else50
  call void @__assert_fail(ptr noundef @.str.6.61, ptr noundef @.str.4.59, i32 noundef 444, ptr noundef @__PRETTY_FUNCTION__.write) #14, !dbg !2720
  unreachable, !dbg !2720

if.else53:                                        ; preds = %if.else50
  %46 = load ptr, ptr %f, align 8, !dbg !2723
  %off54 = getelementptr inbounds %struct.exe_file_t.6, ptr %46, i32 0, i32 2, !dbg !2726
  %47 = load i64, ptr %off54, align 8, !dbg !2726
  %48 = load ptr, ptr %f, align 8, !dbg !2727
  %dfile55 = getelementptr inbounds %struct.exe_file_t.6, ptr %48, i32 0, i32 3, !dbg !2728
  %49 = load ptr, ptr %dfile55, align 8, !dbg !2728
  %size56 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %49, i32 0, i32 0, !dbg !2729
  %50 = load i32, ptr %size56, align 8, !dbg !2729
  %conv57 = zext i32 %50 to i64, !dbg !2730
  %cmp58 = icmp slt i64 %47, %conv57, !dbg !2731
  br i1 %cmp58, label %if.then60, label %if.end67, !dbg !2732

if.then60:                                        ; preds = %if.else53
  %51 = load ptr, ptr %f, align 8, !dbg !2733
  %dfile61 = getelementptr inbounds %struct.exe_file_t.6, ptr %51, i32 0, i32 3, !dbg !2734
  %52 = load ptr, ptr %dfile61, align 8, !dbg !2734
  %size62 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %52, i32 0, i32 0, !dbg !2735
  %53 = load i32, ptr %size62, align 8, !dbg !2735
  %conv63 = zext i32 %53 to i64, !dbg !2733
  %54 = load ptr, ptr %f, align 8, !dbg !2736
  %off64 = getelementptr inbounds %struct.exe_file_t.6, ptr %54, i32 0, i32 2, !dbg !2737
  %55 = load i64, ptr %off64, align 8, !dbg !2737
  %sub = sub nsw i64 %conv63, %55, !dbg !2738
  store i64 %sub, ptr %actual_count, align 8, !dbg !2739
  br label %if.end67, !dbg !2740

if.end67:                                         ; preds = %if.then60, %if.else53, %if.then49
  %56 = load i64, ptr %actual_count, align 8, !dbg !2741
  %tobool68 = icmp ne i64 %56, 0, !dbg !2741
  br i1 %tobool68, label %if.then69, label %if.end72, !dbg !2743

if.then69:                                        ; preds = %if.end67
  %57 = load ptr, ptr %f, align 8, !dbg !2744
  %dfile70 = getelementptr inbounds %struct.exe_file_t.6, ptr %57, i32 0, i32 3, !dbg !2745
  %58 = load ptr, ptr %dfile70, align 8, !dbg !2745
  %contents = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %58, i32 0, i32 1, !dbg !2746
  %59 = load ptr, ptr %contents, align 8, !dbg !2746
  %60 = load ptr, ptr %f, align 8, !dbg !2747
  %off71 = getelementptr inbounds %struct.exe_file_t.6, ptr %60, i32 0, i32 2, !dbg !2748
  %61 = load i64, ptr %off71, align 8, !dbg !2748
  %add.ptr = getelementptr inbounds i8, ptr %59, i64 %61, !dbg !2749
  %62 = load ptr, ptr %buf.addr, align 8, !dbg !2750
  %63 = load i64, ptr %actual_count, align 8, !dbg !2751
  %64 = call ptr @memcpy(ptr %add.ptr, ptr %62, i64 %63), !dbg !2752
  br label %if.end72, !dbg !2752

if.end72:                                         ; preds = %if.then69, %if.end67
  %65 = load i64, ptr %count.addr, align 8, !dbg !2753
  %66 = load i64, ptr %actual_count, align 8, !dbg !2755
  %cmp73 = icmp ne i64 %65, %66, !dbg !2756
  br i1 %cmp73, label %if.then75, label %if.end76, !dbg !2757

if.then75:                                        ; preds = %if.end72
  call void @klee_warning(ptr noundef @.str.7.62), !dbg !2758
  br label %if.end76, !dbg !2758

if.end76:                                         ; preds = %if.then75, %if.end72
  %67 = load ptr, ptr %f, align 8, !dbg !2759
  %dfile77 = getelementptr inbounds %struct.exe_file_t.6, ptr %67, i32 0, i32 3, !dbg !2761
  %68 = load ptr, ptr %dfile77, align 8, !dbg !2761
  %69 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 2), align 8, !dbg !2762
  %cmp78 = icmp eq ptr %68, %69, !dbg !2763
  br i1 %cmp78, label %if.then80, label %if.end84, !dbg !2764

if.then80:                                        ; preds = %if.end76
  %70 = load i64, ptr %actual_count, align 8, !dbg !2765
  %71 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 3), align 8, !dbg !2766
  %conv81 = zext i32 %71 to i64, !dbg !2766
  %add82 = add i64 %conv81, %70, !dbg !2766
  %conv83 = trunc i64 %add82 to i32, !dbg !2766
  store i32 %conv83, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 3), align 8, !dbg !2766
  br label %if.end84, !dbg !2767

if.end84:                                         ; preds = %if.then80, %if.end76
  %72 = load i64, ptr %count.addr, align 8, !dbg !2768
  %73 = load ptr, ptr %f, align 8, !dbg !2769
  %off85 = getelementptr inbounds %struct.exe_file_t.6, ptr %73, i32 0, i32 2, !dbg !2770
  %74 = load i64, ptr %off85, align 8, !dbg !2771
  %add86 = add i64 %74, %72, !dbg !2771
  store i64 %add86, ptr %off85, align 8, !dbg !2771
  %75 = load i64, ptr %count.addr, align 8, !dbg !2772
  store i64 %75, ptr %retval, align 8, !dbg !2773
  br label %return, !dbg !2773

return:                                           ; preds = %if.end84, %if.end40, %if.then23, %if.then3, %if.then
  %76 = load i64, ptr %retval, align 8, !dbg !2774
  ret i64 %76, !dbg !2774
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @__fd_lseek(i32 noundef %fd, i64 noundef %offset, i32 noundef %whence) #0 !dbg !2775 {
entry:
  %retval = alloca i64, align 8
  %fd.addr = alloca i32, align 4
  %offset.addr = alloca i64, align 8
  %whence.addr = alloca i32, align 4
  %new_off = alloca i64, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2778, metadata !DIExpression()), !dbg !2779
  store i64 %offset, ptr %offset.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %offset.addr, metadata !2780, metadata !DIExpression()), !dbg !2781
  store i32 %whence, ptr %whence.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %whence.addr, metadata !2782, metadata !DIExpression()), !dbg !2783
  call void @llvm.dbg.declare(metadata ptr %new_off, metadata !2784, metadata !DIExpression()), !dbg !2785
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2786, metadata !DIExpression()), !dbg !2787
  %0 = load i32, ptr %fd.addr, align 4, !dbg !2788
  %call = call ptr @__get_file(i32 noundef %0), !dbg !2789
  store ptr %call, ptr %f, align 8, !dbg !2787
  %1 = load ptr, ptr %f, align 8, !dbg !2790
  %tobool = icmp ne ptr %1, null, !dbg !2790
  br i1 %tobool, label %if.end, label %if.then, !dbg !2792

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !2793
  store i32 9, ptr %call1, align 4, !dbg !2795
  store i64 -1, ptr %retval, align 8, !dbg !2796
  br label %return, !dbg !2796

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !2797
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !2799
  %3 = load ptr, ptr %dfile, align 8, !dbg !2799
  %tobool2 = icmp ne ptr %3, null, !dbg !2797
  br i1 %tobool2, label %if.end24, label %if.then3, !dbg !2800

if.then3:                                         ; preds = %if.end
  %4 = load i32, ptr %whence.addr, align 4, !dbg !2801
  %cmp = icmp eq i32 %4, 0, !dbg !2804
  br i1 %cmp, label %if.then4, label %if.else, !dbg !2805

if.then4:                                         ; preds = %if.then3
  %5 = load ptr, ptr %f, align 8, !dbg !2806
  %fd5 = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 0, !dbg !2808
  %6 = load i32, ptr %fd5, align 8, !dbg !2808
  %7 = load i64, ptr %offset.addr, align 8, !dbg !2809
  %call6 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %6, i64 noundef %7, i32 noundef 0) #16, !dbg !2810
  store i64 %call6, ptr %new_off, align 8, !dbg !2811
  br label %if.end19, !dbg !2812

if.else:                                          ; preds = %if.then3
  %8 = load ptr, ptr %f, align 8, !dbg !2813
  %fd7 = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 0, !dbg !2815
  %9 = load i32, ptr %fd7, align 8, !dbg !2815
  %10 = load ptr, ptr %f, align 8, !dbg !2816
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %10, i32 0, i32 2, !dbg !2817
  %11 = load i64, ptr %off, align 8, !dbg !2817
  %call8 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %9, i64 noundef %11, i32 noundef 0) #16, !dbg !2818
  store i64 %call8, ptr %new_off, align 8, !dbg !2819
  %12 = load i64, ptr %new_off, align 8, !dbg !2820
  %cmp9 = icmp ne i64 %12, -1, !dbg !2822
  br i1 %cmp9, label %if.then10, label %if.end19, !dbg !2823

if.then10:                                        ; preds = %if.else
  %13 = load i64, ptr %new_off, align 8, !dbg !2824
  %14 = load ptr, ptr %f, align 8, !dbg !2824
  %off11 = getelementptr inbounds %struct.exe_file_t.6, ptr %14, i32 0, i32 2, !dbg !2824
  %15 = load i64, ptr %off11, align 8, !dbg !2824
  %cmp12 = icmp eq i64 %13, %15, !dbg !2824
  br i1 %cmp12, label %if.end15, label %if.else14, !dbg !2828

if.else14:                                        ; preds = %if.then10
  call void @__assert_fail(ptr noundef @.str.8.63, ptr noundef @.str.4.59, i32 noundef 490, ptr noundef @__PRETTY_FUNCTION__.__fd_lseek) #14, !dbg !2824
  unreachable, !dbg !2824

if.end15:                                         ; preds = %if.then10
  %16 = load ptr, ptr %f, align 8, !dbg !2829
  %fd16 = getelementptr inbounds %struct.exe_file_t.6, ptr %16, i32 0, i32 0, !dbg !2830
  %17 = load i32, ptr %fd16, align 8, !dbg !2830
  %18 = load i64, ptr %offset.addr, align 8, !dbg !2831
  %19 = load i32, ptr %whence.addr, align 4, !dbg !2832
  %call17 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %17, i64 noundef %18, i32 noundef %19) #16, !dbg !2833
  store i64 %call17, ptr %new_off, align 8, !dbg !2834
  br label %if.end19, !dbg !2835

if.end19:                                         ; preds = %if.else, %if.end15, %if.then4
  %20 = load i64, ptr %new_off, align 8, !dbg !2836
  %cmp20 = icmp eq i64 %20, -1, !dbg !2838
  br i1 %cmp20, label %if.then21, label %if.end22, !dbg !2839

if.then21:                                        ; preds = %if.end19
  store i64 -1, ptr %retval, align 8, !dbg !2840
  br label %return, !dbg !2840

if.end22:                                         ; preds = %if.end19
  %21 = load i64, ptr %new_off, align 8, !dbg !2841
  %22 = load ptr, ptr %f, align 8, !dbg !2842
  %off23 = getelementptr inbounds %struct.exe_file_t.6, ptr %22, i32 0, i32 2, !dbg !2843
  store i64 %21, ptr %off23, align 8, !dbg !2844
  %23 = load i64, ptr %new_off, align 8, !dbg !2845
  store i64 %23, ptr %retval, align 8, !dbg !2846
  br label %return, !dbg !2846

if.end24:                                         ; preds = %if.end
  %24 = load i32, ptr %whence.addr, align 4, !dbg !2847
  switch i32 %24, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb25
    i32 2, label %sw.bb27
  ], !dbg !2848

sw.bb:                                            ; preds = %if.end24
  %25 = load i64, ptr %offset.addr, align 8, !dbg !2849
  store i64 %25, ptr %new_off, align 8, !dbg !2851
  br label %sw.epilog, !dbg !2852

sw.bb25:                                          ; preds = %if.end24
  %26 = load ptr, ptr %f, align 8, !dbg !2853
  %off26 = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 2, !dbg !2854
  %27 = load i64, ptr %off26, align 8, !dbg !2854
  %28 = load i64, ptr %offset.addr, align 8, !dbg !2855
  %add = add nsw i64 %27, %28, !dbg !2856
  store i64 %add, ptr %new_off, align 8, !dbg !2857
  br label %sw.epilog, !dbg !2858

sw.bb27:                                          ; preds = %if.end24
  %29 = load ptr, ptr %f, align 8, !dbg !2859
  %dfile28 = getelementptr inbounds %struct.exe_file_t.6, ptr %29, i32 0, i32 3, !dbg !2860
  %30 = load ptr, ptr %dfile28, align 8, !dbg !2860
  %size = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %30, i32 0, i32 0, !dbg !2861
  %31 = load i32, ptr %size, align 8, !dbg !2861
  %conv = zext i32 %31 to i64, !dbg !2859
  %32 = load i64, ptr %offset.addr, align 8, !dbg !2862
  %add29 = add nsw i64 %conv, %32, !dbg !2863
  store i64 %add29, ptr %new_off, align 8, !dbg !2864
  br label %sw.epilog, !dbg !2865

sw.default:                                       ; preds = %if.end24
  %call30 = call ptr @__errno_location() #17, !dbg !2866
  store i32 22, ptr %call30, align 4, !dbg !2868
  store i64 -1, ptr %retval, align 8, !dbg !2869
  br label %return, !dbg !2869

sw.epilog:                                        ; preds = %sw.bb27, %sw.bb25, %sw.bb
  %33 = load i64, ptr %new_off, align 8, !dbg !2870
  %cmp31 = icmp slt i64 %33, 0, !dbg !2872
  br i1 %cmp31, label %if.then33, label %if.end35, !dbg !2873

if.then33:                                        ; preds = %sw.epilog
  %call34 = call ptr @__errno_location() #17, !dbg !2874
  store i32 22, ptr %call34, align 4, !dbg !2876
  store i64 -1, ptr %retval, align 8, !dbg !2877
  br label %return, !dbg !2877

if.end35:                                         ; preds = %sw.epilog
  %34 = load i64, ptr %new_off, align 8, !dbg !2878
  %35 = load ptr, ptr %f, align 8, !dbg !2879
  %off36 = getelementptr inbounds %struct.exe_file_t.6, ptr %35, i32 0, i32 2, !dbg !2880
  store i64 %34, ptr %off36, align 8, !dbg !2881
  %36 = load ptr, ptr %f, align 8, !dbg !2882
  %off37 = getelementptr inbounds %struct.exe_file_t.6, ptr %36, i32 0, i32 2, !dbg !2883
  %37 = load i64, ptr %off37, align 8, !dbg !2883
  store i64 %37, ptr %retval, align 8, !dbg !2884
  br label %return, !dbg !2884

return:                                           ; preds = %if.end35, %if.then33, %sw.default, %if.end22, %if.then21, %if.then
  %38 = load i64, ptr %retval, align 8, !dbg !2885
  ret i64 %38, !dbg !2885
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_stat(ptr noundef %path, ptr noundef %buf) #0 !dbg !2886 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2889, metadata !DIExpression()), !dbg !2890
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2891, metadata !DIExpression()), !dbg !2892
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !2893, metadata !DIExpression()), !dbg !2894
  %0 = load ptr, ptr %path.addr, align 8, !dbg !2895
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !2896
  store ptr %call, ptr %dfile, align 8, !dbg !2894
  %1 = load ptr, ptr %dfile, align 8, !dbg !2897
  %tobool = icmp ne ptr %1, null, !dbg !2897
  br i1 %tobool, label %if.then, label %if.end, !dbg !2899

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %buf.addr, align 8, !dbg !2900
  %3 = load ptr, ptr %dfile, align 8, !dbg !2902
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %3, i32 0, i32 2, !dbg !2903
  %4 = load ptr, ptr %stat, align 8, !dbg !2903
  %5 = call ptr @memcpy(ptr %2, ptr %4, i64 144), !dbg !2904
  store i32 0, ptr %retval, align 4, !dbg !2905
  br label %return, !dbg !2905

if.end:                                           ; preds = %entry
  %6 = load ptr, ptr %path.addr, align 8, !dbg !2906
  %call1 = call ptr @__concretize_string(ptr noundef %6), !dbg !2908
  %7 = load ptr, ptr %buf.addr, align 8, !dbg !2909
  %call2 = call i64 (i64, ...) @syscall(i64 noundef 4, ptr noundef %call1, ptr noundef %7) #16, !dbg !2910
  %conv = trunc i64 %call2 to i32, !dbg !2910
  store i32 %conv, ptr %retval, align 4, !dbg !2911
  br label %return, !dbg !2911

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !2912
  ret i32 %8, !dbg !2912
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fstatat(i32 noundef %fd, ptr noundef nonnull %path, ptr noundef nonnull %buf, i32 noundef %flags) #0 !dbg !2913 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %dfile9 = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !2916, metadata !DIExpression()), !dbg !2917
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2918, metadata !DIExpression()), !dbg !2919
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2920, metadata !DIExpression()), !dbg !2921
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !2922, metadata !DIExpression()), !dbg !2923
  %0 = load i32, ptr %fd.addr, align 4, !dbg !2924
  %cmp = icmp ne i32 %0, -100, !dbg !2926
  br i1 %cmp, label %if.then, label %if.end8, !dbg !2927

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %f, metadata !2928, metadata !DIExpression()), !dbg !2930
  %1 = load i32, ptr %fd.addr, align 4, !dbg !2931
  %call = call ptr @__get_file(i32 noundef %1), !dbg !2932
  store ptr %call, ptr %f, align 8, !dbg !2930
  %2 = load ptr, ptr %f, align 8, !dbg !2933
  %tobool = icmp ne ptr %2, null, !dbg !2933
  br i1 %tobool, label %if.else, label %if.then1, !dbg !2935

if.then1:                                         ; preds = %if.then
  %call2 = call ptr @__errno_location() #17, !dbg !2936
  store i32 9, ptr %call2, align 4, !dbg !2938
  store i32 -1, ptr %retval, align 4, !dbg !2939
  br label %return, !dbg !2939

if.else:                                          ; preds = %if.then
  %3 = load ptr, ptr %f, align 8, !dbg !2940
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %3, i32 0, i32 3, !dbg !2942
  %4 = load ptr, ptr %dfile, align 8, !dbg !2942
  %tobool3 = icmp ne ptr %4, null, !dbg !2940
  br i1 %tobool3, label %if.then4, label %if.end6, !dbg !2943

if.then4:                                         ; preds = %if.else
  call void @klee_warning(ptr noundef @.str.2.55), !dbg !2944
  %call5 = call ptr @__errno_location() #17, !dbg !2946
  store i32 2, ptr %call5, align 4, !dbg !2947
  store i32 -1, ptr %retval, align 4, !dbg !2948
  br label %return, !dbg !2948

if.end6:                                          ; preds = %if.else
  %5 = load ptr, ptr %f, align 8, !dbg !2949
  %fd7 = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 0, !dbg !2950
  %6 = load i32, ptr %fd7, align 8, !dbg !2950
  store i32 %6, ptr %fd.addr, align 4, !dbg !2951
  br label %if.end8, !dbg !2952

if.end8:                                          ; preds = %if.end6, %entry
  call void @llvm.dbg.declare(metadata ptr %dfile9, metadata !2953, metadata !DIExpression()), !dbg !2954
  %7 = load ptr, ptr %path.addr, align 8, !dbg !2955
  %call10 = call ptr @__get_sym_file(ptr noundef %7), !dbg !2956
  store ptr %call10, ptr %dfile9, align 8, !dbg !2954
  %8 = load ptr, ptr %dfile9, align 8, !dbg !2957
  %tobool11 = icmp ne ptr %8, null, !dbg !2957
  br i1 %tobool11, label %if.then12, label %if.end13, !dbg !2959

if.then12:                                        ; preds = %if.end8
  %9 = load ptr, ptr %buf.addr, align 8, !dbg !2960
  %10 = load ptr, ptr %dfile9, align 8, !dbg !2962
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %10, i32 0, i32 2, !dbg !2963
  %11 = load ptr, ptr %stat, align 8, !dbg !2963
  %12 = call ptr @memcpy(ptr %9, ptr %11, i64 144), !dbg !2964
  store i32 0, ptr %retval, align 4, !dbg !2965
  br label %return, !dbg !2965

if.end13:                                         ; preds = %if.end8
  %13 = load ptr, ptr %path.addr, align 8, !dbg !2966
  %tobool14 = icmp ne ptr %13, null, !dbg !2966
  br i1 %tobool14, label %if.end17, label %if.else16, !dbg !2969

if.else16:                                        ; preds = %if.end13
  call void @__assert_fail(ptr noundef @.str.9.64, ptr noundef @.str.4.59, i32 noundef 560, ptr noundef @__PRETTY_FUNCTION__.fstatat) #14, !dbg !2966
  unreachable, !dbg !2966

if.end17:                                         ; preds = %if.end13
  %14 = load i32, ptr %fd.addr, align 4, !dbg !2970
  %conv = sext i32 %14 to i64, !dbg !2971
  %15 = load ptr, ptr %path.addr, align 8, !dbg !2972
  %call18 = call ptr @__concretize_string(ptr noundef %15), !dbg !2972
  %16 = load ptr, ptr %buf.addr, align 8, !dbg !2973
  %17 = load i32, ptr %flags.addr, align 4, !dbg !2974
  %conv19 = sext i32 %17 to i64, !dbg !2975
  %call20 = call i64 (i64, ...) @syscall(i64 noundef 262, i64 noundef %conv, ptr noundef %call18, ptr noundef %16, i64 noundef %conv19) #16, !dbg !2976
  %conv21 = trunc i64 %call20 to i32, !dbg !2976
  store i32 %conv21, ptr %retval, align 4, !dbg !2977
  br label %return, !dbg !2977

return:                                           ; preds = %if.end17, %if.then12, %if.then4, %if.then1
  %18 = load i32, ptr %retval, align 4, !dbg !2978
  ret i32 %18, !dbg !2978
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_lstat(ptr noundef %path, ptr noundef %buf) #0 !dbg !2979 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !2980, metadata !DIExpression()), !dbg !2981
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !2982, metadata !DIExpression()), !dbg !2983
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !2984, metadata !DIExpression()), !dbg !2985
  %0 = load ptr, ptr %path.addr, align 8, !dbg !2986
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !2987
  store ptr %call, ptr %dfile, align 8, !dbg !2985
  %1 = load ptr, ptr %dfile, align 8, !dbg !2988
  %tobool = icmp ne ptr %1, null, !dbg !2988
  br i1 %tobool, label %if.then, label %if.end, !dbg !2990

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %buf.addr, align 8, !dbg !2991
  %3 = load ptr, ptr %dfile, align 8, !dbg !2993
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %3, i32 0, i32 2, !dbg !2994
  %4 = load ptr, ptr %stat, align 8, !dbg !2994
  %5 = call ptr @memcpy(ptr %2, ptr %4, i64 144), !dbg !2995
  store i32 0, ptr %retval, align 4, !dbg !2996
  br label %return, !dbg !2996

if.end:                                           ; preds = %entry
  %6 = load ptr, ptr %path.addr, align 8, !dbg !2997
  %call1 = call ptr @__concretize_string(ptr noundef %6), !dbg !2999
  %7 = load ptr, ptr %buf.addr, align 8, !dbg !3000
  %call2 = call i64 (i64, ...) @syscall(i64 noundef 6, ptr noundef %call1, ptr noundef %7) #16, !dbg !3001
  %conv = trunc i64 %call2 to i32, !dbg !3001
  store i32 %conv, ptr %retval, align 4, !dbg !3002
  br label %return, !dbg !3002

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !3003
  ret i32 %8, !dbg !3003
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chdir(ptr noundef nonnull %path) #0 !dbg !3004 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !3007, metadata !DIExpression()), !dbg !3008
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !3009, metadata !DIExpression()), !dbg !3010
  %0 = load ptr, ptr %path.addr, align 8, !dbg !3011
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !3012
  store ptr %call, ptr %dfile, align 8, !dbg !3010
  %1 = load ptr, ptr %dfile, align 8, !dbg !3013
  %tobool = icmp ne ptr %1, null, !dbg !3013
  br i1 %tobool, label %if.then, label %if.end, !dbg !3015

if.then:                                          ; preds = %entry
  call void @klee_warning(ptr noundef @.str.10.65), !dbg !3016
  %call1 = call ptr @__errno_location() #17, !dbg !3018
  store i32 2, ptr %call1, align 4, !dbg !3019
  store i32 -1, ptr %retval, align 4, !dbg !3020
  br label %return, !dbg !3020

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %path.addr, align 8, !dbg !3021
  %call2 = call ptr @__concretize_string(ptr noundef %2), !dbg !3022
  %call3 = call i64 (i64, ...) @syscall(i64 noundef 80, ptr noundef %call2) #16, !dbg !3023
  %conv = trunc i64 %call3 to i32, !dbg !3023
  store i32 %conv, ptr %retval, align 4, !dbg !3024
  br label %return, !dbg !3024

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, ptr %retval, align 4, !dbg !3025
  ret i32 %3, !dbg !3025
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fchdir(i32 noundef %fd) #0 !dbg !3026 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3027, metadata !DIExpression()), !dbg !3028
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3029, metadata !DIExpression()), !dbg !3030
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3031
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3032
  store ptr %call, ptr %f, align 8, !dbg !3030
  %1 = load ptr, ptr %f, align 8, !dbg !3033
  %tobool = icmp ne ptr %1, null, !dbg !3033
  br i1 %tobool, label %if.end, label %if.then, !dbg !3035

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3036
  store i32 9, ptr %call1, align 4, !dbg !3038
  store i32 -1, ptr %retval, align 4, !dbg !3039
  br label %return, !dbg !3039

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !3040
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !3042
  %3 = load ptr, ptr %dfile, align 8, !dbg !3042
  %tobool2 = icmp ne ptr %3, null, !dbg !3040
  br i1 %tobool2, label %if.then3, label %if.end5, !dbg !3043

if.then3:                                         ; preds = %if.end
  call void @klee_warning(ptr noundef @.str.10.65), !dbg !3044
  %call4 = call ptr @__errno_location() #17, !dbg !3046
  store i32 2, ptr %call4, align 4, !dbg !3047
  store i32 -1, ptr %retval, align 4, !dbg !3048
  br label %return, !dbg !3048

if.end5:                                          ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !3049
  %fd6 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 0, !dbg !3050
  %5 = load i32, ptr %fd6, align 8, !dbg !3050
  %call7 = call i64 (i64, ...) @syscall(i64 noundef 81, i32 noundef %5) #16, !dbg !3051
  %conv = trunc i64 %call7 to i32, !dbg !3051
  store i32 %conv, ptr %retval, align 4, !dbg !3052
  br label %return, !dbg !3052

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %6 = load i32, ptr %retval, align 4, !dbg !3053
  ret i32 %6, !dbg !3053
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chmod(ptr noundef nonnull %path, i32 noundef %mode) #0 !dbg !430 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %mode.addr = alloca i32, align 4
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !3054, metadata !DIExpression()), !dbg !3055
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !3056, metadata !DIExpression()), !dbg !3057
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !3058, metadata !DIExpression()), !dbg !3059
  %0 = load ptr, ptr %path.addr, align 8, !dbg !3060
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !3061
  store ptr %call, ptr %dfile, align 8, !dbg !3059
  %1 = load i32, ptr @chmod.n_calls, align 4, !dbg !3062
  %inc = add nsw i32 %1, 1, !dbg !3062
  store i32 %inc, ptr @chmod.n_calls, align 4, !dbg !3062
  %2 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3063
  %tobool = icmp ne i32 %2, 0, !dbg !3065
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !3066

land.lhs.true:                                    ; preds = %entry
  %3 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 11), align 8, !dbg !3067
  %4 = load i32, ptr %3, align 4, !dbg !3068
  %5 = load i32, ptr @chmod.n_calls, align 4, !dbg !3069
  %cmp = icmp eq i32 %4, %5, !dbg !3070
  br i1 %cmp, label %if.then, label %if.end, !dbg !3071

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3072
  %dec = add i32 %6, -1, !dbg !3072
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3072
  %call1 = call ptr @__errno_location() #17, !dbg !3074
  store i32 5, ptr %call1, align 4, !dbg !3075
  store i32 -1, ptr %retval, align 4, !dbg !3076
  br label %return, !dbg !3076

if.end:                                           ; preds = %land.lhs.true, %entry
  %7 = load ptr, ptr %dfile, align 8, !dbg !3077
  %tobool2 = icmp ne ptr %7, null, !dbg !3077
  br i1 %tobool2, label %if.then3, label %if.end5, !dbg !3079

if.then3:                                         ; preds = %if.end
  %8 = load ptr, ptr %dfile, align 8, !dbg !3080
  %9 = load i32, ptr %mode.addr, align 4, !dbg !3082
  %call4 = call i32 @__df_chmod(ptr noundef %8, i32 noundef %9), !dbg !3083
  store i32 %call4, ptr %retval, align 4, !dbg !3084
  br label %return, !dbg !3084

if.end5:                                          ; preds = %if.end
  %10 = load ptr, ptr %path.addr, align 8, !dbg !3085
  %call6 = call ptr @__concretize_string(ptr noundef %10), !dbg !3086
  %11 = load i32, ptr %mode.addr, align 4, !dbg !3087
  %call7 = call i64 (i64, ...) @syscall(i64 noundef 90, ptr noundef %call6, i32 noundef %11) #16, !dbg !3088
  %conv = trunc i64 %call7 to i32, !dbg !3088
  store i32 %conv, ptr %retval, align 4, !dbg !3089
  br label %return, !dbg !3089

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %12 = load i32, ptr %retval, align 4, !dbg !3090
  ret i32 %12, !dbg !3090
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @__df_chmod(ptr noundef %df, i32 noundef %mode) #0 !dbg !3091 {
entry:
  %retval = alloca i32, align 4
  %df.addr = alloca ptr, align 8
  %mode.addr = alloca i32, align 4
  store ptr %df, ptr %df.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %df.addr, metadata !3094, metadata !DIExpression()), !dbg !3095
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !3096, metadata !DIExpression()), !dbg !3097
  %call = call i32 @geteuid() #16, !dbg !3098
  %0 = load ptr, ptr %df.addr, align 8, !dbg !3100
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %0, i32 0, i32 2, !dbg !3101
  %1 = load ptr, ptr %stat, align 8, !dbg !3101
  %st_uid = getelementptr inbounds %struct.stat64.9, ptr %1, i32 0, i32 4, !dbg !3102
  %2 = load i32, ptr %st_uid, align 4, !dbg !3102
  %cmp = icmp eq i32 %call, %2, !dbg !3103
  br i1 %cmp, label %if.then, label %if.else, !dbg !3104

if.then:                                          ; preds = %entry
  %call1 = call i32 @getgid() #16, !dbg !3105
  %3 = load ptr, ptr %df.addr, align 8, !dbg !3108
  %stat2 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %3, i32 0, i32 2, !dbg !3109
  %4 = load ptr, ptr %stat2, align 8, !dbg !3109
  %st_gid = getelementptr inbounds %struct.stat64.9, ptr %4, i32 0, i32 5, !dbg !3110
  %5 = load i32, ptr %st_gid, align 8, !dbg !3110
  %cmp3 = icmp ne i32 %call1, %5, !dbg !3111
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !3112

if.then4:                                         ; preds = %if.then
  %6 = load i32, ptr %mode.addr, align 4, !dbg !3113
  %and = and i32 %6, -1025, !dbg !3113
  store i32 %and, ptr %mode.addr, align 4, !dbg !3113
  br label %if.end, !dbg !3114

if.end:                                           ; preds = %if.then4, %if.then
  %7 = load ptr, ptr %df.addr, align 8, !dbg !3115
  %stat5 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %7, i32 0, i32 2, !dbg !3116
  %8 = load ptr, ptr %stat5, align 8, !dbg !3116
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %8, i32 0, i32 3, !dbg !3117
  %9 = load i32, ptr %st_mode, align 8, !dbg !3117
  %and6 = and i32 %9, -4096, !dbg !3118
  %10 = load i32, ptr %mode.addr, align 4, !dbg !3119
  %and7 = and i32 %10, 4095, !dbg !3120
  %or = or i32 %and6, %and7, !dbg !3121
  %11 = load ptr, ptr %df.addr, align 8, !dbg !3122
  %stat8 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %11, i32 0, i32 2, !dbg !3123
  %12 = load ptr, ptr %stat8, align 8, !dbg !3123
  %st_mode9 = getelementptr inbounds %struct.stat64.9, ptr %12, i32 0, i32 3, !dbg !3124
  store i32 %or, ptr %st_mode9, align 8, !dbg !3125
  store i32 0, ptr %retval, align 4, !dbg !3126
  br label %return, !dbg !3126

if.else:                                          ; preds = %entry
  %call10 = call ptr @__errno_location() #17, !dbg !3127
  store i32 1, ptr %call10, align 4, !dbg !3129
  store i32 -1, ptr %retval, align 4, !dbg !3130
  br label %return, !dbg !3130

return:                                           ; preds = %if.else, %if.end
  %13 = load i32, ptr %retval, align 4, !dbg !3131
  ret i32 %13, !dbg !3131
}

; Function Attrs: nounwind
declare i32 @geteuid() #9

; Function Attrs: nounwind
declare i32 @getgid() #9

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fchmod(i32 noundef %fd, i32 noundef %mode) #0 !dbg !436 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %mode.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3132, metadata !DIExpression()), !dbg !3133
  store i32 %mode, ptr %mode.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %mode.addr, metadata !3134, metadata !DIExpression()), !dbg !3135
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3136, metadata !DIExpression()), !dbg !3137
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3138
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3139
  store ptr %call, ptr %f, align 8, !dbg !3137
  %1 = load ptr, ptr %f, align 8, !dbg !3140
  %tobool = icmp ne ptr %1, null, !dbg !3140
  br i1 %tobool, label %if.end, label %if.then, !dbg !3142

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3143
  store i32 9, ptr %call1, align 4, !dbg !3145
  store i32 -1, ptr %retval, align 4, !dbg !3146
  br label %return, !dbg !3146

if.end:                                           ; preds = %entry
  %2 = load i32, ptr @fchmod.n_calls, align 4, !dbg !3147
  %inc = add nsw i32 %2, 1, !dbg !3147
  store i32 %inc, ptr @fchmod.n_calls, align 4, !dbg !3147
  %3 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3148
  %tobool2 = icmp ne i32 %3, 0, !dbg !3150
  br i1 %tobool2, label %land.lhs.true, label %if.end5, !dbg !3151

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 12), align 8, !dbg !3152
  %5 = load i32, ptr %4, align 4, !dbg !3153
  %6 = load i32, ptr @fchmod.n_calls, align 4, !dbg !3154
  %cmp = icmp eq i32 %5, %6, !dbg !3155
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !3156

if.then3:                                         ; preds = %land.lhs.true
  %7 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3157
  %dec = add i32 %7, -1, !dbg !3157
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3157
  %call4 = call ptr @__errno_location() #17, !dbg !3159
  store i32 5, ptr %call4, align 4, !dbg !3160
  store i32 -1, ptr %retval, align 4, !dbg !3161
  br label %return, !dbg !3161

if.end5:                                          ; preds = %land.lhs.true, %if.end
  %8 = load ptr, ptr %f, align 8, !dbg !3162
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !3164
  %9 = load ptr, ptr %dfile, align 8, !dbg !3164
  %tobool6 = icmp ne ptr %9, null, !dbg !3162
  br i1 %tobool6, label %if.then7, label %if.end10, !dbg !3165

if.then7:                                         ; preds = %if.end5
  %10 = load ptr, ptr %f, align 8, !dbg !3166
  %dfile8 = getelementptr inbounds %struct.exe_file_t.6, ptr %10, i32 0, i32 3, !dbg !3168
  %11 = load ptr, ptr %dfile8, align 8, !dbg !3168
  %12 = load i32, ptr %mode.addr, align 4, !dbg !3169
  %call9 = call i32 @__df_chmod(ptr noundef %11, i32 noundef %12), !dbg !3170
  store i32 %call9, ptr %retval, align 4, !dbg !3171
  br label %return, !dbg !3171

if.end10:                                         ; preds = %if.end5
  %13 = load ptr, ptr %f, align 8, !dbg !3172
  %fd11 = getelementptr inbounds %struct.exe_file_t.6, ptr %13, i32 0, i32 0, !dbg !3173
  %14 = load i32, ptr %fd11, align 8, !dbg !3173
  %15 = load i32, ptr %mode.addr, align 4, !dbg !3174
  %call12 = call i64 (i64, ...) @syscall(i64 noundef 91, i32 noundef %14, i32 noundef %15) #16, !dbg !3175
  %conv = trunc i64 %call12 to i32, !dbg !3175
  store i32 %conv, ptr %retval, align 4, !dbg !3176
  br label %return, !dbg !3176

return:                                           ; preds = %if.end10, %if.then7, %if.then3, %if.then
  %16 = load i32, ptr %retval, align 4, !dbg !3177
  ret i32 %16, !dbg !3177
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chown(ptr noundef nonnull %path, i32 noundef %owner, i32 noundef %group) #0 !dbg !3178 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %owner.addr = alloca i32, align 4
  %group.addr = alloca i32, align 4
  %df = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !3183, metadata !DIExpression()), !dbg !3184
  store i32 %owner, ptr %owner.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %owner.addr, metadata !3185, metadata !DIExpression()), !dbg !3186
  store i32 %group, ptr %group.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %group.addr, metadata !3187, metadata !DIExpression()), !dbg !3188
  call void @llvm.dbg.declare(metadata ptr %df, metadata !3189, metadata !DIExpression()), !dbg !3190
  %0 = load ptr, ptr %path.addr, align 8, !dbg !3191
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !3192
  store ptr %call, ptr %df, align 8, !dbg !3190
  %1 = load ptr, ptr %df, align 8, !dbg !3193
  %tobool = icmp ne ptr %1, null, !dbg !3193
  br i1 %tobool, label %if.then, label %if.end, !dbg !3195

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %df, align 8, !dbg !3196
  %3 = load i32, ptr %owner.addr, align 4, !dbg !3198
  %4 = load i32, ptr %group.addr, align 4, !dbg !3199
  %call1 = call i32 @__df_chown(ptr noundef %2, i32 noundef %3, i32 noundef %4), !dbg !3200
  store i32 %call1, ptr %retval, align 4, !dbg !3201
  br label %return, !dbg !3201

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %path.addr, align 8, !dbg !3202
  %call2 = call ptr @__concretize_string(ptr noundef %5), !dbg !3203
  %6 = load i32, ptr %owner.addr, align 4, !dbg !3204
  %7 = load i32, ptr %group.addr, align 4, !dbg !3205
  %call3 = call i64 (i64, ...) @syscall(i64 noundef 92, ptr noundef %call2, i32 noundef %6, i32 noundef %7) #16, !dbg !3206
  %conv = trunc i64 %call3 to i32, !dbg !3206
  store i32 %conv, ptr %retval, align 4, !dbg !3207
  br label %return, !dbg !3207

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !3208
  ret i32 %8, !dbg !3208
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @__df_chown(ptr noundef %df, i32 noundef %owner, i32 noundef %group) #0 !dbg !3209 {
entry:
  %df.addr = alloca ptr, align 8
  %owner.addr = alloca i32, align 4
  %group.addr = alloca i32, align 4
  store ptr %df, ptr %df.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %df.addr, metadata !3212, metadata !DIExpression()), !dbg !3213
  store i32 %owner, ptr %owner.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %owner.addr, metadata !3214, metadata !DIExpression()), !dbg !3215
  store i32 %group, ptr %group.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %group.addr, metadata !3216, metadata !DIExpression()), !dbg !3217
  call void @klee_warning(ptr noundef @.str.26.66), !dbg !3218
  %call = call ptr @__errno_location() #17, !dbg !3219
  store i32 1, ptr %call, align 4, !dbg !3220
  ret i32 -1, !dbg !3221
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fchown(i32 noundef %fd, i32 noundef %owner, i32 noundef %group) #0 !dbg !3222 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %owner.addr = alloca i32, align 4
  %group.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3225, metadata !DIExpression()), !dbg !3226
  store i32 %owner, ptr %owner.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %owner.addr, metadata !3227, metadata !DIExpression()), !dbg !3228
  store i32 %group, ptr %group.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %group.addr, metadata !3229, metadata !DIExpression()), !dbg !3230
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3231, metadata !DIExpression()), !dbg !3232
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3233
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3234
  store ptr %call, ptr %f, align 8, !dbg !3232
  %1 = load ptr, ptr %f, align 8, !dbg !3235
  %tobool = icmp ne ptr %1, null, !dbg !3235
  br i1 %tobool, label %if.end, label %if.then, !dbg !3237

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3238
  store i32 9, ptr %call1, align 4, !dbg !3240
  store i32 -1, ptr %retval, align 4, !dbg !3241
  br label %return, !dbg !3241

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !3242
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !3244
  %3 = load ptr, ptr %dfile, align 8, !dbg !3244
  %tobool2 = icmp ne ptr %3, null, !dbg !3242
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !3245

if.then3:                                         ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !3246
  %dfile4 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 3, !dbg !3248
  %5 = load ptr, ptr %dfile4, align 8, !dbg !3248
  %6 = load i32, ptr %owner.addr, align 4, !dbg !3249
  %7 = load i32, ptr %group.addr, align 4, !dbg !3250
  %call5 = call i32 @__df_chown(ptr noundef %5, i32 noundef %6, i32 noundef %7), !dbg !3251
  store i32 %call5, ptr %retval, align 4, !dbg !3252
  br label %return, !dbg !3252

if.end6:                                          ; preds = %if.end
  %8 = load i32, ptr %fd.addr, align 4, !dbg !3253
  %9 = load i32, ptr %owner.addr, align 4, !dbg !3254
  %10 = load i32, ptr %group.addr, align 4, !dbg !3255
  %call7 = call i64 (i64, ...) @syscall(i64 noundef 93, i32 noundef %8, i32 noundef %9, i32 noundef %10) #16, !dbg !3256
  %conv = trunc i64 %call7 to i32, !dbg !3256
  store i32 %conv, ptr %retval, align 4, !dbg !3257
  br label %return, !dbg !3257

return:                                           ; preds = %if.end6, %if.then3, %if.then
  %11 = load i32, ptr %retval, align 4, !dbg !3258
  ret i32 %11, !dbg !3258
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @lchown(ptr noundef nonnull %path, i32 noundef %owner, i32 noundef %group) #0 !dbg !3259 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %owner.addr = alloca i32, align 4
  %group.addr = alloca i32, align 4
  %df = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !3260, metadata !DIExpression()), !dbg !3261
  store i32 %owner, ptr %owner.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %owner.addr, metadata !3262, metadata !DIExpression()), !dbg !3263
  store i32 %group, ptr %group.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %group.addr, metadata !3264, metadata !DIExpression()), !dbg !3265
  call void @llvm.dbg.declare(metadata ptr %df, metadata !3266, metadata !DIExpression()), !dbg !3267
  %0 = load ptr, ptr %path.addr, align 8, !dbg !3268
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !3269
  store ptr %call, ptr %df, align 8, !dbg !3267
  %1 = load ptr, ptr %df, align 8, !dbg !3270
  %tobool = icmp ne ptr %1, null, !dbg !3270
  br i1 %tobool, label %if.then, label %if.end, !dbg !3272

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %df, align 8, !dbg !3273
  %3 = load i32, ptr %owner.addr, align 4, !dbg !3275
  %4 = load i32, ptr %group.addr, align 4, !dbg !3276
  %call1 = call i32 @__df_chown(ptr noundef %2, i32 noundef %3, i32 noundef %4), !dbg !3277
  store i32 %call1, ptr %retval, align 4, !dbg !3278
  br label %return, !dbg !3278

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %path.addr, align 8, !dbg !3279
  %call2 = call ptr @__concretize_string(ptr noundef %5), !dbg !3280
  %6 = load i32, ptr %owner.addr, align 4, !dbg !3281
  %7 = load i32, ptr %group.addr, align 4, !dbg !3282
  %call3 = call i64 (i64, ...) @syscall(i64 noundef 92, ptr noundef %call2, i32 noundef %6, i32 noundef %7) #16, !dbg !3283
  %conv = trunc i64 %call3 to i32, !dbg !3283
  store i32 %conv, ptr %retval, align 4, !dbg !3284
  br label %return, !dbg !3284

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !3285
  ret i32 %8, !dbg !3285
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_fstat(i32 noundef %fd, ptr noundef %buf) #0 !dbg !3286 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3287, metadata !DIExpression()), !dbg !3288
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !3289, metadata !DIExpression()), !dbg !3290
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3291, metadata !DIExpression()), !dbg !3292
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3293
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3294
  store ptr %call, ptr %f, align 8, !dbg !3292
  %1 = load ptr, ptr %f, align 8, !dbg !3295
  %tobool = icmp ne ptr %1, null, !dbg !3295
  br i1 %tobool, label %if.end, label %if.then, !dbg !3297

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3298
  store i32 9, ptr %call1, align 4, !dbg !3300
  store i32 -1, ptr %retval, align 4, !dbg !3301
  br label %return, !dbg !3301

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !3302
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !3304
  %3 = load ptr, ptr %dfile, align 8, !dbg !3304
  %tobool2 = icmp ne ptr %3, null, !dbg !3302
  br i1 %tobool2, label %if.end6, label %if.then3, !dbg !3305

if.then3:                                         ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !3306
  %fd4 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 0, !dbg !3308
  %5 = load i32, ptr %fd4, align 8, !dbg !3308
  %6 = load ptr, ptr %buf.addr, align 8, !dbg !3309
  %call5 = call i64 (i64, ...) @syscall(i64 noundef 5, i32 noundef %5, ptr noundef %6) #16, !dbg !3310
  %conv = trunc i64 %call5 to i32, !dbg !3310
  store i32 %conv, ptr %retval, align 4, !dbg !3311
  br label %return, !dbg !3311

if.end6:                                          ; preds = %if.end
  %7 = load ptr, ptr %buf.addr, align 8, !dbg !3312
  %8 = load ptr, ptr %f, align 8, !dbg !3313
  %dfile7 = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !3314
  %9 = load ptr, ptr %dfile7, align 8, !dbg !3314
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %9, i32 0, i32 2, !dbg !3315
  %10 = load ptr, ptr %stat, align 8, !dbg !3315
  %11 = call ptr @memcpy(ptr %7, ptr %10, i64 144), !dbg !3316
  store i32 0, ptr %retval, align 4, !dbg !3317
  br label %return, !dbg !3317

return:                                           ; preds = %if.end6, %if.then3, %if.then
  %12 = load i32, ptr %retval, align 4, !dbg !3318
  ret i32 %12, !dbg !3318
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_ftruncate(i32 noundef %fd, i64 noundef %length) #0 !dbg !441 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %length.addr = alloca i64, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3319, metadata !DIExpression()), !dbg !3320
  store i64 %length, ptr %length.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %length.addr, metadata !3321, metadata !DIExpression()), !dbg !3322
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3323, metadata !DIExpression()), !dbg !3324
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3325
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3326
  store ptr %call, ptr %f, align 8, !dbg !3324
  %1 = load i32, ptr @__fd_ftruncate.n_calls, align 4, !dbg !3327
  %inc = add nsw i32 %1, 1, !dbg !3327
  store i32 %inc, ptr @__fd_ftruncate.n_calls, align 4, !dbg !3327
  %2 = load ptr, ptr %f, align 8, !dbg !3328
  %tobool = icmp ne ptr %2, null, !dbg !3328
  br i1 %tobool, label %if.end, label %if.then, !dbg !3330

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3331
  store i32 9, ptr %call1, align 4, !dbg !3333
  store i32 -1, ptr %retval, align 4, !dbg !3334
  br label %return, !dbg !3334

if.end:                                           ; preds = %entry
  %3 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3335
  %tobool2 = icmp ne i32 %3, 0, !dbg !3337
  br i1 %tobool2, label %land.lhs.true, label %if.end5, !dbg !3338

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 9), align 8, !dbg !3339
  %5 = load i32, ptr %4, align 4, !dbg !3340
  %6 = load i32, ptr @__fd_ftruncate.n_calls, align 4, !dbg !3341
  %cmp = icmp eq i32 %5, %6, !dbg !3342
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !3343

if.then3:                                         ; preds = %land.lhs.true
  %7 = load i32, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3344
  %dec = add i32 %7, -1, !dbg !3344
  store i32 %dec, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 5), align 8, !dbg !3344
  %call4 = call ptr @__errno_location() #17, !dbg !3346
  store i32 5, ptr %call4, align 4, !dbg !3347
  store i32 -1, ptr %retval, align 4, !dbg !3348
  br label %return, !dbg !3348

if.end5:                                          ; preds = %land.lhs.true, %if.end
  %8 = load ptr, ptr %f, align 8, !dbg !3349
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !3351
  %9 = load ptr, ptr %dfile, align 8, !dbg !3351
  %tobool6 = icmp ne ptr %9, null, !dbg !3349
  br i1 %tobool6, label %if.then7, label %if.end9, !dbg !3352

if.then7:                                         ; preds = %if.end5
  call void @klee_warning(ptr noundef @.str.11.67), !dbg !3353
  %call8 = call ptr @__errno_location() #17, !dbg !3355
  store i32 5, ptr %call8, align 4, !dbg !3356
  store i32 -1, ptr %retval, align 4, !dbg !3357
  br label %return, !dbg !3357

if.end9:                                          ; preds = %if.end5
  %10 = load ptr, ptr %f, align 8, !dbg !3358
  %fd10 = getelementptr inbounds %struct.exe_file_t.6, ptr %10, i32 0, i32 0, !dbg !3359
  %11 = load i32, ptr %fd10, align 8, !dbg !3359
  %12 = load i64, ptr %length.addr, align 8, !dbg !3360
  %call11 = call i64 (i64, ...) @syscall(i64 noundef 77, i32 noundef %11, i64 noundef %12) #16, !dbg !3361
  %conv = trunc i64 %call11 to i32, !dbg !3361
  store i32 %conv, ptr %retval, align 4, !dbg !3362
  br label %return, !dbg !3362

return:                                           ; preds = %if.end9, %if.then7, %if.then3, %if.then
  %13 = load i32, ptr %retval, align 4, !dbg !3363
  ret i32 %13, !dbg !3363
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_getdents(i32 noundef %fd, ptr noundef %dirp, i32 noundef %count) #0 !dbg !3364 {
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
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3367, metadata !DIExpression()), !dbg !3368
  store ptr %dirp, ptr %dirp.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %dirp.addr, metadata !3369, metadata !DIExpression()), !dbg !3370
  store i32 %count, ptr %count.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !3371, metadata !DIExpression()), !dbg !3372
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3373, metadata !DIExpression()), !dbg !3374
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3375
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3376
  store ptr %call, ptr %f, align 8, !dbg !3374
  %1 = load ptr, ptr %f, align 8, !dbg !3377
  %tobool = icmp ne ptr %1, null, !dbg !3377
  br i1 %tobool, label %if.end, label %if.then, !dbg !3379

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3380
  store i32 9, ptr %call1, align 4, !dbg !3382
  store i32 -1, ptr %retval, align 4, !dbg !3383
  br label %return, !dbg !3383

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !3384
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !3386
  %3 = load ptr, ptr %dfile, align 8, !dbg !3386
  %tobool2 = icmp ne ptr %3, null, !dbg !3384
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !3387

if.then3:                                         ; preds = %if.end
  call void @klee_warning(ptr noundef @.str.12.68), !dbg !3388
  %call4 = call ptr @__errno_location() #17, !dbg !3390
  store i32 22, ptr %call4, align 4, !dbg !3391
  store i32 -1, ptr %retval, align 4, !dbg !3392
  br label %return, !dbg !3392

if.else:                                          ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !3393
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 2, !dbg !3396
  %5 = load i64, ptr %off, align 8, !dbg !3396
  %cmp = icmp ult i64 %5, 4096, !dbg !3397
  br i1 %cmp, label %if.then5, label %if.else43, !dbg !3398

if.then5:                                         ; preds = %if.else
  call void @llvm.dbg.declare(metadata ptr %i, metadata !3399, metadata !DIExpression()), !dbg !3401
  call void @llvm.dbg.declare(metadata ptr %pad, metadata !3402, metadata !DIExpression()), !dbg !3403
  call void @llvm.dbg.declare(metadata ptr %bytes, metadata !3404, metadata !DIExpression()), !dbg !3405
  store i64 0, ptr %bytes, align 8, !dbg !3405
  %6 = load ptr, ptr %f, align 8, !dbg !3406
  %off6 = getelementptr inbounds %struct.exe_file_t.6, ptr %6, i32 0, i32 2, !dbg !3407
  %7 = load i64, ptr %off6, align 8, !dbg !3407
  %div = udiv i64 %7, 280, !dbg !3408
  store i64 %div, ptr %i, align 8, !dbg !3409
  %8 = load i64, ptr %i, align 8, !dbg !3410
  %mul = mul i64 %8, 280, !dbg !3412
  %9 = load ptr, ptr %f, align 8, !dbg !3413
  %off7 = getelementptr inbounds %struct.exe_file_t.6, ptr %9, i32 0, i32 2, !dbg !3414
  %10 = load i64, ptr %off7, align 8, !dbg !3414
  %cmp8 = icmp ne i64 %mul, %10, !dbg !3415
  br i1 %cmp8, label %if.then11, label %lor.lhs.false, !dbg !3416

lor.lhs.false:                                    ; preds = %if.then5
  %11 = load i64, ptr %i, align 8, !dbg !3417
  %12 = load i32, ptr @__exe_fs, align 8, !dbg !3418
  %conv = zext i32 %12 to i64, !dbg !3419
  %cmp9 = icmp sgt i64 %11, %conv, !dbg !3420
  br i1 %cmp9, label %if.then11, label %for.cond, !dbg !3421

if.then11:                                        ; preds = %lor.lhs.false, %if.then5
  %call12 = call ptr @__errno_location() #17, !dbg !3422
  store i32 22, ptr %call12, align 4, !dbg !3424
  store i32 -1, ptr %retval, align 4, !dbg !3425
  br label %return, !dbg !3425

for.cond:                                         ; preds = %lor.lhs.false, %for.body
  %13 = load i64, ptr %i, align 8, !dbg !3426
  %14 = load i32, ptr @__exe_fs, align 8, !dbg !3429
  %conv14 = zext i32 %14 to i64, !dbg !3430
  %cmp15 = icmp slt i64 %13, %conv14, !dbg !3431
  br i1 %cmp15, label %for.body, label %for.end, !dbg !3432

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata ptr %df, metadata !3433, metadata !DIExpression()), !dbg !3435
  %15 = load ptr, ptr getelementptr inbounds (%struct.exe_file_system_t.7, ptr @__exe_fs, i32 0, i32 4), align 8, !dbg !3436
  %16 = load i64, ptr %i, align 8, !dbg !3437
  %arrayidx = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %15, i64 %16, !dbg !3438
  store ptr %arrayidx, ptr %df, align 8, !dbg !3435
  %17 = load ptr, ptr %df, align 8, !dbg !3439
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %17, i32 0, i32 2, !dbg !3440
  %18 = load ptr, ptr %stat, align 8, !dbg !3440
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %18, i32 0, i32 1, !dbg !3441
  %19 = load i64, ptr %st_ino, align 8, !dbg !3441
  %20 = load ptr, ptr %dirp.addr, align 8, !dbg !3442
  %d_ino = getelementptr inbounds %struct.dirent64, ptr %20, i32 0, i32 0, !dbg !3443
  store i64 %19, ptr %d_ino, align 8, !dbg !3444
  %21 = load ptr, ptr %dirp.addr, align 8, !dbg !3445
  %d_reclen = getelementptr inbounds %struct.dirent64, ptr %21, i32 0, i32 2, !dbg !3446
  store i16 280, ptr %d_reclen, align 8, !dbg !3447
  %22 = load ptr, ptr %df, align 8, !dbg !3448
  %stat17 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %22, i32 0, i32 2, !dbg !3448
  %23 = load ptr, ptr %stat17, align 8, !dbg !3448
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %23, i32 0, i32 3, !dbg !3448
  %24 = load i32, ptr %st_mode, align 8, !dbg !3448
  %and = and i32 %24, 61440, !dbg !3448
  %shr = lshr i32 %and, 12, !dbg !3448
  %conv18 = trunc i32 %shr to i8, !dbg !3448
  %25 = load ptr, ptr %dirp.addr, align 8, !dbg !3449
  %d_type = getelementptr inbounds %struct.dirent64, ptr %25, i32 0, i32 3, !dbg !3450
  store i8 %conv18, ptr %d_type, align 2, !dbg !3451
  %26 = load i64, ptr %i, align 8, !dbg !3452
  %add = add nsw i64 65, %26, !dbg !3453
  %conv19 = trunc i64 %add to i8, !dbg !3454
  %27 = load ptr, ptr %dirp.addr, align 8, !dbg !3455
  %d_name = getelementptr inbounds %struct.dirent64, ptr %27, i32 0, i32 4, !dbg !3456
  %arrayidx20 = getelementptr inbounds [256 x i8], ptr %d_name, i64 0, i64 0, !dbg !3455
  store i8 %conv19, ptr %arrayidx20, align 1, !dbg !3457
  %28 = load ptr, ptr %dirp.addr, align 8, !dbg !3458
  %d_name21 = getelementptr inbounds %struct.dirent64, ptr %28, i32 0, i32 4, !dbg !3459
  %arrayidx22 = getelementptr inbounds [256 x i8], ptr %d_name21, i64 0, i64 1, !dbg !3458
  store i8 0, ptr %arrayidx22, align 1, !dbg !3460
  %29 = load i64, ptr %i, align 8, !dbg !3461
  %add23 = add nsw i64 %29, 1, !dbg !3462
  %mul24 = mul i64 %add23, 280, !dbg !3463
  %30 = load ptr, ptr %dirp.addr, align 8, !dbg !3464
  %d_off = getelementptr inbounds %struct.dirent64, ptr %30, i32 0, i32 1, !dbg !3465
  store i64 %mul24, ptr %d_off, align 8, !dbg !3466
  %31 = load ptr, ptr %dirp.addr, align 8, !dbg !3467
  %d_reclen25 = getelementptr inbounds %struct.dirent64, ptr %31, i32 0, i32 2, !dbg !3468
  %32 = load i16, ptr %d_reclen25, align 8, !dbg !3468
  %conv26 = zext i16 %32 to i64, !dbg !3467
  %33 = load i64, ptr %bytes, align 8, !dbg !3469
  %add27 = add nsw i64 %33, %conv26, !dbg !3469
  store i64 %add27, ptr %bytes, align 8, !dbg !3469
  %34 = load ptr, ptr %dirp.addr, align 8, !dbg !3470
  %incdec.ptr = getelementptr inbounds %struct.dirent64, ptr %34, i32 1, !dbg !3470
  store ptr %incdec.ptr, ptr %dirp.addr, align 8, !dbg !3470
  %35 = load i64, ptr %i, align 8, !dbg !3471
  %inc = add nsw i64 %35, 1, !dbg !3471
  store i64 %inc, ptr %i, align 8, !dbg !3471
  br label %for.cond, !dbg !3472, !llvm.loop !3473

for.end:                                          ; preds = %for.cond
  %36 = load i32, ptr %count.addr, align 4, !dbg !3475
  %cmp28 = icmp uge i32 %36, 4096, !dbg !3476
  %37 = load i32, ptr %count.addr, align 4, !dbg !3475
  %cond = select i1 %cmp28, i32 4096, i32 %37, !dbg !3475
  %conv30 = zext i32 %cond to i64, !dbg !3475
  store i64 %conv30, ptr %pad, align 8, !dbg !3477
  %38 = load ptr, ptr %dirp.addr, align 8, !dbg !3478
  %d_ino31 = getelementptr inbounds %struct.dirent64, ptr %38, i32 0, i32 0, !dbg !3479
  store i64 0, ptr %d_ino31, align 8, !dbg !3480
  %39 = load i64, ptr %pad, align 8, !dbg !3481
  %40 = load i64, ptr %bytes, align 8, !dbg !3482
  %sub = sub nsw i64 %39, %40, !dbg !3483
  %conv32 = trunc i64 %sub to i16, !dbg !3481
  %41 = load ptr, ptr %dirp.addr, align 8, !dbg !3484
  %d_reclen33 = getelementptr inbounds %struct.dirent64, ptr %41, i32 0, i32 2, !dbg !3485
  store i16 %conv32, ptr %d_reclen33, align 8, !dbg !3486
  %42 = load ptr, ptr %dirp.addr, align 8, !dbg !3487
  %d_type34 = getelementptr inbounds %struct.dirent64, ptr %42, i32 0, i32 3, !dbg !3488
  store i8 0, ptr %d_type34, align 2, !dbg !3489
  %43 = load ptr, ptr %dirp.addr, align 8, !dbg !3490
  %d_name35 = getelementptr inbounds %struct.dirent64, ptr %43, i32 0, i32 4, !dbg !3491
  %arrayidx36 = getelementptr inbounds [256 x i8], ptr %d_name35, i64 0, i64 0, !dbg !3490
  store i8 0, ptr %arrayidx36, align 1, !dbg !3492
  %44 = load ptr, ptr %dirp.addr, align 8, !dbg !3493
  %d_off37 = getelementptr inbounds %struct.dirent64, ptr %44, i32 0, i32 1, !dbg !3494
  store i64 4096, ptr %d_off37, align 8, !dbg !3495
  %45 = load ptr, ptr %dirp.addr, align 8, !dbg !3496
  %d_reclen38 = getelementptr inbounds %struct.dirent64, ptr %45, i32 0, i32 2, !dbg !3497
  %46 = load i16, ptr %d_reclen38, align 8, !dbg !3497
  %conv39 = zext i16 %46 to i64, !dbg !3496
  %47 = load i64, ptr %bytes, align 8, !dbg !3498
  %add40 = add nsw i64 %47, %conv39, !dbg !3498
  store i64 %add40, ptr %bytes, align 8, !dbg !3498
  %48 = load i64, ptr %pad, align 8, !dbg !3499
  %49 = load ptr, ptr %f, align 8, !dbg !3500
  %off41 = getelementptr inbounds %struct.exe_file_t.6, ptr %49, i32 0, i32 2, !dbg !3501
  store i64 %48, ptr %off41, align 8, !dbg !3502
  %50 = load i64, ptr %bytes, align 8, !dbg !3503
  %conv42 = trunc i64 %50 to i32, !dbg !3503
  store i32 %conv42, ptr %retval, align 4, !dbg !3504
  br label %return, !dbg !3504

if.else43:                                        ; preds = %if.else
  call void @llvm.dbg.declare(metadata ptr %os_pos, metadata !3505, metadata !DIExpression()), !dbg !3507
  %51 = load ptr, ptr %f, align 8, !dbg !3508
  %off44 = getelementptr inbounds %struct.exe_file_t.6, ptr %51, i32 0, i32 2, !dbg !3509
  %52 = load i64, ptr %off44, align 8, !dbg !3509
  %sub45 = sub nsw i64 %52, 4096, !dbg !3510
  store i64 %sub45, ptr %os_pos, align 8, !dbg !3507
  %53 = load ptr, ptr %dirp.addr, align 8, !dbg !3511
  %54 = load i32, ptr %count.addr, align 4, !dbg !3512
  %conv46 = zext i32 %54 to i64, !dbg !3512
  %55 = call ptr @memset(ptr %53, i32 0, i64 %conv46), !dbg !3513
  call void @llvm.dbg.declare(metadata ptr %s, metadata !3514, metadata !DIExpression()), !dbg !3515
  %56 = load ptr, ptr %f, align 8, !dbg !3516
  %fd47 = getelementptr inbounds %struct.exe_file_t.6, ptr %56, i32 0, i32 0, !dbg !3517
  %57 = load i32, ptr %fd47, align 8, !dbg !3517
  %58 = load i64, ptr %os_pos, align 8, !dbg !3518
  %call48 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %57, i64 noundef %58, i32 noundef 0) #16, !dbg !3519
  store i64 %call48, ptr %s, align 8, !dbg !3515
  %59 = load i64, ptr %s, align 8, !dbg !3520
  %60 = load i64, ptr %s, align 8, !dbg !3521
  %cmp49 = icmp ne i64 %60, -1, !dbg !3521
  br i1 %cmp49, label %if.end53, label %if.else52, !dbg !3524

if.else52:                                        ; preds = %if.else43
  call void @__assert_fail(ptr noundef @.str.13.69, ptr noundef @.str.4.59, i32 noundef 830, ptr noundef @__PRETTY_FUNCTION__.__fd_getdents) #14, !dbg !3521
  unreachable, !dbg !3521

if.end53:                                         ; preds = %if.else43
  call void @llvm.dbg.declare(metadata ptr %res, metadata !3525, metadata !DIExpression()), !dbg !3526
  %61 = load ptr, ptr %f, align 8, !dbg !3527
  %fd54 = getelementptr inbounds %struct.exe_file_t.6, ptr %61, i32 0, i32 0, !dbg !3528
  %62 = load i32, ptr %fd54, align 8, !dbg !3528
  %63 = load ptr, ptr %dirp.addr, align 8, !dbg !3529
  %64 = load i32, ptr %count.addr, align 4, !dbg !3530
  %call55 = call i64 (i64, ...) @syscall(i64 noundef 217, i32 noundef %62, ptr noundef %63, i32 noundef %64) #16, !dbg !3531
  %conv56 = trunc i64 %call55 to i32, !dbg !3531
  store i32 %conv56, ptr %res, align 4, !dbg !3526
  %65 = load i32, ptr %res, align 4, !dbg !3532
  %cmp57 = icmp sgt i32 %65, -1, !dbg !3534
  br i1 %cmp57, label %if.then59, label %if.end78, !dbg !3535

if.then59:                                        ; preds = %if.end53
  call void @llvm.dbg.declare(metadata ptr %pos, metadata !3536, metadata !DIExpression()), !dbg !3538
  store i32 0, ptr %pos, align 4, !dbg !3538
  %66 = load ptr, ptr %f, align 8, !dbg !3539
  %fd60 = getelementptr inbounds %struct.exe_file_t.6, ptr %66, i32 0, i32 0, !dbg !3540
  %67 = load i32, ptr %fd60, align 8, !dbg !3540
  %call61 = call i64 (i64, ...) @syscall(i64 noundef 8, i32 noundef %67, i32 noundef 0, i32 noundef 1) #16, !dbg !3541
  %68 = load ptr, ptr %f, align 8, !dbg !3542
  %off62 = getelementptr inbounds %struct.exe_file_t.6, ptr %68, i32 0, i32 2, !dbg !3543
  store i64 %call61, ptr %off62, align 8, !dbg !3544
  %69 = load ptr, ptr %f, align 8, !dbg !3545
  %off63 = getelementptr inbounds %struct.exe_file_t.6, ptr %69, i32 0, i32 2, !dbg !3545
  %70 = load i64, ptr %off63, align 8, !dbg !3545
  %cmp64 = icmp ne i64 %70, -1, !dbg !3545
  br i1 %cmp64, label %if.end68, label %if.else67, !dbg !3548

if.else67:                                        ; preds = %if.then59
  call void @__assert_fail(ptr noundef @.str.14.70, ptr noundef @.str.4.59, i32 noundef 835, ptr noundef @__PRETTY_FUNCTION__.__fd_getdents) #14, !dbg !3545
  unreachable, !dbg !3545

if.end68:                                         ; preds = %if.then59
  %71 = load ptr, ptr %f, align 8, !dbg !3549
  %off69 = getelementptr inbounds %struct.exe_file_t.6, ptr %71, i32 0, i32 2, !dbg !3550
  %72 = load i64, ptr %off69, align 8, !dbg !3551
  %add70 = add nsw i64 %72, 4096, !dbg !3551
  store i64 %add70, ptr %off69, align 8, !dbg !3551
  br label %while.cond, !dbg !3552

while.cond:                                       ; preds = %while.body, %if.end68
  %73 = load i32, ptr %pos, align 4, !dbg !3553
  %74 = load i32, ptr %res, align 4, !dbg !3554
  %cmp71 = icmp slt i32 %73, %74, !dbg !3555
  br i1 %cmp71, label %while.body, label %if.end78, !dbg !3552

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata ptr %dp, metadata !3556, metadata !DIExpression()), !dbg !3558
  %75 = load ptr, ptr %dirp.addr, align 8, !dbg !3559
  %76 = load i32, ptr %pos, align 4, !dbg !3560
  %idx.ext = sext i32 %76 to i64, !dbg !3561
  %add.ptr = getelementptr inbounds i8, ptr %75, i64 %idx.ext, !dbg !3561
  store ptr %add.ptr, ptr %dp, align 8, !dbg !3558
  %77 = load ptr, ptr %dp, align 8, !dbg !3562
  %d_off73 = getelementptr inbounds %struct.dirent64, ptr %77, i32 0, i32 1, !dbg !3563
  %78 = load i64, ptr %d_off73, align 8, !dbg !3564
  %add74 = add nsw i64 %78, 4096, !dbg !3564
  store i64 %add74, ptr %d_off73, align 8, !dbg !3564
  %79 = load ptr, ptr %dp, align 8, !dbg !3565
  %d_reclen75 = getelementptr inbounds %struct.dirent64, ptr %79, i32 0, i32 2, !dbg !3566
  %80 = load i16, ptr %d_reclen75, align 8, !dbg !3566
  %conv76 = zext i16 %80 to i32, !dbg !3565
  %81 = load i32, ptr %pos, align 4, !dbg !3567
  %add77 = add nsw i32 %81, %conv76, !dbg !3567
  store i32 %add77, ptr %pos, align 4, !dbg !3567
  br label %while.cond, !dbg !3552, !llvm.loop !3568

if.end78:                                         ; preds = %while.cond, %if.end53
  %82 = load i32, ptr %res, align 4, !dbg !3570
  store i32 %82, ptr %retval, align 4, !dbg !3571
  br label %return, !dbg !3571

return:                                           ; preds = %if.end78, %for.end, %if.then11, %if.then3, %if.then
  %83 = load i32, ptr %retval, align 4, !dbg !3572
  ret i32 %83, !dbg !3572
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ioctl(i32 noundef %fd, i64 noundef %request, ...) #0 !dbg !3573 {
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
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3576, metadata !DIExpression()), !dbg !3577
  store i64 %request, ptr %request.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %request.addr, metadata !3578, metadata !DIExpression()), !dbg !3579
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3580, metadata !DIExpression()), !dbg !3581
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3582
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3583
  store ptr %call, ptr %f, align 8, !dbg !3581
  call void @llvm.dbg.declare(metadata ptr %ap, metadata !3584, metadata !DIExpression()), !dbg !3600
  call void @llvm.dbg.declare(metadata ptr %buf, metadata !3601, metadata !DIExpression()), !dbg !3602
  %1 = load ptr, ptr %f, align 8, !dbg !3603
  %tobool = icmp ne ptr %1, null, !dbg !3603
  br i1 %tobool, label %if.end, label %if.then, !dbg !3605

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3606
  store i32 9, ptr %call1, align 4, !dbg !3608
  store i32 -1, ptr %retval, align 4, !dbg !3609
  br label %return, !dbg !3609

if.end:                                           ; preds = %entry
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3610
  call void @llvm.va_start(ptr %arraydecay), !dbg !3610
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3611
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay2, i32 0, i32 0, !dbg !3611
  %gp_offset = load i32, ptr %gp_offset_p, align 16, !dbg !3611
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !3611
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !3611

vaarg.in_reg:                                     ; preds = %if.end
  %2 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay2, i32 0, i32 3, !dbg !3611
  %reg_save_area = load ptr, ptr %2, align 16, !dbg !3611
  %3 = getelementptr i8, ptr %reg_save_area, i32 %gp_offset, !dbg !3611
  %4 = add i32 %gp_offset, 8, !dbg !3611
  store i32 %4, ptr %gp_offset_p, align 16, !dbg !3611
  br label %vaarg.end, !dbg !3611

vaarg.in_mem:                                     ; preds = %if.end
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay2, i32 0, i32 2, !dbg !3611
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8, !dbg !3611
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8, !dbg !3611
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8, !dbg !3611
  br label %vaarg.end, !dbg !3611

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %3, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ], !dbg !3611
  %5 = load ptr, ptr %vaarg.addr, align 8, !dbg !3611
  store ptr %5, ptr %buf, align 8, !dbg !3612
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3613
  call void @llvm.va_end(ptr %arraydecay3), !dbg !3613
  %6 = load ptr, ptr %f, align 8, !dbg !3614
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %6, i32 0, i32 3, !dbg !3616
  %7 = load ptr, ptr %dfile, align 8, !dbg !3616
  %tobool4 = icmp ne ptr %7, null, !dbg !3614
  br i1 %tobool4, label %if.then5, label %if.end101, !dbg !3617

if.then5:                                         ; preds = %vaarg.end
  call void @llvm.dbg.declare(metadata ptr %stat, metadata !3618, metadata !DIExpression()), !dbg !3620
  %8 = load ptr, ptr %f, align 8, !dbg !3621
  %dfile6 = getelementptr inbounds %struct.exe_file_t.6, ptr %8, i32 0, i32 3, !dbg !3622
  %9 = load ptr, ptr %dfile6, align 8, !dbg !3622
  %stat7 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %9, i32 0, i32 2, !dbg !3623
  %10 = load ptr, ptr %stat7, align 8, !dbg !3623
  store ptr %10, ptr %stat, align 8, !dbg !3620
  %11 = load i64, ptr %request.addr, align 8, !dbg !3624
  switch i64 %11, label %sw.default [
    i64 21505, label %sw.bb
    i64 21506, label %sw.bb46
    i64 21507, label %sw.bb53
    i64 21508, label %sw.bb58
    i64 21523, label %sw.bb65
    i64 21524, label %sw.bb72
    i64 21531, label %sw.bb80
    i64 2150657282, label %sw.bb98
  ], !dbg !3625

sw.bb:                                            ; preds = %if.then5
  call void @llvm.dbg.declare(metadata ptr %ts, metadata !3626, metadata !DIExpression()), !dbg !3646
  %12 = load ptr, ptr %buf, align 8, !dbg !3647
  store ptr %12, ptr %ts, align 8, !dbg !3646
  call void @klee_warning_once(ptr noundef @.str.15.71), !dbg !3648
  %13 = load ptr, ptr %stat, align 8, !dbg !3649
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %13, i32 0, i32 3, !dbg !3649
  %14 = load i32, ptr %st_mode, align 8, !dbg !3649
  %and = and i32 %14, 61440, !dbg !3649
  %cmp = icmp eq i32 %and, 8192, !dbg !3649
  br i1 %cmp, label %if.then8, label %if.else, !dbg !3651

if.then8:                                         ; preds = %sw.bb
  %15 = load ptr, ptr %ts, align 8, !dbg !3652
  %c_iflag = getelementptr inbounds %struct.termios, ptr %15, i32 0, i32 0, !dbg !3654
  store i32 27906, ptr %c_iflag, align 4, !dbg !3655
  %16 = load ptr, ptr %ts, align 8, !dbg !3656
  %c_oflag = getelementptr inbounds %struct.termios, ptr %16, i32 0, i32 1, !dbg !3657
  store i32 5, ptr %c_oflag, align 4, !dbg !3658
  %17 = load ptr, ptr %ts, align 8, !dbg !3659
  %c_cflag = getelementptr inbounds %struct.termios, ptr %17, i32 0, i32 2, !dbg !3660
  store i32 1215, ptr %c_cflag, align 4, !dbg !3661
  %18 = load ptr, ptr %ts, align 8, !dbg !3662
  %c_lflag = getelementptr inbounds %struct.termios, ptr %18, i32 0, i32 3, !dbg !3663
  store i32 35287, ptr %c_lflag, align 4, !dbg !3664
  %19 = load ptr, ptr %ts, align 8, !dbg !3665
  %c_line = getelementptr inbounds %struct.termios, ptr %19, i32 0, i32 4, !dbg !3666
  store i8 0, ptr %c_line, align 4, !dbg !3667
  %20 = load ptr, ptr %ts, align 8, !dbg !3668
  %c_cc = getelementptr inbounds %struct.termios, ptr %20, i32 0, i32 5, !dbg !3669
  %arrayidx = getelementptr inbounds [32 x i8], ptr %c_cc, i64 0, i64 0, !dbg !3668
  store i8 3, ptr %arrayidx, align 1, !dbg !3670
  %21 = load ptr, ptr %ts, align 8, !dbg !3671
  %c_cc9 = getelementptr inbounds %struct.termios, ptr %21, i32 0, i32 5, !dbg !3672
  %arrayidx10 = getelementptr inbounds [32 x i8], ptr %c_cc9, i64 0, i64 1, !dbg !3671
  store i8 28, ptr %arrayidx10, align 1, !dbg !3673
  %22 = load ptr, ptr %ts, align 8, !dbg !3674
  %c_cc11 = getelementptr inbounds %struct.termios, ptr %22, i32 0, i32 5, !dbg !3675
  %arrayidx12 = getelementptr inbounds [32 x i8], ptr %c_cc11, i64 0, i64 2, !dbg !3674
  store i8 127, ptr %arrayidx12, align 1, !dbg !3676
  %23 = load ptr, ptr %ts, align 8, !dbg !3677
  %c_cc13 = getelementptr inbounds %struct.termios, ptr %23, i32 0, i32 5, !dbg !3678
  %arrayidx14 = getelementptr inbounds [32 x i8], ptr %c_cc13, i64 0, i64 3, !dbg !3677
  store i8 21, ptr %arrayidx14, align 1, !dbg !3679
  %24 = load ptr, ptr %ts, align 8, !dbg !3680
  %c_cc15 = getelementptr inbounds %struct.termios, ptr %24, i32 0, i32 5, !dbg !3681
  %arrayidx16 = getelementptr inbounds [32 x i8], ptr %c_cc15, i64 0, i64 4, !dbg !3680
  store i8 4, ptr %arrayidx16, align 1, !dbg !3682
  %25 = load ptr, ptr %ts, align 8, !dbg !3683
  %c_cc17 = getelementptr inbounds %struct.termios, ptr %25, i32 0, i32 5, !dbg !3684
  %arrayidx18 = getelementptr inbounds [32 x i8], ptr %c_cc17, i64 0, i64 5, !dbg !3683
  store i8 0, ptr %arrayidx18, align 1, !dbg !3685
  %26 = load ptr, ptr %ts, align 8, !dbg !3686
  %c_cc19 = getelementptr inbounds %struct.termios, ptr %26, i32 0, i32 5, !dbg !3687
  %arrayidx20 = getelementptr inbounds [32 x i8], ptr %c_cc19, i64 0, i64 6, !dbg !3686
  store i8 1, ptr %arrayidx20, align 1, !dbg !3688
  %27 = load ptr, ptr %ts, align 8, !dbg !3689
  %c_cc21 = getelementptr inbounds %struct.termios, ptr %27, i32 0, i32 5, !dbg !3690
  %arrayidx22 = getelementptr inbounds [32 x i8], ptr %c_cc21, i64 0, i64 7, !dbg !3689
  store i8 -1, ptr %arrayidx22, align 1, !dbg !3691
  %28 = load ptr, ptr %ts, align 8, !dbg !3692
  %c_cc23 = getelementptr inbounds %struct.termios, ptr %28, i32 0, i32 5, !dbg !3693
  %arrayidx24 = getelementptr inbounds [32 x i8], ptr %c_cc23, i64 0, i64 8, !dbg !3692
  store i8 17, ptr %arrayidx24, align 1, !dbg !3694
  %29 = load ptr, ptr %ts, align 8, !dbg !3695
  %c_cc25 = getelementptr inbounds %struct.termios, ptr %29, i32 0, i32 5, !dbg !3696
  %arrayidx26 = getelementptr inbounds [32 x i8], ptr %c_cc25, i64 0, i64 9, !dbg !3695
  store i8 19, ptr %arrayidx26, align 1, !dbg !3697
  %30 = load ptr, ptr %ts, align 8, !dbg !3698
  %c_cc27 = getelementptr inbounds %struct.termios, ptr %30, i32 0, i32 5, !dbg !3699
  %arrayidx28 = getelementptr inbounds [32 x i8], ptr %c_cc27, i64 0, i64 10, !dbg !3698
  store i8 26, ptr %arrayidx28, align 1, !dbg !3700
  %31 = load ptr, ptr %ts, align 8, !dbg !3701
  %c_cc29 = getelementptr inbounds %struct.termios, ptr %31, i32 0, i32 5, !dbg !3702
  %arrayidx30 = getelementptr inbounds [32 x i8], ptr %c_cc29, i64 0, i64 11, !dbg !3701
  store i8 -1, ptr %arrayidx30, align 1, !dbg !3703
  %32 = load ptr, ptr %ts, align 8, !dbg !3704
  %c_cc31 = getelementptr inbounds %struct.termios, ptr %32, i32 0, i32 5, !dbg !3705
  %arrayidx32 = getelementptr inbounds [32 x i8], ptr %c_cc31, i64 0, i64 12, !dbg !3704
  store i8 18, ptr %arrayidx32, align 1, !dbg !3706
  %33 = load ptr, ptr %ts, align 8, !dbg !3707
  %c_cc33 = getelementptr inbounds %struct.termios, ptr %33, i32 0, i32 5, !dbg !3708
  %arrayidx34 = getelementptr inbounds [32 x i8], ptr %c_cc33, i64 0, i64 13, !dbg !3707
  store i8 15, ptr %arrayidx34, align 1, !dbg !3709
  %34 = load ptr, ptr %ts, align 8, !dbg !3710
  %c_cc35 = getelementptr inbounds %struct.termios, ptr %34, i32 0, i32 5, !dbg !3711
  %arrayidx36 = getelementptr inbounds [32 x i8], ptr %c_cc35, i64 0, i64 14, !dbg !3710
  store i8 23, ptr %arrayidx36, align 1, !dbg !3712
  %35 = load ptr, ptr %ts, align 8, !dbg !3713
  %c_cc37 = getelementptr inbounds %struct.termios, ptr %35, i32 0, i32 5, !dbg !3714
  %arrayidx38 = getelementptr inbounds [32 x i8], ptr %c_cc37, i64 0, i64 15, !dbg !3713
  store i8 22, ptr %arrayidx38, align 1, !dbg !3715
  %36 = load ptr, ptr %ts, align 8, !dbg !3716
  %c_cc39 = getelementptr inbounds %struct.termios, ptr %36, i32 0, i32 5, !dbg !3717
  %arrayidx40 = getelementptr inbounds [32 x i8], ptr %c_cc39, i64 0, i64 16, !dbg !3716
  store i8 -1, ptr %arrayidx40, align 1, !dbg !3718
  %37 = load ptr, ptr %ts, align 8, !dbg !3719
  %c_cc41 = getelementptr inbounds %struct.termios, ptr %37, i32 0, i32 5, !dbg !3720
  %arrayidx42 = getelementptr inbounds [32 x i8], ptr %c_cc41, i64 0, i64 17, !dbg !3719
  store i8 0, ptr %arrayidx42, align 1, !dbg !3721
  %38 = load ptr, ptr %ts, align 8, !dbg !3722
  %c_cc43 = getelementptr inbounds %struct.termios, ptr %38, i32 0, i32 5, !dbg !3723
  %arrayidx44 = getelementptr inbounds [32 x i8], ptr %c_cc43, i64 0, i64 18, !dbg !3722
  store i8 0, ptr %arrayidx44, align 1, !dbg !3724
  store i32 0, ptr %retval, align 4, !dbg !3725
  br label %return, !dbg !3725

if.else:                                          ; preds = %sw.bb
  %call45 = call ptr @__errno_location() #17, !dbg !3726
  store i32 25, ptr %call45, align 4, !dbg !3728
  store i32 -1, ptr %retval, align 4, !dbg !3729
  br label %return, !dbg !3729

sw.bb46:                                          ; preds = %if.then5
  call void @klee_warning_once(ptr noundef @.str.16.72), !dbg !3730
  %39 = load ptr, ptr %stat, align 8, !dbg !3732
  %st_mode47 = getelementptr inbounds %struct.stat64.9, ptr %39, i32 0, i32 3, !dbg !3732
  %40 = load i32, ptr %st_mode47, align 8, !dbg !3732
  %and48 = and i32 %40, 61440, !dbg !3732
  %cmp49 = icmp eq i32 %and48, 8192, !dbg !3732
  br i1 %cmp49, label %if.then50, label %if.else51, !dbg !3734

if.then50:                                        ; preds = %sw.bb46
  store i32 0, ptr %retval, align 4, !dbg !3735
  br label %return, !dbg !3735

if.else51:                                        ; preds = %sw.bb46
  %call52 = call ptr @__errno_location() #17, !dbg !3737
  store i32 25, ptr %call52, align 4, !dbg !3739
  store i32 -1, ptr %retval, align 4, !dbg !3740
  br label %return, !dbg !3740

sw.bb53:                                          ; preds = %if.then5
  call void @klee_warning_once(ptr noundef @.str.17.73), !dbg !3741
  %41 = load i32, ptr %fd.addr, align 4, !dbg !3743
  %cmp54 = icmp eq i32 %41, 0, !dbg !3745
  br i1 %cmp54, label %if.then55, label %if.else56, !dbg !3746

if.then55:                                        ; preds = %sw.bb53
  store i32 0, ptr %retval, align 4, !dbg !3747
  br label %return, !dbg !3747

if.else56:                                        ; preds = %sw.bb53
  %call57 = call ptr @__errno_location() #17, !dbg !3749
  store i32 25, ptr %call57, align 4, !dbg !3751
  store i32 -1, ptr %retval, align 4, !dbg !3752
  br label %return, !dbg !3752

sw.bb58:                                          ; preds = %if.then5
  call void @klee_warning_once(ptr noundef @.str.18.74), !dbg !3753
  %42 = load ptr, ptr %stat, align 8, !dbg !3755
  %st_mode59 = getelementptr inbounds %struct.stat64.9, ptr %42, i32 0, i32 3, !dbg !3755
  %43 = load i32, ptr %st_mode59, align 8, !dbg !3755
  %and60 = and i32 %43, 61440, !dbg !3755
  %cmp61 = icmp eq i32 %and60, 8192, !dbg !3755
  br i1 %cmp61, label %if.then62, label %if.else63, !dbg !3757

if.then62:                                        ; preds = %sw.bb58
  store i32 0, ptr %retval, align 4, !dbg !3758
  br label %return, !dbg !3758

if.else63:                                        ; preds = %sw.bb58
  %call64 = call ptr @__errno_location() #17, !dbg !3760
  store i32 25, ptr %call64, align 4, !dbg !3762
  store i32 -1, ptr %retval, align 4, !dbg !3763
  br label %return, !dbg !3763

sw.bb65:                                          ; preds = %if.then5
  call void @llvm.dbg.declare(metadata ptr %ws, metadata !3764, metadata !DIExpression()), !dbg !3774
  %44 = load ptr, ptr %buf, align 8, !dbg !3775
  store ptr %44, ptr %ws, align 8, !dbg !3774
  %45 = load ptr, ptr %ws, align 8, !dbg !3776
  %ws_row = getelementptr inbounds %struct.winsize, ptr %45, i32 0, i32 0, !dbg !3777
  store i16 24, ptr %ws_row, align 2, !dbg !3778
  %46 = load ptr, ptr %ws, align 8, !dbg !3779
  %ws_col = getelementptr inbounds %struct.winsize, ptr %46, i32 0, i32 1, !dbg !3780
  store i16 80, ptr %ws_col, align 2, !dbg !3781
  call void @klee_warning_once(ptr noundef @.str.19.75), !dbg !3782
  %47 = load ptr, ptr %stat, align 8, !dbg !3783
  %st_mode66 = getelementptr inbounds %struct.stat64.9, ptr %47, i32 0, i32 3, !dbg !3783
  %48 = load i32, ptr %st_mode66, align 8, !dbg !3783
  %and67 = and i32 %48, 61440, !dbg !3783
  %cmp68 = icmp eq i32 %and67, 8192, !dbg !3783
  br i1 %cmp68, label %if.then69, label %if.else70, !dbg !3785

if.then69:                                        ; preds = %sw.bb65
  store i32 0, ptr %retval, align 4, !dbg !3786
  br label %return, !dbg !3786

if.else70:                                        ; preds = %sw.bb65
  %call71 = call ptr @__errno_location() #17, !dbg !3788
  store i32 25, ptr %call71, align 4, !dbg !3790
  store i32 -1, ptr %retval, align 4, !dbg !3791
  br label %return, !dbg !3791

sw.bb72:                                          ; preds = %if.then5
  call void @klee_warning_once(ptr noundef @.str.20.76), !dbg !3792
  %49 = load ptr, ptr %stat, align 8, !dbg !3794
  %st_mode73 = getelementptr inbounds %struct.stat64.9, ptr %49, i32 0, i32 3, !dbg !3794
  %50 = load i32, ptr %st_mode73, align 8, !dbg !3794
  %and74 = and i32 %50, 61440, !dbg !3794
  %cmp75 = icmp eq i32 %and74, 8192, !dbg !3794
  br i1 %cmp75, label %if.then76, label %if.else78, !dbg !3796

if.then76:                                        ; preds = %sw.bb72
  %call77 = call ptr @__errno_location() #17, !dbg !3797
  store i32 22, ptr %call77, align 4, !dbg !3799
  store i32 -1, ptr %retval, align 4, !dbg !3800
  br label %return, !dbg !3800

if.else78:                                        ; preds = %sw.bb72
  %call79 = call ptr @__errno_location() #17, !dbg !3801
  store i32 25, ptr %call79, align 4, !dbg !3803
  store i32 -1, ptr %retval, align 4, !dbg !3804
  br label %return, !dbg !3804

sw.bb80:                                          ; preds = %if.then5
  call void @llvm.dbg.declare(metadata ptr %res, metadata !3805, metadata !DIExpression()), !dbg !3807
  %51 = load ptr, ptr %buf, align 8, !dbg !3808
  store ptr %51, ptr %res, align 8, !dbg !3807
  call void @klee_warning_once(ptr noundef @.str.21.77), !dbg !3809
  %52 = load ptr, ptr %stat, align 8, !dbg !3810
  %st_mode81 = getelementptr inbounds %struct.stat64.9, ptr %52, i32 0, i32 3, !dbg !3810
  %53 = load i32, ptr %st_mode81, align 8, !dbg !3810
  %and82 = and i32 %53, 61440, !dbg !3810
  %cmp83 = icmp eq i32 %and82, 8192, !dbg !3810
  br i1 %cmp83, label %if.then84, label %if.else96, !dbg !3812

if.then84:                                        ; preds = %sw.bb80
  %54 = load ptr, ptr %f, align 8, !dbg !3813
  %off = getelementptr inbounds %struct.exe_file_t.6, ptr %54, i32 0, i32 2, !dbg !3816
  %55 = load i64, ptr %off, align 8, !dbg !3816
  %56 = load ptr, ptr %f, align 8, !dbg !3817
  %dfile85 = getelementptr inbounds %struct.exe_file_t.6, ptr %56, i32 0, i32 3, !dbg !3818
  %57 = load ptr, ptr %dfile85, align 8, !dbg !3818
  %size = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %57, i32 0, i32 0, !dbg !3819
  %58 = load i32, ptr %size, align 8, !dbg !3819
  %conv = zext i32 %58 to i64, !dbg !3820
  %cmp86 = icmp slt i64 %55, %conv, !dbg !3821
  br i1 %cmp86, label %if.then88, label %if.else94, !dbg !3822

if.then88:                                        ; preds = %if.then84
  %59 = load ptr, ptr %f, align 8, !dbg !3823
  %dfile89 = getelementptr inbounds %struct.exe_file_t.6, ptr %59, i32 0, i32 3, !dbg !3825
  %60 = load ptr, ptr %dfile89, align 8, !dbg !3825
  %size90 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %60, i32 0, i32 0, !dbg !3826
  %61 = load i32, ptr %size90, align 8, !dbg !3826
  %conv91 = zext i32 %61 to i64, !dbg !3823
  %62 = load ptr, ptr %f, align 8, !dbg !3827
  %off92 = getelementptr inbounds %struct.exe_file_t.6, ptr %62, i32 0, i32 2, !dbg !3828
  %63 = load i64, ptr %off92, align 8, !dbg !3828
  %sub = sub nsw i64 %conv91, %63, !dbg !3829
  %conv93 = trunc i64 %sub to i32, !dbg !3823
  %64 = load ptr, ptr %res, align 8, !dbg !3830
  store i32 %conv93, ptr %64, align 4, !dbg !3831
  br label %if.end95, !dbg !3832

if.else94:                                        ; preds = %if.then84
  %65 = load ptr, ptr %res, align 8, !dbg !3833
  store i32 0, ptr %65, align 4, !dbg !3835
  br label %if.end95

if.end95:                                         ; preds = %if.else94, %if.then88
  store i32 0, ptr %retval, align 4, !dbg !3836
  br label %return, !dbg !3836

if.else96:                                        ; preds = %sw.bb80
  %call97 = call ptr @__errno_location() #17, !dbg !3837
  store i32 25, ptr %call97, align 4, !dbg !3839
  store i32 -1, ptr %retval, align 4, !dbg !3840
  br label %return, !dbg !3840

sw.bb98:                                          ; preds = %if.then5
  call void @klee_warning(ptr noundef @.str.22.78), !dbg !3841
  %call99 = call ptr @__errno_location() #17, !dbg !3843
  store i32 22, ptr %call99, align 4, !dbg !3844
  store i32 -1, ptr %retval, align 4, !dbg !3845
  br label %return, !dbg !3845

sw.default:                                       ; preds = %if.then5
  call void @klee_warning(ptr noundef @.str.12.68), !dbg !3846
  %call100 = call ptr @__errno_location() #17, !dbg !3847
  store i32 22, ptr %call100, align 4, !dbg !3848
  store i32 -1, ptr %retval, align 4, !dbg !3849
  br label %return, !dbg !3849

if.end101:                                        ; preds = %vaarg.end
  %66 = load ptr, ptr %f, align 8, !dbg !3850
  %fd102 = getelementptr inbounds %struct.exe_file_t.6, ptr %66, i32 0, i32 0, !dbg !3851
  %67 = load i32, ptr %fd102, align 8, !dbg !3851
  %68 = load i64, ptr %request.addr, align 8, !dbg !3852
  %69 = load ptr, ptr %buf, align 8, !dbg !3853
  %call103 = call i64 (i64, ...) @syscall(i64 noundef 16, i32 noundef %67, i64 noundef %68, ptr noundef %69) #16, !dbg !3854
  %conv104 = trunc i64 %call103 to i32, !dbg !3854
  store i32 %conv104, ptr %retval, align 4, !dbg !3855
  br label %return, !dbg !3855

return:                                           ; preds = %if.end101, %sw.default, %sw.bb98, %if.else96, %if.end95, %if.else78, %if.then76, %if.else70, %if.then69, %if.else63, %if.then62, %if.else56, %if.then55, %if.else51, %if.then50, %if.else, %if.then8, %if.then
  %70 = load i32, ptr %retval, align 4, !dbg !3856
  ret i32 %70, !dbg !3856
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #11

declare void @klee_warning_once(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fcntl(i32 noundef %fd, i32 noundef %cmd, ...) #0 !dbg !3857 {
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
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !3860, metadata !DIExpression()), !dbg !3861
  store i32 %cmd, ptr %cmd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %cmd.addr, metadata !3862, metadata !DIExpression()), !dbg !3863
  call void @llvm.dbg.declare(metadata ptr %f, metadata !3864, metadata !DIExpression()), !dbg !3865
  %0 = load i32, ptr %fd.addr, align 4, !dbg !3866
  %call = call ptr @__get_file(i32 noundef %0), !dbg !3867
  store ptr %call, ptr %f, align 8, !dbg !3865
  call void @llvm.dbg.declare(metadata ptr %ap, metadata !3868, metadata !DIExpression()), !dbg !3869
  call void @llvm.dbg.declare(metadata ptr %arg, metadata !3870, metadata !DIExpression()), !dbg !3871
  call void @llvm.dbg.declare(metadata ptr %lock, metadata !3872, metadata !DIExpression()), !dbg !3884
  %1 = load ptr, ptr %f, align 8, !dbg !3885
  %tobool = icmp ne ptr %1, null, !dbg !3885
  br i1 %tobool, label %if.end, label %if.then, !dbg !3887

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !3888
  store i32 9, ptr %call1, align 4, !dbg !3890
  store i32 -1, ptr %retval, align 4, !dbg !3891
  br label %return, !dbg !3891

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %cmd.addr, align 4, !dbg !3892
  %cmp = icmp eq i32 %2, 1, !dbg !3894
  %3 = load i32, ptr %cmd.addr, align 4
  %cmp2 = icmp eq i32 %3, 3
  %or.cond = select i1 %cmp, i1 true, i1 %cmp2, !dbg !3895
  %4 = load i32, ptr %cmd.addr, align 4
  %cmp4 = icmp eq i32 %4, 9
  %or.cond1 = select i1 %or.cond, i1 true, i1 %cmp4, !dbg !3895
  %5 = load i32, ptr %cmd.addr, align 4
  %cmp6 = icmp eq i32 %5, 11
  %or.cond2 = select i1 %or.cond1, i1 true, i1 %cmp6, !dbg !3895
  %6 = load i32, ptr %cmd.addr, align 4
  %cmp8 = icmp eq i32 %6, 1025
  %or.cond3 = select i1 %or.cond2, i1 true, i1 %cmp8, !dbg !3895
  %7 = load i32, ptr %cmd.addr, align 4
  %cmp10 = icmp eq i32 %7, 1026
  %or.cond4 = select i1 %or.cond3, i1 true, i1 %cmp10, !dbg !3895
  br i1 %or.cond4, label %if.then11, label %if.else, !dbg !3895

if.then11:                                        ; preds = %if.end
  store i32 0, ptr %arg, align 4, !dbg !3896
  br label %if.end36, !dbg !3898

if.else:                                          ; preds = %if.end
  %8 = load i32, ptr %cmd.addr, align 4, !dbg !3899
  %cmp12 = icmp eq i32 %8, 5, !dbg !3901
  %9 = load i32, ptr %cmd.addr, align 4
  %cmp14 = icmp eq i32 %9, 6
  %or.cond5 = select i1 %cmp12, i1 true, i1 %cmp14, !dbg !3902
  %10 = load i32, ptr %cmd.addr, align 4
  %cmp16 = icmp eq i32 %10, 7
  %or.cond6 = select i1 %or.cond5, i1 true, i1 %cmp16, !dbg !3902
  br i1 %or.cond6, label %if.then17, label %if.else20, !dbg !3902

if.then17:                                        ; preds = %if.else
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3903
  call void @llvm.va_start(ptr %arraydecay), !dbg !3903
  %arraydecay18 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3905
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay18, i32 0, i32 0, !dbg !3905
  %gp_offset = load i32, ptr %gp_offset_p, align 16, !dbg !3905
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !3905
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !3905

vaarg.in_reg:                                     ; preds = %if.then17
  %11 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay18, i32 0, i32 3, !dbg !3905
  %reg_save_area = load ptr, ptr %11, align 16, !dbg !3905
  %12 = getelementptr i8, ptr %reg_save_area, i32 %gp_offset, !dbg !3905
  %13 = add i32 %gp_offset, 8, !dbg !3905
  store i32 %13, ptr %gp_offset_p, align 16, !dbg !3905
  br label %vaarg.end, !dbg !3905

vaarg.in_mem:                                     ; preds = %if.then17
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay18, i32 0, i32 2, !dbg !3905
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8, !dbg !3905
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8, !dbg !3905
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8, !dbg !3905
  br label %vaarg.end, !dbg !3905

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %12, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ], !dbg !3905
  %14 = load ptr, ptr %vaarg.addr, align 8, !dbg !3905
  store ptr %14, ptr %lock, align 8, !dbg !3906
  %arraydecay19 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3907
  call void @llvm.va_end(ptr %arraydecay19), !dbg !3907
  br label %if.end36, !dbg !3908

if.else20:                                        ; preds = %if.else
  %arraydecay21 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3909
  call void @llvm.va_start(ptr %arraydecay21), !dbg !3909
  %arraydecay22 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3911
  %gp_offset_p23 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay22, i32 0, i32 0, !dbg !3911
  %gp_offset24 = load i32, ptr %gp_offset_p23, align 16, !dbg !3911
  %fits_in_gp25 = icmp ule i32 %gp_offset24, 40, !dbg !3911
  br i1 %fits_in_gp25, label %vaarg.in_reg26, label %vaarg.in_mem28, !dbg !3911

vaarg.in_reg26:                                   ; preds = %if.else20
  %15 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay22, i32 0, i32 3, !dbg !3911
  %reg_save_area27 = load ptr, ptr %15, align 16, !dbg !3911
  %16 = getelementptr i8, ptr %reg_save_area27, i32 %gp_offset24, !dbg !3911
  %17 = add i32 %gp_offset24, 8, !dbg !3911
  store i32 %17, ptr %gp_offset_p23, align 16, !dbg !3911
  br label %vaarg.end32, !dbg !3911

vaarg.in_mem28:                                   ; preds = %if.else20
  %overflow_arg_area_p29 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay22, i32 0, i32 2, !dbg !3911
  %overflow_arg_area30 = load ptr, ptr %overflow_arg_area_p29, align 8, !dbg !3911
  %overflow_arg_area.next31 = getelementptr i8, ptr %overflow_arg_area30, i32 8, !dbg !3911
  store ptr %overflow_arg_area.next31, ptr %overflow_arg_area_p29, align 8, !dbg !3911
  br label %vaarg.end32, !dbg !3911

vaarg.end32:                                      ; preds = %vaarg.in_mem28, %vaarg.in_reg26
  %vaarg.addr33 = phi ptr [ %16, %vaarg.in_reg26 ], [ %overflow_arg_area30, %vaarg.in_mem28 ], !dbg !3911
  %18 = load i32, ptr %vaarg.addr33, align 4, !dbg !3911
  store i32 %18, ptr %arg, align 4, !dbg !3912
  %arraydecay34 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !3913
  call void @llvm.va_end(ptr %arraydecay34), !dbg !3913
  br label %if.end36

if.end36:                                         ; preds = %vaarg.end, %vaarg.end32, %if.then11
  %19 = load ptr, ptr %f, align 8, !dbg !3914
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %19, i32 0, i32 3, !dbg !3916
  %20 = load ptr, ptr %dfile, align 8, !dbg !3916
  %tobool37 = icmp ne ptr %20, null, !dbg !3914
  br i1 %tobool37, label %if.then38, label %if.end56, !dbg !3917

if.then38:                                        ; preds = %if.end36
  %21 = load i32, ptr %cmd.addr, align 4, !dbg !3918
  switch i32 %21, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb43
    i32 3, label %sw.bb52
    i32 5, label %sw.bb53
    i32 6, label %sw.bb54
  ], !dbg !3920

sw.bb:                                            ; preds = %if.then38
  call void @llvm.dbg.declare(metadata ptr %flags, metadata !3921, metadata !DIExpression()), !dbg !3924
  store i32 0, ptr %flags, align 4, !dbg !3924
  %22 = load ptr, ptr %f, align 8, !dbg !3925
  %flags39 = getelementptr inbounds %struct.exe_file_t.6, ptr %22, i32 0, i32 1, !dbg !3927
  %23 = load i32, ptr %flags39, align 4, !dbg !3927
  %and = and i32 %23, 2, !dbg !3928
  %tobool40 = icmp ne i32 %and, 0, !dbg !3928
  br i1 %tobool40, label %if.then41, label %if.end42, !dbg !3929

if.then41:                                        ; preds = %sw.bb
  %24 = load i32, ptr %flags, align 4, !dbg !3930
  %or = or i32 %24, 1, !dbg !3930
  store i32 %or, ptr %flags, align 4, !dbg !3930
  br label %if.end42, !dbg !3931

if.end42:                                         ; preds = %if.then41, %sw.bb
  %25 = load i32, ptr %flags, align 4, !dbg !3932
  store i32 %25, ptr %retval, align 4, !dbg !3933
  br label %return, !dbg !3933

sw.bb43:                                          ; preds = %if.then38
  %26 = load ptr, ptr %f, align 8, !dbg !3934
  %flags44 = getelementptr inbounds %struct.exe_file_t.6, ptr %26, i32 0, i32 1, !dbg !3936
  %27 = load i32, ptr %flags44, align 4, !dbg !3937
  %and45 = and i32 %27, -3, !dbg !3937
  store i32 %and45, ptr %flags44, align 4, !dbg !3937
  %28 = load i32, ptr %arg, align 4, !dbg !3938
  %and46 = and i32 %28, 1, !dbg !3940
  %tobool47 = icmp ne i32 %and46, 0, !dbg !3940
  br i1 %tobool47, label %if.then48, label %if.end51, !dbg !3941

if.then48:                                        ; preds = %sw.bb43
  %29 = load ptr, ptr %f, align 8, !dbg !3942
  %flags49 = getelementptr inbounds %struct.exe_file_t.6, ptr %29, i32 0, i32 1, !dbg !3943
  %30 = load i32, ptr %flags49, align 4, !dbg !3944
  %or50 = or i32 %30, 2, !dbg !3944
  store i32 %or50, ptr %flags49, align 4, !dbg !3944
  br label %if.end51, !dbg !3942

if.end51:                                         ; preds = %if.then48, %sw.bb43
  store i32 0, ptr %retval, align 4, !dbg !3945
  br label %return, !dbg !3945

sw.bb52:                                          ; preds = %if.then38
  store i32 0, ptr %retval, align 4, !dbg !3946
  br label %return, !dbg !3946

sw.bb53:                                          ; preds = %if.then38
  %31 = load ptr, ptr %lock, align 8, !dbg !3948
  %l_type = getelementptr inbounds %struct.flock, ptr %31, i32 0, i32 0, !dbg !3950
  store i16 2, ptr %l_type, align 8, !dbg !3951
  store i32 0, ptr %retval, align 4, !dbg !3952
  br label %return, !dbg !3952

sw.bb54:                                          ; preds = %if.then38
  store i32 0, ptr %retval, align 4, !dbg !3953
  br label %return, !dbg !3953

sw.default:                                       ; preds = %if.then38
  call void @klee_warning(ptr noundef @.str.12.68), !dbg !3955
  %call55 = call ptr @__errno_location() #17, !dbg !3956
  store i32 22, ptr %call55, align 4, !dbg !3957
  store i32 -1, ptr %retval, align 4, !dbg !3958
  br label %return, !dbg !3958

if.end56:                                         ; preds = %if.end36
  %32 = load ptr, ptr %f, align 8, !dbg !3959
  %fd57 = getelementptr inbounds %struct.exe_file_t.6, ptr %32, i32 0, i32 0, !dbg !3960
  %33 = load i32, ptr %fd57, align 8, !dbg !3960
  %34 = load i32, ptr %cmd.addr, align 4, !dbg !3961
  %35 = load i32, ptr %arg, align 4, !dbg !3962
  %call58 = call i64 (i64, ...) @syscall(i64 noundef 72, i32 noundef %33, i32 noundef %34, i32 noundef %35) #16, !dbg !3963
  %conv = trunc i64 %call58 to i32, !dbg !3963
  store i32 %conv, ptr %retval, align 4, !dbg !3964
  br label %return, !dbg !3964

return:                                           ; preds = %if.end56, %sw.default, %sw.bb54, %sw.bb53, %sw.bb52, %if.end51, %if.end42, %if.then
  %36 = load i32, ptr %retval, align 4, !dbg !3965
  ret i32 %36, !dbg !3965
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fd_statfs(ptr noundef %path, ptr noundef %buf) #0 !dbg !3966 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !3996, metadata !DIExpression()), !dbg !3997
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !3998, metadata !DIExpression()), !dbg !3999
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !4000, metadata !DIExpression()), !dbg !4001
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4002
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !4003
  store ptr %call, ptr %dfile, align 8, !dbg !4001
  %1 = load ptr, ptr %dfile, align 8, !dbg !4004
  %tobool = icmp ne ptr %1, null, !dbg !4004
  br i1 %tobool, label %if.then, label %if.end, !dbg !4006

if.then:                                          ; preds = %entry
  call void @klee_warning(ptr noundef @.str.10.65), !dbg !4007
  %call1 = call ptr @__errno_location() #17, !dbg !4009
  store i32 2, ptr %call1, align 4, !dbg !4010
  store i32 -1, ptr %retval, align 4, !dbg !4011
  br label %return, !dbg !4011

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %path.addr, align 8, !dbg !4012
  %call2 = call ptr @__concretize_string(ptr noundef %2), !dbg !4013
  %3 = load ptr, ptr %buf.addr, align 8, !dbg !4014
  %call3 = call i64 (i64, ...) @syscall(i64 noundef 137, ptr noundef %call2, ptr noundef %3) #16, !dbg !4015
  %conv = trunc i64 %call3 to i32, !dbg !4015
  store i32 %conv, ptr %retval, align 4, !dbg !4016
  br label %return, !dbg !4016

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, ptr %retval, align 4, !dbg !4017
  ret i32 %4, !dbg !4017
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fstatfs(i32 noundef %fd, ptr noundef nonnull %buf) #0 !dbg !4018 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4021, metadata !DIExpression()), !dbg !4022
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4023, metadata !DIExpression()), !dbg !4024
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4025, metadata !DIExpression()), !dbg !4026
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4027
  %call = call ptr @__get_file(i32 noundef %0), !dbg !4028
  store ptr %call, ptr %f, align 8, !dbg !4026
  %1 = load ptr, ptr %f, align 8, !dbg !4029
  %tobool = icmp ne ptr %1, null, !dbg !4029
  br i1 %tobool, label %if.end, label %if.then, !dbg !4031

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !4032
  store i32 9, ptr %call1, align 4, !dbg !4034
  store i32 -1, ptr %retval, align 4, !dbg !4035
  br label %return, !dbg !4035

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !4036
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !4038
  %3 = load ptr, ptr %dfile, align 8, !dbg !4038
  %tobool2 = icmp ne ptr %3, null, !dbg !4036
  br i1 %tobool2, label %if.then3, label %if.end5, !dbg !4039

if.then3:                                         ; preds = %if.end
  call void @klee_warning(ptr noundef @.str.23.79), !dbg !4040
  %call4 = call ptr @__errno_location() #17, !dbg !4042
  store i32 9, ptr %call4, align 4, !dbg !4043
  store i32 -1, ptr %retval, align 4, !dbg !4044
  br label %return, !dbg !4044

if.end5:                                          ; preds = %if.end
  %4 = load ptr, ptr %f, align 8, !dbg !4045
  %fd6 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 0, !dbg !4046
  %5 = load i32, ptr %fd6, align 8, !dbg !4046
  %6 = load ptr, ptr %buf.addr, align 8, !dbg !4047
  %call7 = call i64 (i64, ...) @syscall(i64 noundef 138, i32 noundef %5, ptr noundef %6) #16, !dbg !4048
  %conv = trunc i64 %call7 to i32, !dbg !4048
  store i32 %conv, ptr %retval, align 4, !dbg !4049
  br label %return, !dbg !4049

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %7 = load i32, ptr %retval, align 4, !dbg !4050
  ret i32 %7, !dbg !4050
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fsync(i32 noundef %fd) #0 !dbg !4051 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4052, metadata !DIExpression()), !dbg !4053
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4054, metadata !DIExpression()), !dbg !4055
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4056
  %call = call ptr @__get_file(i32 noundef %0), !dbg !4057
  store ptr %call, ptr %f, align 8, !dbg !4055
  %1 = load ptr, ptr %f, align 8, !dbg !4058
  %tobool = icmp ne ptr %1, null, !dbg !4058
  br i1 %tobool, label %if.else, label %if.then, !dbg !4060

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !4061
  store i32 9, ptr %call1, align 4, !dbg !4063
  store i32 -1, ptr %retval, align 4, !dbg !4064
  br label %return, !dbg !4064

if.else:                                          ; preds = %entry
  %2 = load ptr, ptr %f, align 8, !dbg !4065
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %2, i32 0, i32 3, !dbg !4067
  %3 = load ptr, ptr %dfile, align 8, !dbg !4067
  %tobool2 = icmp ne ptr %3, null, !dbg !4065
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !4068

if.then3:                                         ; preds = %if.else
  store i32 0, ptr %retval, align 4, !dbg !4069
  br label %return, !dbg !4069

if.end4:                                          ; preds = %if.else
  %4 = load ptr, ptr %f, align 8, !dbg !4071
  %fd5 = getelementptr inbounds %struct.exe_file_t.6, ptr %4, i32 0, i32 0, !dbg !4072
  %5 = load i32, ptr %fd5, align 8, !dbg !4072
  %call6 = call i64 (i64, ...) @syscall(i64 noundef 74, i32 noundef %5) #16, !dbg !4073
  %conv = trunc i64 %call6 to i32, !dbg !4073
  store i32 %conv, ptr %retval, align 4, !dbg !4074
  br label %return, !dbg !4074

return:                                           ; preds = %if.end4, %if.then3, %if.then
  %6 = load i32, ptr %retval, align 4, !dbg !4075
  ret i32 %6, !dbg !4075
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dup2(i32 noundef %oldfd, i32 noundef %newfd) #0 !dbg !4076 {
entry:
  %retval = alloca i32, align 4
  %oldfd.addr = alloca i32, align 4
  %newfd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %f2 = alloca ptr, align 8
  store i32 %oldfd, ptr %oldfd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %oldfd.addr, metadata !4079, metadata !DIExpression()), !dbg !4080
  store i32 %newfd, ptr %newfd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %newfd.addr, metadata !4081, metadata !DIExpression()), !dbg !4082
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4083, metadata !DIExpression()), !dbg !4084
  %0 = load i32, ptr %oldfd.addr, align 4, !dbg !4085
  %call = call ptr @__get_file(i32 noundef %0), !dbg !4086
  store ptr %call, ptr %f, align 8, !dbg !4084
  %1 = load ptr, ptr %f, align 8, !dbg !4087
  %tobool = icmp ne ptr %1, null, !dbg !4087
  %2 = load i32, ptr %newfd.addr, align 4
  %cmp = icmp sge i32 %2, 0
  %or.cond = select i1 %tobool, i1 %cmp, i1 false, !dbg !4089
  %3 = load i32, ptr %newfd.addr, align 4
  %cmp1 = icmp slt i32 %3, 32
  %or.cond1 = select i1 %or.cond, i1 %cmp1, i1 false, !dbg !4089
  br i1 %or.cond1, label %if.else, label %if.then, !dbg !4089

if.then:                                          ; preds = %entry
  %call2 = call ptr @__errno_location() #17, !dbg !4090
  store i32 9, ptr %call2, align 4, !dbg !4092
  store i32 -1, ptr %retval, align 4, !dbg !4093
  br label %return, !dbg !4093

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %f2, metadata !4094, metadata !DIExpression()), !dbg !4096
  %4 = load i32, ptr %newfd.addr, align 4, !dbg !4097
  %idxprom = sext i32 %4 to i64, !dbg !4098
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !4098
  store ptr %arrayidx, ptr %f2, align 8, !dbg !4096
  %5 = load ptr, ptr %f2, align 8, !dbg !4099
  %flags = getelementptr inbounds %struct.exe_file_t.6, ptr %5, i32 0, i32 1, !dbg !4101
  %6 = load i32, ptr %flags, align 4, !dbg !4101
  %and = and i32 %6, 1, !dbg !4102
  %tobool3 = icmp ne i32 %and, 0, !dbg !4102
  br i1 %tobool3, label %if.then4, label %if.end, !dbg !4103

if.then4:                                         ; preds = %if.else
  %7 = load i32, ptr %newfd.addr, align 4, !dbg !4104
  %call5 = call i32 @close(i32 noundef %7), !dbg !4105
  br label %if.end, !dbg !4105

if.end:                                           ; preds = %if.then4, %if.else
  %8 = load ptr, ptr %f2, align 8, !dbg !4106
  %9 = load ptr, ptr %f, align 8, !dbg !4107
  %10 = call ptr @memcpy(ptr %8, ptr %9, i64 24), !dbg !4108
  %11 = load ptr, ptr %f2, align 8, !dbg !4109
  %flags6 = getelementptr inbounds %struct.exe_file_t.6, ptr %11, i32 0, i32 1, !dbg !4110
  %12 = load i32, ptr %flags6, align 4, !dbg !4111
  %and7 = and i32 %12, -3, !dbg !4111
  store i32 %and7, ptr %flags6, align 4, !dbg !4111
  %13 = load i32, ptr %newfd.addr, align 4, !dbg !4112
  store i32 %13, ptr %retval, align 4, !dbg !4113
  br label %return, !dbg !4113

return:                                           ; preds = %if.end, %if.then
  %14 = load i32, ptr %retval, align 4, !dbg !4114
  ret i32 %14, !dbg !4114
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dup(i32 noundef %oldfd) #0 !dbg !4115 {
entry:
  %retval = alloca i32, align 4
  %oldfd.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %fd = alloca i32, align 4
  store i32 %oldfd, ptr %oldfd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %oldfd.addr, metadata !4116, metadata !DIExpression()), !dbg !4117
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4118, metadata !DIExpression()), !dbg !4119
  %0 = load i32, ptr %oldfd.addr, align 4, !dbg !4120
  %call = call ptr @__get_file(i32 noundef %0), !dbg !4121
  store ptr %call, ptr %f, align 8, !dbg !4119
  %1 = load ptr, ptr %f, align 8, !dbg !4122
  %tobool = icmp ne ptr %1, null, !dbg !4122
  br i1 %tobool, label %if.else, label %if.then, !dbg !4124

if.then:                                          ; preds = %entry
  %call1 = call ptr @__errno_location() #17, !dbg !4125
  store i32 9, ptr %call1, align 4, !dbg !4127
  store i32 -1, ptr %retval, align 4, !dbg !4128
  br label %return, !dbg !4128

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %fd, metadata !4129, metadata !DIExpression()), !dbg !4131
  store i32 0, ptr %fd, align 4, !dbg !4132
  br label %for.cond, !dbg !4134

for.cond:                                         ; preds = %for.inc, %if.else
  %2 = load i32, ptr %fd, align 4, !dbg !4135
  %cmp = icmp slt i32 %2, 32, !dbg !4137
  br i1 %cmp, label %for.body, label %for.end, !dbg !4138

for.body:                                         ; preds = %for.cond
  %3 = load i32, ptr %fd, align 4, !dbg !4139
  %idxprom = sext i32 %3 to i64, !dbg !4141
  %arrayidx = getelementptr inbounds [32 x %struct.exe_file_t.6], ptr @__exe_env, i64 0, i64 %idxprom, !dbg !4141
  %flags = getelementptr inbounds %struct.exe_file_t.6, ptr %arrayidx, i32 0, i32 1, !dbg !4142
  %4 = load i32, ptr %flags, align 4, !dbg !4142
  %and = and i32 %4, 1, !dbg !4143
  %tobool2 = icmp ne i32 %and, 0, !dbg !4143
  br i1 %tobool2, label %for.inc, label %for.end, !dbg !4144

for.inc:                                          ; preds = %for.body
  %5 = load i32, ptr %fd, align 4, !dbg !4145
  %inc = add nsw i32 %5, 1, !dbg !4145
  store i32 %inc, ptr %fd, align 4, !dbg !4145
  br label %for.cond, !dbg !4146, !llvm.loop !4147

for.end:                                          ; preds = %for.body, %for.cond
  %6 = load i32, ptr %fd, align 4, !dbg !4149
  %cmp4 = icmp eq i32 %6, 32, !dbg !4151
  br i1 %cmp4, label %if.then5, label %if.else7, !dbg !4152

if.then5:                                         ; preds = %for.end
  %call6 = call ptr @__errno_location() #17, !dbg !4153
  store i32 24, ptr %call6, align 4, !dbg !4155
  store i32 -1, ptr %retval, align 4, !dbg !4156
  br label %return, !dbg !4156

if.else7:                                         ; preds = %for.end
  %7 = load i32, ptr %oldfd.addr, align 4, !dbg !4157
  %8 = load i32, ptr %fd, align 4, !dbg !4159
  %call8 = call i32 @dup2(i32 noundef %7, i32 noundef %8) #16, !dbg !4160
  store i32 %call8, ptr %retval, align 4, !dbg !4161
  br label %return, !dbg !4161

return:                                           ; preds = %if.else7, %if.then5, %if.then
  %9 = load i32, ptr %retval, align 4, !dbg !4162
  ret i32 %9, !dbg !4162
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rmdir(ptr noundef nonnull %pathname) #0 !dbg !4163 {
entry:
  %retval = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4164, metadata !DIExpression()), !dbg !4165
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !4166, metadata !DIExpression()), !dbg !4167
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !4168
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !4169
  store ptr %call, ptr %dfile, align 8, !dbg !4167
  %1 = load ptr, ptr %dfile, align 8, !dbg !4170
  %tobool = icmp ne ptr %1, null, !dbg !4170
  br i1 %tobool, label %if.then, label %if.end, !dbg !4172

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %dfile, align 8, !dbg !4173
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %2, i32 0, i32 2, !dbg !4173
  %3 = load ptr, ptr %stat, align 8, !dbg !4173
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %3, i32 0, i32 3, !dbg !4173
  %4 = load i32, ptr %st_mode, align 8, !dbg !4173
  %and = and i32 %4, 61440, !dbg !4173
  %cmp = icmp eq i32 %and, 16384, !dbg !4173
  br i1 %cmp, label %if.then1, label %if.else, !dbg !4176

if.then1:                                         ; preds = %if.then
  %5 = load ptr, ptr %dfile, align 8, !dbg !4177
  %stat2 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %5, i32 0, i32 2, !dbg !4179
  %6 = load ptr, ptr %stat2, align 8, !dbg !4179
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %6, i32 0, i32 1, !dbg !4180
  store i64 0, ptr %st_ino, align 8, !dbg !4181
  store i32 0, ptr %retval, align 4, !dbg !4182
  br label %return, !dbg !4182

if.else:                                          ; preds = %if.then
  %call3 = call ptr @__errno_location() #17, !dbg !4183
  store i32 20, ptr %call3, align 4, !dbg !4185
  store i32 -1, ptr %retval, align 4, !dbg !4186
  br label %return, !dbg !4186

if.end:                                           ; preds = %entry
  call void @klee_warning(ptr noundef @.str.24.80), !dbg !4187
  %call4 = call ptr @__errno_location() #17, !dbg !4188
  store i32 1, ptr %call4, align 4, !dbg !4189
  store i32 -1, ptr %retval, align 4, !dbg !4190
  br label %return, !dbg !4190

return:                                           ; preds = %if.end, %if.else, %if.then1
  %7 = load i32, ptr %retval, align 4, !dbg !4191
  ret i32 %7, !dbg !4191
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @unlink(ptr noundef nonnull %pathname) #0 !dbg !4192 {
entry:
  %retval = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %dfile = alloca ptr, align 8
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4193, metadata !DIExpression()), !dbg !4194
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !4195, metadata !DIExpression()), !dbg !4196
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !4197
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !4198
  store ptr %call, ptr %dfile, align 8, !dbg !4196
  %1 = load ptr, ptr %dfile, align 8, !dbg !4199
  %tobool = icmp ne ptr %1, null, !dbg !4199
  br i1 %tobool, label %if.then, label %if.end, !dbg !4201

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %dfile, align 8, !dbg !4202
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %2, i32 0, i32 2, !dbg !4202
  %3 = load ptr, ptr %stat, align 8, !dbg !4202
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %3, i32 0, i32 3, !dbg !4202
  %4 = load i32, ptr %st_mode, align 8, !dbg !4202
  %and = and i32 %4, 61440, !dbg !4202
  %cmp = icmp eq i32 %and, 32768, !dbg !4202
  br i1 %cmp, label %if.then1, label %if.else, !dbg !4205

if.then1:                                         ; preds = %if.then
  %5 = load ptr, ptr %dfile, align 8, !dbg !4206
  %stat2 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %5, i32 0, i32 2, !dbg !4208
  %6 = load ptr, ptr %stat2, align 8, !dbg !4208
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %6, i32 0, i32 1, !dbg !4209
  store i64 0, ptr %st_ino, align 8, !dbg !4210
  store i32 0, ptr %retval, align 4, !dbg !4211
  br label %return, !dbg !4211

if.else:                                          ; preds = %if.then
  %7 = load ptr, ptr %dfile, align 8, !dbg !4212
  %stat3 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %7, i32 0, i32 2, !dbg !4212
  %8 = load ptr, ptr %stat3, align 8, !dbg !4212
  %st_mode4 = getelementptr inbounds %struct.stat64.9, ptr %8, i32 0, i32 3, !dbg !4212
  %9 = load i32, ptr %st_mode4, align 8, !dbg !4212
  %and5 = and i32 %9, 61440, !dbg !4212
  %cmp6 = icmp eq i32 %and5, 16384, !dbg !4212
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !4214

if.then7:                                         ; preds = %if.else
  %call8 = call ptr @__errno_location() #17, !dbg !4215
  store i32 21, ptr %call8, align 4, !dbg !4217
  store i32 -1, ptr %retval, align 4, !dbg !4218
  br label %return, !dbg !4218

if.else9:                                         ; preds = %if.else
  %call10 = call ptr @__errno_location() #17, !dbg !4219
  store i32 1, ptr %call10, align 4, !dbg !4221
  store i32 -1, ptr %retval, align 4, !dbg !4222
  br label %return, !dbg !4222

if.end:                                           ; preds = %entry
  call void @klee_warning(ptr noundef @.str.24.80), !dbg !4223
  %call11 = call ptr @__errno_location() #17, !dbg !4224
  store i32 1, ptr %call11, align 4, !dbg !4225
  store i32 -1, ptr %retval, align 4, !dbg !4226
  br label %return, !dbg !4226

return:                                           ; preds = %if.end, %if.else9, %if.then7, %if.then1
  %10 = load i32, ptr %retval, align 4, !dbg !4227
  ret i32 %10, !dbg !4227
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @unlinkat(i32 noundef %dirfd, ptr noundef nonnull %pathname, i32 noundef %flags) #0 !dbg !4228 {
entry:
  %retval = alloca i32, align 4
  %dirfd.addr = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %dfile = alloca ptr, align 8
  store i32 %dirfd, ptr %dirfd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %dirfd.addr, metadata !4231, metadata !DIExpression()), !dbg !4232
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4233, metadata !DIExpression()), !dbg !4234
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !4235, metadata !DIExpression()), !dbg !4236
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !4237, metadata !DIExpression()), !dbg !4238
  %0 = load ptr, ptr %pathname.addr, align 8, !dbg !4239
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !4240
  store ptr %call, ptr %dfile, align 8, !dbg !4238
  %1 = load ptr, ptr %dfile, align 8, !dbg !4241
  %tobool = icmp ne ptr %1, null, !dbg !4241
  br i1 %tobool, label %if.then, label %if.end, !dbg !4243

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %dfile, align 8, !dbg !4244
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %2, i32 0, i32 2, !dbg !4244
  %3 = load ptr, ptr %stat, align 8, !dbg !4244
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %3, i32 0, i32 3, !dbg !4244
  %4 = load i32, ptr %st_mode, align 8, !dbg !4244
  %and = and i32 %4, 61440, !dbg !4244
  %cmp = icmp eq i32 %and, 32768, !dbg !4244
  br i1 %cmp, label %if.then1, label %if.else, !dbg !4247

if.then1:                                         ; preds = %if.then
  %5 = load ptr, ptr %dfile, align 8, !dbg !4248
  %stat2 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %5, i32 0, i32 2, !dbg !4250
  %6 = load ptr, ptr %stat2, align 8, !dbg !4250
  %st_ino = getelementptr inbounds %struct.stat64.9, ptr %6, i32 0, i32 1, !dbg !4251
  store i64 0, ptr %st_ino, align 8, !dbg !4252
  store i32 0, ptr %retval, align 4, !dbg !4253
  br label %return, !dbg !4253

if.else:                                          ; preds = %if.then
  %7 = load ptr, ptr %dfile, align 8, !dbg !4254
  %stat3 = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %7, i32 0, i32 2, !dbg !4254
  %8 = load ptr, ptr %stat3, align 8, !dbg !4254
  %st_mode4 = getelementptr inbounds %struct.stat64.9, ptr %8, i32 0, i32 3, !dbg !4254
  %9 = load i32, ptr %st_mode4, align 8, !dbg !4254
  %and5 = and i32 %9, 61440, !dbg !4254
  %cmp6 = icmp eq i32 %and5, 16384, !dbg !4254
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !4256

if.then7:                                         ; preds = %if.else
  %call8 = call ptr @__errno_location() #17, !dbg !4257
  store i32 21, ptr %call8, align 4, !dbg !4259
  store i32 -1, ptr %retval, align 4, !dbg !4260
  br label %return, !dbg !4260

if.else9:                                         ; preds = %if.else
  %call10 = call ptr @__errno_location() #17, !dbg !4261
  store i32 1, ptr %call10, align 4, !dbg !4263
  store i32 -1, ptr %retval, align 4, !dbg !4264
  br label %return, !dbg !4264

if.end:                                           ; preds = %entry
  call void @klee_warning(ptr noundef @.str.24.80), !dbg !4265
  %call11 = call ptr @__errno_location() #17, !dbg !4266
  store i32 1, ptr %call11, align 4, !dbg !4267
  store i32 -1, ptr %retval, align 4, !dbg !4268
  br label %return, !dbg !4268

return:                                           ; preds = %if.end, %if.else9, %if.then7, %if.then1
  %10 = load i32, ptr %retval, align 4, !dbg !4269
  ret i32 %10, !dbg !4269
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @readlink(ptr noundef nonnull %path, ptr noundef nonnull %buf, i64 noundef %bufsize) #0 !dbg !4270 {
entry:
  %retval = alloca i64, align 8
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %bufsize.addr = alloca i64, align 8
  %dfile = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4273, metadata !DIExpression()), !dbg !4274
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4275, metadata !DIExpression()), !dbg !4276
  store i64 %bufsize, ptr %bufsize.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %bufsize.addr, metadata !4277, metadata !DIExpression()), !dbg !4278
  call void @llvm.dbg.declare(metadata ptr %dfile, metadata !4279, metadata !DIExpression()), !dbg !4280
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4281
  %call = call ptr @__get_sym_file(ptr noundef %0), !dbg !4282
  store ptr %call, ptr %dfile, align 8, !dbg !4280
  %1 = load ptr, ptr %dfile, align 8, !dbg !4283
  %tobool = icmp ne ptr %1, null, !dbg !4283
  br i1 %tobool, label %if.then, label %if.end20, !dbg !4285

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %dfile, align 8, !dbg !4286
  %stat = getelementptr inbounds %struct.exe_disk_file_t.10, ptr %2, i32 0, i32 2, !dbg !4286
  %3 = load ptr, ptr %stat, align 8, !dbg !4286
  %st_mode = getelementptr inbounds %struct.stat64.9, ptr %3, i32 0, i32 3, !dbg !4286
  %4 = load i32, ptr %st_mode, align 8, !dbg !4286
  %and = and i32 %4, 61440, !dbg !4286
  %cmp = icmp eq i32 %and, 40960, !dbg !4286
  br i1 %cmp, label %if.then1, label %if.else, !dbg !4289

if.then1:                                         ; preds = %if.then
  %5 = load ptr, ptr %path.addr, align 8, !dbg !4290
  %arrayidx = getelementptr inbounds i8, ptr %5, i64 0, !dbg !4290
  %6 = load i8, ptr %arrayidx, align 1, !dbg !4290
  %7 = load ptr, ptr %buf.addr, align 8, !dbg !4292
  %arrayidx2 = getelementptr inbounds i8, ptr %7, i64 0, !dbg !4292
  store i8 %6, ptr %arrayidx2, align 1, !dbg !4293
  %8 = load i64, ptr %bufsize.addr, align 8, !dbg !4294
  %cmp3 = icmp ugt i64 %8, 1, !dbg !4296
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !4297

if.then4:                                         ; preds = %if.then1
  %9 = load ptr, ptr %buf.addr, align 8, !dbg !4298
  %arrayidx5 = getelementptr inbounds i8, ptr %9, i64 1, !dbg !4298
  store i8 46, ptr %arrayidx5, align 1, !dbg !4299
  br label %if.end, !dbg !4298

if.end:                                           ; preds = %if.then4, %if.then1
  %10 = load i64, ptr %bufsize.addr, align 8, !dbg !4300
  %cmp6 = icmp ugt i64 %10, 2, !dbg !4302
  br i1 %cmp6, label %if.then7, label %if.end9, !dbg !4303

if.then7:                                         ; preds = %if.end
  %11 = load ptr, ptr %buf.addr, align 8, !dbg !4304
  %arrayidx8 = getelementptr inbounds i8, ptr %11, i64 2, !dbg !4304
  store i8 108, ptr %arrayidx8, align 1, !dbg !4305
  br label %if.end9, !dbg !4304

if.end9:                                          ; preds = %if.then7, %if.end
  %12 = load i64, ptr %bufsize.addr, align 8, !dbg !4306
  %cmp10 = icmp ugt i64 %12, 3, !dbg !4308
  br i1 %cmp10, label %if.then11, label %if.end13, !dbg !4309

if.then11:                                        ; preds = %if.end9
  %13 = load ptr, ptr %buf.addr, align 8, !dbg !4310
  %arrayidx12 = getelementptr inbounds i8, ptr %13, i64 3, !dbg !4310
  store i8 110, ptr %arrayidx12, align 1, !dbg !4311
  br label %if.end13, !dbg !4310

if.end13:                                         ; preds = %if.then11, %if.end9
  %14 = load i64, ptr %bufsize.addr, align 8, !dbg !4312
  %cmp14 = icmp ugt i64 %14, 4, !dbg !4314
  br i1 %cmp14, label %if.then15, label %if.end17, !dbg !4315

if.then15:                                        ; preds = %if.end13
  %15 = load ptr, ptr %buf.addr, align 8, !dbg !4316
  %arrayidx16 = getelementptr inbounds i8, ptr %15, i64 4, !dbg !4316
  store i8 107, ptr %arrayidx16, align 1, !dbg !4317
  br label %if.end17, !dbg !4316

if.end17:                                         ; preds = %if.then15, %if.end13
  %16 = load i64, ptr %bufsize.addr, align 8, !dbg !4318
  %cmp18 = icmp ugt i64 %16, 5, !dbg !4319
  %17 = load i64, ptr %bufsize.addr, align 8, !dbg !4320
  %cond = select i1 %cmp18, i64 5, i64 %17, !dbg !4320
  store i64 %cond, ptr %retval, align 8, !dbg !4321
  br label %return, !dbg !4321

if.else:                                          ; preds = %if.then
  %call19 = call ptr @__errno_location() #17, !dbg !4322
  store i32 22, ptr %call19, align 4, !dbg !4324
  store i64 -1, ptr %retval, align 8, !dbg !4325
  br label %return, !dbg !4325

if.end20:                                         ; preds = %entry
  %18 = load ptr, ptr %path.addr, align 8, !dbg !4326
  %19 = load ptr, ptr %buf.addr, align 8, !dbg !4327
  %20 = load i64, ptr %bufsize.addr, align 8, !dbg !4328
  %call21 = call i64 (i64, ...) @syscall(i64 noundef 89, ptr noundef %18, ptr noundef %19, i64 noundef %20) #16, !dbg !4329
  store i64 %call21, ptr %retval, align 8, !dbg !4330
  br label %return, !dbg !4330

return:                                           ; preds = %if.end20, %if.else, %if.end17
  %21 = load i64, ptr %retval, align 8, !dbg !4331
  ret i64 %21, !dbg !4331
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @select(i32 noundef %nfds, ptr noundef %read, ptr noundef %write, ptr noundef %except, ptr noundef %timeout) #0 !dbg !4332 {
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
  call void @llvm.dbg.declare(metadata ptr %nfds.addr, metadata !4344, metadata !DIExpression()), !dbg !4345
  store ptr %read, ptr %read.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %read.addr, metadata !4346, metadata !DIExpression()), !dbg !4347
  store ptr %write, ptr %write.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %write.addr, metadata !4348, metadata !DIExpression()), !dbg !4349
  store ptr %except, ptr %except.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %except.addr, metadata !4350, metadata !DIExpression()), !dbg !4351
  store ptr %timeout, ptr %timeout.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %timeout.addr, metadata !4352, metadata !DIExpression()), !dbg !4353
  call void @llvm.dbg.declare(metadata ptr %in_read, metadata !4354, metadata !DIExpression()), !dbg !4355
  call void @llvm.dbg.declare(metadata ptr %in_write, metadata !4356, metadata !DIExpression()), !dbg !4357
  call void @llvm.dbg.declare(metadata ptr %in_except, metadata !4358, metadata !DIExpression()), !dbg !4359
  call void @llvm.dbg.declare(metadata ptr %os_read, metadata !4360, metadata !DIExpression()), !dbg !4361
  call void @llvm.dbg.declare(metadata ptr %os_write, metadata !4362, metadata !DIExpression()), !dbg !4363
  call void @llvm.dbg.declare(metadata ptr %os_except, metadata !4364, metadata !DIExpression()), !dbg !4365
  call void @llvm.dbg.declare(metadata ptr %i, metadata !4366, metadata !DIExpression()), !dbg !4367
  call void @llvm.dbg.declare(metadata ptr %count, metadata !4368, metadata !DIExpression()), !dbg !4369
  store i32 0, ptr %count, align 4, !dbg !4369
  call void @llvm.dbg.declare(metadata ptr %os_nfds, metadata !4370, metadata !DIExpression()), !dbg !4371
  store i32 0, ptr %os_nfds, align 4, !dbg !4371
  %0 = load ptr, ptr %read.addr, align 8, !dbg !4372
  %tobool = icmp ne ptr %0, null, !dbg !4372
  br i1 %tobool, label %if.then, label %if.else, !dbg !4374

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %read.addr, align 8, !dbg !4375
  %2 = call ptr @memcpy(ptr %in_read, ptr %1, i64 128), !dbg !4377
  %3 = load ptr, ptr %read.addr, align 8, !dbg !4378
  %4 = call ptr @memset(ptr %3, i32 0, i64 128), !dbg !4378
  br label %if.end, !dbg !4379

if.else:                                          ; preds = %entry
  %5 = call ptr @memset(ptr %in_read, i32 0, i64 128), !dbg !4380
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load ptr, ptr %write.addr, align 8, !dbg !4382
  %tobool1 = icmp ne ptr %6, null, !dbg !4382
  br i1 %tobool1, label %if.then2, label %if.else3, !dbg !4384

if.then2:                                         ; preds = %if.end
  %7 = load ptr, ptr %write.addr, align 8, !dbg !4385
  %8 = call ptr @memcpy(ptr %in_write, ptr %7, i64 128), !dbg !4387
  %9 = load ptr, ptr %write.addr, align 8, !dbg !4388
  %10 = call ptr @memset(ptr %9, i32 0, i64 128), !dbg !4388
  br label %if.end4, !dbg !4389

if.else3:                                         ; preds = %if.end
  %11 = call ptr @memset(ptr %in_write, i32 0, i64 128), !dbg !4390
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %12 = load ptr, ptr %except.addr, align 8, !dbg !4392
  %tobool5 = icmp ne ptr %12, null, !dbg !4392
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !4394

if.then6:                                         ; preds = %if.end4
  %13 = load ptr, ptr %except.addr, align 8, !dbg !4395
  %14 = call ptr @memcpy(ptr %in_except, ptr %13, i64 128), !dbg !4397
  %15 = load ptr, ptr %except.addr, align 8, !dbg !4398
  %16 = call ptr @memset(ptr %15, i32 0, i64 128), !dbg !4398
  br label %if.end8, !dbg !4399

if.else7:                                         ; preds = %if.end4
  %17 = call ptr @memset(ptr %in_except, i32 0, i64 128), !dbg !4400
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %18 = call ptr @memset(ptr %os_read, i32 0, i64 128), !dbg !4402
  %19 = call ptr @memset(ptr %os_write, i32 0, i64 128), !dbg !4403
  %20 = call ptr @memset(ptr %os_except, i32 0, i64 128), !dbg !4404
  store i32 0, ptr %i, align 4, !dbg !4405
  br label %for.cond, !dbg !4407

for.cond:                                         ; preds = %for.inc, %if.end8
  %21 = load i32, ptr %i, align 4, !dbg !4408
  %22 = load i32, ptr %nfds.addr, align 4, !dbg !4410
  %cmp = icmp slt i32 %21, %22, !dbg !4411
  br i1 %cmp, label %for.body, label %for.end, !dbg !4412

for.body:                                         ; preds = %for.cond
  %fds_bits = getelementptr inbounds %struct.fd_set, ptr %in_read, i32 0, i32 0, !dbg !4413
  %23 = load i32, ptr %i, align 4, !dbg !4413
  %div = sdiv i32 %23, 64, !dbg !4413
  %idxprom = sext i32 %div to i64, !dbg !4413
  %arrayidx = getelementptr inbounds [16 x i64], ptr %fds_bits, i64 0, i64 %idxprom, !dbg !4413
  %24 = load i64, ptr %arrayidx, align 8, !dbg !4413
  %25 = load i32, ptr %i, align 4, !dbg !4413
  %rem = srem i32 %25, 64, !dbg !4413
  %int_cast_to_i64 = zext i32 %rem to i64, !dbg !4413
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4413
  %shl = shl i32 1, %rem, !dbg !4413, !klee.check.shift !4416
  %conv = sext i32 %shl to i64, !dbg !4413
  %and = and i64 %24, %conv, !dbg !4413
  %tobool9 = icmp ne i64 %and, 0, !dbg !4413
  br i1 %tobool9, label %if.then29, label %lor.lhs.false, !dbg !4417

lor.lhs.false:                                    ; preds = %for.body
  %fds_bits10 = getelementptr inbounds %struct.fd_set, ptr %in_write, i32 0, i32 0, !dbg !4418
  %26 = load i32, ptr %i, align 4, !dbg !4418
  %div11 = sdiv i32 %26, 64, !dbg !4418
  %idxprom12 = sext i32 %div11 to i64, !dbg !4418
  %arrayidx13 = getelementptr inbounds [16 x i64], ptr %fds_bits10, i64 0, i64 %idxprom12, !dbg !4418
  %27 = load i64, ptr %arrayidx13, align 8, !dbg !4418
  %28 = load i32, ptr %i, align 4, !dbg !4418
  %rem14 = srem i32 %28, 64, !dbg !4418
  %int_cast_to_i641 = zext i32 %rem14 to i64, !dbg !4418
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4418
  %shl15 = shl i32 1, %rem14, !dbg !4418, !klee.check.shift !4416
  %conv16 = sext i32 %shl15 to i64, !dbg !4418
  %and17 = and i64 %27, %conv16, !dbg !4418
  %tobool18 = icmp ne i64 %and17, 0, !dbg !4418
  br i1 %tobool18, label %if.then29, label %lor.lhs.false19, !dbg !4419

lor.lhs.false19:                                  ; preds = %lor.lhs.false
  %fds_bits20 = getelementptr inbounds %struct.fd_set, ptr %in_except, i32 0, i32 0, !dbg !4420
  %29 = load i32, ptr %i, align 4, !dbg !4420
  %div21 = sdiv i32 %29, 64, !dbg !4420
  %idxprom22 = sext i32 %div21 to i64, !dbg !4420
  %arrayidx23 = getelementptr inbounds [16 x i64], ptr %fds_bits20, i64 0, i64 %idxprom22, !dbg !4420
  %30 = load i64, ptr %arrayidx23, align 8, !dbg !4420
  %31 = load i32, ptr %i, align 4, !dbg !4420
  %rem24 = srem i32 %31, 64, !dbg !4420
  %int_cast_to_i642 = zext i32 %rem24 to i64, !dbg !4420
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4420
  %shl25 = shl i32 1, %rem24, !dbg !4420, !klee.check.shift !4416
  %conv26 = sext i32 %shl25 to i64, !dbg !4420
  %and27 = and i64 %30, %conv26, !dbg !4420
  %tobool28 = icmp ne i64 %and27, 0, !dbg !4420
  br i1 %tobool28, label %if.then29, label %for.inc, !dbg !4421

if.then29:                                        ; preds = %lor.lhs.false19, %lor.lhs.false, %for.body
  call void @llvm.dbg.declare(metadata ptr %f, metadata !4422, metadata !DIExpression()), !dbg !4424
  %32 = load i32, ptr %i, align 4, !dbg !4425
  %call = call ptr @__get_file(i32 noundef %32), !dbg !4426
  store ptr %call, ptr %f, align 8, !dbg !4424
  %33 = load ptr, ptr %f, align 8, !dbg !4427
  %tobool30 = icmp ne ptr %33, null, !dbg !4427
  br i1 %tobool30, label %if.else33, label %if.then31, !dbg !4429

if.then31:                                        ; preds = %if.then29
  %call32 = call ptr @__errno_location() #17, !dbg !4430
  store i32 9, ptr %call32, align 4, !dbg !4432
  store i32 -1, ptr %retval, align 4, !dbg !4433
  br label %return, !dbg !4433

if.else33:                                        ; preds = %if.then29
  %34 = load ptr, ptr %f, align 8, !dbg !4434
  %dfile = getelementptr inbounds %struct.exe_file_t.6, ptr %34, i32 0, i32 3, !dbg !4436
  %35 = load ptr, ptr %dfile, align 8, !dbg !4436
  %tobool34 = icmp ne ptr %35, null, !dbg !4434
  br i1 %tobool34, label %if.then35, label %if.else92, !dbg !4437

if.then35:                                        ; preds = %if.else33
  %fds_bits36 = getelementptr inbounds %struct.fd_set, ptr %in_read, i32 0, i32 0, !dbg !4438
  %36 = load i32, ptr %i, align 4, !dbg !4438
  %div37 = sdiv i32 %36, 64, !dbg !4438
  %idxprom38 = sext i32 %div37 to i64, !dbg !4438
  %arrayidx39 = getelementptr inbounds [16 x i64], ptr %fds_bits36, i64 0, i64 %idxprom38, !dbg !4438
  %37 = load i64, ptr %arrayidx39, align 8, !dbg !4438
  %38 = load i32, ptr %i, align 4, !dbg !4438
  %rem40 = srem i32 %38, 64, !dbg !4438
  %int_cast_to_i643 = zext i32 %rem40 to i64, !dbg !4438
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i643), !dbg !4438
  %shl41 = shl i32 1, %rem40, !dbg !4438, !klee.check.shift !4416
  %conv42 = sext i32 %shl41 to i64, !dbg !4438
  %and43 = and i64 %37, %conv42, !dbg !4438
  %tobool44 = icmp ne i64 %and43, 0, !dbg !4438
  br i1 %tobool44, label %if.then45, label %if.end53, !dbg !4441

if.then45:                                        ; preds = %if.then35
  %39 = load i32, ptr %i, align 4, !dbg !4442
  %rem46 = srem i32 %39, 64, !dbg !4442
  %int_cast_to_i644 = zext i32 %rem46 to i64, !dbg !4442
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i644), !dbg !4442
  %shl47 = shl i32 1, %rem46, !dbg !4442, !klee.check.shift !4416
  %conv48 = sext i32 %shl47 to i64, !dbg !4442
  %40 = load ptr, ptr %read.addr, align 8, !dbg !4442
  %fds_bits49 = getelementptr inbounds %struct.fd_set, ptr %40, i32 0, i32 0, !dbg !4442
  %41 = load i32, ptr %i, align 4, !dbg !4442
  %div50 = sdiv i32 %41, 64, !dbg !4442
  %idxprom51 = sext i32 %div50 to i64, !dbg !4442
  %arrayidx52 = getelementptr inbounds [16 x i64], ptr %fds_bits49, i64 0, i64 %idxprom51, !dbg !4442
  %42 = load i64, ptr %arrayidx52, align 8, !dbg !4442
  %or = or i64 %42, %conv48, !dbg !4442
  store i64 %or, ptr %arrayidx52, align 8, !dbg !4442
  br label %if.end53, !dbg !4442

if.end53:                                         ; preds = %if.then45, %if.then35
  %fds_bits54 = getelementptr inbounds %struct.fd_set, ptr %in_write, i32 0, i32 0, !dbg !4443
  %43 = load i32, ptr %i, align 4, !dbg !4443
  %div55 = sdiv i32 %43, 64, !dbg !4443
  %idxprom56 = sext i32 %div55 to i64, !dbg !4443
  %arrayidx57 = getelementptr inbounds [16 x i64], ptr %fds_bits54, i64 0, i64 %idxprom56, !dbg !4443
  %44 = load i64, ptr %arrayidx57, align 8, !dbg !4443
  %45 = load i32, ptr %i, align 4, !dbg !4443
  %rem58 = srem i32 %45, 64, !dbg !4443
  %int_cast_to_i645 = zext i32 %rem58 to i64, !dbg !4443
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i645), !dbg !4443
  %shl59 = shl i32 1, %rem58, !dbg !4443, !klee.check.shift !4416
  %conv60 = sext i32 %shl59 to i64, !dbg !4443
  %and61 = and i64 %44, %conv60, !dbg !4443
  %tobool62 = icmp ne i64 %and61, 0, !dbg !4443
  br i1 %tobool62, label %if.then63, label %if.end72, !dbg !4445

if.then63:                                        ; preds = %if.end53
  %46 = load i32, ptr %i, align 4, !dbg !4446
  %rem64 = srem i32 %46, 64, !dbg !4446
  %int_cast_to_i646 = zext i32 %rem64 to i64, !dbg !4446
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i646), !dbg !4446
  %shl65 = shl i32 1, %rem64, !dbg !4446, !klee.check.shift !4416
  %conv66 = sext i32 %shl65 to i64, !dbg !4446
  %47 = load ptr, ptr %write.addr, align 8, !dbg !4446
  %fds_bits67 = getelementptr inbounds %struct.fd_set, ptr %47, i32 0, i32 0, !dbg !4446
  %48 = load i32, ptr %i, align 4, !dbg !4446
  %div68 = sdiv i32 %48, 64, !dbg !4446
  %idxprom69 = sext i32 %div68 to i64, !dbg !4446
  %arrayidx70 = getelementptr inbounds [16 x i64], ptr %fds_bits67, i64 0, i64 %idxprom69, !dbg !4446
  %49 = load i64, ptr %arrayidx70, align 8, !dbg !4446
  %or71 = or i64 %49, %conv66, !dbg !4446
  store i64 %or71, ptr %arrayidx70, align 8, !dbg !4446
  br label %if.end72, !dbg !4446

if.end72:                                         ; preds = %if.then63, %if.end53
  %fds_bits73 = getelementptr inbounds %struct.fd_set, ptr %in_except, i32 0, i32 0, !dbg !4447
  %50 = load i32, ptr %i, align 4, !dbg !4447
  %div74 = sdiv i32 %50, 64, !dbg !4447
  %idxprom75 = sext i32 %div74 to i64, !dbg !4447
  %arrayidx76 = getelementptr inbounds [16 x i64], ptr %fds_bits73, i64 0, i64 %idxprom75, !dbg !4447
  %51 = load i64, ptr %arrayidx76, align 8, !dbg !4447
  %52 = load i32, ptr %i, align 4, !dbg !4447
  %rem77 = srem i32 %52, 64, !dbg !4447
  %int_cast_to_i647 = zext i32 %rem77 to i64, !dbg !4447
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i647), !dbg !4447
  %shl78 = shl i32 1, %rem77, !dbg !4447, !klee.check.shift !4416
  %conv79 = sext i32 %shl78 to i64, !dbg !4447
  %and80 = and i64 %51, %conv79, !dbg !4447
  %tobool81 = icmp ne i64 %and80, 0, !dbg !4447
  br i1 %tobool81, label %if.then82, label %if.end91, !dbg !4449

if.then82:                                        ; preds = %if.end72
  %53 = load i32, ptr %i, align 4, !dbg !4450
  %rem83 = srem i32 %53, 64, !dbg !4450
  %int_cast_to_i648 = zext i32 %rem83 to i64, !dbg !4450
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i648), !dbg !4450
  %shl84 = shl i32 1, %rem83, !dbg !4450, !klee.check.shift !4416
  %conv85 = sext i32 %shl84 to i64, !dbg !4450
  %54 = load ptr, ptr %except.addr, align 8, !dbg !4450
  %fds_bits86 = getelementptr inbounds %struct.fd_set, ptr %54, i32 0, i32 0, !dbg !4450
  %55 = load i32, ptr %i, align 4, !dbg !4450
  %div87 = sdiv i32 %55, 64, !dbg !4450
  %idxprom88 = sext i32 %div87 to i64, !dbg !4450
  %arrayidx89 = getelementptr inbounds [16 x i64], ptr %fds_bits86, i64 0, i64 %idxprom88, !dbg !4450
  %56 = load i64, ptr %arrayidx89, align 8, !dbg !4450
  %or90 = or i64 %56, %conv85, !dbg !4450
  store i64 %or90, ptr %arrayidx89, align 8, !dbg !4450
  br label %if.end91, !dbg !4450

if.end91:                                         ; preds = %if.then82, %if.end72
  %57 = load i32, ptr %count, align 4, !dbg !4451
  %inc = add nsw i32 %57, 1, !dbg !4451
  store i32 %inc, ptr %count, align 4, !dbg !4451
  br label %for.inc, !dbg !4452

if.else92:                                        ; preds = %if.else33
  %fds_bits93 = getelementptr inbounds %struct.fd_set, ptr %in_read, i32 0, i32 0, !dbg !4453
  %58 = load i32, ptr %i, align 4, !dbg !4453
  %div94 = sdiv i32 %58, 64, !dbg !4453
  %idxprom95 = sext i32 %div94 to i64, !dbg !4453
  %arrayidx96 = getelementptr inbounds [16 x i64], ptr %fds_bits93, i64 0, i64 %idxprom95, !dbg !4453
  %59 = load i64, ptr %arrayidx96, align 8, !dbg !4453
  %60 = load i32, ptr %i, align 4, !dbg !4453
  %rem97 = srem i32 %60, 64, !dbg !4453
  %int_cast_to_i649 = zext i32 %rem97 to i64, !dbg !4453
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i649), !dbg !4453
  %shl98 = shl i32 1, %rem97, !dbg !4453, !klee.check.shift !4416
  %conv99 = sext i32 %shl98 to i64, !dbg !4453
  %and100 = and i64 %59, %conv99, !dbg !4453
  %tobool101 = icmp ne i64 %and100, 0, !dbg !4453
  br i1 %tobool101, label %if.then102, label %if.end112, !dbg !4456

if.then102:                                       ; preds = %if.else92
  %61 = load ptr, ptr %f, align 8, !dbg !4457
  %fd = getelementptr inbounds %struct.exe_file_t.6, ptr %61, i32 0, i32 0, !dbg !4457
  %62 = load i32, ptr %fd, align 8, !dbg !4457
  %rem103 = srem i32 %62, 64, !dbg !4457
  %int_cast_to_i6410 = zext i32 %rem103 to i64, !dbg !4457
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6410), !dbg !4457
  %shl104 = shl i32 1, %rem103, !dbg !4457, !klee.check.shift !4416
  %conv105 = sext i32 %shl104 to i64, !dbg !4457
  %fds_bits106 = getelementptr inbounds %struct.fd_set, ptr %os_read, i32 0, i32 0, !dbg !4457
  %63 = load ptr, ptr %f, align 8, !dbg !4457
  %fd107 = getelementptr inbounds %struct.exe_file_t.6, ptr %63, i32 0, i32 0, !dbg !4457
  %64 = load i32, ptr %fd107, align 8, !dbg !4457
  %div108 = sdiv i32 %64, 64, !dbg !4457
  %idxprom109 = sext i32 %div108 to i64, !dbg !4457
  %arrayidx110 = getelementptr inbounds [16 x i64], ptr %fds_bits106, i64 0, i64 %idxprom109, !dbg !4457
  %65 = load i64, ptr %arrayidx110, align 8, !dbg !4457
  %or111 = or i64 %65, %conv105, !dbg !4457
  store i64 %or111, ptr %arrayidx110, align 8, !dbg !4457
  br label %if.end112, !dbg !4457

if.end112:                                        ; preds = %if.then102, %if.else92
  %fds_bits113 = getelementptr inbounds %struct.fd_set, ptr %in_write, i32 0, i32 0, !dbg !4458
  %66 = load i32, ptr %i, align 4, !dbg !4458
  %div114 = sdiv i32 %66, 64, !dbg !4458
  %idxprom115 = sext i32 %div114 to i64, !dbg !4458
  %arrayidx116 = getelementptr inbounds [16 x i64], ptr %fds_bits113, i64 0, i64 %idxprom115, !dbg !4458
  %67 = load i64, ptr %arrayidx116, align 8, !dbg !4458
  %68 = load i32, ptr %i, align 4, !dbg !4458
  %rem117 = srem i32 %68, 64, !dbg !4458
  %int_cast_to_i6411 = zext i32 %rem117 to i64, !dbg !4458
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6411), !dbg !4458
  %shl118 = shl i32 1, %rem117, !dbg !4458, !klee.check.shift !4416
  %conv119 = sext i32 %shl118 to i64, !dbg !4458
  %and120 = and i64 %67, %conv119, !dbg !4458
  %tobool121 = icmp ne i64 %and120, 0, !dbg !4458
  br i1 %tobool121, label %if.then122, label %if.end133, !dbg !4460

if.then122:                                       ; preds = %if.end112
  %69 = load ptr, ptr %f, align 8, !dbg !4461
  %fd123 = getelementptr inbounds %struct.exe_file_t.6, ptr %69, i32 0, i32 0, !dbg !4461
  %70 = load i32, ptr %fd123, align 8, !dbg !4461
  %rem124 = srem i32 %70, 64, !dbg !4461
  %int_cast_to_i6412 = zext i32 %rem124 to i64, !dbg !4461
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6412), !dbg !4461
  %shl125 = shl i32 1, %rem124, !dbg !4461, !klee.check.shift !4416
  %conv126 = sext i32 %shl125 to i64, !dbg !4461
  %fds_bits127 = getelementptr inbounds %struct.fd_set, ptr %os_write, i32 0, i32 0, !dbg !4461
  %71 = load ptr, ptr %f, align 8, !dbg !4461
  %fd128 = getelementptr inbounds %struct.exe_file_t.6, ptr %71, i32 0, i32 0, !dbg !4461
  %72 = load i32, ptr %fd128, align 8, !dbg !4461
  %div129 = sdiv i32 %72, 64, !dbg !4461
  %idxprom130 = sext i32 %div129 to i64, !dbg !4461
  %arrayidx131 = getelementptr inbounds [16 x i64], ptr %fds_bits127, i64 0, i64 %idxprom130, !dbg !4461
  %73 = load i64, ptr %arrayidx131, align 8, !dbg !4461
  %or132 = or i64 %73, %conv126, !dbg !4461
  store i64 %or132, ptr %arrayidx131, align 8, !dbg !4461
  br label %if.end133, !dbg !4461

if.end133:                                        ; preds = %if.then122, %if.end112
  %fds_bits134 = getelementptr inbounds %struct.fd_set, ptr %in_except, i32 0, i32 0, !dbg !4462
  %74 = load i32, ptr %i, align 4, !dbg !4462
  %div135 = sdiv i32 %74, 64, !dbg !4462
  %idxprom136 = sext i32 %div135 to i64, !dbg !4462
  %arrayidx137 = getelementptr inbounds [16 x i64], ptr %fds_bits134, i64 0, i64 %idxprom136, !dbg !4462
  %75 = load i64, ptr %arrayidx137, align 8, !dbg !4462
  %76 = load i32, ptr %i, align 4, !dbg !4462
  %rem138 = srem i32 %76, 64, !dbg !4462
  %int_cast_to_i6413 = zext i32 %rem138 to i64, !dbg !4462
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6413), !dbg !4462
  %shl139 = shl i32 1, %rem138, !dbg !4462, !klee.check.shift !4416
  %conv140 = sext i32 %shl139 to i64, !dbg !4462
  %and141 = and i64 %75, %conv140, !dbg !4462
  %tobool142 = icmp ne i64 %and141, 0, !dbg !4462
  br i1 %tobool142, label %if.then143, label %if.end154, !dbg !4464

if.then143:                                       ; preds = %if.end133
  %77 = load ptr, ptr %f, align 8, !dbg !4465
  %fd144 = getelementptr inbounds %struct.exe_file_t.6, ptr %77, i32 0, i32 0, !dbg !4465
  %78 = load i32, ptr %fd144, align 8, !dbg !4465
  %rem145 = srem i32 %78, 64, !dbg !4465
  %int_cast_to_i6414 = zext i32 %rem145 to i64, !dbg !4465
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6414), !dbg !4465
  %shl146 = shl i32 1, %rem145, !dbg !4465, !klee.check.shift !4416
  %conv147 = sext i32 %shl146 to i64, !dbg !4465
  %fds_bits148 = getelementptr inbounds %struct.fd_set, ptr %os_except, i32 0, i32 0, !dbg !4465
  %79 = load ptr, ptr %f, align 8, !dbg !4465
  %fd149 = getelementptr inbounds %struct.exe_file_t.6, ptr %79, i32 0, i32 0, !dbg !4465
  %80 = load i32, ptr %fd149, align 8, !dbg !4465
  %div150 = sdiv i32 %80, 64, !dbg !4465
  %idxprom151 = sext i32 %div150 to i64, !dbg !4465
  %arrayidx152 = getelementptr inbounds [16 x i64], ptr %fds_bits148, i64 0, i64 %idxprom151, !dbg !4465
  %81 = load i64, ptr %arrayidx152, align 8, !dbg !4465
  %or153 = or i64 %81, %conv147, !dbg !4465
  store i64 %or153, ptr %arrayidx152, align 8, !dbg !4465
  br label %if.end154, !dbg !4465

if.end154:                                        ; preds = %if.then143, %if.end133
  %82 = load ptr, ptr %f, align 8, !dbg !4466
  %fd155 = getelementptr inbounds %struct.exe_file_t.6, ptr %82, i32 0, i32 0, !dbg !4468
  %83 = load i32, ptr %fd155, align 8, !dbg !4468
  %84 = load i32, ptr %os_nfds, align 4, !dbg !4469
  %cmp156 = icmp sge i32 %83, %84, !dbg !4470
  br i1 %cmp156, label %if.then158, label %for.inc, !dbg !4471

if.then158:                                       ; preds = %if.end154
  %85 = load ptr, ptr %f, align 8, !dbg !4472
  %fd159 = getelementptr inbounds %struct.exe_file_t.6, ptr %85, i32 0, i32 0, !dbg !4473
  %86 = load i32, ptr %fd159, align 8, !dbg !4473
  %add = add nsw i32 %86, 1, !dbg !4474
  store i32 %add, ptr %os_nfds, align 4, !dbg !4475
  br label %for.inc, !dbg !4476

for.inc:                                          ; preds = %lor.lhs.false19, %if.end91, %if.then158, %if.end154
  %87 = load i32, ptr %i, align 4, !dbg !4477
  %inc164 = add nsw i32 %87, 1, !dbg !4477
  store i32 %inc164, ptr %i, align 4, !dbg !4477
  br label %for.cond, !dbg !4478, !llvm.loop !4479

for.end:                                          ; preds = %for.cond
  %88 = load i32, ptr %os_nfds, align 4, !dbg !4481
  %cmp165 = icmp sgt i32 %88, 0, !dbg !4483
  br i1 %cmp165, label %if.then167, label %if.end262, !dbg !4484

if.then167:                                       ; preds = %for.end
  call void @llvm.dbg.declare(metadata ptr %tv, metadata !4485, metadata !DIExpression()), !dbg !4487
  %89 = call ptr @memset(ptr %tv, i32 0, i64 16), !dbg !4487
  call void @llvm.dbg.declare(metadata ptr %r, metadata !4488, metadata !DIExpression()), !dbg !4489
  %90 = load i32, ptr %os_nfds, align 4, !dbg !4490
  %call168 = call i64 (i64, ...) @syscall(i64 noundef 23, i32 noundef %90, ptr noundef %os_read, ptr noundef %os_write, ptr noundef %os_except, ptr noundef %tv) #16, !dbg !4491
  %conv169 = trunc i64 %call168 to i32, !dbg !4491
  store i32 %conv169, ptr %r, align 4, !dbg !4489
  %91 = load i32, ptr %r, align 4, !dbg !4492
  %cmp170 = icmp eq i32 %91, -1, !dbg !4494
  br i1 %cmp170, label %if.then172, label %if.else176, !dbg !4495

if.then172:                                       ; preds = %if.then167
  %92 = load i32, ptr %count, align 4, !dbg !4496
  %tobool173 = icmp ne i32 %92, 0, !dbg !4496
  br i1 %tobool173, label %if.end262, label %if.then174, !dbg !4499

if.then174:                                       ; preds = %if.then172
  store i32 -1, ptr %retval, align 4, !dbg !4500
  br label %return, !dbg !4500

if.else176:                                       ; preds = %if.then167
  %93 = load i32, ptr %r, align 4, !dbg !4501
  %94 = load i32, ptr %count, align 4, !dbg !4503
  %add177 = add nsw i32 %94, %93, !dbg !4503
  store i32 %add177, ptr %count, align 4, !dbg !4503
  store i32 0, ptr %i, align 4, !dbg !4504
  br label %for.cond178, !dbg !4506

for.cond178:                                      ; preds = %for.inc258, %if.else176
  %95 = load i32, ptr %i, align 4, !dbg !4507
  %96 = load i32, ptr %nfds.addr, align 4, !dbg !4509
  %cmp179 = icmp slt i32 %95, %96, !dbg !4510
  br i1 %cmp179, label %for.body181, label %if.end262, !dbg !4511

for.body181:                                      ; preds = %for.cond178
  call void @llvm.dbg.declare(metadata ptr %f182, metadata !4512, metadata !DIExpression()), !dbg !4514
  %97 = load i32, ptr %i, align 4, !dbg !4515
  %call183 = call ptr @__get_file(i32 noundef %97), !dbg !4516
  store ptr %call183, ptr %f182, align 8, !dbg !4514
  %98 = load ptr, ptr %f182, align 8, !dbg !4517
  %tobool184 = icmp ne ptr %98, null, !dbg !4517
  br i1 %tobool184, label %land.lhs.true, label %for.inc258, !dbg !4519

land.lhs.true:                                    ; preds = %for.body181
  %99 = load ptr, ptr %f182, align 8, !dbg !4520
  %dfile185 = getelementptr inbounds %struct.exe_file_t.6, ptr %99, i32 0, i32 3, !dbg !4521
  %100 = load ptr, ptr %dfile185, align 8, !dbg !4521
  %tobool186 = icmp ne ptr %100, null, !dbg !4520
  br i1 %tobool186, label %for.inc258, label %if.then187, !dbg !4522

if.then187:                                       ; preds = %land.lhs.true
  %101 = load ptr, ptr %read.addr, align 8, !dbg !4523
  %tobool188 = icmp ne ptr %101, null, !dbg !4523
  br i1 %tobool188, label %land.lhs.true189, label %if.end210, !dbg !4526

land.lhs.true189:                                 ; preds = %if.then187
  %fds_bits190 = getelementptr inbounds %struct.fd_set, ptr %os_read, i32 0, i32 0, !dbg !4527
  %102 = load ptr, ptr %f182, align 8, !dbg !4527
  %fd191 = getelementptr inbounds %struct.exe_file_t.6, ptr %102, i32 0, i32 0, !dbg !4527
  %103 = load i32, ptr %fd191, align 8, !dbg !4527
  %div192 = sdiv i32 %103, 64, !dbg !4527
  %idxprom193 = sext i32 %div192 to i64, !dbg !4527
  %arrayidx194 = getelementptr inbounds [16 x i64], ptr %fds_bits190, i64 0, i64 %idxprom193, !dbg !4527
  %104 = load i64, ptr %arrayidx194, align 8, !dbg !4527
  %105 = load ptr, ptr %f182, align 8, !dbg !4527
  %fd195 = getelementptr inbounds %struct.exe_file_t.6, ptr %105, i32 0, i32 0, !dbg !4527
  %106 = load i32, ptr %fd195, align 8, !dbg !4527
  %rem196 = srem i32 %106, 64, !dbg !4527
  %int_cast_to_i6415 = zext i32 %rem196 to i64, !dbg !4527
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6415), !dbg !4527
  %shl197 = shl i32 1, %rem196, !dbg !4527, !klee.check.shift !4416
  %conv198 = sext i32 %shl197 to i64, !dbg !4527
  %and199 = and i64 %104, %conv198, !dbg !4527
  %tobool200 = icmp ne i64 %and199, 0, !dbg !4527
  br i1 %tobool200, label %if.then201, label %if.end210, !dbg !4528

if.then201:                                       ; preds = %land.lhs.true189
  %107 = load i32, ptr %i, align 4, !dbg !4529
  %rem202 = srem i32 %107, 64, !dbg !4529
  %int_cast_to_i6416 = zext i32 %rem202 to i64, !dbg !4529
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6416), !dbg !4529
  %shl203 = shl i32 1, %rem202, !dbg !4529, !klee.check.shift !4416
  %conv204 = sext i32 %shl203 to i64, !dbg !4529
  %108 = load ptr, ptr %read.addr, align 8, !dbg !4529
  %fds_bits205 = getelementptr inbounds %struct.fd_set, ptr %108, i32 0, i32 0, !dbg !4529
  %109 = load i32, ptr %i, align 4, !dbg !4529
  %div206 = sdiv i32 %109, 64, !dbg !4529
  %idxprom207 = sext i32 %div206 to i64, !dbg !4529
  %arrayidx208 = getelementptr inbounds [16 x i64], ptr %fds_bits205, i64 0, i64 %idxprom207, !dbg !4529
  %110 = load i64, ptr %arrayidx208, align 8, !dbg !4529
  %or209 = or i64 %110, %conv204, !dbg !4529
  store i64 %or209, ptr %arrayidx208, align 8, !dbg !4529
  br label %if.end210, !dbg !4529

if.end210:                                        ; preds = %if.then201, %land.lhs.true189, %if.then187
  %111 = load ptr, ptr %write.addr, align 8, !dbg !4530
  %tobool211 = icmp ne ptr %111, null, !dbg !4530
  br i1 %tobool211, label %land.lhs.true212, label %if.end233, !dbg !4532

land.lhs.true212:                                 ; preds = %if.end210
  %fds_bits213 = getelementptr inbounds %struct.fd_set, ptr %os_write, i32 0, i32 0, !dbg !4533
  %112 = load ptr, ptr %f182, align 8, !dbg !4533
  %fd214 = getelementptr inbounds %struct.exe_file_t.6, ptr %112, i32 0, i32 0, !dbg !4533
  %113 = load i32, ptr %fd214, align 8, !dbg !4533
  %div215 = sdiv i32 %113, 64, !dbg !4533
  %idxprom216 = sext i32 %div215 to i64, !dbg !4533
  %arrayidx217 = getelementptr inbounds [16 x i64], ptr %fds_bits213, i64 0, i64 %idxprom216, !dbg !4533
  %114 = load i64, ptr %arrayidx217, align 8, !dbg !4533
  %115 = load ptr, ptr %f182, align 8, !dbg !4533
  %fd218 = getelementptr inbounds %struct.exe_file_t.6, ptr %115, i32 0, i32 0, !dbg !4533
  %116 = load i32, ptr %fd218, align 8, !dbg !4533
  %rem219 = srem i32 %116, 64, !dbg !4533
  %int_cast_to_i6417 = zext i32 %rem219 to i64, !dbg !4533
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6417), !dbg !4533
  %shl220 = shl i32 1, %rem219, !dbg !4533, !klee.check.shift !4416
  %conv221 = sext i32 %shl220 to i64, !dbg !4533
  %and222 = and i64 %114, %conv221, !dbg !4533
  %tobool223 = icmp ne i64 %and222, 0, !dbg !4533
  br i1 %tobool223, label %if.then224, label %if.end233, !dbg !4534

if.then224:                                       ; preds = %land.lhs.true212
  %117 = load i32, ptr %i, align 4, !dbg !4535
  %rem225 = srem i32 %117, 64, !dbg !4535
  %int_cast_to_i6418 = zext i32 %rem225 to i64, !dbg !4535
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6418), !dbg !4535
  %shl226 = shl i32 1, %rem225, !dbg !4535, !klee.check.shift !4416
  %conv227 = sext i32 %shl226 to i64, !dbg !4535
  %118 = load ptr, ptr %write.addr, align 8, !dbg !4535
  %fds_bits228 = getelementptr inbounds %struct.fd_set, ptr %118, i32 0, i32 0, !dbg !4535
  %119 = load i32, ptr %i, align 4, !dbg !4535
  %div229 = sdiv i32 %119, 64, !dbg !4535
  %idxprom230 = sext i32 %div229 to i64, !dbg !4535
  %arrayidx231 = getelementptr inbounds [16 x i64], ptr %fds_bits228, i64 0, i64 %idxprom230, !dbg !4535
  %120 = load i64, ptr %arrayidx231, align 8, !dbg !4535
  %or232 = or i64 %120, %conv227, !dbg !4535
  store i64 %or232, ptr %arrayidx231, align 8, !dbg !4535
  br label %if.end233, !dbg !4535

if.end233:                                        ; preds = %if.then224, %land.lhs.true212, %if.end210
  %121 = load ptr, ptr %except.addr, align 8, !dbg !4536
  %tobool234 = icmp ne ptr %121, null, !dbg !4536
  br i1 %tobool234, label %land.lhs.true235, label %for.inc258, !dbg !4538

land.lhs.true235:                                 ; preds = %if.end233
  %fds_bits236 = getelementptr inbounds %struct.fd_set, ptr %os_except, i32 0, i32 0, !dbg !4539
  %122 = load ptr, ptr %f182, align 8, !dbg !4539
  %fd237 = getelementptr inbounds %struct.exe_file_t.6, ptr %122, i32 0, i32 0, !dbg !4539
  %123 = load i32, ptr %fd237, align 8, !dbg !4539
  %div238 = sdiv i32 %123, 64, !dbg !4539
  %idxprom239 = sext i32 %div238 to i64, !dbg !4539
  %arrayidx240 = getelementptr inbounds [16 x i64], ptr %fds_bits236, i64 0, i64 %idxprom239, !dbg !4539
  %124 = load i64, ptr %arrayidx240, align 8, !dbg !4539
  %125 = load ptr, ptr %f182, align 8, !dbg !4539
  %fd241 = getelementptr inbounds %struct.exe_file_t.6, ptr %125, i32 0, i32 0, !dbg !4539
  %126 = load i32, ptr %fd241, align 8, !dbg !4539
  %rem242 = srem i32 %126, 64, !dbg !4539
  %int_cast_to_i6419 = zext i32 %rem242 to i64, !dbg !4539
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6419), !dbg !4539
  %shl243 = shl i32 1, %rem242, !dbg !4539, !klee.check.shift !4416
  %conv244 = sext i32 %shl243 to i64, !dbg !4539
  %and245 = and i64 %124, %conv244, !dbg !4539
  %tobool246 = icmp ne i64 %and245, 0, !dbg !4539
  br i1 %tobool246, label %if.then247, label %for.inc258, !dbg !4540

if.then247:                                       ; preds = %land.lhs.true235
  %127 = load i32, ptr %i, align 4, !dbg !4541
  %rem248 = srem i32 %127, 64, !dbg !4541
  %int_cast_to_i6420 = zext i32 %rem248 to i64, !dbg !4541
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6420), !dbg !4541
  %shl249 = shl i32 1, %rem248, !dbg !4541, !klee.check.shift !4416
  %conv250 = sext i32 %shl249 to i64, !dbg !4541
  %128 = load ptr, ptr %except.addr, align 8, !dbg !4541
  %fds_bits251 = getelementptr inbounds %struct.fd_set, ptr %128, i32 0, i32 0, !dbg !4541
  %129 = load i32, ptr %i, align 4, !dbg !4541
  %div252 = sdiv i32 %129, 64, !dbg !4541
  %idxprom253 = sext i32 %div252 to i64, !dbg !4541
  %arrayidx254 = getelementptr inbounds [16 x i64], ptr %fds_bits251, i64 0, i64 %idxprom253, !dbg !4541
  %130 = load i64, ptr %arrayidx254, align 8, !dbg !4541
  %or255 = or i64 %130, %conv250, !dbg !4541
  store i64 %or255, ptr %arrayidx254, align 8, !dbg !4541
  br label %for.inc258, !dbg !4541

for.inc258:                                       ; preds = %for.body181, %land.lhs.true, %if.then247, %land.lhs.true235, %if.end233
  %131 = load i32, ptr %i, align 4, !dbg !4542
  %inc259 = add nsw i32 %131, 1, !dbg !4542
  store i32 %inc259, ptr %i, align 4, !dbg !4542
  br label %for.cond178, !dbg !4543, !llvm.loop !4544

if.end262:                                        ; preds = %if.then172, %for.cond178, %for.end
  %132 = load i32, ptr %count, align 4, !dbg !4546
  store i32 %132, ptr %retval, align 4, !dbg !4547
  br label %return, !dbg !4547

return:                                           ; preds = %if.end262, %if.then174, %if.then31
  %133 = load i32, ptr %retval, align 4, !dbg !4548
  ret i32 %133, !dbg !4548
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chroot(ptr noundef nonnull %path) #0 !dbg !4549 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4550, metadata !DIExpression()), !dbg !4551
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4552
  %arrayidx = getelementptr inbounds i8, ptr %0, i64 0, !dbg !4552
  %1 = load i8, ptr %arrayidx, align 1, !dbg !4552
  %conv = sext i8 %1 to i32, !dbg !4552
  %cmp = icmp eq i32 %conv, 0, !dbg !4554
  br i1 %cmp, label %if.then, label %if.end, !dbg !4555

if.then:                                          ; preds = %entry
  %call = call ptr @__errno_location() #17, !dbg !4556
  store i32 2, ptr %call, align 4, !dbg !4558
  store i32 -1, ptr %retval, align 4, !dbg !4559
  br label %return, !dbg !4559

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %path.addr, align 8, !dbg !4560
  %arrayidx2 = getelementptr inbounds i8, ptr %2, i64 0, !dbg !4560
  %3 = load i8, ptr %arrayidx2, align 1, !dbg !4560
  %conv3 = sext i8 %3 to i32, !dbg !4560
  %cmp4 = icmp eq i32 %conv3, 47, !dbg !4562
  br i1 %cmp4, label %land.lhs.true, label %if.end11, !dbg !4563

land.lhs.true:                                    ; preds = %if.end
  %4 = load ptr, ptr %path.addr, align 8, !dbg !4564
  %arrayidx6 = getelementptr inbounds i8, ptr %4, i64 1, !dbg !4564
  %5 = load i8, ptr %arrayidx6, align 1, !dbg !4564
  %conv7 = sext i8 %5 to i32, !dbg !4564
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !4565
  br i1 %cmp8, label %if.then10, label %if.end11, !dbg !4566

if.then10:                                        ; preds = %land.lhs.true
  store i32 0, ptr %retval, align 4, !dbg !4567
  br label %return, !dbg !4567

if.end11:                                         ; preds = %land.lhs.true, %if.end
  call void @klee_warning(ptr noundef @.str.25.81), !dbg !4569
  %call12 = call ptr @__errno_location() #17, !dbg !4570
  store i32 2, ptr %call12, align 4, !dbg !4571
  store i32 -1, ptr %retval, align 4, !dbg !4572
  br label %return, !dbg !4572

return:                                           ; preds = %if.end11, %if.then10, %if.then
  %6 = load i32, ptr %retval, align 4, !dbg !4573
  ret i32 %6, !dbg !4573
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @open64(ptr noundef nonnull %pathname, i32 noundef %flags, ...) #0 !dbg !4574 {
entry:
  %pathname.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %mode = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4578, metadata !DIExpression()), !dbg !4579
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !4580, metadata !DIExpression()), !dbg !4581
  call void @llvm.dbg.declare(metadata ptr %mode, metadata !4582, metadata !DIExpression()), !dbg !4583
  store i32 0, ptr %mode, align 4, !dbg !4583
  %0 = load i32, ptr %flags.addr, align 4, !dbg !4584
  %and = and i32 %0, 64, !dbg !4586
  %tobool = icmp ne i32 %and, 0, !dbg !4586
  br i1 %tobool, label %if.then, label %if.end, !dbg !4587

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %ap, metadata !4588, metadata !DIExpression()), !dbg !4601
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4602
  call void @llvm.va_start(ptr %arraydecay), !dbg !4602
  %arraydecay1 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4603
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 0, !dbg !4603
  %gp_offset = load i32, ptr %gp_offset_p, align 16, !dbg !4603
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !4603
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !4603

vaarg.in_reg:                                     ; preds = %if.then
  %1 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 3, !dbg !4603
  %reg_save_area = load ptr, ptr %1, align 16, !dbg !4603
  %2 = getelementptr i8, ptr %reg_save_area, i32 %gp_offset, !dbg !4603
  %3 = add i32 %gp_offset, 8, !dbg !4603
  store i32 %3, ptr %gp_offset_p, align 16, !dbg !4603
  br label %vaarg.end, !dbg !4603

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 2, !dbg !4603
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8, !dbg !4603
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8, !dbg !4603
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8, !dbg !4603
  br label %vaarg.end, !dbg !4603

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ], !dbg !4603
  %4 = load i32, ptr %vaarg.addr, align 4, !dbg !4603
  store i32 %4, ptr %mode, align 4, !dbg !4604
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4605
  call void @llvm.va_end(ptr %arraydecay2), !dbg !4605
  br label %if.end, !dbg !4606

if.end:                                           ; preds = %vaarg.end, %entry
  %5 = load ptr, ptr %pathname.addr, align 8, !dbg !4607
  %6 = load i32, ptr %flags.addr, align 4, !dbg !4608
  %7 = load i32, ptr %mode, align 4, !dbg !4609
  %call = call i32 @__fd_open(ptr noundef %5, i32 noundef %6, i32 noundef %7), !dbg !4610
  ret i32 %call, !dbg !4611
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @openat64(i32 noundef %fd, ptr noundef nonnull %pathname, i32 noundef %flags, ...) #0 !dbg !4612 {
entry:
  %fd.addr = alloca i32, align 4
  %pathname.addr = alloca ptr, align 8
  %flags.addr = alloca i32, align 4
  %mode = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4615, metadata !DIExpression()), !dbg !4616
  store ptr %pathname, ptr %pathname.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pathname.addr, metadata !4617, metadata !DIExpression()), !dbg !4618
  store i32 %flags, ptr %flags.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %flags.addr, metadata !4619, metadata !DIExpression()), !dbg !4620
  call void @llvm.dbg.declare(metadata ptr %mode, metadata !4621, metadata !DIExpression()), !dbg !4622
  store i32 0, ptr %mode, align 4, !dbg !4622
  %0 = load i32, ptr %flags.addr, align 4, !dbg !4623
  %and = and i32 %0, 64, !dbg !4625
  %tobool = icmp ne i32 %and, 0, !dbg !4625
  br i1 %tobool, label %if.then, label %if.end, !dbg !4626

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata ptr %ap, metadata !4627, metadata !DIExpression()), !dbg !4629
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4630
  call void @llvm.va_start(ptr %arraydecay), !dbg !4630
  %arraydecay1 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4631
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 0, !dbg !4631
  %gp_offset = load i32, ptr %gp_offset_p, align 16, !dbg !4631
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !4631
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !4631

vaarg.in_reg:                                     ; preds = %if.then
  %1 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 3, !dbg !4631
  %reg_save_area = load ptr, ptr %1, align 16, !dbg !4631
  %2 = getelementptr i8, ptr %reg_save_area, i32 %gp_offset, !dbg !4631
  %3 = add i32 %gp_offset, 8, !dbg !4631
  store i32 %3, ptr %gp_offset_p, align 16, !dbg !4631
  br label %vaarg.end, !dbg !4631

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 2, !dbg !4631
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8, !dbg !4631
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8, !dbg !4631
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8, !dbg !4631
  br label %vaarg.end, !dbg !4631

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ], !dbg !4631
  %4 = load i32, ptr %vaarg.addr, align 4, !dbg !4631
  store i32 %4, ptr %mode, align 4, !dbg !4632
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0, !dbg !4633
  call void @llvm.va_end(ptr %arraydecay2), !dbg !4633
  br label %if.end, !dbg !4634

if.end:                                           ; preds = %vaarg.end, %entry
  %5 = load i32, ptr %fd.addr, align 4, !dbg !4635
  %6 = load ptr, ptr %pathname.addr, align 8, !dbg !4636
  %7 = load i32, ptr %flags.addr, align 4, !dbg !4637
  %8 = load i32, ptr %mode, align 4, !dbg !4638
  %call = call i32 @__fd_openat(i32 noundef %5, ptr noundef %6, i32 noundef %7, i32 noundef %8), !dbg !4639
  ret i32 %call, !dbg !4640
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @lseek64(i32 noundef %fd, i64 noundef %offset, i32 noundef %whence) #0 !dbg !4641 {
entry:
  %fd.addr = alloca i32, align 4
  %offset.addr = alloca i64, align 8
  %whence.addr = alloca i32, align 4
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4644, metadata !DIExpression()), !dbg !4645
  store i64 %offset, ptr %offset.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %offset.addr, metadata !4646, metadata !DIExpression()), !dbg !4647
  store i32 %whence, ptr %whence.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %whence.addr, metadata !4648, metadata !DIExpression()), !dbg !4649
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4650
  %1 = load i64, ptr %offset.addr, align 8, !dbg !4651
  %2 = load i32, ptr %whence.addr, align 4, !dbg !4652
  %call = call i64 @__fd_lseek(i32 noundef %0, i64 noundef %1, i32 noundef %2), !dbg !4653
  ret i64 %call, !dbg !4654
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__xstat64(i32 noundef %vers, ptr noundef %path, ptr noundef %buf) #0 !dbg !4655 {
entry:
  %vers.addr = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store i32 %vers, ptr %vers.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %vers.addr, metadata !4676, metadata !DIExpression()), !dbg !4677
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4678, metadata !DIExpression()), !dbg !4679
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4680, metadata !DIExpression()), !dbg !4681
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4682
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4683
  %call = call i32 @__fd_stat(ptr noundef %0, ptr noundef %1), !dbg !4684
  ret i32 %call, !dbg !4685
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @stat64(ptr noundef nonnull %path, ptr noundef nonnull %buf) #0 !dbg !4686 {
entry:
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4689, metadata !DIExpression()), !dbg !4690
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4691, metadata !DIExpression()), !dbg !4692
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4693
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4694
  %call = call i32 @__fd_stat(ptr noundef %0, ptr noundef %1), !dbg !4695
  ret i32 %call, !dbg !4696
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__lxstat64(i32 noundef %vers, ptr noundef %path, ptr noundef %buf) #0 !dbg !4697 {
entry:
  %vers.addr = alloca i32, align 4
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store i32 %vers, ptr %vers.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %vers.addr, metadata !4698, metadata !DIExpression()), !dbg !4699
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4700, metadata !DIExpression()), !dbg !4701
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4702, metadata !DIExpression()), !dbg !4703
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4704
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4705
  %call = call i32 @__fd_lstat(ptr noundef %0, ptr noundef %1), !dbg !4706
  ret i32 %call, !dbg !4707
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @lstat64(ptr noundef nonnull %path, ptr noundef nonnull %buf) #0 !dbg !4708 {
entry:
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4709, metadata !DIExpression()), !dbg !4710
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4711, metadata !DIExpression()), !dbg !4712
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4713
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4714
  %call = call i32 @__fd_lstat(ptr noundef %0, ptr noundef %1), !dbg !4715
  ret i32 %call, !dbg !4716
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @__fxstat64(i32 noundef %vers, i32 noundef %fd, ptr noundef %buf) #0 !dbg !4717 {
entry:
  %vers.addr = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  store i32 %vers, ptr %vers.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %vers.addr, metadata !4720, metadata !DIExpression()), !dbg !4721
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4722, metadata !DIExpression()), !dbg !4723
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4724, metadata !DIExpression()), !dbg !4725
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4726
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4727
  %call = call i32 @__fd_fstat(i32 noundef %0, ptr noundef %1), !dbg !4728
  ret i32 %call, !dbg !4729
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fstat64(i32 noundef %fd, ptr noundef nonnull %buf) #0 !dbg !4730 {
entry:
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4733, metadata !DIExpression()), !dbg !4734
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4735, metadata !DIExpression()), !dbg !4736
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4737
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4738
  %call = call i32 @__fd_fstat(i32 noundef %0, ptr noundef %1), !dbg !4739
  ret i32 %call, !dbg !4740
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ftruncate64(i32 noundef %fd, i64 noundef %length) #0 !dbg !4741 {
entry:
  %fd.addr = alloca i32, align 4
  %length.addr = alloca i64, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4742, metadata !DIExpression()), !dbg !4743
  store i64 %length, ptr %length.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %length.addr, metadata !4744, metadata !DIExpression()), !dbg !4745
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4746
  %1 = load i64, ptr %length.addr, align 8, !dbg !4747
  %call = call i32 @__fd_ftruncate(i32 noundef %0, i64 noundef %1), !dbg !4748
  ret i32 %call, !dbg !4749
}

; Function Attrs: noinline nounwind uwtable
define weak dso_local i32 @statfs64(ptr noundef nonnull %path, ptr noundef nonnull %buf) #0 !dbg !4750 {
entry:
  %path.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  store ptr %path, ptr %path.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %path.addr, metadata !4774, metadata !DIExpression()), !dbg !4775
  store ptr %buf, ptr %buf.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %buf.addr, metadata !4776, metadata !DIExpression()), !dbg !4777
  %0 = load ptr, ptr %path.addr, align 8, !dbg !4778
  %1 = load ptr, ptr %buf.addr, align 8, !dbg !4779
  %call = call i32 @__fd_statfs(ptr noundef %0, ptr noundef %1), !dbg !4780
  ret i32 %call, !dbg !4781
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @getdents64(i32 noundef %fd, ptr noundef nonnull %dirp, i64 noundef %count) #0 !dbg !4782 {
entry:
  %fd.addr = alloca i32, align 4
  %dirp.addr = alloca ptr, align 8
  %count.addr = alloca i64, align 8
  store i32 %fd, ptr %fd.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fd.addr, metadata !4785, metadata !DIExpression()), !dbg !4786
  store ptr %dirp, ptr %dirp.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %dirp.addr, metadata !4787, metadata !DIExpression()), !dbg !4788
  store i64 %count, ptr %count.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !4789, metadata !DIExpression()), !dbg !4790
  %0 = load i32, ptr %fd.addr, align 4, !dbg !4791
  %1 = load ptr, ptr %dirp.addr, align 8, !dbg !4792
  %2 = load i64, ptr %count.addr, align 8, !dbg !4793
  %conv = trunc i64 %2 to i32, !dbg !4793
  %call = call i32 @__fd_getdents(i32 noundef %0, ptr noundef %1, i32 noundef %conv), !dbg !4794
  %conv1 = sext i32 %call to i64, !dbg !4794
  ret i64 %conv1, !dbg !4795
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @memcpy(ptr noundef %destaddr, ptr noundef %srcaddr, i64 noundef %len) #0 !dbg !4796 {
entry:
  %destaddr.addr = alloca ptr, align 8
  %srcaddr.addr = alloca ptr, align 8
  %len.addr = alloca i64, align 8
  %dest = alloca ptr, align 8
  %src = alloca ptr, align 8
  store ptr %destaddr, ptr %destaddr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %destaddr.addr, metadata !4800, metadata !DIExpression()), !dbg !4801
  store ptr %srcaddr, ptr %srcaddr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %srcaddr.addr, metadata !4802, metadata !DIExpression()), !dbg !4803
  store i64 %len, ptr %len.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %len.addr, metadata !4804, metadata !DIExpression()), !dbg !4805
  call void @llvm.dbg.declare(metadata ptr %dest, metadata !4806, metadata !DIExpression()), !dbg !4807
  %0 = load ptr, ptr %destaddr.addr, align 8, !dbg !4808
  store ptr %0, ptr %dest, align 8, !dbg !4807
  call void @llvm.dbg.declare(metadata ptr %src, metadata !4809, metadata !DIExpression()), !dbg !4810
  %1 = load ptr, ptr %srcaddr.addr, align 8, !dbg !4811
  store ptr %1, ptr %src, align 8, !dbg !4810
  br label %while.cond, !dbg !4812

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, ptr %len.addr, align 8, !dbg !4813
  %dec = add i64 %2, -1, !dbg !4813
  store i64 %dec, ptr %len.addr, align 8, !dbg !4813
  %cmp = icmp ugt i64 %2, 0, !dbg !4814
  br i1 %cmp, label %while.body, label %while.end, !dbg !4812

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr %src, align 8, !dbg !4815
  %incdec.ptr = getelementptr inbounds i8, ptr %3, i32 1, !dbg !4815
  store ptr %incdec.ptr, ptr %src, align 8, !dbg !4815
  %4 = load i8, ptr %3, align 1, !dbg !4816
  %5 = load ptr, ptr %dest, align 8, !dbg !4817
  %incdec.ptr1 = getelementptr inbounds i8, ptr %5, i32 1, !dbg !4817
  store ptr %incdec.ptr1, ptr %dest, align 8, !dbg !4817
  store i8 %4, ptr %5, align 1, !dbg !4818
  br label %while.cond, !dbg !4812, !llvm.loop !4819

while.end:                                        ; preds = %while.cond
  %6 = load ptr, ptr %destaddr.addr, align 8, !dbg !4821
  ret ptr %6, !dbg !4822
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @memset(ptr noundef %dst, i32 noundef %s, i64 noundef %count) #0 !dbg !4823 {
entry:
  %dst.addr = alloca ptr, align 8
  %s.addr = alloca i32, align 4
  %count.addr = alloca i64, align 8
  %a = alloca ptr, align 8
  store ptr %dst, ptr %dst.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %dst.addr, metadata !4827, metadata !DIExpression()), !dbg !4828
  store i32 %s, ptr %s.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %s.addr, metadata !4829, metadata !DIExpression()), !dbg !4830
  store i64 %count, ptr %count.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %count.addr, metadata !4831, metadata !DIExpression()), !dbg !4832
  call void @llvm.dbg.declare(metadata ptr %a, metadata !4833, metadata !DIExpression()), !dbg !4834
  %0 = load ptr, ptr %dst.addr, align 8, !dbg !4835
  store ptr %0, ptr %a, align 8, !dbg !4834
  br label %while.cond, !dbg !4836

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i64, ptr %count.addr, align 8, !dbg !4837
  %dec = add i64 %1, -1, !dbg !4837
  store i64 %dec, ptr %count.addr, align 8, !dbg !4837
  %cmp = icmp ugt i64 %1, 0, !dbg !4838
  br i1 %cmp, label %while.body, label %while.end, !dbg !4836

while.body:                                       ; preds = %while.cond
  %2 = load i32, ptr %s.addr, align 4, !dbg !4839
  %conv = trunc i32 %2 to i8, !dbg !4839
  %3 = load ptr, ptr %a, align 8, !dbg !4840
  %incdec.ptr = getelementptr inbounds i8, ptr %3, i32 1, !dbg !4840
  store ptr %incdec.ptr, ptr %a, align 8, !dbg !4840
  store i8 %conv, ptr %3, align 1, !dbg !4841
  br label %while.cond, !dbg !4836, !llvm.loop !4842

while.end:                                        ; preds = %while.cond
  %4 = load ptr, ptr %dst.addr, align 8, !dbg !4843
  ret ptr %4, !dbg !4844
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_overshift_check(i64 noundef %bitWidth, i64 noundef %shift) #0 !dbg !4845 {
entry:
  %bitWidth.addr = alloca i64, align 8
  %shift.addr = alloca i64, align 8
  store i64 %bitWidth, ptr %bitWidth.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %bitWidth.addr, metadata !4849, metadata !DIExpression()), !dbg !4850
  store i64 %shift, ptr %shift.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %shift.addr, metadata !4851, metadata !DIExpression()), !dbg !4852
  %0 = load i64, ptr %shift.addr, align 8, !dbg !4853
  %1 = load i64, ptr %bitWidth.addr, align 8, !dbg !4855
  %cmp = icmp uge i64 %0, %1, !dbg !4856
  br i1 %cmp, label %if.then, label %if.end, !dbg !4857

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.90, i32 noundef 0, ptr noundef @.str.1.91, ptr noundef @.str.2.92) #13, !dbg !4858
  unreachable, !dbg !4858

if.end:                                           ; preds = %entry
  ret void, !dbg !4860
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #8 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nocallback nofree nosync nounwind willreturn }
attributes #12 = { nounwind allocsize(0) }
attributes #13 = { noreturn }
attributes #14 = { noreturn nounwind }
attributes #15 = { nounwind willreturn memory(read) }
attributes #16 = { nounwind }
attributes #17 = { nounwind willreturn memory(none) }

!llvm.dbg.cu = !{!509, !514, !198, !516, !310, !520, !553, !555, !557}
!llvm.module.flags = !{!560, !561, !562, !563, !564, !565, !566}
!llvm.ident = !{!567, !567, !567, !567, !567, !567, !567, !567, !567}

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
!140 = distinct !DIGlobalVariable(scope: null, file: !141, line: 112, type: !142, isLocal: true, isDefinition: true)
!141 = !DIFile(filename: "klee_src/runtime/POSIX/fd_init.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "0b3ec57f306e31d8d312045d84027ae7")
!142 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !143)
!143 = !{!144}
!144 = !DISubrange(count: 2)
!145 = !DIGlobalVariableExpression(var: !146, expr: !DIExpression())
!146 = distinct !DIGlobalVariable(scope: null, file: !141, line: 117, type: !147, isLocal: true, isDefinition: true)
!147 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 304, elements: !148)
!148 = !{!149}
!149 = !DISubrange(count: 38)
!150 = !DIGlobalVariableExpression(var: !151, expr: !DIExpression())
!151 = distinct !DIGlobalVariable(scope: null, file: !141, line: 117, type: !124, isLocal: true, isDefinition: true)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(scope: null, file: !141, line: 117, type: !20, isLocal: true, isDefinition: true)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(scope: null, file: !141, line: 129, type: !156, isLocal: true, isDefinition: true)
!156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !157)
!157 = !{!158}
!158 = !DISubrange(count: 6)
!159 = !DIGlobalVariableExpression(var: !160, expr: !DIExpression())
!160 = distinct !DIGlobalVariable(scope: null, file: !141, line: 145, type: !15, isLocal: true, isDefinition: true)
!161 = !DIGlobalVariableExpression(var: !162, expr: !DIExpression())
!162 = distinct !DIGlobalVariable(scope: null, file: !141, line: 146, type: !35, isLocal: true, isDefinition: true)
!163 = !DIGlobalVariableExpression(var: !164, expr: !DIExpression())
!164 = distinct !DIGlobalVariable(scope: null, file: !141, line: 147, type: !35, isLocal: true, isDefinition: true)
!165 = !DIGlobalVariableExpression(var: !166, expr: !DIExpression())
!166 = distinct !DIGlobalVariable(scope: null, file: !141, line: 148, type: !167, isLocal: true, isDefinition: true)
!167 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !168)
!168 = !{!169}
!169 = !DISubrange(count: 15)
!170 = !DIGlobalVariableExpression(var: !171, expr: !DIExpression())
!171 = distinct !DIGlobalVariable(scope: null, file: !141, line: 149, type: !54, isLocal: true, isDefinition: true)
!172 = !DIGlobalVariableExpression(var: !173, expr: !DIExpression())
!173 = distinct !DIGlobalVariable(scope: null, file: !141, line: 157, type: !3, isLocal: true, isDefinition: true)
!174 = !DIGlobalVariableExpression(var: !175, expr: !DIExpression())
!175 = distinct !DIGlobalVariable(scope: null, file: !141, line: 52, type: !156, isLocal: true, isDefinition: true)
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression())
!177 = distinct !DIGlobalVariable(scope: null, file: !141, line: 54, type: !178, isLocal: true, isDefinition: true)
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !179)
!179 = !{!180}
!180 = !DISubrange(count: 5)
!181 = !DIGlobalVariableExpression(var: !182, expr: !DIExpression())
!182 = distinct !DIGlobalVariable(scope: null, file: !141, line: 54, type: !183, isLocal: true, isDefinition: true)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 704, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 88)
!186 = !DIGlobalVariableExpression(var: !187, expr: !DIExpression())
!187 = distinct !DIGlobalVariable(scope: null, file: !188, line: 16, type: !30, isLocal: true, isDefinition: true)
!188 = !DIFile(filename: "klee_src/runtime/Intrinsic/klee_range.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "967b9ed6e7b3db2f47ee33010ec31c43")
!189 = !DIGlobalVariableExpression(var: !190, expr: !DIExpression())
!190 = distinct !DIGlobalVariable(scope: null, file: !188, line: 16, type: !191, isLocal: true, isDefinition: true)
!191 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !192)
!192 = !{!193}
!193 = !DISubrange(count: 14)
!194 = !DIGlobalVariableExpression(var: !195, expr: !DIExpression())
!195 = distinct !DIGlobalVariable(scope: null, file: !188, line: 16, type: !178, isLocal: true, isDefinition: true)
!196 = !DIGlobalVariableExpression(var: !197, expr: !DIExpression())
!197 = distinct !DIGlobalVariable(name: "__exe_env", scope: !198, file: !141, line: 34, type: !272, isLocal: false, isDefinition: true)
!198 = distinct !DICompileUnit(language: DW_LANG_C89, file: !199, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !200, splitDebugInlining: false, nameTableKind: None)
!199 = !DIFile(filename: "/tmp/klee_src/runtime/POSIX/fd_init.c", directory: "/tmp/klee_build160stp_z3/runtime/POSIX", checksumkind: CSK_MD5, checksum: "0b3ec57f306e31d8d312045d84027ae7")
!200 = !{!196, !139, !145, !150, !152, !154, !159, !161, !163, !165, !170, !172, !201, !174, !176, !181}
!201 = !DIGlobalVariableExpression(var: !202, expr: !DIExpression())
!202 = distinct !DIGlobalVariable(name: "__exe_fs", scope: !198, file: !141, line: 21, type: !203, isLocal: false, isDefinition: true)
!203 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_file_system_t", file: !204, line: 87, baseType: !205)
!204 = !DIFile(filename: "klee_src/runtime/POSIX/fd.h", directory: "/tmp", checksumkind: CSK_MD5, checksum: "c3ceb01eba347a2d17a528cf2ea6c932")
!205 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !204, line: 75, size: 832, elements: !206)
!206 = !{!207, !209, !260, !261, !262, !263, !264, !266, !267, !268, !269, !270, !271}
!207 = !DIDerivedType(tag: DW_TAG_member, name: "n_sym_files", scope: !205, file: !204, line: 76, baseType: !208, size: 32)
!208 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "sym_stdin", scope: !205, file: !204, line: 77, baseType: !210, size: 64, offset: 64)
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_disk_file_t", file: !204, line: 57, baseType: !212)
!212 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !204, line: 53, size: 192, elements: !213)
!213 = !{!214, !215, !217}
!214 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !212, file: !204, line: 54, baseType: !208, size: 32)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "contents", scope: !212, file: !204, line: 55, baseType: !216, size: 64, offset: 64)
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "stat", scope: !212, file: !204, line: 56, baseType: !218, size: 64, offset: 128)
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !219, size: 64)
!219 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat64", file: !220, line: 103, size: 1152, elements: !221)
!220 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_stat.h", directory: "", checksumkind: CSK_MD5, checksum: "3ba283bc334370fe631cbc82f5229ed7")
!221 = !{!222, !226, !228, !230, !232, !234, !236, !238, !239, !242, !244, !246, !254, !255, !256}
!222 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !219, file: !220, line: 108, baseType: !223, size: 64)
!223 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !224, line: 145, baseType: !225)
!224 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!225 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !219, file: !220, line: 110, baseType: !227, size: 64, offset: 64)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino64_t", file: !224, line: 149, baseType: !225)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !219, file: !220, line: 111, baseType: !229, size: 64, offset: 128)
!229 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !224, line: 151, baseType: !225)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !219, file: !220, line: 112, baseType: !231, size: 32, offset: 192)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !224, line: 150, baseType: !208)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !219, file: !220, line: 119, baseType: !233, size: 32, offset: 224)
!233 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !224, line: 146, baseType: !208)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !219, file: !220, line: 120, baseType: !235, size: 32, offset: 256)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !224, line: 147, baseType: !208)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !219, file: !220, line: 122, baseType: !237, size: 32, offset: 288)
!237 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !219, file: !220, line: 123, baseType: !223, size: 64, offset: 320)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !219, file: !220, line: 124, baseType: !240, size: 64, offset: 384)
!240 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !224, line: 152, baseType: !241)
!241 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !219, file: !220, line: 130, baseType: !243, size: 64, offset: 448)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !224, line: 175, baseType: !241)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !219, file: !220, line: 131, baseType: !245, size: 64, offset: 512)
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt64_t", file: !224, line: 181, baseType: !241)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !219, file: !220, line: 139, baseType: !247, size: 128, offset: 576)
!247 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !248, line: 11, size: 128, elements: !249)
!248 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!249 = !{!250, !252}
!250 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !247, file: !248, line: 16, baseType: !251, size: 64)
!251 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !224, line: 160, baseType: !241)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !247, file: !248, line: 21, baseType: !253, size: 64, offset: 64)
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !224, line: 197, baseType: !241)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !219, file: !220, line: 140, baseType: !247, size: 128, offset: 704)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !219, file: !220, line: 141, baseType: !247, size: 128, offset: 832)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !219, file: !220, line: 151, baseType: !257, size: 192, offset: 960)
!257 = !DICompositeType(tag: DW_TAG_array_type, baseType: !253, size: 192, elements: !258)
!258 = !{!259}
!259 = !DISubrange(count: 3)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "sym_stdout", scope: !205, file: !204, line: 77, baseType: !210, size: 64, offset: 128)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "stdout_writes", scope: !205, file: !204, line: 78, baseType: !208, size: 32, offset: 192)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "sym_files", scope: !205, file: !204, line: 79, baseType: !210, size: 64, offset: 256)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "max_failures", scope: !205, file: !204, line: 82, baseType: !208, size: 32, offset: 320)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "read_fail", scope: !205, file: !204, line: 85, baseType: !265, size: 64, offset: 384)
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "write_fail", scope: !205, file: !204, line: 85, baseType: !265, size: 64, offset: 448)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "close_fail", scope: !205, file: !204, line: 85, baseType: !265, size: 64, offset: 512)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "ftruncate_fail", scope: !205, file: !204, line: 85, baseType: !265, size: 64, offset: 576)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "getcwd_fail", scope: !205, file: !204, line: 85, baseType: !265, size: 64, offset: 640)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "chmod_fail", scope: !205, file: !204, line: 86, baseType: !265, size: 64, offset: 704)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "fchmod_fail", scope: !205, file: !204, line: 86, baseType: !265, size: 64, offset: 768)
!272 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_sym_env_t", file: !204, line: 101, baseType: !273)
!273 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !204, line: 94, size: 6208, elements: !274)
!274 = !{!275, !289, !291}
!275 = !DIDerivedType(tag: DW_TAG_member, name: "fds", scope: !273, file: !204, line: 95, baseType: !276, size: 6144)
!276 = !DICompositeType(tag: DW_TAG_array_type, baseType: !277, size: 6144, elements: !287)
!277 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_file_t", file: !204, line: 73, baseType: !278)
!278 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !204, line: 66, size: 192, elements: !279)
!279 = !{!280, !281, !282, !286}
!280 = !DIDerivedType(tag: DW_TAG_member, name: "fd", scope: !278, file: !204, line: 67, baseType: !237, size: 32)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !278, file: !204, line: 68, baseType: !208, size: 32, offset: 32)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "off", scope: !278, file: !204, line: 71, baseType: !283, size: 64, offset: 64)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "off64_t", file: !284, line: 92, baseType: !285)
!284 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e62424071ad3f1b4d088c139fd9ccfd1")
!285 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !224, line: 153, baseType: !241)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "dfile", scope: !278, file: !204, line: 72, baseType: !210, size: 64, offset: 128)
!287 = !{!288}
!288 = !DISubrange(count: 32)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "umask", scope: !273, file: !204, line: 96, baseType: !290, size: 32, offset: 6144)
!290 = !DIDerivedType(tag: DW_TAG_typedef, name: "mode_t", file: !284, line: 69, baseType: !231)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "save_all_writes", scope: !273, file: !204, line: 100, baseType: !237, size: 32, offset: 6176)
!292 = !DIGlobalVariableExpression(var: !293, expr: !DIExpression())
!293 = distinct !DIGlobalVariable(scope: null, file: !294, line: 159, type: !295, isLocal: true, isDefinition: true)
!294 = !DIFile(filename: "klee_src/runtime/POSIX/fd.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "fd27ffca8f23688b1cbb26cb3f8119d2")
!295 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 368, elements: !296)
!296 = !{!297}
!297 = !DISubrange(count: 46)
!298 = !DIGlobalVariableExpression(var: !299, expr: !DIExpression())
!299 = distinct !DIGlobalVariable(scope: null, file: !294, line: 167, type: !300, isLocal: true, isDefinition: true)
!300 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 376, elements: !301)
!301 = !{!302}
!302 = !DISubrange(count: 47)
!303 = !DIGlobalVariableExpression(var: !304, expr: !DIExpression())
!304 = distinct !DIGlobalVariable(scope: null, file: !294, line: 208, type: !129, isLocal: true, isDefinition: true)
!305 = !DIGlobalVariableExpression(var: !306, expr: !DIExpression())
!306 = distinct !DIGlobalVariable(name: "n_calls", scope: !307, file: !294, line: 299, type: !237, isLocal: true, isDefinition: true)
!307 = distinct !DISubprogram(name: "close", scope: !294, file: !294, line: 298, type: !308, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!308 = !DISubroutineType(types: !309)
!309 = !{!237, !237}
!310 = distinct !DICompileUnit(language: DW_LANG_C89, file: !311, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !312, retainedTypes: !331, globals: !371, splitDebugInlining: false, nameTableKind: None)
!311 = !DIFile(filename: "/tmp/klee_src/runtime/POSIX/fd.c", directory: "/tmp/klee_build160stp_z3/runtime/POSIX", checksumkind: CSK_MD5, checksum: "fd27ffca8f23688b1cbb26cb3f8119d2")
!312 = !{!313, !319}
!313 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !204, line: 59, baseType: !208, size: 32, elements: !314)
!314 = !{!315, !316, !317, !318}
!315 = !DIEnumerator(name: "eOpen", value: 1)
!316 = !DIEnumerator(name: "eCloseOnExec", value: 2)
!317 = !DIEnumerator(name: "eReadable", value: 4)
!318 = !DIEnumerator(name: "eWriteable", value: 8)
!319 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !320, line: 97, baseType: !208, size: 32, elements: !321)
!320 = !DIFile(filename: "/usr/include/dirent.h", directory: "", checksumkind: CSK_MD5, checksum: "6eb1a2faa0cf53b967234cc6c0fe978e")
!321 = !{!322, !323, !324, !325, !326, !327, !328, !329, !330}
!322 = !DIEnumerator(name: "DT_UNKNOWN", value: 0)
!323 = !DIEnumerator(name: "DT_FIFO", value: 1)
!324 = !DIEnumerator(name: "DT_CHR", value: 2)
!325 = !DIEnumerator(name: "DT_DIR", value: 4)
!326 = !DIEnumerator(name: "DT_BLK", value: 6)
!327 = !DIEnumerator(name: "DT_REG", value: 8)
!328 = !DIEnumerator(name: "DT_LNK", value: 10)
!329 = !DIEnumerator(name: "DT_SOCK", value: 12)
!330 = !DIEnumerator(name: "DT_WHT", value: 14)
!331 = !{!241, !332, !283, !225, !333, !216, !347, !237, !5}
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!333 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !334, size: 64)
!334 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dirent64", file: !335, line: 37, size: 2240, elements: !336)
!335 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/dirent.h", directory: "", checksumkind: CSK_MD5, checksum: "bc8b10a1ddd2747862e3ae7b91dbf464")
!336 = !{!337, !338, !339, !341, !343}
!337 = !DIDerivedType(tag: DW_TAG_member, name: "d_ino", scope: !334, file: !335, line: 39, baseType: !227, size: 64)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "d_off", scope: !334, file: !335, line: 40, baseType: !285, size: 64, offset: 64)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "d_reclen", scope: !334, file: !335, line: 41, baseType: !340, size: 16, offset: 128)
!340 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "d_type", scope: !334, file: !335, line: 42, baseType: !342, size: 8, offset: 144)
!342 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "d_name", scope: !334, file: !335, line: 43, baseType: !344, size: 2048, offset: 152)
!344 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 2048, elements: !345)
!345 = !{!346}
!346 = !DISubrange(count: 256)
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !348, size: 64)
!348 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !220, line: 26, size: 1152, elements: !349)
!349 = !{!350, !351, !353, !354, !355, !356, !357, !358, !359, !360, !361, !363, !368, !369, !370}
!350 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !348, file: !220, line: 31, baseType: !223, size: 64)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !348, file: !220, line: 36, baseType: !352, size: 64, offset: 64)
!352 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !224, line: 148, baseType: !225)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !348, file: !220, line: 44, baseType: !229, size: 64, offset: 128)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !348, file: !220, line: 45, baseType: !231, size: 32, offset: 192)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !348, file: !220, line: 47, baseType: !233, size: 32, offset: 224)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !348, file: !220, line: 48, baseType: !235, size: 32, offset: 256)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !348, file: !220, line: 50, baseType: !237, size: 32, offset: 288)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !348, file: !220, line: 52, baseType: !223, size: 64, offset: 320)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !348, file: !220, line: 57, baseType: !240, size: 64, offset: 384)
!360 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !348, file: !220, line: 61, baseType: !243, size: 64, offset: 448)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !348, file: !220, line: 63, baseType: !362, size: 64, offset: 512)
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !224, line: 180, baseType: !241)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !348, file: !220, line: 74, baseType: !364, size: 128, offset: 576)
!364 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !248, line: 11, size: 128, elements: !365)
!365 = !{!366, !367}
!366 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !364, file: !248, line: 16, baseType: !251, size: 64)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !364, file: !248, line: 21, baseType: !253, size: 64, offset: 64)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !348, file: !220, line: 75, baseType: !364, size: 128, offset: 704)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !348, file: !220, line: 76, baseType: !364, size: 128, offset: 832)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !348, file: !220, line: 89, baseType: !257, size: 192, offset: 960)
!371 = !{!292, !298, !303, !305, !372, !382, !384, !389, !394, !401, !403, !408, !410, !415, !417, !419, !421, !426, !428, !434, !439, !444, !449, !451, !453, !455, !460, !462, !467, !472, !474, !476, !478, !480, !482, !485, !487, !492, !494}
!372 = !DIGlobalVariableExpression(var: !373, expr: !DIExpression())
!373 = distinct !DIGlobalVariable(name: "n_calls", scope: !374, file: !294, line: 331, type: !237, isLocal: true, isDefinition: true)
!374 = distinct !DISubprogram(name: "read", scope: !294, file: !294, line: 330, type: !375, scopeLine: 330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!375 = !DISubroutineType(types: !376)
!376 = !{!377, !237, !332, !379}
!377 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !284, line: 108, baseType: !378)
!378 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ssize_t", file: !224, line: 194, baseType: !241)
!379 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !380, line: 46, baseType: !225)
!380 = !DIFile(filename: "llvm-160-install_O_D_A/lib/clang/16/include/stddef.h", directory: "/tmp", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!381 = !{}
!382 = !DIGlobalVariableExpression(var: !383, expr: !DIExpression())
!383 = distinct !DIGlobalVariable(scope: null, file: !294, line: 379, type: !54, isLocal: true, isDefinition: true)
!384 = !DIGlobalVariableExpression(var: !385, expr: !DIExpression())
!385 = distinct !DIGlobalVariable(scope: null, file: !294, line: 379, type: !386, isLocal: true, isDefinition: true)
!386 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 264, elements: !387)
!387 = !{!388}
!388 = !DISubrange(count: 33)
!389 = !DIGlobalVariableExpression(var: !390, expr: !DIExpression())
!390 = distinct !DIGlobalVariable(scope: null, file: !294, line: 379, type: !391, isLocal: true, isDefinition: true)
!391 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 272, elements: !392)
!392 = !{!393}
!393 = !DISubrange(count: 34)
!394 = !DIGlobalVariableExpression(var: !395, expr: !DIExpression())
!395 = distinct !DIGlobalVariable(name: "n_calls", scope: !396, file: !294, line: 397, type: !237, isLocal: true, isDefinition: true)
!396 = distinct !DISubprogram(name: "write", scope: !294, file: !294, line: 396, type: !397, scopeLine: 396, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!397 = !DISubroutineType(types: !398)
!398 = !{!377, !237, !399, !379}
!399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !400, size: 64)
!400 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!401 = !DIGlobalVariableExpression(var: !402, expr: !DIExpression())
!402 = distinct !DIGlobalVariable(scope: null, file: !294, line: 431, type: !3, isLocal: true, isDefinition: true)
!403 = !DIGlobalVariableExpression(var: !404, expr: !DIExpression())
!404 = distinct !DIGlobalVariable(scope: null, file: !294, line: 431, type: !405, isLocal: true, isDefinition: true)
!405 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !406)
!406 = !{!407}
!407 = !DISubrange(count: 41)
!408 = !DIGlobalVariableExpression(var: !409, expr: !DIExpression())
!409 = distinct !DIGlobalVariable(scope: null, file: !294, line: 444, type: !142, isLocal: true, isDefinition: true)
!410 = !DIGlobalVariableExpression(var: !411, expr: !DIExpression())
!411 = distinct !DIGlobalVariable(scope: null, file: !294, line: 455, type: !412, isLocal: true, isDefinition: true)
!412 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !413)
!413 = !{!414}
!414 = !DISubrange(count: 24)
!415 = !DIGlobalVariableExpression(var: !416, expr: !DIExpression())
!416 = distinct !DIGlobalVariable(scope: null, file: !294, line: 490, type: !97, isLocal: true, isDefinition: true)
!417 = !DIGlobalVariableExpression(var: !418, expr: !DIExpression())
!418 = distinct !DIGlobalVariable(scope: null, file: !294, line: 490, type: !147, isLocal: true, isDefinition: true)
!419 = !DIGlobalVariableExpression(var: !420, expr: !DIExpression())
!420 = distinct !DIGlobalVariable(scope: null, file: !294, line: 560, type: !178, isLocal: true, isDefinition: true)
!421 = !DIGlobalVariableExpression(var: !422, expr: !DIExpression())
!422 = distinct !DIGlobalVariable(scope: null, file: !294, line: 560, type: !423, isLocal: true, isDefinition: true)
!423 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 408, elements: !424)
!424 = !{!425}
!425 = !DISubrange(count: 51)
!426 = !DIGlobalVariableExpression(var: !427, expr: !DIExpression())
!427 = distinct !DIGlobalVariable(scope: null, file: !294, line: 593, type: !386, isLocal: true, isDefinition: true)
!428 = !DIGlobalVariableExpression(var: !429, expr: !DIExpression())
!429 = distinct !DIGlobalVariable(name: "n_calls", scope: !430, file: !294, line: 633, type: !237, isLocal: true, isDefinition: true)
!430 = distinct !DISubprogram(name: "chmod", scope: !294, file: !294, line: 632, type: !431, scopeLine: 632, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!431 = !DISubroutineType(types: !432)
!432 = !{!237, !433, !290}
!433 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!434 = !DIGlobalVariableExpression(var: !435, expr: !DIExpression())
!435 = distinct !DIGlobalVariable(name: "n_calls", scope: !436, file: !294, line: 652, type: !237, isLocal: true, isDefinition: true)
!436 = distinct !DISubprogram(name: "fchmod", scope: !294, file: !294, line: 651, type: !437, scopeLine: 651, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!437 = !DISubroutineType(types: !438)
!438 = !{!237, !237, !290}
!439 = !DIGlobalVariableExpression(var: !440, expr: !DIExpression())
!440 = distinct !DIGlobalVariable(name: "n_calls", scope: !441, file: !294, line: 738, type: !237, isLocal: true, isDefinition: true)
!441 = distinct !DISubprogram(name: "__fd_ftruncate", scope: !294, file: !294, line: 737, type: !442, scopeLine: 737, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!442 = !DISubroutineType(types: !443)
!443 = !{!237, !237, !283}
!444 = !DIGlobalVariableExpression(var: !445, expr: !DIExpression())
!445 = distinct !DIGlobalVariable(scope: null, file: !294, line: 755, type: !446, isLocal: true, isDefinition: true)
!446 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 240, elements: !447)
!447 = !{!448}
!448 = !DISubrange(count: 30)
!449 = !DIGlobalVariableExpression(var: !450, expr: !DIExpression())
!450 = distinct !DIGlobalVariable(scope: null, file: !294, line: 775, type: !386, isLocal: true, isDefinition: true)
!451 = !DIGlobalVariableExpression(var: !452, expr: !DIExpression())
!452 = distinct !DIGlobalVariable(scope: null, file: !294, line: 830, type: !97, isLocal: true, isDefinition: true)
!453 = !DIGlobalVariableExpression(var: !454, expr: !DIExpression())
!454 = distinct !DIGlobalVariable(scope: null, file: !294, line: 830, type: !71, isLocal: true, isDefinition: true)
!455 = !DIGlobalVariableExpression(var: !456, expr: !DIExpression())
!456 = distinct !DIGlobalVariable(scope: null, file: !294, line: 835, type: !457, isLocal: true, isDefinition: true)
!457 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !458)
!458 = !{!459}
!459 = !DISubrange(count: 22)
!460 = !DIGlobalVariableExpression(var: !461, expr: !DIExpression())
!461 = distinct !DIGlobalVariable(scope: null, file: !294, line: 880, type: !405, isLocal: true, isDefinition: true)
!462 = !DIGlobalVariableExpression(var: !463, expr: !DIExpression())
!463 = distinct !DIGlobalVariable(scope: null, file: !294, line: 920, type: !464, isLocal: true, isDefinition: true)
!464 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !465)
!465 = !{!466}
!466 = !DISubrange(count: 42)
!467 = !DIGlobalVariableExpression(var: !468, expr: !DIExpression())
!468 = distinct !DIGlobalVariable(scope: null, file: !294, line: 930, type: !469, isLocal: true, isDefinition: true)
!469 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 344, elements: !470)
!470 = !{!471}
!471 = !DISubrange(count: 43)
!472 = !DIGlobalVariableExpression(var: !473, expr: !DIExpression())
!473 = distinct !DIGlobalVariable(scope: null, file: !294, line: 940, type: !469, isLocal: true, isDefinition: true)
!474 = !DIGlobalVariableExpression(var: !475, expr: !DIExpression())
!475 = distinct !DIGlobalVariable(scope: null, file: !294, line: 952, type: !30, isLocal: true, isDefinition: true)
!476 = !DIGlobalVariableExpression(var: !477, expr: !DIExpression())
!477 = distinct !DIGlobalVariable(scope: null, file: !294, line: 962, type: !295, isLocal: true, isDefinition: true)
!478 = !DIGlobalVariableExpression(var: !479, expr: !DIExpression())
!479 = distinct !DIGlobalVariable(scope: null, file: !294, line: 973, type: !469, isLocal: true, isDefinition: true)
!480 = !DIGlobalVariableExpression(var: !481, expr: !DIExpression())
!481 = distinct !DIGlobalVariable(scope: null, file: !294, line: 987, type: !129, isLocal: true, isDefinition: true)
!482 = !DIGlobalVariableExpression(var: !483, expr: !DIExpression())
!483 = distinct !DIGlobalVariable(scope: null, file: !294, line: 1094, type: !484, isLocal: true, isDefinition: true)
!484 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !287)
!485 = !DIGlobalVariableExpression(var: !486, expr: !DIExpression())
!486 = distinct !DIGlobalVariable(scope: null, file: !294, line: 1170, type: !102, isLocal: true, isDefinition: true)
!487 = !DIGlobalVariableExpression(var: !488, expr: !DIExpression())
!488 = distinct !DIGlobalVariable(name: "n_calls", scope: !489, file: !294, line: 1332, type: !237, isLocal: true, isDefinition: true)
!489 = distinct !DISubprogram(name: "getcwd", scope: !294, file: !294, line: 1331, type: !490, scopeLine: 1331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!490 = !DISubroutineType(types: !491)
!491 = !{!216, !216, !379}
!492 = !DIGlobalVariableExpression(var: !493, expr: !DIExpression())
!493 = distinct !DIGlobalVariable(scope: null, file: !294, line: 1427, type: !97, isLocal: true, isDefinition: true)
!494 = !DIGlobalVariableExpression(var: !495, expr: !DIExpression())
!495 = distinct !DIGlobalVariable(scope: null, file: !294, line: 676, type: !484, isLocal: true, isDefinition: true)
!496 = !DIGlobalVariableExpression(var: !497, expr: !DIExpression())
!497 = distinct !DIGlobalVariable(scope: null, file: !498, line: 27, type: !499, isLocal: true, isDefinition: true)
!498 = !DIFile(filename: "klee_src/runtime/Intrinsic/klee_overshift_check.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "5666ed772284910b5d0f856859e4d123")
!499 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !500)
!500 = !{!501}
!501 = !DISubrange(count: 8)
!502 = !DIGlobalVariableExpression(var: !503, expr: !DIExpression())
!503 = distinct !DIGlobalVariable(scope: null, file: !498, line: 27, type: !504, isLocal: true, isDefinition: true)
!504 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !505)
!505 = !{!506}
!506 = !DISubrange(count: 16)
!507 = !DIGlobalVariableExpression(var: !508, expr: !DIExpression())
!508 = distinct !DIGlobalVariable(scope: null, file: !498, line: 27, type: !191, isLocal: true, isDefinition: true)
!509 = distinct !DICompileUnit(language: DW_LANG_C89, file: !510, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !511, globals: !513, splitDebugInlining: false, nameTableKind: None)
!510 = !DIFile(filename: "/tmp/klee_src/runtime/POSIX/klee_init_env.c", directory: "/tmp/klee_build160stp_z3/runtime/POSIX", checksumkind: CSK_MD5, checksum: "ba7d55a62d9543eebe7c76b1af831f03")
!511 = !{!512}
!512 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!513 = !{!0, !8, !13, !18, !23, !28, !33, !38, !40, !45, !50, !52, !57, !59, !64, !69, !74, !79, !81, !83, !88, !93, !95, !100, !105, !107, !109, !111, !113, !115, !117, !122, !127, !132, !134}
!514 = distinct !DICompileUnit(language: DW_LANG_C11, file: !515, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!515 = !DIFile(filename: "/workspace/benchmarks/targets/md5sum_klee.c", directory: "/workspace", checksumkind: CSK_MD5, checksum: "3be79d9e406ba777af5cb3c06c201f83")
!516 = distinct !DICompileUnit(language: DW_LANG_C89, file: !517, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !518, globals: !519, splitDebugInlining: false, nameTableKind: None)
!517 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/klee_range.c", directory: "/tmp/klee_build160stp_z3/runtime/Intrinsic", checksumkind: CSK_MD5, checksum: "967b9ed6e7b3db2f47ee33010ec31c43")
!518 = !{!208}
!519 = !{!186, !189, !194}
!520 = distinct !DICompileUnit(language: DW_LANG_C89, file: !521, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !522, splitDebugInlining: false, nameTableKind: None)
!521 = !DIFile(filename: "/tmp/klee_src/runtime/POSIX/fd_64.c", directory: "/tmp/klee_build160stp_z3/runtime/POSIX", checksumkind: CSK_MD5, checksum: "cc9a465ed9cbb2f7acded7c1ccec6e43")
!522 = !{!523, !545}
!523 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !524, size: 64)
!524 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat64", file: !220, line: 103, size: 1152, elements: !525)
!525 = !{!526, !527, !528, !529, !530, !531, !532, !533, !534, !535, !536, !537, !542, !543, !544}
!526 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !524, file: !220, line: 108, baseType: !223, size: 64)
!527 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !524, file: !220, line: 110, baseType: !227, size: 64, offset: 64)
!528 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !524, file: !220, line: 111, baseType: !229, size: 64, offset: 128)
!529 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !524, file: !220, line: 112, baseType: !231, size: 32, offset: 192)
!530 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !524, file: !220, line: 119, baseType: !233, size: 32, offset: 224)
!531 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !524, file: !220, line: 120, baseType: !235, size: 32, offset: 256)
!532 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !524, file: !220, line: 122, baseType: !237, size: 32, offset: 288)
!533 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !524, file: !220, line: 123, baseType: !223, size: 64, offset: 320)
!534 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !524, file: !220, line: 124, baseType: !240, size: 64, offset: 384)
!535 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !524, file: !220, line: 130, baseType: !243, size: 64, offset: 448)
!536 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !524, file: !220, line: 131, baseType: !245, size: 64, offset: 512)
!537 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !524, file: !220, line: 139, baseType: !538, size: 128, offset: 576)
!538 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !248, line: 11, size: 128, elements: !539)
!539 = !{!540, !541}
!540 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !538, file: !248, line: 16, baseType: !251, size: 64)
!541 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !538, file: !248, line: 21, baseType: !253, size: 64, offset: 64)
!542 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !524, file: !220, line: 140, baseType: !538, size: 128, offset: 704)
!543 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !524, file: !220, line: 141, baseType: !538, size: 128, offset: 832)
!544 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !524, file: !220, line: 151, baseType: !257, size: 192, offset: 960)
!545 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !546, size: 64)
!546 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dirent64", file: !335, line: 37, size: 2240, elements: !547)
!547 = !{!548, !549, !550, !551, !552}
!548 = !DIDerivedType(tag: DW_TAG_member, name: "d_ino", scope: !546, file: !335, line: 39, baseType: !227, size: 64)
!549 = !DIDerivedType(tag: DW_TAG_member, name: "d_off", scope: !546, file: !335, line: 40, baseType: !285, size: 64, offset: 64)
!550 = !DIDerivedType(tag: DW_TAG_member, name: "d_reclen", scope: !546, file: !335, line: 41, baseType: !340, size: 16, offset: 128)
!551 = !DIDerivedType(tag: DW_TAG_member, name: "d_type", scope: !546, file: !335, line: 42, baseType: !342, size: 8, offset: 144)
!552 = !DIDerivedType(tag: DW_TAG_member, name: "d_name", scope: !546, file: !335, line: 43, baseType: !344, size: 2048, offset: 152)
!553 = distinct !DICompileUnit(language: DW_LANG_C11, file: !554, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!554 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build160stp_z3/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!555 = distinct !DICompileUnit(language: DW_LANG_C11, file: !556, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!556 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memset.c", directory: "/tmp/klee_build160stp_z3/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "f66ef9ef9131ab198e93a41b1a9ae1fc")
!557 = distinct !DICompileUnit(language: DW_LANG_C89, file: !558, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !559, splitDebugInlining: false, nameTableKind: None)
!558 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/klee_overshift_check.c", directory: "/tmp/klee_build160stp_z3/runtime/Intrinsic", checksumkind: CSK_MD5, checksum: "5666ed772284910b5d0f856859e4d123")
!559 = !{!496, !502, !507}
!560 = !{i32 7, !"Dwarf Version", i32 5}
!561 = !{i32 2, !"Debug Info Version", i32 3}
!562 = !{i32 1, !"wchar_size", i32 4}
!563 = !{i32 8, !"PIC Level", i32 2}
!564 = !{i32 7, !"PIE Level", i32 2}
!565 = !{i32 7, !"uwtable", i32 2}
!566 = !{i32 7, !"frame-pointer", i32 2}
!567 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
!568 = distinct !DISubprogram(name: "klee_init_env", scope: !2, file: !2, line: 82, type: !569, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !509, retainedNodes: !381)
!569 = !DISubroutineType(types: !570)
!570 = !{null, !265, !571}
!571 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !512, size: 64)
!572 = !DILocalVariable(name: "argcPtr", arg: 1, scope: !568, file: !2, line: 82, type: !265)
!573 = !DILocation(line: 82, column: 25, scope: !568)
!574 = !DILocalVariable(name: "argvPtr", arg: 2, scope: !568, file: !2, line: 82, type: !571)
!575 = !DILocation(line: 82, column: 42, scope: !568)
!576 = !DILocalVariable(name: "argc", scope: !568, file: !2, line: 83, type: !237)
!577 = !DILocation(line: 83, column: 7, scope: !568)
!578 = !DILocation(line: 83, column: 15, scope: !568)
!579 = !DILocation(line: 83, column: 14, scope: !568)
!580 = !DILocalVariable(name: "argv", scope: !568, file: !2, line: 84, type: !512)
!581 = !DILocation(line: 84, column: 10, scope: !568)
!582 = !DILocation(line: 84, column: 18, scope: !568)
!583 = !DILocation(line: 84, column: 17, scope: !568)
!584 = !DILocalVariable(name: "new_argc", scope: !568, file: !2, line: 86, type: !237)
!585 = !DILocation(line: 86, column: 7, scope: !568)
!586 = !DILocalVariable(name: "n_args", scope: !568, file: !2, line: 86, type: !237)
!587 = !DILocation(line: 86, column: 21, scope: !568)
!588 = !DILocalVariable(name: "new_argv", scope: !568, file: !2, line: 87, type: !589)
!589 = !DICompositeType(tag: DW_TAG_array_type, baseType: !216, size: 65536, elements: !590)
!590 = !{!591}
!591 = !DISubrange(count: 1024)
!592 = !DILocation(line: 87, column: 9, scope: !568)
!593 = !DILocalVariable(name: "max_len", scope: !568, file: !2, line: 88, type: !208)
!594 = !DILocation(line: 88, column: 12, scope: !568)
!595 = !DILocalVariable(name: "min_argvs", scope: !568, file: !2, line: 88, type: !208)
!596 = !DILocation(line: 88, column: 21, scope: !568)
!597 = !DILocalVariable(name: "max_argvs", scope: !568, file: !2, line: 88, type: !208)
!598 = !DILocation(line: 88, column: 32, scope: !568)
!599 = !DILocalVariable(name: "sym_files", scope: !568, file: !2, line: 89, type: !208)
!600 = !DILocation(line: 89, column: 12, scope: !568)
!601 = !DILocalVariable(name: "sym_file_len", scope: !568, file: !2, line: 89, type: !208)
!602 = !DILocation(line: 89, column: 27, scope: !568)
!603 = !DILocalVariable(name: "sym_stdin_len", scope: !568, file: !2, line: 90, type: !208)
!604 = !DILocation(line: 90, column: 12, scope: !568)
!605 = !DILocalVariable(name: "sym_stdout_flag", scope: !568, file: !2, line: 91, type: !237)
!606 = !DILocation(line: 91, column: 7, scope: !568)
!607 = !DILocalVariable(name: "save_all_writes_flag", scope: !568, file: !2, line: 92, type: !237)
!608 = !DILocation(line: 92, column: 7, scope: !568)
!609 = !DILocalVariable(name: "fd_fail", scope: !568, file: !2, line: 93, type: !237)
!610 = !DILocation(line: 93, column: 7, scope: !568)
!611 = !DILocalVariable(name: "final_argv", scope: !568, file: !2, line: 94, type: !512)
!612 = !DILocation(line: 94, column: 10, scope: !568)
!613 = !DILocalVariable(name: "sym_arg_name", scope: !568, file: !2, line: 95, type: !614)
!614 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 48, elements: !157)
!615 = !DILocation(line: 95, column: 8, scope: !568)
!616 = !DILocalVariable(name: "sym_arg_num", scope: !568, file: !2, line: 96, type: !208)
!617 = !DILocation(line: 96, column: 12, scope: !568)
!618 = !DILocalVariable(name: "k", scope: !568, file: !2, line: 97, type: !237)
!619 = !DILocation(line: 97, column: 7, scope: !568)
!620 = !DILocalVariable(name: "i", scope: !568, file: !2, line: 97, type: !237)
!621 = !DILocation(line: 97, column: 14, scope: !568)
!622 = !DILocation(line: 99, column: 3, scope: !568)
!623 = !DILocation(line: 99, column: 19, scope: !568)
!624 = !DILocation(line: 102, column: 7, scope: !625)
!625 = distinct !DILexicalBlock(scope: !568, file: !2, line: 102, column: 7)
!626 = !DILocation(line: 102, column: 12, scope: !625)
!627 = !DILocation(line: 102, column: 17, scope: !625)
!628 = !DILocation(line: 102, column: 28, scope: !625)
!629 = !DILocation(line: 102, column: 20, scope: !625)
!630 = !DILocation(line: 102, column: 7, scope: !568)
!631 = !DILocation(line: 103, column: 5, scope: !632)
!632 = distinct !DILexicalBlock(scope: !625, file: !2, line: 102, column: 48)
!633 = !DILocation(line: 118, column: 3, scope: !632)
!634 = !DILocation(line: 120, column: 3, scope: !568)
!635 = !DILocation(line: 120, column: 10, scope: !568)
!636 = !DILocation(line: 120, column: 14, scope: !568)
!637 = !DILocation(line: 120, column: 12, scope: !568)
!638 = !DILocation(line: 121, column: 17, scope: !639)
!639 = distinct !DILexicalBlock(scope: !640, file: !2, line: 121, column: 9)
!640 = distinct !DILexicalBlock(scope: !568, file: !2, line: 120, column: 20)
!641 = !DILocation(line: 121, column: 22, scope: !639)
!642 = !DILocation(line: 121, column: 9, scope: !639)
!643 = !DILocation(line: 121, column: 39, scope: !639)
!644 = !DILocation(line: 121, column: 50, scope: !639)
!645 = !DILocation(line: 121, column: 55, scope: !639)
!646 = !DILocation(line: 121, column: 42, scope: !639)
!647 = !DILocation(line: 121, column: 9, scope: !640)
!648 = !DILocalVariable(name: "msg", scope: !649, file: !2, line: 122, type: !433)
!649 = distinct !DILexicalBlock(scope: !639, file: !2, line: 121, column: 72)
!650 = !DILocation(line: 122, column: 19, scope: !649)
!651 = !DILocation(line: 123, column: 11, scope: !652)
!652 = distinct !DILexicalBlock(scope: !649, file: !2, line: 123, column: 11)
!653 = !DILocation(line: 123, column: 18, scope: !652)
!654 = !DILocation(line: 123, column: 15, scope: !652)
!655 = !DILocation(line: 123, column: 11, scope: !649)
!656 = !DILocation(line: 124, column: 22, scope: !652)
!657 = !DILocation(line: 124, column: 9, scope: !652)
!658 = !DILocation(line: 126, column: 30, scope: !649)
!659 = !DILocation(line: 126, column: 36, scope: !649)
!660 = !DILocation(line: 126, column: 41, scope: !649)
!661 = !DILocation(line: 126, column: 17, scope: !649)
!662 = !DILocation(line: 126, column: 15, scope: !649)
!663 = !DILocation(line: 128, column: 11, scope: !664)
!664 = distinct !DILexicalBlock(scope: !649, file: !2, line: 128, column: 11)
!665 = !DILocation(line: 128, column: 23, scope: !664)
!666 = !DILocation(line: 128, column: 11, scope: !649)
!667 = !DILocation(line: 129, column: 9, scope: !664)
!668 = !DILocation(line: 131, column: 31, scope: !649)
!669 = !DILocation(line: 131, column: 43, scope: !649)
!670 = !DILocation(line: 131, column: 29, scope: !649)
!671 = !DILocation(line: 131, column: 25, scope: !649)
!672 = !DILocation(line: 131, column: 7, scope: !649)
!673 = !DILocation(line: 131, column: 23, scope: !649)
!674 = !DILocation(line: 132, column: 31, scope: !649)
!675 = !DILocation(line: 132, column: 43, scope: !649)
!676 = !DILocation(line: 132, column: 29, scope: !649)
!677 = !DILocation(line: 132, column: 25, scope: !649)
!678 = !DILocation(line: 132, column: 7, scope: !649)
!679 = !DILocation(line: 132, column: 23, scope: !649)
!680 = !DILocation(line: 133, column: 18, scope: !649)
!681 = !DILocation(line: 134, column: 28, scope: !649)
!682 = !DILocation(line: 134, column: 52, scope: !649)
!683 = !DILocation(line: 134, column: 61, scope: !649)
!684 = !DILocation(line: 134, column: 38, scope: !649)
!685 = !DILocation(line: 134, column: 7, scope: !649)
!686 = !DILocation(line: 136, column: 5, scope: !649)
!687 = !DILocation(line: 136, column: 24, scope: !688)
!688 = distinct !DILexicalBlock(scope: !639, file: !2, line: 136, column: 16)
!689 = !DILocation(line: 136, column: 29, scope: !688)
!690 = !DILocation(line: 136, column: 16, scope: !688)
!691 = !DILocation(line: 136, column: 47, scope: !688)
!692 = !DILocation(line: 137, column: 24, scope: !688)
!693 = !DILocation(line: 137, column: 29, scope: !688)
!694 = !DILocation(line: 137, column: 16, scope: !688)
!695 = !DILocation(line: 136, column: 16, scope: !639)
!696 = !DILocalVariable(name: "msg", scope: !697, file: !2, line: 138, type: !433)
!697 = distinct !DILexicalBlock(scope: !688, file: !2, line: 137, column: 47)
!698 = !DILocation(line: 138, column: 19, scope: !697)
!699 = !DILocation(line: 141, column: 11, scope: !700)
!700 = distinct !DILexicalBlock(scope: !697, file: !2, line: 141, column: 11)
!701 = !DILocation(line: 141, column: 13, scope: !700)
!702 = !DILocation(line: 141, column: 20, scope: !700)
!703 = !DILocation(line: 141, column: 17, scope: !700)
!704 = !DILocation(line: 141, column: 11, scope: !697)
!705 = !DILocation(line: 142, column: 22, scope: !700)
!706 = !DILocation(line: 142, column: 9, scope: !700)
!707 = !DILocation(line: 144, column: 8, scope: !697)
!708 = !DILocation(line: 145, column: 32, scope: !697)
!709 = !DILocation(line: 145, column: 38, scope: !697)
!710 = !DILocation(line: 145, column: 43, scope: !697)
!711 = !DILocation(line: 145, column: 19, scope: !697)
!712 = !DILocation(line: 145, column: 17, scope: !697)
!713 = !DILocation(line: 146, column: 32, scope: !697)
!714 = !DILocation(line: 146, column: 38, scope: !697)
!715 = !DILocation(line: 146, column: 43, scope: !697)
!716 = !DILocation(line: 146, column: 19, scope: !697)
!717 = !DILocation(line: 146, column: 17, scope: !697)
!718 = !DILocation(line: 147, column: 30, scope: !697)
!719 = !DILocation(line: 147, column: 36, scope: !697)
!720 = !DILocation(line: 147, column: 41, scope: !697)
!721 = !DILocation(line: 147, column: 17, scope: !697)
!722 = !DILocation(line: 147, column: 15, scope: !697)
!723 = !DILocation(line: 149, column: 12, scope: !724)
!724 = distinct !DILexicalBlock(scope: !697, file: !2, line: 149, column: 11)
!725 = !DILocation(line: 149, column: 24, scope: !724)
!726 = !DILocation(line: 149, column: 22, scope: !724)
!727 = !DILocation(line: 149, column: 35, scope: !724)
!728 = !DILocation(line: 149, column: 39, scope: !724)
!729 = !DILocation(line: 149, column: 49, scope: !724)
!730 = !DILocation(line: 149, column: 54, scope: !724)
!731 = !DILocation(line: 150, column: 9, scope: !724)
!732 = !DILocation(line: 152, column: 27, scope: !697)
!733 = !DILocation(line: 152, column: 38, scope: !697)
!734 = !DILocation(line: 152, column: 48, scope: !697)
!735 = !DILocation(line: 152, column: 16, scope: !697)
!736 = !DILocation(line: 152, column: 14, scope: !697)
!737 = !DILocation(line: 154, column: 11, scope: !738)
!738 = distinct !DILexicalBlock(scope: !697, file: !2, line: 154, column: 11)
!739 = !DILocation(line: 154, column: 25, scope: !738)
!740 = !DILocation(line: 154, column: 23, scope: !738)
!741 = !DILocation(line: 154, column: 35, scope: !738)
!742 = !DILocation(line: 154, column: 11, scope: !697)
!743 = !DILocation(line: 155, column: 9, scope: !738)
!744 = !DILocation(line: 157, column: 14, scope: !745)
!745 = distinct !DILexicalBlock(scope: !697, file: !2, line: 157, column: 7)
!746 = !DILocation(line: 157, column: 12, scope: !745)
!747 = !DILocation(line: 157, column: 19, scope: !748)
!748 = distinct !DILexicalBlock(scope: !745, file: !2, line: 157, column: 7)
!749 = !DILocation(line: 157, column: 23, scope: !748)
!750 = !DILocation(line: 157, column: 21, scope: !748)
!751 = !DILocation(line: 157, column: 7, scope: !745)
!752 = !DILocation(line: 158, column: 33, scope: !753)
!753 = distinct !DILexicalBlock(scope: !748, file: !2, line: 157, column: 36)
!754 = !DILocation(line: 158, column: 45, scope: !753)
!755 = !DILocation(line: 158, column: 31, scope: !753)
!756 = !DILocation(line: 158, column: 27, scope: !753)
!757 = !DILocation(line: 158, column: 9, scope: !753)
!758 = !DILocation(line: 158, column: 25, scope: !753)
!759 = !DILocation(line: 159, column: 33, scope: !753)
!760 = !DILocation(line: 159, column: 45, scope: !753)
!761 = !DILocation(line: 159, column: 31, scope: !753)
!762 = !DILocation(line: 159, column: 27, scope: !753)
!763 = !DILocation(line: 159, column: 9, scope: !753)
!764 = !DILocation(line: 159, column: 25, scope: !753)
!765 = !DILocation(line: 160, column: 20, scope: !753)
!766 = !DILocation(line: 162, column: 30, scope: !753)
!767 = !DILocation(line: 162, column: 54, scope: !753)
!768 = !DILocation(line: 162, column: 63, scope: !753)
!769 = !DILocation(line: 162, column: 40, scope: !753)
!770 = !DILocation(line: 162, column: 9, scope: !753)
!771 = !DILocation(line: 157, column: 32, scope: !748)
!772 = !DILocation(line: 157, column: 7, scope: !748)
!773 = distinct !{!773, !751, !774}
!774 = !DILocation(line: 164, column: 7, scope: !745)
!775 = !DILocation(line: 165, column: 24, scope: !776)
!776 = distinct !DILexicalBlock(scope: !688, file: !2, line: 165, column: 16)
!777 = !DILocation(line: 165, column: 29, scope: !776)
!778 = !DILocation(line: 165, column: 16, scope: !776)
!779 = !DILocation(line: 165, column: 48, scope: !776)
!780 = !DILocation(line: 166, column: 24, scope: !776)
!781 = !DILocation(line: 166, column: 29, scope: !776)
!782 = !DILocation(line: 166, column: 16, scope: !776)
!783 = !DILocation(line: 165, column: 16, scope: !688)
!784 = !DILocalVariable(name: "msg", scope: !785, file: !2, line: 167, type: !433)
!785 = distinct !DILexicalBlock(scope: !776, file: !2, line: 166, column: 48)
!786 = !DILocation(line: 167, column: 19, scope: !785)
!787 = !DILocation(line: 170, column: 11, scope: !788)
!788 = distinct !DILexicalBlock(scope: !785, file: !2, line: 170, column: 11)
!789 = !DILocation(line: 170, column: 13, scope: !788)
!790 = !DILocation(line: 170, column: 20, scope: !788)
!791 = !DILocation(line: 170, column: 17, scope: !788)
!792 = !DILocation(line: 170, column: 11, scope: !785)
!793 = !DILocation(line: 171, column: 22, scope: !788)
!794 = !DILocation(line: 171, column: 9, scope: !788)
!795 = !DILocation(line: 173, column: 11, scope: !796)
!796 = distinct !DILexicalBlock(scope: !785, file: !2, line: 173, column: 11)
!797 = !DILocation(line: 173, column: 21, scope: !796)
!798 = !DILocation(line: 173, column: 11, scope: !785)
!799 = !DILocation(line: 174, column: 9, scope: !796)
!800 = !DILocation(line: 176, column: 8, scope: !785)
!801 = !DILocation(line: 177, column: 32, scope: !785)
!802 = !DILocation(line: 177, column: 38, scope: !785)
!803 = !DILocation(line: 177, column: 43, scope: !785)
!804 = !DILocation(line: 177, column: 19, scope: !785)
!805 = !DILocation(line: 177, column: 17, scope: !785)
!806 = !DILocation(line: 178, column: 35, scope: !785)
!807 = !DILocation(line: 178, column: 41, scope: !785)
!808 = !DILocation(line: 178, column: 46, scope: !785)
!809 = !DILocation(line: 178, column: 22, scope: !785)
!810 = !DILocation(line: 178, column: 20, scope: !785)
!811 = !DILocation(line: 180, column: 11, scope: !812)
!812 = distinct !DILexicalBlock(scope: !785, file: !2, line: 180, column: 11)
!813 = !DILocation(line: 180, column: 21, scope: !812)
!814 = !DILocation(line: 180, column: 11, scope: !785)
!815 = !DILocation(line: 181, column: 9, scope: !812)
!816 = !DILocation(line: 184, column: 11, scope: !817)
!817 = distinct !DILexicalBlock(scope: !785, file: !2, line: 184, column: 11)
!818 = !DILocation(line: 184, column: 24, scope: !817)
!819 = !DILocation(line: 184, column: 11, scope: !785)
!820 = !DILocation(line: 185, column: 9, scope: !817)
!821 = !DILocation(line: 188, column: 24, scope: !822)
!822 = distinct !DILexicalBlock(scope: !776, file: !2, line: 188, column: 16)
!823 = !DILocation(line: 188, column: 29, scope: !822)
!824 = !DILocation(line: 188, column: 16, scope: !822)
!825 = !DILocation(line: 188, column: 48, scope: !822)
!826 = !DILocation(line: 189, column: 24, scope: !822)
!827 = !DILocation(line: 189, column: 29, scope: !822)
!828 = !DILocation(line: 189, column: 16, scope: !822)
!829 = !DILocation(line: 188, column: 16, scope: !776)
!830 = !DILocalVariable(name: "msg", scope: !831, file: !2, line: 190, type: !433)
!831 = distinct !DILexicalBlock(scope: !822, file: !2, line: 189, column: 48)
!832 = !DILocation(line: 190, column: 19, scope: !831)
!833 = !DILocation(line: 193, column: 11, scope: !834)
!834 = distinct !DILexicalBlock(scope: !831, file: !2, line: 193, column: 11)
!835 = !DILocation(line: 193, column: 18, scope: !834)
!836 = !DILocation(line: 193, column: 15, scope: !834)
!837 = !DILocation(line: 193, column: 11, scope: !831)
!838 = !DILocation(line: 194, column: 22, scope: !834)
!839 = !DILocation(line: 194, column: 9, scope: !834)
!840 = !DILocation(line: 196, column: 36, scope: !831)
!841 = !DILocation(line: 196, column: 42, scope: !831)
!842 = !DILocation(line: 196, column: 47, scope: !831)
!843 = !DILocation(line: 196, column: 23, scope: !831)
!844 = !DILocation(line: 196, column: 21, scope: !831)
!845 = !DILocation(line: 197, column: 5, scope: !831)
!846 = !DILocation(line: 197, column: 24, scope: !847)
!847 = distinct !DILexicalBlock(scope: !822, file: !2, line: 197, column: 16)
!848 = !DILocation(line: 197, column: 29, scope: !847)
!849 = !DILocation(line: 197, column: 16, scope: !847)
!850 = !DILocation(line: 197, column: 49, scope: !847)
!851 = !DILocation(line: 198, column: 24, scope: !847)
!852 = !DILocation(line: 198, column: 29, scope: !847)
!853 = !DILocation(line: 198, column: 16, scope: !847)
!854 = !DILocation(line: 197, column: 16, scope: !822)
!855 = !DILocation(line: 199, column: 23, scope: !856)
!856 = distinct !DILexicalBlock(scope: !847, file: !2, line: 198, column: 49)
!857 = !DILocation(line: 200, column: 8, scope: !856)
!858 = !DILocation(line: 201, column: 5, scope: !856)
!859 = !DILocation(line: 201, column: 24, scope: !860)
!860 = distinct !DILexicalBlock(scope: !847, file: !2, line: 201, column: 16)
!861 = !DILocation(line: 201, column: 29, scope: !860)
!862 = !DILocation(line: 201, column: 16, scope: !860)
!863 = !DILocation(line: 201, column: 54, scope: !860)
!864 = !DILocation(line: 202, column: 24, scope: !860)
!865 = !DILocation(line: 202, column: 29, scope: !860)
!866 = !DILocation(line: 202, column: 16, scope: !860)
!867 = !DILocation(line: 201, column: 16, scope: !847)
!868 = !DILocation(line: 203, column: 28, scope: !869)
!869 = distinct !DILexicalBlock(scope: !860, file: !2, line: 202, column: 54)
!870 = !DILocation(line: 204, column: 8, scope: !869)
!871 = !DILocation(line: 205, column: 5, scope: !869)
!872 = !DILocation(line: 205, column: 24, scope: !873)
!873 = distinct !DILexicalBlock(scope: !860, file: !2, line: 205, column: 16)
!874 = !DILocation(line: 205, column: 29, scope: !873)
!875 = !DILocation(line: 205, column: 16, scope: !873)
!876 = !DILocation(line: 205, column: 46, scope: !873)
!877 = !DILocation(line: 205, column: 57, scope: !873)
!878 = !DILocation(line: 205, column: 62, scope: !873)
!879 = !DILocation(line: 205, column: 49, scope: !873)
!880 = !DILocation(line: 205, column: 16, scope: !860)
!881 = !DILocation(line: 206, column: 15, scope: !882)
!882 = distinct !DILexicalBlock(scope: !873, file: !2, line: 205, column: 79)
!883 = !DILocation(line: 207, column: 8, scope: !882)
!884 = !DILocation(line: 208, column: 5, scope: !882)
!885 = !DILocation(line: 208, column: 24, scope: !886)
!886 = distinct !DILexicalBlock(scope: !873, file: !2, line: 208, column: 16)
!887 = !DILocation(line: 208, column: 29, scope: !886)
!888 = !DILocation(line: 208, column: 16, scope: !886)
!889 = !DILocation(line: 208, column: 48, scope: !886)
!890 = !DILocation(line: 208, column: 59, scope: !886)
!891 = !DILocation(line: 208, column: 64, scope: !886)
!892 = !DILocation(line: 208, column: 51, scope: !886)
!893 = !DILocation(line: 208, column: 16, scope: !873)
!894 = !DILocation(line: 209, column: 9, scope: !895)
!895 = distinct !DILexicalBlock(scope: !886, file: !2, line: 208, column: 83)
!896 = !DILocation(line: 210, column: 5, scope: !895)
!897 = !DILocation(line: 210, column: 24, scope: !898)
!898 = distinct !DILexicalBlock(scope: !886, file: !2, line: 210, column: 16)
!899 = !DILocation(line: 210, column: 29, scope: !898)
!900 = !DILocation(line: 210, column: 16, scope: !898)
!901 = !DILocation(line: 210, column: 47, scope: !898)
!902 = !DILocation(line: 211, column: 24, scope: !898)
!903 = !DILocation(line: 211, column: 29, scope: !898)
!904 = !DILocation(line: 211, column: 16, scope: !898)
!905 = !DILocation(line: 210, column: 16, scope: !886)
!906 = !DILocalVariable(name: "msg", scope: !907, file: !2, line: 212, type: !433)
!907 = distinct !DILexicalBlock(scope: !898, file: !2, line: 211, column: 47)
!908 = !DILocation(line: 212, column: 19, scope: !907)
!909 = !DILocation(line: 213, column: 11, scope: !910)
!910 = distinct !DILexicalBlock(scope: !907, file: !2, line: 213, column: 11)
!911 = !DILocation(line: 213, column: 18, scope: !910)
!912 = !DILocation(line: 213, column: 15, scope: !910)
!913 = !DILocation(line: 213, column: 11, scope: !907)
!914 = !DILocation(line: 214, column: 22, scope: !910)
!915 = !DILocation(line: 214, column: 9, scope: !910)
!916 = !DILocation(line: 216, column: 30, scope: !907)
!917 = !DILocation(line: 216, column: 36, scope: !907)
!918 = !DILocation(line: 216, column: 41, scope: !907)
!919 = !DILocation(line: 216, column: 17, scope: !907)
!920 = !DILocation(line: 216, column: 15, scope: !907)
!921 = !DILocation(line: 217, column: 5, scope: !907)
!922 = !DILocation(line: 219, column: 28, scope: !923)
!923 = distinct !DILexicalBlock(scope: !898, file: !2, line: 217, column: 12)
!924 = !DILocation(line: 219, column: 38, scope: !923)
!925 = !DILocation(line: 219, column: 44, scope: !923)
!926 = !DILocation(line: 219, column: 7, scope: !923)
!927 = distinct !{!927, !634, !928}
!928 = !DILocation(line: 221, column: 3, scope: !568)
!929 = !DILocation(line: 223, column: 33, scope: !568)
!930 = !DILocation(line: 223, column: 42, scope: !568)
!931 = !DILocation(line: 223, column: 32, scope: !568)
!932 = !DILocation(line: 223, column: 47, scope: !568)
!933 = !DILocation(line: 223, column: 25, scope: !568)
!934 = !DILocation(line: 223, column: 14, scope: !568)
!935 = !DILocation(line: 224, column: 8, scope: !936)
!936 = distinct !DILexicalBlock(scope: !568, file: !2, line: 224, column: 7)
!937 = !DILocation(line: 224, column: 7, scope: !568)
!938 = !DILocation(line: 225, column: 5, scope: !936)
!939 = !DILocation(line: 226, column: 20, scope: !568)
!940 = !DILocation(line: 226, column: 3, scope: !568)
!941 = !DILocation(line: 227, column: 10, scope: !568)
!942 = !DILocation(line: 227, column: 3, scope: !568)
!943 = !DILocation(line: 227, column: 32, scope: !568)
!944 = !DILocation(line: 227, column: 41, scope: !568)
!945 = !DILocation(line: 228, column: 3, scope: !568)
!946 = !DILocation(line: 228, column: 14, scope: !568)
!947 = !DILocation(line: 228, column: 24, scope: !568)
!948 = !DILocation(line: 230, column: 14, scope: !568)
!949 = !DILocation(line: 230, column: 4, scope: !568)
!950 = !DILocation(line: 230, column: 12, scope: !568)
!951 = !DILocation(line: 231, column: 14, scope: !568)
!952 = !DILocation(line: 231, column: 4, scope: !568)
!953 = !DILocation(line: 231, column: 12, scope: !568)
!954 = !DILocation(line: 233, column: 17, scope: !568)
!955 = !DILocation(line: 233, column: 28, scope: !568)
!956 = !DILocation(line: 233, column: 42, scope: !568)
!957 = !DILocation(line: 233, column: 57, scope: !568)
!958 = !DILocation(line: 234, column: 17, scope: !568)
!959 = !DILocation(line: 234, column: 39, scope: !568)
!960 = !DILocation(line: 233, column: 3, scope: !568)
!961 = !DILocation(line: 235, column: 1, scope: !568)
!962 = distinct !DISubprogram(name: "__streq", scope: !2, file: !2, line: 48, type: !963, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !509, retainedNodes: !381)
!963 = !DISubroutineType(types: !964)
!964 = !{!237, !433, !433}
!965 = !DILocalVariable(name: "a", arg: 1, scope: !962, file: !2, line: 48, type: !433)
!966 = !DILocation(line: 48, column: 32, scope: !962)
!967 = !DILocalVariable(name: "b", arg: 2, scope: !962, file: !2, line: 48, type: !433)
!968 = !DILocation(line: 48, column: 47, scope: !962)
!969 = !DILocation(line: 49, column: 3, scope: !962)
!970 = !DILocation(line: 49, column: 11, scope: !962)
!971 = !DILocation(line: 49, column: 10, scope: !962)
!972 = !DILocation(line: 49, column: 17, scope: !962)
!973 = !DILocation(line: 49, column: 16, scope: !962)
!974 = !DILocation(line: 49, column: 13, scope: !962)
!975 = !DILocation(line: 50, column: 11, scope: !976)
!976 = distinct !DILexicalBlock(scope: !977, file: !2, line: 50, column: 9)
!977 = distinct !DILexicalBlock(scope: !962, file: !2, line: 49, column: 20)
!978 = !DILocation(line: 50, column: 10, scope: !976)
!979 = !DILocation(line: 50, column: 9, scope: !977)
!980 = !DILocation(line: 51, column: 7, scope: !976)
!981 = !DILocation(line: 52, column: 6, scope: !977)
!982 = !DILocation(line: 53, column: 6, scope: !977)
!983 = distinct !{!983, !969, !984}
!984 = !DILocation(line: 54, column: 3, scope: !962)
!985 = !DILocation(line: 55, column: 3, scope: !962)
!986 = !DILocation(line: 56, column: 1, scope: !962)
!987 = distinct !DISubprogram(name: "__emit_error", scope: !2, file: !2, line: 19, type: !988, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !509, retainedNodes: !381)
!988 = !DISubroutineType(types: !989)
!989 = !{null, !433}
!990 = !DILocalVariable(name: "msg", arg: 1, scope: !987, file: !2, line: 19, type: !433)
!991 = !DILocation(line: 19, column: 38, scope: !987)
!992 = !DILocation(line: 20, column: 41, scope: !987)
!993 = !DILocation(line: 20, column: 3, scope: !987)
!994 = distinct !DISubprogram(name: "__str_to_int", scope: !2, file: !2, line: 26, type: !995, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !509, retainedNodes: !381)
!995 = !DISubroutineType(types: !996)
!996 = !{!241, !216, !433}
!997 = !DILocalVariable(name: "s", arg: 1, scope: !994, file: !2, line: 26, type: !216)
!998 = !DILocation(line: 26, column: 36, scope: !994)
!999 = !DILocalVariable(name: "error_msg", arg: 2, scope: !994, file: !2, line: 26, type: !433)
!1000 = !DILocation(line: 26, column: 51, scope: !994)
!1001 = !DILocalVariable(name: "res", scope: !994, file: !2, line: 27, type: !241)
!1002 = !DILocation(line: 27, column: 12, scope: !994)
!1003 = !DILocalVariable(name: "c", scope: !994, file: !2, line: 28, type: !5)
!1004 = !DILocation(line: 28, column: 8, scope: !994)
!1005 = !DILocation(line: 30, column: 9, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !994, file: !2, line: 30, column: 7)
!1007 = !DILocation(line: 30, column: 8, scope: !1006)
!1008 = !DILocation(line: 30, column: 7, scope: !994)
!1009 = !DILocation(line: 31, column: 18, scope: !1006)
!1010 = !DILocation(line: 31, column: 5, scope: !1006)
!1011 = !DILocation(line: 33, column: 3, scope: !994)
!1012 = !DILocation(line: 33, column: 17, scope: !994)
!1013 = !DILocation(line: 33, column: 15, scope: !994)
!1014 = !DILocation(line: 33, column: 13, scope: !994)
!1015 = !DILocation(line: 34, column: 9, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1017, file: !2, line: 34, column: 9)
!1017 = distinct !DILexicalBlock(scope: !994, file: !2, line: 33, column: 22)
!1018 = !DILocation(line: 34, column: 11, scope: !1016)
!1019 = !DILocation(line: 34, column: 18, scope: !1016)
!1020 = !DILocation(line: 34, column: 21, scope: !1016)
!1021 = !DILocation(line: 34, column: 23, scope: !1016)
!1022 = !DILocation(line: 34, column: 9, scope: !1017)
!1023 = !DILocation(line: 35, column: 13, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1016, file: !2, line: 34, column: 31)
!1025 = !DILocation(line: 35, column: 17, scope: !1024)
!1026 = !DILocation(line: 35, column: 25, scope: !1024)
!1027 = !DILocation(line: 35, column: 27, scope: !1024)
!1028 = !DILocation(line: 35, column: 24, scope: !1024)
!1029 = !DILocation(line: 35, column: 22, scope: !1024)
!1030 = !DILocation(line: 35, column: 11, scope: !1024)
!1031 = !DILocation(line: 36, column: 5, scope: !1024)
!1032 = !DILocation(line: 37, column: 20, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1016, file: !2, line: 36, column: 12)
!1034 = !DILocation(line: 37, column: 7, scope: !1033)
!1035 = distinct !{!1035, !1011, !1036}
!1036 = !DILocation(line: 39, column: 3, scope: !994)
!1037 = !DILocation(line: 40, column: 10, scope: !994)
!1038 = !DILocation(line: 40, column: 3, scope: !994)
!1039 = distinct !DISubprogram(name: "__add_arg", scope: !2, file: !2, line: 73, type: !1040, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !509, retainedNodes: !381)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{null, !265, !512, !216, !237}
!1042 = !DILocalVariable(name: "argc", arg: 1, scope: !1039, file: !2, line: 73, type: !265)
!1043 = !DILocation(line: 73, column: 28, scope: !1039)
!1044 = !DILocalVariable(name: "argv", arg: 2, scope: !1039, file: !2, line: 73, type: !512)
!1045 = !DILocation(line: 73, column: 41, scope: !1039)
!1046 = !DILocalVariable(name: "arg", arg: 3, scope: !1039, file: !2, line: 73, type: !216)
!1047 = !DILocation(line: 73, column: 53, scope: !1039)
!1048 = !DILocalVariable(name: "argcMax", arg: 4, scope: !1039, file: !2, line: 73, type: !237)
!1049 = !DILocation(line: 73, column: 62, scope: !1039)
!1050 = !DILocation(line: 74, column: 8, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1039, file: !2, line: 74, column: 7)
!1052 = !DILocation(line: 74, column: 7, scope: !1051)
!1053 = !DILocation(line: 74, column: 14, scope: !1051)
!1054 = !DILocation(line: 74, column: 12, scope: !1051)
!1055 = !DILocation(line: 74, column: 7, scope: !1039)
!1056 = !DILocation(line: 75, column: 5, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1051, file: !2, line: 74, column: 23)
!1058 = !DILocation(line: 76, column: 3, scope: !1057)
!1059 = !DILocation(line: 77, column: 19, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1051, file: !2, line: 76, column: 10)
!1061 = !DILocation(line: 77, column: 5, scope: !1060)
!1062 = !DILocation(line: 77, column: 11, scope: !1060)
!1063 = !DILocation(line: 77, column: 10, scope: !1060)
!1064 = !DILocation(line: 77, column: 17, scope: !1060)
!1065 = !DILocation(line: 78, column: 7, scope: !1060)
!1066 = !DILocation(line: 78, column: 12, scope: !1060)
!1067 = !DILocation(line: 80, column: 1, scope: !1039)
!1068 = distinct !DISubprogram(name: "__get_sym_str", scope: !2, file: !2, line: 58, type: !1069, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !509, retainedNodes: !381)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!216, !237, !216}
!1071 = !DILocalVariable(name: "numChars", arg: 1, scope: !1068, file: !2, line: 58, type: !237)
!1072 = !DILocation(line: 58, column: 32, scope: !1068)
!1073 = !DILocalVariable(name: "name", arg: 2, scope: !1068, file: !2, line: 58, type: !216)
!1074 = !DILocation(line: 58, column: 48, scope: !1068)
!1075 = !DILocalVariable(name: "i", scope: !1068, file: !2, line: 59, type: !237)
!1076 = !DILocation(line: 59, column: 7, scope: !1068)
!1077 = !DILocalVariable(name: "s", scope: !1068, file: !2, line: 60, type: !216)
!1078 = !DILocation(line: 60, column: 9, scope: !1068)
!1079 = !DILocation(line: 60, column: 20, scope: !1068)
!1080 = !DILocation(line: 60, column: 28, scope: !1068)
!1081 = !DILocation(line: 60, column: 13, scope: !1068)
!1082 = !DILocation(line: 61, column: 8, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1068, file: !2, line: 61, column: 7)
!1084 = !DILocation(line: 61, column: 7, scope: !1068)
!1085 = !DILocation(line: 62, column: 5, scope: !1083)
!1086 = !DILocation(line: 63, column: 20, scope: !1068)
!1087 = !DILocation(line: 63, column: 3, scope: !1068)
!1088 = !DILocation(line: 64, column: 22, scope: !1068)
!1089 = !DILocation(line: 64, column: 25, scope: !1068)
!1090 = !DILocation(line: 64, column: 33, scope: !1068)
!1091 = !DILocation(line: 64, column: 37, scope: !1068)
!1092 = !DILocation(line: 64, column: 3, scope: !1068)
!1093 = !DILocation(line: 66, column: 9, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1068, file: !2, line: 66, column: 3)
!1095 = !DILocation(line: 66, column: 8, scope: !1094)
!1096 = !DILocation(line: 66, column: 13, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1094, file: !2, line: 66, column: 3)
!1098 = !DILocation(line: 66, column: 15, scope: !1097)
!1099 = !DILocation(line: 66, column: 14, scope: !1097)
!1100 = !DILocation(line: 66, column: 3, scope: !1094)
!1101 = !DILocation(line: 67, column: 27, scope: !1097)
!1102 = !DILocation(line: 67, column: 40, scope: !1097)
!1103 = !DILocation(line: 67, column: 42, scope: !1097)
!1104 = !DILocation(line: 67, column: 30, scope: !1097)
!1105 = !DILocation(line: 67, column: 5, scope: !1097)
!1106 = !DILocation(line: 66, column: 26, scope: !1097)
!1107 = !DILocation(line: 66, column: 3, scope: !1097)
!1108 = distinct !{!1108, !1100, !1109}
!1109 = !DILocation(line: 67, column: 45, scope: !1094)
!1110 = !DILocation(line: 69, column: 3, scope: !1068)
!1111 = !DILocation(line: 69, column: 5, scope: !1068)
!1112 = !DILocation(line: 69, column: 15, scope: !1068)
!1113 = !DILocation(line: 70, column: 10, scope: !1068)
!1114 = !DILocation(line: 70, column: 3, scope: !1068)
!1115 = distinct !DISubprogram(name: "__klee_posix_wrapper", scope: !2, file: !2, line: 242, type: !1116, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !509, retainedNodes: !381)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{!237, !237, !512, !512}
!1118 = !DILocalVariable(name: "argcPtr", arg: 1, scope: !1115, file: !2, line: 242, type: !237)
!1119 = !DILocation(line: 242, column: 30, scope: !1115)
!1120 = !DILocalVariable(name: "argvPtr", arg: 2, scope: !1115, file: !2, line: 242, type: !512)
!1121 = !DILocation(line: 242, column: 46, scope: !1115)
!1122 = !DILocalVariable(name: "envp", arg: 3, scope: !1115, file: !2, line: 242, type: !512)
!1123 = !DILocation(line: 242, column: 62, scope: !1115)
!1124 = !DILocation(line: 243, column: 3, scope: !1115)
!1125 = !DILocation(line: 244, column: 36, scope: !1115)
!1126 = !DILocation(line: 244, column: 45, scope: !1115)
!1127 = !DILocation(line: 244, column: 54, scope: !1115)
!1128 = !DILocation(line: 244, column: 10, scope: !1115)
!1129 = !DILocation(line: 244, column: 3, scope: !1115)
!1130 = distinct !DISubprogram(name: "__isprint", scope: !2, file: !2, line: 43, type: !1131, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !509, retainedNodes: !381)
!1131 = !DISubroutineType(types: !1132)
!1132 = !{!237, !4}
!1133 = !DILocalVariable(name: "c", arg: 1, scope: !1130, file: !2, line: 43, type: !4)
!1134 = !DILocation(line: 43, column: 33, scope: !1130)
!1135 = !DILocation(line: 45, column: 17, scope: !1130)
!1136 = !DILocation(line: 45, column: 14, scope: !1130)
!1137 = !DILocation(line: 45, column: 19, scope: !1130)
!1138 = !DILocation(line: 45, column: 3, scope: !1130)
!1139 = distinct !DISubprogram(name: "check_hash", scope: !1140, file: !1140, line: 6, type: !1141, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !514, retainedNodes: !381)
!1140 = !DIFile(filename: "benchmarks/targets/md5sum_klee.c", directory: "/workspace", checksumkind: CSK_MD5, checksum: "3be79d9e406ba777af5cb3c06c201f83")
!1141 = !DISubroutineType(types: !1142)
!1142 = !{null, !433, !1143}
!1143 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1144, line: 46, baseType: !225)
!1144 = !DIFile(filename: "/tmp/llvm-160-install_O_D_A/lib/clang/16/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!1145 = !DILocalVariable(name: "in", arg: 1, scope: !1139, file: !1140, line: 6, type: !433)
!1146 = !DILocation(line: 6, column: 29, scope: !1139)
!1147 = !DILocalVariable(name: "len", arg: 2, scope: !1139, file: !1140, line: 6, type: !1143)
!1148 = !DILocation(line: 6, column: 40, scope: !1139)
!1149 = !DILocation(line: 7, column: 9, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1139, file: !1140, line: 7, column: 9)
!1151 = !DILocation(line: 7, column: 13, scope: !1150)
!1152 = !DILocation(line: 7, column: 9, scope: !1139)
!1153 = !DILocation(line: 8, column: 9, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1139, file: !1140, line: 8, column: 9)
!1155 = !DILocation(line: 8, column: 15, scope: !1154)
!1156 = !DILocation(line: 8, column: 22, scope: !1154)
!1157 = !DILocation(line: 8, column: 25, scope: !1154)
!1158 = !DILocation(line: 8, column: 31, scope: !1154)
!1159 = !DILocation(line: 8, column: 38, scope: !1154)
!1160 = !DILocation(line: 8, column: 41, scope: !1154)
!1161 = !DILocation(line: 8, column: 47, scope: !1154)
!1162 = !DILocation(line: 8, column: 54, scope: !1154)
!1163 = !DILocation(line: 8, column: 57, scope: !1154)
!1164 = !DILocation(line: 8, column: 63, scope: !1154)
!1165 = !DILocation(line: 8, column: 9, scope: !1139)
!1166 = !DILocation(line: 9, column: 9, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1154, file: !1140, line: 8, column: 71)
!1168 = !DILocation(line: 11, column: 1, scope: !1139)
!1169 = distinct !DISubprogram(name: "main", scope: !1140, file: !1140, line: 13, type: !1170, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !514, retainedNodes: !381)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{!237, !237, !512}
!1172 = !DILocalVariable(name: "argc", arg: 1, scope: !1169, file: !1140, line: 13, type: !237)
!1173 = !DILocation(line: 13, column: 14, scope: !1169)
!1174 = !DILocalVariable(name: "argv", arg: 2, scope: !1169, file: !1140, line: 13, type: !512)
!1175 = !DILocation(line: 13, column: 27, scope: !1169)
!1176 = !DILocalVariable(name: "buf", scope: !1169, file: !1140, line: 14, type: !1177)
!1177 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1024, elements: !1178)
!1178 = !{!1179}
!1179 = !DISubrange(count: 128)
!1180 = !DILocation(line: 14, column: 10, scope: !1169)
!1181 = !DILocation(line: 15, column: 5, scope: !1169)
!1182 = !DILocation(line: 16, column: 17, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1169, file: !1140, line: 16, column: 9)
!1184 = !DILocation(line: 16, column: 9, scope: !1183)
!1185 = !DILocation(line: 16, column: 39, scope: !1183)
!1186 = !DILocation(line: 16, column: 9, scope: !1169)
!1187 = !DILocation(line: 17, column: 20, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1183, file: !1140, line: 16, column: 44)
!1189 = !DILocation(line: 17, column: 32, scope: !1188)
!1190 = !DILocation(line: 17, column: 25, scope: !1188)
!1191 = !DILocation(line: 17, column: 9, scope: !1188)
!1192 = !DILocation(line: 18, column: 5, scope: !1188)
!1193 = !DILocation(line: 19, column: 5, scope: !1169)
!1194 = distinct !DISubprogram(name: "klee_init_fds", scope: !141, file: !141, line: 105, type: !1195, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !198, retainedNodes: !381)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{null, !208, !208, !208, !237, !237, !208}
!1197 = !DILocalVariable(name: "n_files", arg: 1, scope: !1194, file: !141, line: 105, type: !208)
!1198 = !DILocation(line: 105, column: 29, scope: !1194)
!1199 = !DILocalVariable(name: "file_length", arg: 2, scope: !1194, file: !141, line: 105, type: !208)
!1200 = !DILocation(line: 105, column: 47, scope: !1194)
!1201 = !DILocalVariable(name: "stdin_length", arg: 3, scope: !1194, file: !141, line: 106, type: !208)
!1202 = !DILocation(line: 106, column: 29, scope: !1194)
!1203 = !DILocalVariable(name: "sym_stdout_flag", arg: 4, scope: !1194, file: !141, line: 106, type: !237)
!1204 = !DILocation(line: 106, column: 47, scope: !1194)
!1205 = !DILocalVariable(name: "save_all_writes_flag", arg: 5, scope: !1194, file: !141, line: 107, type: !237)
!1206 = !DILocation(line: 107, column: 24, scope: !1194)
!1207 = !DILocalVariable(name: "max_failures", arg: 6, scope: !1194, file: !141, line: 107, type: !208)
!1208 = !DILocation(line: 107, column: 55, scope: !1194)
!1209 = !DILocalVariable(name: "k", scope: !1194, file: !141, line: 108, type: !208)
!1210 = !DILocation(line: 108, column: 12, scope: !1194)
!1211 = !DILocalVariable(name: "name", scope: !1194, file: !141, line: 109, type: !1212)
!1212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 56, elements: !6)
!1213 = !DILocation(line: 109, column: 8, scope: !1194)
!1214 = !DILocalVariable(name: "s", scope: !1194, file: !141, line: 110, type: !219)
!1215 = !DILocation(line: 110, column: 17, scope: !1194)
!1216 = !DILocation(line: 112, column: 3, scope: !1194)
!1217 = !DILocation(line: 114, column: 26, scope: !1194)
!1218 = !DILocation(line: 114, column: 24, scope: !1194)
!1219 = !DILocation(line: 115, column: 61, scope: !1194)
!1220 = !DILocation(line: 115, column: 59, scope: !1194)
!1221 = !DILocation(line: 115, column: 24, scope: !1194)
!1222 = !DILocation(line: 115, column: 22, scope: !1194)
!1223 = !DILocation(line: 116, column: 7, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1194, file: !141, line: 116, column: 7)
!1225 = !DILocation(line: 116, column: 15, scope: !1224)
!1226 = !DILocation(line: 117, column: 5, scope: !1224)
!1227 = !DILocation(line: 119, column: 9, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1194, file: !141, line: 119, column: 3)
!1229 = !DILocation(line: 119, column: 8, scope: !1228)
!1230 = !DILocation(line: 119, column: 13, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1228, file: !141, line: 119, column: 3)
!1232 = !DILocation(line: 119, column: 17, scope: !1231)
!1233 = !DILocation(line: 119, column: 15, scope: !1231)
!1234 = !DILocation(line: 119, column: 3, scope: !1228)
!1235 = !DILocation(line: 120, column: 21, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1231, file: !141, line: 119, column: 31)
!1237 = !DILocation(line: 120, column: 19, scope: !1236)
!1238 = !DILocation(line: 120, column: 15, scope: !1236)
!1239 = !DILocation(line: 120, column: 5, scope: !1236)
!1240 = !DILocation(line: 120, column: 13, scope: !1236)
!1241 = !DILocation(line: 121, column: 34, scope: !1236)
!1242 = !DILocation(line: 121, column: 44, scope: !1236)
!1243 = !DILocation(line: 121, column: 25, scope: !1236)
!1244 = !DILocation(line: 121, column: 48, scope: !1236)
!1245 = !DILocation(line: 121, column: 61, scope: !1236)
!1246 = !DILocation(line: 121, column: 5, scope: !1236)
!1247 = !DILocation(line: 119, column: 27, scope: !1231)
!1248 = !DILocation(line: 119, column: 3, scope: !1231)
!1249 = distinct !{!1249, !1234, !1250}
!1250 = !DILocation(line: 122, column: 3, scope: !1228)
!1251 = !DILocation(line: 125, column: 7, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1194, file: !141, line: 125, column: 7)
!1253 = !DILocation(line: 125, column: 7, scope: !1194)
!1254 = !DILocation(line: 126, column: 26, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1252, file: !141, line: 125, column: 21)
!1256 = !DILocation(line: 126, column: 24, scope: !1255)
!1257 = !DILocation(line: 127, column: 19, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1255, file: !141, line: 127, column: 9)
!1259 = !DILocation(line: 127, column: 10, scope: !1258)
!1260 = !DILocation(line: 127, column: 9, scope: !1255)
!1261 = !DILocation(line: 128, column: 7, scope: !1258)
!1262 = !DILocation(line: 129, column: 33, scope: !1255)
!1263 = !DILocation(line: 129, column: 44, scope: !1255)
!1264 = !DILocation(line: 129, column: 5, scope: !1255)
!1265 = !DILocation(line: 130, column: 39, scope: !1255)
!1266 = !DILocation(line: 130, column: 28, scope: !1255)
!1267 = !DILocation(line: 131, column: 3, scope: !1255)
!1268 = !DILocation(line: 132, column: 27, scope: !1252)
!1269 = !DILocation(line: 134, column: 27, scope: !1194)
!1270 = !DILocation(line: 134, column: 25, scope: !1194)
!1271 = !DILocation(line: 135, column: 16, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1194, file: !141, line: 135, column: 7)
!1273 = !DILocation(line: 135, column: 7, scope: !1272)
!1274 = !DILocation(line: 135, column: 7, scope: !1194)
!1275 = !DILocation(line: 136, column: 26, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1272, file: !141, line: 135, column: 30)
!1277 = !DILocation(line: 136, column: 24, scope: !1276)
!1278 = !DILocation(line: 137, column: 27, scope: !1276)
!1279 = !DILocation(line: 137, column: 25, scope: !1276)
!1280 = !DILocation(line: 138, column: 27, scope: !1276)
!1281 = !DILocation(line: 138, column: 25, scope: !1276)
!1282 = !DILocation(line: 139, column: 31, scope: !1276)
!1283 = !DILocation(line: 139, column: 29, scope: !1276)
!1284 = !DILocation(line: 140, column: 28, scope: !1276)
!1285 = !DILocation(line: 140, column: 26, scope: !1276)
!1286 = !DILocation(line: 141, column: 20, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1276, file: !141, line: 141, column: 9)
!1288 = !DILocation(line: 141, column: 11, scope: !1287)
!1289 = !DILocation(line: 141, column: 30, scope: !1287)
!1290 = !DILocation(line: 143, column: 7, scope: !1287)
!1291 = !DILocation(line: 145, column: 33, scope: !1276)
!1292 = !DILocation(line: 145, column: 5, scope: !1276)
!1293 = !DILocation(line: 146, column: 33, scope: !1276)
!1294 = !DILocation(line: 146, column: 5, scope: !1276)
!1295 = !DILocation(line: 147, column: 33, scope: !1276)
!1296 = !DILocation(line: 147, column: 5, scope: !1276)
!1297 = !DILocation(line: 148, column: 33, scope: !1276)
!1298 = !DILocation(line: 148, column: 5, scope: !1276)
!1299 = !DILocation(line: 149, column: 33, scope: !1276)
!1300 = !DILocation(line: 149, column: 5, scope: !1276)
!1301 = !DILocation(line: 150, column: 3, scope: !1276)
!1302 = !DILocation(line: 153, column: 7, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1194, file: !141, line: 153, column: 7)
!1304 = !DILocation(line: 153, column: 7, scope: !1194)
!1305 = !DILocation(line: 154, column: 27, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1303, file: !141, line: 153, column: 24)
!1307 = !DILocation(line: 154, column: 25, scope: !1306)
!1308 = !DILocation(line: 155, column: 19, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1306, file: !141, line: 155, column: 9)
!1310 = !DILocation(line: 155, column: 10, scope: !1309)
!1311 = !DILocation(line: 155, column: 9, scope: !1306)
!1312 = !DILocation(line: 156, column: 7, scope: !1309)
!1313 = !DILocation(line: 157, column: 33, scope: !1306)
!1314 = !DILocation(line: 157, column: 5, scope: !1306)
!1315 = !DILocation(line: 158, column: 39, scope: !1306)
!1316 = !DILocation(line: 158, column: 28, scope: !1306)
!1317 = !DILocation(line: 159, column: 28, scope: !1306)
!1318 = !DILocation(line: 160, column: 3, scope: !1306)
!1319 = !DILocation(line: 161, column: 28, scope: !1303)
!1320 = !DILocation(line: 163, column: 31, scope: !1194)
!1321 = !DILocation(line: 163, column: 29, scope: !1194)
!1322 = !DILocation(line: 164, column: 1, scope: !1194)
!1323 = distinct !DISubprogram(name: "__create_new_dfile", scope: !141, file: !141, line: 42, type: !1324, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !198, retainedNodes: !381)
!1324 = !DISubroutineType(types: !1325)
!1325 = !{null, !210, !208, !433, !218}
!1326 = !DILocalVariable(name: "dfile", arg: 1, scope: !1323, file: !141, line: 42, type: !210)
!1327 = !DILocation(line: 42, column: 49, scope: !1323)
!1328 = !DILocalVariable(name: "size", arg: 2, scope: !1323, file: !141, line: 42, type: !208)
!1329 = !DILocation(line: 42, column: 65, scope: !1323)
!1330 = !DILocalVariable(name: "name", arg: 3, scope: !1323, file: !141, line: 43, type: !433)
!1331 = !DILocation(line: 43, column: 44, scope: !1323)
!1332 = !DILocalVariable(name: "defaults", arg: 4, scope: !1323, file: !141, line: 43, type: !218)
!1333 = !DILocation(line: 43, column: 65, scope: !1323)
!1334 = !DILocalVariable(name: "s", scope: !1323, file: !141, line: 44, type: !218)
!1335 = !DILocation(line: 44, column: 18, scope: !1323)
!1336 = !DILocation(line: 44, column: 22, scope: !1323)
!1337 = !DILocation(line: 45, column: 8, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1323, file: !141, line: 45, column: 7)
!1339 = !DILocation(line: 45, column: 7, scope: !1323)
!1340 = !DILocation(line: 46, column: 5, scope: !1338)
!1341 = !DILocalVariable(name: "sp", scope: !1323, file: !141, line: 48, type: !433)
!1342 = !DILocation(line: 48, column: 15, scope: !1323)
!1343 = !DILocalVariable(name: "sname", scope: !1323, file: !141, line: 49, type: !1344)
!1344 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 512, elements: !1345)
!1345 = !{!1346}
!1346 = !DISubrange(count: 64)
!1347 = !DILocation(line: 49, column: 8, scope: !1323)
!1348 = !DILocation(line: 50, column: 11, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1323, file: !141, line: 50, column: 3)
!1350 = !DILocation(line: 50, column: 10, scope: !1349)
!1351 = !DILocation(line: 50, column: 8, scope: !1349)
!1352 = !DILocation(line: 50, column: 18, scope: !1353)
!1353 = distinct !DILexicalBlock(scope: !1349, file: !141, line: 50, column: 3)
!1354 = !DILocation(line: 50, column: 17, scope: !1353)
!1355 = !DILocation(line: 50, column: 3, scope: !1349)
!1356 = !DILocation(line: 51, column: 23, scope: !1353)
!1357 = !DILocation(line: 51, column: 22, scope: !1353)
!1358 = !DILocation(line: 51, column: 11, scope: !1353)
!1359 = !DILocation(line: 51, column: 14, scope: !1353)
!1360 = !DILocation(line: 51, column: 13, scope: !1353)
!1361 = !DILocation(line: 51, column: 5, scope: !1353)
!1362 = !DILocation(line: 51, column: 20, scope: !1353)
!1363 = !DILocation(line: 50, column: 22, scope: !1353)
!1364 = !DILocation(line: 50, column: 3, scope: !1353)
!1365 = distinct !{!1365, !1355, !1366}
!1366 = !DILocation(line: 51, column: 23, scope: !1349)
!1367 = !DILocation(line: 52, column: 17, scope: !1323)
!1368 = !DILocation(line: 52, column: 20, scope: !1323)
!1369 = !DILocation(line: 52, column: 19, scope: !1323)
!1370 = !DILocation(line: 52, column: 11, scope: !1323)
!1371 = !DILocation(line: 52, column: 3, scope: !1323)
!1372 = !DILocation(line: 54, column: 3, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1374, file: !141, line: 54, column: 3)
!1374 = distinct !DILexicalBlock(scope: !1323, file: !141, line: 54, column: 3)
!1375 = !DILocation(line: 54, column: 3, scope: !1374)
!1376 = !DILocation(line: 56, column: 17, scope: !1323)
!1377 = !DILocation(line: 56, column: 3, scope: !1323)
!1378 = !DILocation(line: 56, column: 10, scope: !1323)
!1379 = !DILocation(line: 56, column: 15, scope: !1323)
!1380 = !DILocation(line: 57, column: 28, scope: !1323)
!1381 = !DILocation(line: 57, column: 35, scope: !1323)
!1382 = !DILocation(line: 57, column: 21, scope: !1323)
!1383 = !DILocation(line: 57, column: 3, scope: !1323)
!1384 = !DILocation(line: 57, column: 10, scope: !1323)
!1385 = !DILocation(line: 57, column: 19, scope: !1323)
!1386 = !DILocation(line: 58, column: 8, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1323, file: !141, line: 58, column: 7)
!1388 = !DILocation(line: 58, column: 15, scope: !1387)
!1389 = !DILocation(line: 58, column: 7, scope: !1323)
!1390 = !DILocation(line: 59, column: 5, scope: !1387)
!1391 = !DILocation(line: 60, column: 22, scope: !1323)
!1392 = !DILocation(line: 60, column: 29, scope: !1323)
!1393 = !DILocation(line: 60, column: 39, scope: !1323)
!1394 = !DILocation(line: 60, column: 46, scope: !1323)
!1395 = !DILocation(line: 60, column: 52, scope: !1323)
!1396 = !DILocation(line: 60, column: 3, scope: !1323)
!1397 = !DILocation(line: 62, column: 22, scope: !1323)
!1398 = !DILocation(line: 62, column: 37, scope: !1323)
!1399 = !DILocation(line: 62, column: 3, scope: !1323)
!1400 = !DILocation(line: 65, column: 25, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1323, file: !141, line: 65, column: 7)
!1402 = !DILocation(line: 65, column: 28, scope: !1401)
!1403 = !DILocation(line: 65, column: 8, scope: !1401)
!1404 = !DILocation(line: 65, column: 36, scope: !1401)
!1405 = !DILocation(line: 66, column: 8, scope: !1401)
!1406 = !DILocation(line: 66, column: 11, scope: !1401)
!1407 = !DILocation(line: 66, column: 18, scope: !1401)
!1408 = !DILocation(line: 66, column: 32, scope: !1401)
!1409 = !DILocation(line: 65, column: 7, scope: !1323)
!1410 = !DILocation(line: 67, column: 17, scope: !1401)
!1411 = !DILocation(line: 67, column: 27, scope: !1401)
!1412 = !DILocation(line: 67, column: 5, scope: !1401)
!1413 = !DILocation(line: 67, column: 8, scope: !1401)
!1414 = !DILocation(line: 67, column: 15, scope: !1401)
!1415 = !DILocation(line: 72, column: 16, scope: !1323)
!1416 = !DILocation(line: 72, column: 19, scope: !1323)
!1417 = !DILocation(line: 72, column: 26, scope: !1323)
!1418 = !DILocation(line: 72, column: 40, scope: !1323)
!1419 = !DILocation(line: 72, column: 15, scope: !1323)
!1420 = !DILocation(line: 72, column: 3, scope: !1323)
!1421 = !DILocation(line: 76, column: 16, scope: !1323)
!1422 = !DILocation(line: 76, column: 19, scope: !1323)
!1423 = !DILocation(line: 76, column: 30, scope: !1323)
!1424 = !DILocation(line: 76, column: 41, scope: !1323)
!1425 = !DILocation(line: 76, column: 15, scope: !1323)
!1426 = !DILocation(line: 76, column: 3, scope: !1323)
!1427 = !DILocation(line: 78, column: 19, scope: !1323)
!1428 = !DILocation(line: 78, column: 24, scope: !1323)
!1429 = !DILocation(line: 78, column: 27, scope: !1323)
!1430 = !DILocation(line: 78, column: 35, scope: !1323)
!1431 = !DILocation(line: 78, column: 22, scope: !1323)
!1432 = !DILocation(line: 78, column: 3, scope: !1323)
!1433 = !DILocation(line: 79, column: 19, scope: !1323)
!1434 = !DILocation(line: 79, column: 22, scope: !1323)
!1435 = !DILocation(line: 79, column: 25, scope: !1323)
!1436 = !DILocation(line: 79, column: 35, scope: !1323)
!1437 = !DILocation(line: 79, column: 45, scope: !1323)
!1438 = !DILocation(line: 79, column: 32, scope: !1323)
!1439 = !DILocation(line: 79, column: 3, scope: !1323)
!1440 = !DILocation(line: 80, column: 19, scope: !1323)
!1441 = !DILocation(line: 80, column: 22, scope: !1323)
!1442 = !DILocation(line: 80, column: 25, scope: !1323)
!1443 = !DILocation(line: 80, column: 36, scope: !1323)
!1444 = !DILocation(line: 80, column: 46, scope: !1323)
!1445 = !DILocation(line: 80, column: 33, scope: !1323)
!1446 = !DILocation(line: 80, column: 3, scope: !1323)
!1447 = !DILocation(line: 81, column: 19, scope: !1323)
!1448 = !DILocation(line: 81, column: 23, scope: !1323)
!1449 = !DILocation(line: 81, column: 26, scope: !1323)
!1450 = !DILocation(line: 81, column: 33, scope: !1323)
!1451 = !DILocation(line: 81, column: 40, scope: !1323)
!1452 = !DILocation(line: 81, column: 22, scope: !1323)
!1453 = !DILocation(line: 81, column: 3, scope: !1323)
!1454 = !DILocation(line: 82, column: 19, scope: !1323)
!1455 = !DILocation(line: 82, column: 23, scope: !1323)
!1456 = !DILocation(line: 82, column: 26, scope: !1323)
!1457 = !DILocation(line: 82, column: 33, scope: !1323)
!1458 = !DILocation(line: 82, column: 40, scope: !1323)
!1459 = !DILocation(line: 82, column: 22, scope: !1323)
!1460 = !DILocation(line: 82, column: 3, scope: !1323)
!1461 = !DILocation(line: 83, column: 19, scope: !1323)
!1462 = !DILocation(line: 83, column: 23, scope: !1323)
!1463 = !DILocation(line: 83, column: 26, scope: !1323)
!1464 = !DILocation(line: 83, column: 33, scope: !1323)
!1465 = !DILocation(line: 83, column: 40, scope: !1323)
!1466 = !DILocation(line: 83, column: 22, scope: !1323)
!1467 = !DILocation(line: 83, column: 3, scope: !1323)
!1468 = !DILocation(line: 84, column: 19, scope: !1323)
!1469 = !DILocation(line: 84, column: 23, scope: !1323)
!1470 = !DILocation(line: 84, column: 26, scope: !1323)
!1471 = !DILocation(line: 84, column: 33, scope: !1323)
!1472 = !DILocation(line: 84, column: 42, scope: !1323)
!1473 = !DILocation(line: 84, column: 22, scope: !1323)
!1474 = !DILocation(line: 84, column: 3, scope: !1323)
!1475 = !DILocation(line: 85, column: 19, scope: !1323)
!1476 = !DILocation(line: 85, column: 22, scope: !1323)
!1477 = !DILocation(line: 85, column: 25, scope: !1323)
!1478 = !DILocation(line: 85, column: 34, scope: !1323)
!1479 = !DILocation(line: 85, column: 3, scope: !1323)
!1480 = !DILocation(line: 86, column: 19, scope: !1323)
!1481 = !DILocation(line: 86, column: 22, scope: !1323)
!1482 = !DILocation(line: 86, column: 25, scope: !1323)
!1483 = !DILocation(line: 86, column: 35, scope: !1323)
!1484 = !DILocation(line: 86, column: 45, scope: !1323)
!1485 = !DILocation(line: 86, column: 32, scope: !1323)
!1486 = !DILocation(line: 86, column: 3, scope: !1323)
!1487 = !DILocation(line: 87, column: 19, scope: !1323)
!1488 = !DILocation(line: 87, column: 22, scope: !1323)
!1489 = !DILocation(line: 87, column: 25, scope: !1323)
!1490 = !DILocation(line: 87, column: 35, scope: !1323)
!1491 = !DILocation(line: 87, column: 45, scope: !1323)
!1492 = !DILocation(line: 87, column: 32, scope: !1323)
!1493 = !DILocation(line: 87, column: 3, scope: !1323)
!1494 = !DILocation(line: 88, column: 19, scope: !1323)
!1495 = !DILocation(line: 88, column: 22, scope: !1323)
!1496 = !DILocation(line: 88, column: 25, scope: !1323)
!1497 = !DILocation(line: 88, column: 36, scope: !1323)
!1498 = !DILocation(line: 88, column: 3, scope: !1323)
!1499 = !DILocation(line: 89, column: 19, scope: !1323)
!1500 = !DILocation(line: 89, column: 22, scope: !1323)
!1501 = !DILocation(line: 89, column: 25, scope: !1323)
!1502 = !DILocation(line: 89, column: 37, scope: !1323)
!1503 = !DILocation(line: 89, column: 47, scope: !1323)
!1504 = !DILocation(line: 89, column: 34, scope: !1323)
!1505 = !DILocation(line: 89, column: 3, scope: !1323)
!1506 = !DILocation(line: 90, column: 19, scope: !1323)
!1507 = !DILocation(line: 90, column: 22, scope: !1323)
!1508 = !DILocation(line: 90, column: 25, scope: !1323)
!1509 = !DILocation(line: 90, column: 37, scope: !1323)
!1510 = !DILocation(line: 90, column: 47, scope: !1323)
!1511 = !DILocation(line: 90, column: 34, scope: !1323)
!1512 = !DILocation(line: 90, column: 3, scope: !1323)
!1513 = !DILocation(line: 91, column: 19, scope: !1323)
!1514 = !DILocation(line: 91, column: 22, scope: !1323)
!1515 = !DILocation(line: 91, column: 25, scope: !1323)
!1516 = !DILocation(line: 91, column: 37, scope: !1323)
!1517 = !DILocation(line: 91, column: 47, scope: !1323)
!1518 = !DILocation(line: 91, column: 34, scope: !1323)
!1519 = !DILocation(line: 91, column: 3, scope: !1323)
!1520 = !DILocation(line: 93, column: 16, scope: !1323)
!1521 = !DILocation(line: 93, column: 23, scope: !1323)
!1522 = !DILocation(line: 93, column: 3, scope: !1323)
!1523 = !DILocation(line: 93, column: 6, scope: !1323)
!1524 = !DILocation(line: 93, column: 14, scope: !1323)
!1525 = !DILocation(line: 94, column: 3, scope: !1323)
!1526 = !DILocation(line: 94, column: 6, scope: !1323)
!1527 = !DILocation(line: 94, column: 16, scope: !1323)
!1528 = !DILocation(line: 95, column: 17, scope: !1323)
!1529 = !DILocation(line: 95, column: 3, scope: !1323)
!1530 = !DILocation(line: 95, column: 10, scope: !1323)
!1531 = !DILocation(line: 95, column: 15, scope: !1323)
!1532 = !DILocation(line: 96, column: 1, scope: !1323)
!1533 = distinct !DISubprogram(name: "klee_range", scope: !188, file: !188, line: 12, type: !1534, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !516, retainedNodes: !381)
!1534 = !DISubroutineType(types: !1535)
!1535 = !{!237, !237, !237, !433}
!1536 = !DILocalVariable(name: "start", arg: 1, scope: !1533, file: !188, line: 12, type: !237)
!1537 = !DILocation(line: 12, column: 20, scope: !1533)
!1538 = !DILocalVariable(name: "end", arg: 2, scope: !1533, file: !188, line: 12, type: !237)
!1539 = !DILocation(line: 12, column: 31, scope: !1533)
!1540 = !DILocalVariable(name: "name", arg: 3, scope: !1533, file: !188, line: 12, type: !433)
!1541 = !DILocation(line: 12, column: 48, scope: !1533)
!1542 = !DILocalVariable(name: "x", scope: !1533, file: !188, line: 13, type: !237)
!1543 = !DILocation(line: 13, column: 7, scope: !1533)
!1544 = !DILocation(line: 15, column: 7, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1533, file: !188, line: 15, column: 7)
!1546 = !DILocation(line: 15, column: 16, scope: !1545)
!1547 = !DILocation(line: 15, column: 13, scope: !1545)
!1548 = !DILocation(line: 15, column: 7, scope: !1533)
!1549 = !DILocation(line: 16, column: 5, scope: !1545)
!1550 = !DILocation(line: 18, column: 7, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1533, file: !188, line: 18, column: 7)
!1552 = !DILocation(line: 18, column: 12, scope: !1551)
!1553 = !DILocation(line: 18, column: 16, scope: !1551)
!1554 = !DILocation(line: 18, column: 14, scope: !1551)
!1555 = !DILocation(line: 18, column: 7, scope: !1533)
!1556 = !DILocation(line: 19, column: 12, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1551, file: !188, line: 18, column: 21)
!1558 = !DILocation(line: 19, column: 5, scope: !1557)
!1559 = !DILocation(line: 21, column: 38, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1551, file: !188, line: 20, column: 10)
!1561 = !DILocation(line: 21, column: 5, scope: !1560)
!1562 = !DILocation(line: 24, column: 9, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1560, file: !188, line: 24, column: 9)
!1564 = !DILocation(line: 24, column: 14, scope: !1563)
!1565 = !DILocation(line: 24, column: 9, scope: !1560)
!1566 = !DILocation(line: 25, column: 30, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1563, file: !188, line: 24, column: 19)
!1568 = !DILocation(line: 25, column: 45, scope: !1567)
!1569 = !DILocation(line: 25, column: 32, scope: !1567)
!1570 = !DILocation(line: 25, column: 19, scope: !1567)
!1571 = !DILocation(line: 25, column: 7, scope: !1567)
!1572 = !DILocation(line: 26, column: 5, scope: !1567)
!1573 = !DILocation(line: 27, column: 19, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1563, file: !188, line: 26, column: 12)
!1575 = !DILocation(line: 27, column: 28, scope: !1574)
!1576 = !DILocation(line: 27, column: 25, scope: !1574)
!1577 = !DILocation(line: 27, column: 7, scope: !1574)
!1578 = !DILocation(line: 28, column: 19, scope: !1574)
!1579 = !DILocation(line: 28, column: 23, scope: !1574)
!1580 = !DILocation(line: 28, column: 21, scope: !1574)
!1581 = !DILocation(line: 28, column: 7, scope: !1574)
!1582 = !DILocation(line: 31, column: 12, scope: !1560)
!1583 = !DILocation(line: 31, column: 5, scope: !1560)
!1584 = !DILocation(line: 33, column: 1, scope: !1533)
!1585 = distinct !DISubprogram(name: "access", scope: !294, file: !294, line: 90, type: !1586, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!1586 = !DISubroutineType(types: !1587)
!1587 = !{!237, !433, !237}
!1588 = !DILocalVariable(name: "pathname", arg: 1, scope: !1585, file: !294, line: 90, type: !433)
!1589 = !DILocation(line: 90, column: 24, scope: !1585)
!1590 = !DILocalVariable(name: "mode", arg: 2, scope: !1585, file: !294, line: 90, type: !237)
!1591 = !DILocation(line: 90, column: 38, scope: !1585)
!1592 = !DILocalVariable(name: "dfile", scope: !1585, file: !294, line: 91, type: !1593)
!1593 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1594, size: 64)
!1594 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_disk_file_t", file: !204, line: 57, baseType: !1595)
!1595 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !204, line: 53, size: 192, elements: !1596)
!1596 = !{!1597, !1598, !1599}
!1597 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !1595, file: !204, line: 54, baseType: !208, size: 32)
!1598 = !DIDerivedType(tag: DW_TAG_member, name: "contents", scope: !1595, file: !204, line: 55, baseType: !216, size: 64, offset: 64)
!1599 = !DIDerivedType(tag: DW_TAG_member, name: "stat", scope: !1595, file: !204, line: 56, baseType: !1600, size: 64, offset: 128)
!1600 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1601, size: 64)
!1601 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat64", file: !220, line: 103, size: 1152, elements: !1602)
!1602 = !{!1603, !1604, !1605, !1606, !1607, !1608, !1609, !1610, !1611, !1612, !1613, !1614, !1615, !1616, !1617}
!1603 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !1601, file: !220, line: 108, baseType: !223, size: 64)
!1604 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !1601, file: !220, line: 110, baseType: !227, size: 64, offset: 64)
!1605 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !1601, file: !220, line: 111, baseType: !229, size: 64, offset: 128)
!1606 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !1601, file: !220, line: 112, baseType: !231, size: 32, offset: 192)
!1607 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !1601, file: !220, line: 119, baseType: !233, size: 32, offset: 224)
!1608 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !1601, file: !220, line: 120, baseType: !235, size: 32, offset: 256)
!1609 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !1601, file: !220, line: 122, baseType: !237, size: 32, offset: 288)
!1610 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !1601, file: !220, line: 123, baseType: !223, size: 64, offset: 320)
!1611 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !1601, file: !220, line: 124, baseType: !240, size: 64, offset: 384)
!1612 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !1601, file: !220, line: 130, baseType: !243, size: 64, offset: 448)
!1613 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !1601, file: !220, line: 131, baseType: !245, size: 64, offset: 512)
!1614 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !1601, file: !220, line: 139, baseType: !364, size: 128, offset: 576)
!1615 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !1601, file: !220, line: 140, baseType: !364, size: 128, offset: 704)
!1616 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !1601, file: !220, line: 141, baseType: !364, size: 128, offset: 832)
!1617 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !1601, file: !220, line: 151, baseType: !257, size: 192, offset: 960)
!1618 = !DILocation(line: 91, column: 20, scope: !1585)
!1619 = !DILocation(line: 91, column: 43, scope: !1585)
!1620 = !DILocation(line: 91, column: 28, scope: !1585)
!1621 = !DILocation(line: 93, column: 7, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1585, file: !294, line: 93, column: 7)
!1623 = !DILocation(line: 93, column: 7, scope: !1585)
!1624 = !DILocation(line: 96, column: 5, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1622, file: !294, line: 93, column: 14)
!1626 = !DILocation(line: 98, column: 51, scope: !1585)
!1627 = !DILocation(line: 98, column: 31, scope: !1585)
!1628 = !DILocation(line: 98, column: 62, scope: !1585)
!1629 = !DILocation(line: 98, column: 10, scope: !1585)
!1630 = !DILocation(line: 98, column: 3, scope: !1585)
!1631 = !DILocation(line: 99, column: 1, scope: !1585)
!1632 = distinct !DISubprogram(name: "__get_sym_file", scope: !294, file: !294, line: 37, type: !1633, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !310, retainedNodes: !381)
!1633 = !DISubroutineType(types: !1634)
!1634 = !{!1593, !433}
!1635 = !DILocalVariable(name: "pathname", arg: 1, scope: !1632, file: !294, line: 37, type: !433)
!1636 = !DILocation(line: 37, column: 52, scope: !1632)
!1637 = !DILocation(line: 38, column: 8, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1632, file: !294, line: 38, column: 7)
!1639 = !DILocation(line: 38, column: 7, scope: !1632)
!1640 = !DILocation(line: 39, column: 5, scope: !1638)
!1641 = !DILocation(line: 43, column: 7, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1632, file: !294, line: 43, column: 7)
!1643 = !DILocation(line: 43, column: 19, scope: !1642)
!1644 = !DILocation(line: 43, column: 7, scope: !1632)
!1645 = !DILocalVariable(name: "cwd", scope: !1646, file: !294, line: 44, type: !1647)
!1646 = distinct !DILexicalBlock(scope: !1642, file: !294, line: 43, column: 27)
!1647 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 8192, elements: !590)
!1648 = !DILocation(line: 44, column: 10, scope: !1646)
!1649 = !DILocation(line: 45, column: 16, scope: !1650)
!1650 = distinct !DILexicalBlock(scope: !1646, file: !294, line: 45, column: 9)
!1651 = !DILocation(line: 45, column: 9, scope: !1650)
!1652 = !DILocation(line: 45, column: 9, scope: !1646)
!1653 = !DILocalVariable(name: "cwd_len", scope: !1654, file: !294, line: 46, type: !379)
!1654 = distinct !DILexicalBlock(scope: !1650, file: !294, line: 45, column: 28)
!1655 = !DILocation(line: 46, column: 14, scope: !1654)
!1656 = !DILocation(line: 46, column: 31, scope: !1654)
!1657 = !DILocation(line: 46, column: 24, scope: !1654)
!1658 = !DILocation(line: 48, column: 11, scope: !1659)
!1659 = distinct !DILexicalBlock(scope: !1654, file: !294, line: 48, column: 11)
!1660 = !DILocation(line: 48, column: 19, scope: !1659)
!1661 = !DILocation(line: 48, column: 23, scope: !1659)
!1662 = !DILocation(line: 48, column: 30, scope: !1659)
!1663 = !DILocation(line: 48, column: 38, scope: !1659)
!1664 = !DILocation(line: 48, column: 26, scope: !1659)
!1665 = !DILocation(line: 48, column: 43, scope: !1659)
!1666 = !DILocation(line: 48, column: 11, scope: !1654)
!1667 = !DILocation(line: 49, column: 13, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1659, file: !294, line: 48, column: 51)
!1669 = !DILocation(line: 49, column: 9, scope: !1668)
!1670 = !DILocation(line: 49, column: 24, scope: !1668)
!1671 = !DILocation(line: 50, column: 7, scope: !1668)
!1672 = !DILocation(line: 51, column: 19, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1654, file: !294, line: 51, column: 11)
!1674 = !DILocation(line: 51, column: 29, scope: !1673)
!1675 = !DILocation(line: 51, column: 34, scope: !1673)
!1676 = !DILocation(line: 51, column: 11, scope: !1673)
!1677 = !DILocation(line: 51, column: 43, scope: !1673)
!1678 = !DILocation(line: 51, column: 11, scope: !1654)
!1679 = !DILocation(line: 52, column: 13, scope: !1680)
!1680 = distinct !DILexicalBlock(scope: !1681, file: !294, line: 52, column: 13)
!1681 = distinct !DILexicalBlock(scope: !1673, file: !294, line: 51, column: 49)
!1682 = !DILocation(line: 52, column: 22, scope: !1680)
!1683 = !DILocation(line: 52, column: 31, scope: !1680)
!1684 = !DILocation(line: 52, column: 13, scope: !1681)
!1685 = !DILocation(line: 53, column: 23, scope: !1680)
!1686 = !DILocation(line: 53, column: 31, scope: !1680)
!1687 = !DILocation(line: 53, column: 20, scope: !1680)
!1688 = !DILocation(line: 53, column: 11, scope: !1680)
!1689 = !DILocalVariable(name: "c", scope: !1632, file: !294, line: 57, type: !5)
!1690 = !DILocation(line: 57, column: 8, scope: !1632)
!1691 = !DILocation(line: 57, column: 12, scope: !1632)
!1692 = !DILocalVariable(name: "i", scope: !1632, file: !294, line: 58, type: !208)
!1693 = !DILocation(line: 58, column: 12, scope: !1632)
!1694 = !DILocation(line: 60, column: 7, scope: !1695)
!1695 = distinct !DILexicalBlock(scope: !1632, file: !294, line: 60, column: 7)
!1696 = !DILocation(line: 60, column: 9, scope: !1695)
!1697 = !DILocation(line: 60, column: 14, scope: !1695)
!1698 = !DILocation(line: 60, column: 17, scope: !1695)
!1699 = !DILocation(line: 60, column: 29, scope: !1695)
!1700 = !DILocation(line: 60, column: 7, scope: !1632)
!1701 = !DILocation(line: 61, column: 5, scope: !1695)
!1702 = !DILocation(line: 63, column: 9, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1632, file: !294, line: 63, column: 3)
!1704 = !DILocation(line: 63, column: 8, scope: !1703)
!1705 = !DILocation(line: 63, column: 13, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1703, file: !294, line: 63, column: 3)
!1707 = !DILocation(line: 63, column: 24, scope: !1706)
!1708 = !DILocation(line: 63, column: 14, scope: !1706)
!1709 = !DILocation(line: 63, column: 3, scope: !1703)
!1710 = !DILocation(line: 64, column: 9, scope: !1711)
!1711 = distinct !DILexicalBlock(scope: !1712, file: !294, line: 64, column: 9)
!1712 = distinct !DILexicalBlock(scope: !1706, file: !294, line: 63, column: 42)
!1713 = !DILocation(line: 64, column: 27, scope: !1711)
!1714 = !DILocation(line: 64, column: 20, scope: !1711)
!1715 = !DILocation(line: 64, column: 18, scope: !1711)
!1716 = !DILocation(line: 64, column: 11, scope: !1711)
!1717 = !DILocation(line: 64, column: 9, scope: !1712)
!1718 = !DILocalVariable(name: "df", scope: !1719, file: !294, line: 65, type: !1593)
!1719 = distinct !DILexicalBlock(scope: !1711, file: !294, line: 64, column: 30)
!1720 = !DILocation(line: 65, column: 24, scope: !1719)
!1721 = !DILocation(line: 65, column: 39, scope: !1719)
!1722 = !DILocation(line: 65, column: 49, scope: !1719)
!1723 = !DILocation(line: 65, column: 30, scope: !1719)
!1724 = !DILocation(line: 66, column: 11, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1719, file: !294, line: 66, column: 11)
!1726 = !DILocation(line: 66, column: 15, scope: !1725)
!1727 = !DILocation(line: 66, column: 21, scope: !1725)
!1728 = !DILocation(line: 66, column: 28, scope: !1725)
!1729 = !DILocation(line: 66, column: 11, scope: !1719)
!1730 = !DILocation(line: 67, column: 9, scope: !1725)
!1731 = !DILocation(line: 68, column: 14, scope: !1719)
!1732 = !DILocation(line: 68, column: 7, scope: !1719)
!1733 = !DILocation(line: 63, column: 37, scope: !1706)
!1734 = !DILocation(line: 63, column: 3, scope: !1706)
!1735 = distinct !{!1735, !1709, !1736}
!1736 = !DILocation(line: 70, column: 3, scope: !1703)
!1737 = !DILocation(line: 72, column: 3, scope: !1632)
!1738 = !DILocation(line: 73, column: 1, scope: !1632)
!1739 = distinct !DISubprogram(name: "__concretize_string", scope: !294, file: !294, line: 1382, type: !1740, scopeLine: 1382, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !310, retainedNodes: !381)
!1740 = !DISubroutineType(types: !1741)
!1741 = !{!433, !433}
!1742 = !DILocalVariable(name: "s", arg: 1, scope: !1739, file: !294, line: 1382, type: !433)
!1743 = !DILocation(line: 1382, column: 52, scope: !1739)
!1744 = !DILocalVariable(name: "sc", scope: !1739, file: !294, line: 1383, type: !216)
!1745 = !DILocation(line: 1383, column: 9, scope: !1739)
!1746 = !DILocation(line: 1383, column: 31, scope: !1739)
!1747 = !DILocation(line: 1383, column: 14, scope: !1739)
!1748 = !DILocalVariable(name: "i", scope: !1739, file: !294, line: 1384, type: !208)
!1749 = !DILocation(line: 1384, column: 12, scope: !1739)
!1750 = !DILocation(line: 1386, column: 10, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1739, file: !294, line: 1386, column: 3)
!1752 = !DILocation(line: 1386, column: 8, scope: !1751)
!1753 = !DILocalVariable(name: "c", scope: !1754, file: !294, line: 1387, type: !5)
!1754 = distinct !DILexicalBlock(scope: !1755, file: !294, line: 1386, column: 27)
!1755 = distinct !DILexicalBlock(scope: !1751, file: !294, line: 1386, column: 3)
!1756 = !DILocation(line: 1387, column: 10, scope: !1754)
!1757 = !DILocation(line: 1387, column: 15, scope: !1754)
!1758 = !DILocation(line: 1387, column: 14, scope: !1754)
!1759 = !DILocation(line: 1389, column: 27, scope: !1760)
!1760 = distinct !DILexicalBlock(scope: !1754, file: !294, line: 1389, column: 9)
!1761 = !DILocation(line: 1389, column: 10, scope: !1760)
!1762 = !DILocation(line: 1389, column: 9, scope: !1754)
!1763 = !DILocation(line: 1390, column: 12, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1765, file: !294, line: 1390, column: 11)
!1765 = distinct !DILexicalBlock(scope: !1760, file: !294, line: 1389, column: 31)
!1766 = !DILocation(line: 1390, column: 11, scope: !1765)
!1767 = !DILocation(line: 1394, column: 11, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1754, file: !294, line: 1394, column: 9)
!1769 = !DILocation(line: 1394, column: 14, scope: !1768)
!1770 = !DILocation(line: 1394, column: 15, scope: !1768)
!1771 = !DILocation(line: 1394, column: 12, scope: !1768)
!1772 = !DILocation(line: 1394, column: 9, scope: !1754)
!1773 = !DILocation(line: 1395, column: 12, scope: !1774)
!1774 = distinct !DILexicalBlock(scope: !1775, file: !294, line: 1395, column: 11)
!1775 = distinct !DILexicalBlock(scope: !1768, file: !294, line: 1394, column: 21)
!1776 = !DILocation(line: 1395, column: 11, scope: !1775)
!1777 = !DILocation(line: 1396, column: 10, scope: !1778)
!1778 = distinct !DILexicalBlock(scope: !1774, file: !294, line: 1395, column: 15)
!1779 = !DILocation(line: 1396, column: 13, scope: !1778)
!1780 = !DILocation(line: 1397, column: 9, scope: !1778)
!1781 = !DILocation(line: 1398, column: 18, scope: !1782)
!1782 = distinct !DILexicalBlock(scope: !1774, file: !294, line: 1398, column: 18)
!1783 = !DILocation(line: 1398, column: 19, scope: !1782)
!1784 = !DILocation(line: 1398, column: 18, scope: !1774)
!1785 = !DILocation(line: 1399, column: 10, scope: !1786)
!1786 = distinct !DILexicalBlock(scope: !1782, file: !294, line: 1398, column: 26)
!1787 = !DILocation(line: 1399, column: 13, scope: !1786)
!1788 = !DILocation(line: 1400, column: 7, scope: !1786)
!1789 = !DILocalVariable(name: "cc", scope: !1790, file: !294, line: 1402, type: !5)
!1790 = distinct !DILexicalBlock(scope: !1768, file: !294, line: 1401, column: 12)
!1791 = !DILocation(line: 1402, column: 12, scope: !1790)
!1792 = !DILocation(line: 1402, column: 46, scope: !1790)
!1793 = !DILocation(line: 1402, column: 40, scope: !1790)
!1794 = !DILocation(line: 1402, column: 24, scope: !1790)
!1795 = !DILocation(line: 1402, column: 17, scope: !1790)
!1796 = !DILocation(line: 1403, column: 19, scope: !1790)
!1797 = !DILocation(line: 1403, column: 25, scope: !1790)
!1798 = !DILocation(line: 1403, column: 22, scope: !1790)
!1799 = !DILocation(line: 1403, column: 7, scope: !1790)
!1800 = !DILocation(line: 1404, column: 13, scope: !1790)
!1801 = !DILocation(line: 1404, column: 8, scope: !1790)
!1802 = !DILocation(line: 1404, column: 11, scope: !1790)
!1803 = !DILocation(line: 1405, column: 12, scope: !1804)
!1804 = distinct !DILexicalBlock(scope: !1790, file: !294, line: 1405, column: 11)
!1805 = !DILocation(line: 1405, column: 11, scope: !1790)
!1806 = !DILocation(line: 1386, column: 16, scope: !1755)
!1807 = !DILocation(line: 1386, column: 21, scope: !1755)
!1808 = !DILocation(line: 1386, column: 3, scope: !1755)
!1809 = distinct !{!1809, !1810, !1811}
!1810 = !DILocation(line: 1386, column: 3, scope: !1751)
!1811 = !DILocation(line: 1407, column: 3, scope: !1751)
!1812 = !DILocation(line: 1409, column: 10, scope: !1739)
!1813 = !DILocation(line: 1409, column: 3, scope: !1739)
!1814 = distinct !DISubprogram(name: "__concretize_ptr", scope: !294, file: !294, line: 1369, type: !1815, scopeLine: 1369, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !310, retainedNodes: !381)
!1815 = !DISubroutineType(types: !1816)
!1816 = !{!332, !399}
!1817 = !DILocalVariable(name: "p", arg: 1, scope: !1814, file: !294, line: 1369, type: !399)
!1818 = !DILocation(line: 1369, column: 43, scope: !1814)
!1819 = !DILocalVariable(name: "pc", scope: !1814, file: !294, line: 1371, type: !216)
!1820 = !DILocation(line: 1371, column: 9, scope: !1814)
!1821 = !DILocation(line: 1371, column: 45, scope: !1814)
!1822 = !DILocation(line: 1371, column: 38, scope: !1814)
!1823 = !DILocation(line: 1371, column: 22, scope: !1814)
!1824 = !DILocation(line: 1371, column: 14, scope: !1814)
!1825 = !DILocation(line: 1372, column: 15, scope: !1814)
!1826 = !DILocation(line: 1372, column: 21, scope: !1814)
!1827 = !DILocation(line: 1372, column: 18, scope: !1814)
!1828 = !DILocation(line: 1372, column: 3, scope: !1814)
!1829 = !DILocation(line: 1373, column: 10, scope: !1814)
!1830 = !DILocation(line: 1373, column: 3, scope: !1814)
!1831 = !DILocalVariable(name: "buf", arg: 1, scope: !489, file: !294, line: 1331, type: !216)
!1832 = !DILocation(line: 1331, column: 20, scope: !489)
!1833 = !DILocalVariable(name: "size", arg: 2, scope: !489, file: !294, line: 1331, type: !379)
!1834 = !DILocation(line: 1331, column: 32, scope: !489)
!1835 = !DILocalVariable(name: "r", scope: !489, file: !294, line: 1333, type: !237)
!1836 = !DILocation(line: 1333, column: 7, scope: !489)
!1837 = !DILocation(line: 1335, column: 10, scope: !489)
!1838 = !DILocation(line: 1337, column: 16, scope: !1839)
!1839 = distinct !DILexicalBlock(scope: !489, file: !294, line: 1337, column: 7)
!1840 = !DILocation(line: 1337, column: 7, scope: !1839)
!1841 = !DILocation(line: 1337, column: 29, scope: !1839)
!1842 = !DILocation(line: 1337, column: 42, scope: !1839)
!1843 = !DILocation(line: 1337, column: 32, scope: !1839)
!1844 = !DILocation(line: 1337, column: 57, scope: !1839)
!1845 = !DILocation(line: 1337, column: 54, scope: !1839)
!1846 = !DILocation(line: 1337, column: 7, scope: !489)
!1847 = !DILocation(line: 1338, column: 26, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1839, file: !294, line: 1337, column: 66)
!1849 = !DILocation(line: 1339, column: 5, scope: !1848)
!1850 = !DILocation(line: 1339, column: 11, scope: !1848)
!1851 = !DILocation(line: 1340, column: 5, scope: !1848)
!1852 = !DILocation(line: 1343, column: 8, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !489, file: !294, line: 1343, column: 7)
!1854 = !DILocation(line: 1343, column: 7, scope: !489)
!1855 = !DILocation(line: 1344, column: 10, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1853, file: !294, line: 1343, column: 13)
!1857 = !DILocation(line: 1345, column: 18, scope: !1856)
!1858 = !DILocation(line: 1345, column: 11, scope: !1856)
!1859 = !DILocation(line: 1345, column: 9, scope: !1856)
!1860 = !DILocation(line: 1346, column: 10, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1856, file: !294, line: 1346, column: 9)
!1862 = !DILocation(line: 1346, column: 9, scope: !1856)
!1863 = !DILocation(line: 1347, column: 7, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1861, file: !294, line: 1346, column: 15)
!1865 = !DILocation(line: 1347, column: 13, scope: !1864)
!1866 = !DILocation(line: 1348, column: 7, scope: !1864)
!1867 = !DILocation(line: 1350, column: 15, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1853, file: !294, line: 1350, column: 14)
!1869 = !DILocation(line: 1350, column: 14, scope: !1853)
!1870 = !DILocation(line: 1351, column: 5, scope: !1871)
!1871 = distinct !DILexicalBlock(scope: !1868, file: !294, line: 1350, column: 21)
!1872 = !DILocation(line: 1351, column: 11, scope: !1871)
!1873 = !DILocation(line: 1352, column: 5, scope: !1871)
!1874 = !DILocation(line: 1355, column: 26, scope: !489)
!1875 = !DILocation(line: 1355, column: 9, scope: !489)
!1876 = !DILocation(line: 1355, column: 7, scope: !489)
!1877 = !DILocation(line: 1356, column: 28, scope: !489)
!1878 = !DILocation(line: 1356, column: 10, scope: !489)
!1879 = !DILocation(line: 1356, column: 8, scope: !489)
!1880 = !DILocation(line: 1360, column: 28, scope: !489)
!1881 = !DILocation(line: 1360, column: 33, scope: !489)
!1882 = !DILocation(line: 1360, column: 3, scope: !489)
!1883 = !DILocation(line: 1361, column: 28, scope: !489)
!1884 = !DILocation(line: 1361, column: 33, scope: !489)
!1885 = !DILocation(line: 1361, column: 7, scope: !489)
!1886 = !DILocation(line: 1361, column: 5, scope: !489)
!1887 = !DILocation(line: 1362, column: 7, scope: !1888)
!1888 = distinct !DILexicalBlock(scope: !489, file: !294, line: 1362, column: 7)
!1889 = !DILocation(line: 1362, column: 9, scope: !1888)
!1890 = !DILocation(line: 1362, column: 7, scope: !489)
!1891 = !DILocation(line: 1363, column: 5, scope: !1888)
!1892 = !DILocation(line: 1364, column: 10, scope: !489)
!1893 = !DILocation(line: 1364, column: 3, scope: !489)
!1894 = !DILocation(line: 1365, column: 1, scope: !489)
!1895 = distinct !DISubprogram(name: "__concretize_size", scope: !294, file: !294, line: 1376, type: !1896, scopeLine: 1376, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !310, retainedNodes: !381)
!1896 = !DISubroutineType(types: !1897)
!1897 = !{!379, !379}
!1898 = !DILocalVariable(name: "s", arg: 1, scope: !1895, file: !294, line: 1376, type: !379)
!1899 = !DILocation(line: 1376, column: 40, scope: !1895)
!1900 = !DILocalVariable(name: "sc", scope: !1895, file: !294, line: 1377, type: !379)
!1901 = !DILocation(line: 1377, column: 10, scope: !1895)
!1902 = !DILocation(line: 1377, column: 37, scope: !1895)
!1903 = !DILocation(line: 1377, column: 15, scope: !1895)
!1904 = !DILocation(line: 1378, column: 15, scope: !1895)
!1905 = !DILocation(line: 1378, column: 21, scope: !1895)
!1906 = !DILocation(line: 1378, column: 18, scope: !1895)
!1907 = !DILocation(line: 1378, column: 3, scope: !1895)
!1908 = !DILocation(line: 1379, column: 10, scope: !1895)
!1909 = !DILocation(line: 1379, column: 3, scope: !1895)
!1910 = distinct !DISubprogram(name: "umask", scope: !294, file: !294, line: 101, type: !1911, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!1911 = !DISubroutineType(types: !1912)
!1912 = !{!231, !290}
!1913 = !DILocalVariable(name: "mask", arg: 1, scope: !1910, file: !294, line: 101, type: !290)
!1914 = !DILocation(line: 101, column: 21, scope: !1910)
!1915 = !DILocalVariable(name: "r", scope: !1910, file: !294, line: 102, type: !290)
!1916 = !DILocation(line: 102, column: 10, scope: !1910)
!1917 = !DILocation(line: 102, column: 24, scope: !1910)
!1918 = !DILocation(line: 103, column: 21, scope: !1910)
!1919 = !DILocation(line: 103, column: 26, scope: !1910)
!1920 = !DILocation(line: 103, column: 19, scope: !1910)
!1921 = !DILocation(line: 104, column: 10, scope: !1910)
!1922 = !DILocation(line: 104, column: 3, scope: !1910)
!1923 = distinct !DISubprogram(name: "__fd_open", scope: !294, file: !294, line: 127, type: !1924, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!1924 = !DISubroutineType(types: !1925)
!1925 = !{!237, !433, !237, !290}
!1926 = !DILocalVariable(name: "pathname", arg: 1, scope: !1923, file: !294, line: 127, type: !433)
!1927 = !DILocation(line: 127, column: 27, scope: !1923)
!1928 = !DILocalVariable(name: "flags", arg: 2, scope: !1923, file: !294, line: 127, type: !237)
!1929 = !DILocation(line: 127, column: 41, scope: !1923)
!1930 = !DILocalVariable(name: "mode", arg: 3, scope: !1923, file: !294, line: 127, type: !290)
!1931 = !DILocation(line: 127, column: 55, scope: !1923)
!1932 = !DILocalVariable(name: "df", scope: !1923, file: !294, line: 128, type: !1593)
!1933 = !DILocation(line: 128, column: 20, scope: !1923)
!1934 = !DILocalVariable(name: "f", scope: !1923, file: !294, line: 129, type: !1935)
!1935 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1936, size: 64)
!1936 = !DIDerivedType(tag: DW_TAG_typedef, name: "exe_file_t", file: !204, line: 73, baseType: !1937)
!1937 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !204, line: 66, size: 192, elements: !1938)
!1938 = !{!1939, !1940, !1941, !1942}
!1939 = !DIDerivedType(tag: DW_TAG_member, name: "fd", scope: !1937, file: !204, line: 67, baseType: !237, size: 32)
!1940 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1937, file: !204, line: 68, baseType: !208, size: 32, offset: 32)
!1941 = !DIDerivedType(tag: DW_TAG_member, name: "off", scope: !1937, file: !204, line: 71, baseType: !283, size: 64, offset: 64)
!1942 = !DIDerivedType(tag: DW_TAG_member, name: "dfile", scope: !1937, file: !204, line: 72, baseType: !1593, size: 64, offset: 128)
!1943 = !DILocation(line: 129, column: 15, scope: !1923)
!1944 = !DILocalVariable(name: "fd", scope: !1923, file: !294, line: 130, type: !237)
!1945 = !DILocation(line: 130, column: 7, scope: !1923)
!1946 = !DILocation(line: 132, column: 11, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1923, file: !294, line: 132, column: 3)
!1948 = !DILocation(line: 132, column: 8, scope: !1947)
!1949 = !DILocation(line: 132, column: 16, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1947, file: !294, line: 132, column: 3)
!1951 = !DILocation(line: 132, column: 19, scope: !1950)
!1952 = !DILocation(line: 132, column: 3, scope: !1947)
!1953 = !DILocation(line: 133, column: 25, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1950, file: !294, line: 133, column: 9)
!1955 = !DILocation(line: 133, column: 11, scope: !1954)
!1956 = !DILocation(line: 133, column: 29, scope: !1954)
!1957 = !DILocation(line: 133, column: 35, scope: !1954)
!1958 = !DILocation(line: 133, column: 9, scope: !1950)
!1959 = !DILocation(line: 132, column: 30, scope: !1950)
!1960 = !DILocation(line: 132, column: 3, scope: !1950)
!1961 = distinct !{!1961, !1952, !1962}
!1962 = !DILocation(line: 134, column: 7, scope: !1947)
!1963 = !DILocation(line: 135, column: 7, scope: !1964)
!1964 = distinct !DILexicalBlock(scope: !1923, file: !294, line: 135, column: 7)
!1965 = !DILocation(line: 135, column: 10, scope: !1964)
!1966 = !DILocation(line: 135, column: 7, scope: !1923)
!1967 = !DILocation(line: 136, column: 5, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1964, file: !294, line: 135, column: 22)
!1969 = !DILocation(line: 136, column: 11, scope: !1968)
!1970 = !DILocation(line: 137, column: 5, scope: !1968)
!1971 = !DILocation(line: 140, column: 22, scope: !1923)
!1972 = !DILocation(line: 140, column: 8, scope: !1923)
!1973 = !DILocation(line: 140, column: 5, scope: !1923)
!1974 = !DILocation(line: 143, column: 10, scope: !1923)
!1975 = !DILocation(line: 143, column: 3, scope: !1923)
!1976 = !DILocation(line: 145, column: 23, scope: !1923)
!1977 = !DILocation(line: 145, column: 8, scope: !1923)
!1978 = !DILocation(line: 145, column: 6, scope: !1923)
!1979 = !DILocation(line: 146, column: 7, scope: !1980)
!1980 = distinct !DILexicalBlock(scope: !1923, file: !294, line: 146, column: 7)
!1981 = !DILocation(line: 146, column: 7, scope: !1923)
!1982 = !DILocation(line: 149, column: 16, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1980, file: !294, line: 146, column: 11)
!1984 = !DILocation(line: 149, column: 5, scope: !1983)
!1985 = !DILocation(line: 149, column: 8, scope: !1983)
!1986 = !DILocation(line: 149, column: 14, scope: !1983)
!1987 = !DILocation(line: 151, column: 10, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1983, file: !294, line: 151, column: 9)
!1989 = !DILocation(line: 151, column: 16, scope: !1988)
!1990 = !DILocation(line: 151, column: 27, scope: !1988)
!1991 = !DILocation(line: 151, column: 31, scope: !1988)
!1992 = !DILocation(line: 151, column: 37, scope: !1988)
!1993 = !DILocation(line: 151, column: 9, scope: !1983)
!1994 = !DILocation(line: 152, column: 7, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1988, file: !294, line: 151, column: 48)
!1996 = !DILocation(line: 152, column: 13, scope: !1995)
!1997 = !DILocation(line: 153, column: 7, scope: !1995)
!1998 = !DILocation(line: 156, column: 10, scope: !1999)
!1999 = distinct !DILexicalBlock(scope: !1983, file: !294, line: 156, column: 9)
!2000 = !DILocation(line: 156, column: 16, scope: !1999)
!2001 = !DILocation(line: 156, column: 27, scope: !1999)
!2002 = !DILocation(line: 156, column: 31, scope: !1999)
!2003 = !DILocation(line: 156, column: 37, scope: !1999)
!2004 = !DILocation(line: 156, column: 9, scope: !1983)
!2005 = !DILocation(line: 159, column: 7, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !1999, file: !294, line: 156, column: 50)
!2007 = !DILocation(line: 160, column: 7, scope: !2006)
!2008 = !DILocation(line: 160, column: 13, scope: !2006)
!2009 = !DILocation(line: 161, column: 7, scope: !2006)
!2010 = !DILocation(line: 164, column: 10, scope: !2011)
!2011 = distinct !DILexicalBlock(scope: !1983, file: !294, line: 164, column: 9)
!2012 = !DILocation(line: 164, column: 16, scope: !2011)
!2013 = !DILocation(line: 164, column: 26, scope: !2011)
!2014 = !DILocation(line: 164, column: 31, scope: !2011)
!2015 = !DILocation(line: 164, column: 37, scope: !2011)
!2016 = !DILocation(line: 164, column: 9, scope: !1983)
!2017 = !DILocation(line: 167, column: 7, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2011, file: !294, line: 164, column: 49)
!2019 = !DILocation(line: 168, column: 7, scope: !2018)
!2020 = !DILocation(line: 168, column: 13, scope: !2018)
!2021 = !DILocation(line: 169, column: 7, scope: !2018)
!2022 = !DILocation(line: 172, column: 25, scope: !2023)
!2023 = distinct !DILexicalBlock(scope: !1983, file: !294, line: 172, column: 9)
!2024 = !DILocation(line: 172, column: 32, scope: !2023)
!2025 = !DILocation(line: 172, column: 36, scope: !2023)
!2026 = !DILocation(line: 172, column: 10, scope: !2023)
!2027 = !DILocation(line: 172, column: 9, scope: !1983)
!2028 = !DILocation(line: 173, column: 2, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !2023, file: !294, line: 172, column: 43)
!2030 = !DILocation(line: 173, column: 8, scope: !2029)
!2031 = !DILocation(line: 174, column: 2, scope: !2029)
!2032 = !DILocation(line: 177, column: 35, scope: !2023)
!2033 = !DILocation(line: 177, column: 38, scope: !2023)
!2034 = !DILocation(line: 177, column: 45, scope: !2023)
!2035 = !DILocation(line: 177, column: 51, scope: !2023)
!2036 = !DILocation(line: 177, column: 59, scope: !2023)
!2037 = !DILocation(line: 178, column: 7, scope: !2023)
!2038 = !DILocation(line: 178, column: 25, scope: !2023)
!2039 = !DILocation(line: 178, column: 14, scope: !2023)
!2040 = !DILocation(line: 178, column: 12, scope: !2023)
!2041 = !DILocation(line: 177, column: 68, scope: !2023)
!2042 = !DILocation(line: 177, column: 7, scope: !2023)
!2043 = !DILocation(line: 177, column: 10, scope: !2023)
!2044 = !DILocation(line: 177, column: 17, scope: !2023)
!2045 = !DILocation(line: 177, column: 23, scope: !2023)
!2046 = !DILocation(line: 177, column: 31, scope: !2023)
!2047 = !DILocation(line: 179, column: 3, scope: !1983)
!2048 = !DILocalVariable(name: "os_fd", scope: !2049, file: !294, line: 180, type: !237)
!2049 = distinct !DILexicalBlock(scope: !1980, file: !294, line: 179, column: 10)
!2050 = !DILocation(line: 180, column: 9, scope: !2049)
!2051 = !DILocation(line: 180, column: 56, scope: !2049)
!2052 = !DILocation(line: 180, column: 36, scope: !2049)
!2053 = !DILocation(line: 180, column: 67, scope: !2049)
!2054 = !DILocation(line: 180, column: 74, scope: !2049)
!2055 = !DILocation(line: 180, column: 17, scope: !2049)
!2056 = !DILocation(line: 181, column: 9, scope: !2057)
!2057 = distinct !DILexicalBlock(scope: !2049, file: !294, line: 181, column: 9)
!2058 = !DILocation(line: 181, column: 15, scope: !2057)
!2059 = !DILocation(line: 181, column: 9, scope: !2049)
!2060 = !DILocation(line: 182, column: 7, scope: !2057)
!2061 = !DILocation(line: 183, column: 13, scope: !2049)
!2062 = !DILocation(line: 183, column: 5, scope: !2049)
!2063 = !DILocation(line: 183, column: 8, scope: !2049)
!2064 = !DILocation(line: 183, column: 11, scope: !2049)
!2065 = !DILocation(line: 186, column: 3, scope: !1923)
!2066 = !DILocation(line: 186, column: 6, scope: !1923)
!2067 = !DILocation(line: 186, column: 12, scope: !1923)
!2068 = !DILocation(line: 187, column: 8, scope: !2069)
!2069 = distinct !DILexicalBlock(scope: !1923, file: !294, line: 187, column: 7)
!2070 = !DILocation(line: 187, column: 14, scope: !2069)
!2071 = !DILocation(line: 187, column: 27, scope: !2069)
!2072 = !DILocation(line: 187, column: 7, scope: !1923)
!2073 = !DILocation(line: 188, column: 5, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2069, file: !294, line: 187, column: 40)
!2075 = !DILocation(line: 188, column: 8, scope: !2074)
!2076 = !DILocation(line: 188, column: 14, scope: !2074)
!2077 = !DILocation(line: 189, column: 3, scope: !2074)
!2078 = !DILocation(line: 189, column: 15, scope: !2079)
!2079 = distinct !DILexicalBlock(scope: !2069, file: !294, line: 189, column: 14)
!2080 = !DILocation(line: 189, column: 21, scope: !2079)
!2081 = !DILocation(line: 189, column: 34, scope: !2079)
!2082 = !DILocation(line: 189, column: 14, scope: !2069)
!2083 = !DILocation(line: 190, column: 5, scope: !2084)
!2084 = distinct !DILexicalBlock(scope: !2079, file: !294, line: 189, column: 47)
!2085 = !DILocation(line: 190, column: 8, scope: !2084)
!2086 = !DILocation(line: 190, column: 14, scope: !2084)
!2087 = !DILocation(line: 191, column: 3, scope: !2084)
!2088 = !DILocation(line: 192, column: 5, scope: !2089)
!2089 = distinct !DILexicalBlock(scope: !2079, file: !294, line: 191, column: 10)
!2090 = !DILocation(line: 192, column: 8, scope: !2089)
!2091 = !DILocation(line: 192, column: 14, scope: !2089)
!2092 = !DILocation(line: 195, column: 10, scope: !1923)
!2093 = !DILocation(line: 195, column: 3, scope: !1923)
!2094 = !DILocation(line: 196, column: 1, scope: !1923)
!2095 = distinct !DISubprogram(name: "has_permission", scope: !294, file: !294, line: 112, type: !2096, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !310, retainedNodes: !381)
!2096 = !DISubroutineType(types: !2097)
!2097 = !{!237, !237, !1600}
!2098 = !DILocalVariable(name: "flags", arg: 1, scope: !2095, file: !294, line: 112, type: !237)
!2099 = !DILocation(line: 112, column: 31, scope: !2095)
!2100 = !DILocalVariable(name: "s", arg: 2, scope: !2095, file: !294, line: 112, type: !1600)
!2101 = !DILocation(line: 112, column: 53, scope: !2095)
!2102 = !DILocalVariable(name: "mode", scope: !2095, file: !294, line: 113, type: !290)
!2103 = !DILocation(line: 113, column: 10, scope: !2095)
!2104 = !DILocation(line: 113, column: 17, scope: !2095)
!2105 = !DILocation(line: 113, column: 20, scope: !2095)
!2106 = !DILocalVariable(name: "read_request", scope: !2095, file: !294, line: 114, type: !237)
!2107 = !DILocation(line: 114, column: 7, scope: !2095)
!2108 = !DILocation(line: 114, column: 24, scope: !2095)
!2109 = !DILocation(line: 114, column: 30, scope: !2095)
!2110 = !DILocation(line: 114, column: 45, scope: !2095)
!2111 = !DILocation(line: 114, column: 51, scope: !2095)
!2112 = !DILocation(line: 114, column: 42, scope: !2095)
!2113 = !DILocation(line: 114, column: 22, scope: !2095)
!2114 = !DILocalVariable(name: "write_request", scope: !2095, file: !294, line: 115, type: !237)
!2115 = !DILocation(line: 115, column: 7, scope: !2095)
!2116 = !DILocation(line: 115, column: 25, scope: !2095)
!2117 = !DILocation(line: 115, column: 31, scope: !2095)
!2118 = !DILocation(line: 115, column: 46, scope: !2095)
!2119 = !DILocation(line: 115, column: 52, scope: !2095)
!2120 = !DILocation(line: 115, column: 43, scope: !2095)
!2121 = !DILocation(line: 115, column: 23, scope: !2095)
!2122 = !DILocation(line: 119, column: 8, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2095, file: !294, line: 119, column: 7)
!2124 = !DILocation(line: 119, column: 27, scope: !2123)
!2125 = !DILocation(line: 119, column: 32, scope: !2123)
!2126 = !DILocation(line: 119, column: 46, scope: !2123)
!2127 = !DILocation(line: 119, column: 51, scope: !2123)
!2128 = !DILocation(line: 119, column: 43, scope: !2123)
!2129 = !DILocation(line: 119, column: 65, scope: !2123)
!2130 = !DILocation(line: 119, column: 70, scope: !2123)
!2131 = !DILocation(line: 119, column: 62, scope: !2123)
!2132 = !DILocation(line: 119, column: 24, scope: !2123)
!2133 = !DILocation(line: 119, column: 22, scope: !2123)
!2134 = !DILocation(line: 120, column: 8, scope: !2123)
!2135 = !DILocation(line: 120, column: 27, scope: !2123)
!2136 = !DILocation(line: 120, column: 32, scope: !2123)
!2137 = !DILocation(line: 120, column: 46, scope: !2123)
!2138 = !DILocation(line: 120, column: 51, scope: !2123)
!2139 = !DILocation(line: 120, column: 43, scope: !2123)
!2140 = !DILocation(line: 120, column: 65, scope: !2123)
!2141 = !DILocation(line: 120, column: 70, scope: !2123)
!2142 = !DILocation(line: 120, column: 62, scope: !2123)
!2143 = !DILocation(line: 120, column: 24, scope: !2123)
!2144 = !DILocation(line: 120, column: 22, scope: !2123)
!2145 = !DILocation(line: 119, column: 83, scope: !2123)
!2146 = !DILocation(line: 119, column: 7, scope: !2095)
!2147 = !DILocation(line: 121, column: 5, scope: !2123)
!2148 = !DILocation(line: 123, column: 3, scope: !2095)
!2149 = !DILocation(line: 124, column: 1, scope: !2095)
!2150 = distinct !DISubprogram(name: "__fd_openat", scope: !294, file: !294, line: 198, type: !2151, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!2151 = !DISubroutineType(types: !2152)
!2152 = !{!237, !237, !433, !237, !290}
!2153 = !DILocalVariable(name: "basefd", arg: 1, scope: !2150, file: !294, line: 198, type: !237)
!2154 = !DILocation(line: 198, column: 21, scope: !2150)
!2155 = !DILocalVariable(name: "pathname", arg: 2, scope: !2150, file: !294, line: 198, type: !433)
!2156 = !DILocation(line: 198, column: 41, scope: !2150)
!2157 = !DILocalVariable(name: "flags", arg: 3, scope: !2150, file: !294, line: 198, type: !237)
!2158 = !DILocation(line: 198, column: 55, scope: !2150)
!2159 = !DILocalVariable(name: "mode", arg: 4, scope: !2150, file: !294, line: 198, type: !290)
!2160 = !DILocation(line: 198, column: 69, scope: !2150)
!2161 = !DILocalVariable(name: "f", scope: !2150, file: !294, line: 199, type: !1935)
!2162 = !DILocation(line: 199, column: 15, scope: !2150)
!2163 = !DILocalVariable(name: "fd", scope: !2150, file: !294, line: 200, type: !237)
!2164 = !DILocation(line: 200, column: 7, scope: !2150)
!2165 = !DILocation(line: 201, column: 7, scope: !2166)
!2166 = distinct !DILexicalBlock(scope: !2150, file: !294, line: 201, column: 7)
!2167 = !DILocation(line: 201, column: 14, scope: !2166)
!2168 = !DILocation(line: 201, column: 7, scope: !2150)
!2169 = !DILocalVariable(name: "bf", scope: !2170, file: !294, line: 202, type: !1935)
!2170 = distinct !DILexicalBlock(scope: !2166, file: !294, line: 201, column: 27)
!2171 = !DILocation(line: 202, column: 17, scope: !2170)
!2172 = !DILocation(line: 202, column: 33, scope: !2170)
!2173 = !DILocation(line: 202, column: 22, scope: !2170)
!2174 = !DILocation(line: 204, column: 10, scope: !2175)
!2175 = distinct !DILexicalBlock(scope: !2170, file: !294, line: 204, column: 9)
!2176 = !DILocation(line: 204, column: 9, scope: !2170)
!2177 = !DILocation(line: 205, column: 7, scope: !2178)
!2178 = distinct !DILexicalBlock(scope: !2175, file: !294, line: 204, column: 14)
!2179 = !DILocation(line: 205, column: 13, scope: !2178)
!2180 = !DILocation(line: 206, column: 7, scope: !2178)
!2181 = !DILocation(line: 207, column: 16, scope: !2182)
!2182 = distinct !DILexicalBlock(scope: !2175, file: !294, line: 207, column: 16)
!2183 = !DILocation(line: 207, column: 20, scope: !2182)
!2184 = !DILocation(line: 207, column: 16, scope: !2175)
!2185 = !DILocation(line: 208, column: 7, scope: !2186)
!2186 = distinct !DILexicalBlock(scope: !2182, file: !294, line: 207, column: 27)
!2187 = !DILocation(line: 209, column: 7, scope: !2186)
!2188 = !DILocation(line: 209, column: 13, scope: !2186)
!2189 = !DILocation(line: 210, column: 7, scope: !2186)
!2190 = !DILocation(line: 212, column: 14, scope: !2170)
!2191 = !DILocation(line: 212, column: 18, scope: !2170)
!2192 = !DILocation(line: 212, column: 12, scope: !2170)
!2193 = !DILocation(line: 213, column: 3, scope: !2170)
!2194 = !DILocation(line: 215, column: 22, scope: !2195)
!2195 = distinct !DILexicalBlock(scope: !2150, file: !294, line: 215, column: 7)
!2196 = !DILocation(line: 215, column: 7, scope: !2195)
!2197 = !DILocation(line: 215, column: 7, scope: !2150)
!2198 = !DILocation(line: 217, column: 22, scope: !2199)
!2199 = distinct !DILexicalBlock(scope: !2195, file: !294, line: 215, column: 33)
!2200 = !DILocation(line: 217, column: 32, scope: !2199)
!2201 = !DILocation(line: 217, column: 39, scope: !2199)
!2202 = !DILocation(line: 217, column: 12, scope: !2199)
!2203 = !DILocation(line: 217, column: 5, scope: !2199)
!2204 = !DILocation(line: 220, column: 11, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2150, file: !294, line: 220, column: 3)
!2206 = !DILocation(line: 220, column: 8, scope: !2205)
!2207 = !DILocation(line: 220, column: 16, scope: !2208)
!2208 = distinct !DILexicalBlock(scope: !2205, file: !294, line: 220, column: 3)
!2209 = !DILocation(line: 220, column: 19, scope: !2208)
!2210 = !DILocation(line: 220, column: 3, scope: !2205)
!2211 = !DILocation(line: 221, column: 25, scope: !2212)
!2212 = distinct !DILexicalBlock(scope: !2208, file: !294, line: 221, column: 9)
!2213 = !DILocation(line: 221, column: 11, scope: !2212)
!2214 = !DILocation(line: 221, column: 29, scope: !2212)
!2215 = !DILocation(line: 221, column: 35, scope: !2212)
!2216 = !DILocation(line: 221, column: 9, scope: !2208)
!2217 = !DILocation(line: 220, column: 30, scope: !2208)
!2218 = !DILocation(line: 220, column: 3, scope: !2208)
!2219 = distinct !{!2219, !2210, !2220}
!2220 = !DILocation(line: 222, column: 7, scope: !2205)
!2221 = !DILocation(line: 223, column: 7, scope: !2222)
!2222 = distinct !DILexicalBlock(scope: !2150, file: !294, line: 223, column: 7)
!2223 = !DILocation(line: 223, column: 10, scope: !2222)
!2224 = !DILocation(line: 223, column: 7, scope: !2150)
!2225 = !DILocation(line: 224, column: 5, scope: !2226)
!2226 = distinct !DILexicalBlock(scope: !2222, file: !294, line: 223, column: 22)
!2227 = !DILocation(line: 224, column: 11, scope: !2226)
!2228 = !DILocation(line: 225, column: 5, scope: !2226)
!2229 = !DILocation(line: 228, column: 22, scope: !2150)
!2230 = !DILocation(line: 228, column: 8, scope: !2150)
!2231 = !DILocation(line: 228, column: 5, scope: !2150)
!2232 = !DILocation(line: 231, column: 10, scope: !2150)
!2233 = !DILocation(line: 231, column: 3, scope: !2150)
!2234 = !DILocalVariable(name: "os_fd", scope: !2150, file: !294, line: 233, type: !237)
!2235 = !DILocation(line: 233, column: 7, scope: !2150)
!2236 = !DILocation(line: 233, column: 42, scope: !2150)
!2237 = !DILocation(line: 233, column: 36, scope: !2150)
!2238 = !DILocation(line: 233, column: 70, scope: !2150)
!2239 = !DILocation(line: 233, column: 50, scope: !2150)
!2240 = !DILocation(line: 233, column: 87, scope: !2150)
!2241 = !DILocation(line: 233, column: 81, scope: !2150)
!2242 = !DILocation(line: 233, column: 94, scope: !2150)
!2243 = !DILocation(line: 233, column: 15, scope: !2150)
!2244 = !DILocation(line: 234, column: 7, scope: !2245)
!2245 = distinct !DILexicalBlock(scope: !2150, file: !294, line: 234, column: 7)
!2246 = !DILocation(line: 234, column: 13, scope: !2245)
!2247 = !DILocation(line: 234, column: 7, scope: !2150)
!2248 = !DILocation(line: 235, column: 5, scope: !2245)
!2249 = !DILocation(line: 237, column: 11, scope: !2150)
!2250 = !DILocation(line: 237, column: 3, scope: !2150)
!2251 = !DILocation(line: 237, column: 6, scope: !2150)
!2252 = !DILocation(line: 237, column: 9, scope: !2150)
!2253 = !DILocation(line: 238, column: 3, scope: !2150)
!2254 = !DILocation(line: 238, column: 6, scope: !2150)
!2255 = !DILocation(line: 238, column: 12, scope: !2150)
!2256 = !DILocation(line: 239, column: 8, scope: !2257)
!2257 = distinct !DILexicalBlock(scope: !2150, file: !294, line: 239, column: 7)
!2258 = !DILocation(line: 239, column: 14, scope: !2257)
!2259 = !DILocation(line: 239, column: 27, scope: !2257)
!2260 = !DILocation(line: 239, column: 7, scope: !2150)
!2261 = !DILocation(line: 240, column: 5, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2257, file: !294, line: 239, column: 40)
!2263 = !DILocation(line: 240, column: 8, scope: !2262)
!2264 = !DILocation(line: 240, column: 14, scope: !2262)
!2265 = !DILocation(line: 241, column: 3, scope: !2262)
!2266 = !DILocation(line: 241, column: 15, scope: !2267)
!2267 = distinct !DILexicalBlock(scope: !2257, file: !294, line: 241, column: 14)
!2268 = !DILocation(line: 241, column: 21, scope: !2267)
!2269 = !DILocation(line: 241, column: 34, scope: !2267)
!2270 = !DILocation(line: 241, column: 14, scope: !2257)
!2271 = !DILocation(line: 242, column: 5, scope: !2272)
!2272 = distinct !DILexicalBlock(scope: !2267, file: !294, line: 241, column: 47)
!2273 = !DILocation(line: 242, column: 8, scope: !2272)
!2274 = !DILocation(line: 242, column: 14, scope: !2272)
!2275 = !DILocation(line: 243, column: 3, scope: !2272)
!2276 = !DILocation(line: 244, column: 5, scope: !2277)
!2277 = distinct !DILexicalBlock(scope: !2267, file: !294, line: 243, column: 10)
!2278 = !DILocation(line: 244, column: 8, scope: !2277)
!2279 = !DILocation(line: 244, column: 14, scope: !2277)
!2280 = !DILocation(line: 247, column: 10, scope: !2150)
!2281 = !DILocation(line: 247, column: 3, scope: !2150)
!2282 = !DILocation(line: 248, column: 1, scope: !2150)
!2283 = distinct !DISubprogram(name: "__get_file", scope: !294, file: !294, line: 80, type: !2284, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !310, retainedNodes: !381)
!2284 = !DISubroutineType(types: !2285)
!2285 = !{!1935, !237}
!2286 = !DILocalVariable(name: "fd", arg: 1, scope: !2283, file: !294, line: 80, type: !237)
!2287 = !DILocation(line: 80, column: 35, scope: !2283)
!2288 = !DILocation(line: 81, column: 7, scope: !2289)
!2289 = distinct !DILexicalBlock(scope: !2283, file: !294, line: 81, column: 7)
!2290 = !DILocation(line: 81, column: 9, scope: !2289)
!2291 = !DILocation(line: 81, column: 13, scope: !2289)
!2292 = !DILocalVariable(name: "f", scope: !2293, file: !294, line: 82, type: !1935)
!2293 = distinct !DILexicalBlock(scope: !2289, file: !294, line: 81, column: 28)
!2294 = !DILocation(line: 82, column: 17, scope: !2293)
!2295 = !DILocation(line: 82, column: 36, scope: !2293)
!2296 = !DILocation(line: 82, column: 22, scope: !2293)
!2297 = !DILocation(line: 83, column: 9, scope: !2298)
!2298 = distinct !DILexicalBlock(scope: !2293, file: !294, line: 83, column: 9)
!2299 = !DILocation(line: 83, column: 12, scope: !2298)
!2300 = !DILocation(line: 83, column: 18, scope: !2298)
!2301 = !DILocation(line: 83, column: 9, scope: !2293)
!2302 = !DILocation(line: 84, column: 14, scope: !2298)
!2303 = !DILocation(line: 84, column: 7, scope: !2298)
!2304 = !DILocation(line: 87, column: 3, scope: !2283)
!2305 = !DILocation(line: 88, column: 1, scope: !2283)
!2306 = distinct !DISubprogram(name: "utimes", scope: !294, file: !294, line: 251, type: !2307, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!2307 = !DISubroutineType(types: !2308)
!2308 = !{!237, !433, !2309}
!2309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2310, size: 64)
!2310 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2311)
!2311 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !2312, line: 8, size: 128, elements: !2313)
!2312 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "", checksumkind: CSK_MD5, checksum: "9b45d950050c215f216850b27bd1e8f3")
!2313 = !{!2314, !2315}
!2314 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !2311, file: !2312, line: 14, baseType: !251, size: 64)
!2315 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !2311, file: !2312, line: 15, baseType: !2316, size: 64, offset: 64)
!2316 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !224, line: 162, baseType: !241)
!2317 = !DILocalVariable(name: "path", arg: 1, scope: !2306, file: !294, line: 251, type: !433)
!2318 = !DILocation(line: 251, column: 24, scope: !2306)
!2319 = !DILocalVariable(name: "times", arg: 2, scope: !2306, file: !294, line: 251, type: !2309)
!2320 = !DILocation(line: 251, column: 51, scope: !2306)
!2321 = !DILocalVariable(name: "dfile", scope: !2306, file: !294, line: 252, type: !1593)
!2322 = !DILocation(line: 252, column: 20, scope: !2306)
!2323 = !DILocation(line: 252, column: 43, scope: !2306)
!2324 = !DILocation(line: 252, column: 28, scope: !2306)
!2325 = !DILocation(line: 254, column: 7, scope: !2326)
!2326 = distinct !DILexicalBlock(scope: !2306, file: !294, line: 254, column: 7)
!2327 = !DILocation(line: 254, column: 7, scope: !2306)
!2328 = !DILocation(line: 256, column: 10, scope: !2329)
!2329 = distinct !DILexicalBlock(scope: !2330, file: !294, line: 256, column: 9)
!2330 = distinct !DILexicalBlock(scope: !2326, file: !294, line: 254, column: 14)
!2331 = !DILocation(line: 256, column: 9, scope: !2330)
!2332 = !DILocalVariable(name: "newTimes", scope: !2333, file: !294, line: 257, type: !2334)
!2333 = distinct !DILexicalBlock(scope: !2329, file: !294, line: 256, column: 17)
!2334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2311, size: 256, elements: !143)
!2335 = !DILocation(line: 257, column: 22, scope: !2333)
!2336 = !DILocation(line: 258, column: 22, scope: !2333)
!2337 = !DILocation(line: 258, column: 7, scope: !2333)
!2338 = !DILocation(line: 259, column: 7, scope: !2333)
!2339 = !DILocation(line: 259, column: 21, scope: !2333)
!2340 = !DILocation(line: 260, column: 15, scope: !2333)
!2341 = !DILocation(line: 260, column: 13, scope: !2333)
!2342 = !DILocation(line: 261, column: 5, scope: !2333)
!2343 = !DILocation(line: 264, column: 29, scope: !2330)
!2344 = !DILocation(line: 264, column: 38, scope: !2330)
!2345 = !DILocation(line: 264, column: 5, scope: !2330)
!2346 = !DILocation(line: 264, column: 12, scope: !2330)
!2347 = !DILocation(line: 264, column: 18, scope: !2330)
!2348 = !DILocation(line: 264, column: 27, scope: !2330)
!2349 = !DILocation(line: 265, column: 29, scope: !2330)
!2350 = !DILocation(line: 265, column: 38, scope: !2330)
!2351 = !DILocation(line: 265, column: 5, scope: !2330)
!2352 = !DILocation(line: 265, column: 12, scope: !2330)
!2353 = !DILocation(line: 265, column: 18, scope: !2330)
!2354 = !DILocation(line: 265, column: 27, scope: !2330)
!2355 = !DILocation(line: 270, column: 5, scope: !2330)
!2356 = !DILocation(line: 272, column: 51, scope: !2306)
!2357 = !DILocation(line: 272, column: 31, scope: !2306)
!2358 = !DILocation(line: 272, column: 58, scope: !2306)
!2359 = !DILocation(line: 272, column: 10, scope: !2306)
!2360 = !DILocation(line: 272, column: 3, scope: !2306)
!2361 = !DILocation(line: 273, column: 1, scope: !2306)
!2362 = distinct !DISubprogram(name: "futimesat", scope: !294, file: !294, line: 276, type: !2363, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!2363 = !DISubroutineType(types: !2364)
!2364 = !{!237, !237, !433, !2309}
!2365 = !DILocalVariable(name: "fd", arg: 1, scope: !2362, file: !294, line: 276, type: !237)
!2366 = !DILocation(line: 276, column: 19, scope: !2362)
!2367 = !DILocalVariable(name: "path", arg: 2, scope: !2362, file: !294, line: 276, type: !433)
!2368 = !DILocation(line: 276, column: 35, scope: !2362)
!2369 = !DILocalVariable(name: "times", arg: 3, scope: !2362, file: !294, line: 276, type: !2309)
!2370 = !DILocation(line: 276, column: 62, scope: !2362)
!2371 = !DILocation(line: 277, column: 7, scope: !2372)
!2372 = distinct !DILexicalBlock(scope: !2362, file: !294, line: 277, column: 7)
!2373 = !DILocation(line: 277, column: 10, scope: !2372)
!2374 = !DILocation(line: 277, column: 7, scope: !2362)
!2375 = !DILocalVariable(name: "f", scope: !2376, file: !294, line: 278, type: !1935)
!2376 = distinct !DILexicalBlock(scope: !2372, file: !294, line: 277, column: 23)
!2377 = !DILocation(line: 278, column: 17, scope: !2376)
!2378 = !DILocation(line: 278, column: 32, scope: !2376)
!2379 = !DILocation(line: 278, column: 21, scope: !2376)
!2380 = !DILocation(line: 280, column: 10, scope: !2381)
!2381 = distinct !DILexicalBlock(scope: !2376, file: !294, line: 280, column: 9)
!2382 = !DILocation(line: 280, column: 9, scope: !2376)
!2383 = !DILocation(line: 281, column: 7, scope: !2384)
!2384 = distinct !DILexicalBlock(scope: !2381, file: !294, line: 280, column: 13)
!2385 = !DILocation(line: 281, column: 13, scope: !2384)
!2386 = !DILocation(line: 282, column: 7, scope: !2384)
!2387 = !DILocation(line: 283, column: 16, scope: !2388)
!2388 = distinct !DILexicalBlock(scope: !2381, file: !294, line: 283, column: 16)
!2389 = !DILocation(line: 283, column: 19, scope: !2388)
!2390 = !DILocation(line: 283, column: 16, scope: !2381)
!2391 = !DILocation(line: 284, column: 7, scope: !2392)
!2392 = distinct !DILexicalBlock(scope: !2388, file: !294, line: 283, column: 26)
!2393 = !DILocation(line: 285, column: 7, scope: !2392)
!2394 = !DILocation(line: 285, column: 13, scope: !2392)
!2395 = !DILocation(line: 286, column: 7, scope: !2392)
!2396 = !DILocation(line: 288, column: 10, scope: !2376)
!2397 = !DILocation(line: 288, column: 13, scope: !2376)
!2398 = !DILocation(line: 288, column: 8, scope: !2376)
!2399 = !DILocation(line: 289, column: 3, scope: !2376)
!2400 = !DILocation(line: 290, column: 22, scope: !2401)
!2401 = distinct !DILexicalBlock(scope: !2362, file: !294, line: 290, column: 7)
!2402 = !DILocation(line: 290, column: 7, scope: !2401)
!2403 = !DILocation(line: 290, column: 7, scope: !2362)
!2404 = !DILocation(line: 291, column: 19, scope: !2405)
!2405 = distinct !DILexicalBlock(scope: !2401, file: !294, line: 290, column: 29)
!2406 = !DILocation(line: 291, column: 25, scope: !2405)
!2407 = !DILocation(line: 291, column: 12, scope: !2405)
!2408 = !DILocation(line: 291, column: 5, scope: !2405)
!2409 = !DILocation(line: 294, column: 40, scope: !2362)
!2410 = !DILocation(line: 294, column: 34, scope: !2362)
!2411 = !DILocation(line: 295, column: 19, scope: !2362)
!2412 = !DILocation(line: 295, column: 46, scope: !2362)
!2413 = !DILocation(line: 295, column: 26, scope: !2362)
!2414 = !DILocation(line: 295, column: 61, scope: !2362)
!2415 = !DILocation(line: 294, column: 10, scope: !2362)
!2416 = !DILocation(line: 294, column: 3, scope: !2362)
!2417 = !DILocation(line: 296, column: 1, scope: !2362)
!2418 = !DILocalVariable(name: "fd", arg: 1, scope: !307, file: !294, line: 298, type: !237)
!2419 = !DILocation(line: 298, column: 15, scope: !307)
!2420 = !DILocalVariable(name: "f", scope: !307, file: !294, line: 300, type: !1935)
!2421 = !DILocation(line: 300, column: 15, scope: !307)
!2422 = !DILocalVariable(name: "r", scope: !307, file: !294, line: 301, type: !237)
!2423 = !DILocation(line: 301, column: 7, scope: !307)
!2424 = !DILocation(line: 303, column: 10, scope: !307)
!2425 = !DILocation(line: 305, column: 18, scope: !307)
!2426 = !DILocation(line: 305, column: 7, scope: !307)
!2427 = !DILocation(line: 305, column: 5, scope: !307)
!2428 = !DILocation(line: 306, column: 8, scope: !2429)
!2429 = distinct !DILexicalBlock(scope: !307, file: !294, line: 306, column: 7)
!2430 = !DILocation(line: 306, column: 7, scope: !307)
!2431 = !DILocation(line: 307, column: 5, scope: !2432)
!2432 = distinct !DILexicalBlock(scope: !2429, file: !294, line: 306, column: 11)
!2433 = !DILocation(line: 307, column: 11, scope: !2432)
!2434 = !DILocation(line: 308, column: 5, scope: !2432)
!2435 = !DILocation(line: 311, column: 16, scope: !2436)
!2436 = distinct !DILexicalBlock(scope: !307, file: !294, line: 311, column: 7)
!2437 = !DILocation(line: 311, column: 7, scope: !2436)
!2438 = !DILocation(line: 311, column: 29, scope: !2436)
!2439 = !DILocation(line: 311, column: 42, scope: !2436)
!2440 = !DILocation(line: 311, column: 32, scope: !2436)
!2441 = !DILocation(line: 311, column: 56, scope: !2436)
!2442 = !DILocation(line: 311, column: 53, scope: !2436)
!2443 = !DILocation(line: 311, column: 7, scope: !307)
!2444 = !DILocation(line: 312, column: 26, scope: !2445)
!2445 = distinct !DILexicalBlock(scope: !2436, file: !294, line: 311, column: 65)
!2446 = !DILocation(line: 313, column: 5, scope: !2445)
!2447 = !DILocation(line: 313, column: 11, scope: !2445)
!2448 = !DILocation(line: 314, column: 5, scope: !2445)
!2449 = !DILocation(line: 325, column: 10, scope: !307)
!2450 = !DILocation(line: 325, column: 3, scope: !307)
!2451 = !DILocation(line: 327, column: 10, scope: !307)
!2452 = !DILocation(line: 327, column: 3, scope: !307)
!2453 = !DILocation(line: 328, column: 1, scope: !307)
!2454 = !DILocalVariable(name: "fd", arg: 1, scope: !374, file: !294, line: 330, type: !237)
!2455 = !DILocation(line: 330, column: 18, scope: !374)
!2456 = !DILocalVariable(name: "buf", arg: 2, scope: !374, file: !294, line: 330, type: !332)
!2457 = !DILocation(line: 330, column: 28, scope: !374)
!2458 = !DILocalVariable(name: "count", arg: 3, scope: !374, file: !294, line: 330, type: !379)
!2459 = !DILocation(line: 330, column: 40, scope: !374)
!2460 = !DILocalVariable(name: "f", scope: !374, file: !294, line: 332, type: !1935)
!2461 = !DILocation(line: 332, column: 15, scope: !374)
!2462 = !DILocation(line: 334, column: 10, scope: !374)
!2463 = !DILocation(line: 336, column: 7, scope: !2464)
!2464 = distinct !DILexicalBlock(scope: !374, file: !294, line: 336, column: 7)
!2465 = !DILocation(line: 336, column: 13, scope: !2464)
!2466 = !DILocation(line: 336, column: 7, scope: !374)
!2467 = !DILocation(line: 337, column: 5, scope: !2464)
!2468 = !DILocation(line: 339, column: 7, scope: !2469)
!2469 = distinct !DILexicalBlock(scope: !374, file: !294, line: 339, column: 7)
!2470 = !DILocation(line: 339, column: 11, scope: !2469)
!2471 = !DILocation(line: 339, column: 7, scope: !374)
!2472 = !DILocation(line: 340, column: 5, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2469, file: !294, line: 339, column: 20)
!2474 = !DILocation(line: 340, column: 11, scope: !2473)
!2475 = !DILocation(line: 341, column: 5, scope: !2473)
!2476 = !DILocation(line: 344, column: 18, scope: !374)
!2477 = !DILocation(line: 344, column: 7, scope: !374)
!2478 = !DILocation(line: 344, column: 5, scope: !374)
!2479 = !DILocation(line: 346, column: 8, scope: !2480)
!2480 = distinct !DILexicalBlock(scope: !374, file: !294, line: 346, column: 7)
!2481 = !DILocation(line: 346, column: 7, scope: !374)
!2482 = !DILocation(line: 347, column: 5, scope: !2483)
!2483 = distinct !DILexicalBlock(scope: !2480, file: !294, line: 346, column: 11)
!2484 = !DILocation(line: 347, column: 11, scope: !2483)
!2485 = !DILocation(line: 348, column: 5, scope: !2483)
!2486 = !DILocation(line: 351, column: 16, scope: !2487)
!2487 = distinct !DILexicalBlock(scope: !374, file: !294, line: 351, column: 7)
!2488 = !DILocation(line: 351, column: 7, scope: !2487)
!2489 = !DILocation(line: 351, column: 29, scope: !2487)
!2490 = !DILocation(line: 351, column: 42, scope: !2487)
!2491 = !DILocation(line: 351, column: 32, scope: !2487)
!2492 = !DILocation(line: 351, column: 55, scope: !2487)
!2493 = !DILocation(line: 351, column: 52, scope: !2487)
!2494 = !DILocation(line: 351, column: 7, scope: !374)
!2495 = !DILocation(line: 352, column: 26, scope: !2496)
!2496 = distinct !DILexicalBlock(scope: !2487, file: !294, line: 351, column: 64)
!2497 = !DILocation(line: 353, column: 5, scope: !2496)
!2498 = !DILocation(line: 353, column: 11, scope: !2496)
!2499 = !DILocation(line: 354, column: 5, scope: !2496)
!2500 = !DILocation(line: 357, column: 8, scope: !2501)
!2501 = distinct !DILexicalBlock(scope: !374, file: !294, line: 357, column: 7)
!2502 = !DILocation(line: 357, column: 11, scope: !2501)
!2503 = !DILocation(line: 357, column: 7, scope: !374)
!2504 = !DILocalVariable(name: "r", scope: !2505, file: !294, line: 359, type: !237)
!2505 = distinct !DILexicalBlock(scope: !2501, file: !294, line: 357, column: 18)
!2506 = !DILocation(line: 359, column: 9, scope: !2505)
!2507 = !DILocation(line: 360, column: 28, scope: !2505)
!2508 = !DILocation(line: 360, column: 11, scope: !2505)
!2509 = !DILocation(line: 360, column: 9, scope: !2505)
!2510 = !DILocation(line: 361, column: 31, scope: !2505)
!2511 = !DILocation(line: 361, column: 13, scope: !2505)
!2512 = !DILocation(line: 361, column: 11, scope: !2505)
!2513 = !DILocation(line: 365, column: 30, scope: !2505)
!2514 = !DILocation(line: 365, column: 35, scope: !2505)
!2515 = !DILocation(line: 365, column: 5, scope: !2505)
!2516 = !DILocation(line: 366, column: 9, scope: !2517)
!2517 = distinct !DILexicalBlock(scope: !2505, file: !294, line: 366, column: 9)
!2518 = !DILocation(line: 366, column: 12, scope: !2517)
!2519 = !DILocation(line: 366, column: 15, scope: !2517)
!2520 = !DILocation(line: 366, column: 9, scope: !2505)
!2521 = !DILocation(line: 367, column: 30, scope: !2517)
!2522 = !DILocation(line: 367, column: 33, scope: !2517)
!2523 = !DILocation(line: 367, column: 37, scope: !2517)
!2524 = !DILocation(line: 367, column: 42, scope: !2517)
!2525 = !DILocation(line: 367, column: 11, scope: !2517)
!2526 = !DILocation(line: 367, column: 9, scope: !2517)
!2527 = !DILocation(line: 367, column: 7, scope: !2517)
!2528 = !DILocation(line: 369, column: 33, scope: !2517)
!2529 = !DILocation(line: 369, column: 36, scope: !2517)
!2530 = !DILocation(line: 369, column: 40, scope: !2517)
!2531 = !DILocation(line: 369, column: 45, scope: !2517)
!2532 = !DILocation(line: 369, column: 62, scope: !2517)
!2533 = !DILocation(line: 369, column: 65, scope: !2517)
!2534 = !DILocation(line: 369, column: 11, scope: !2517)
!2535 = !DILocation(line: 369, column: 9, scope: !2517)
!2536 = !DILocation(line: 371, column: 9, scope: !2537)
!2537 = distinct !DILexicalBlock(scope: !2505, file: !294, line: 371, column: 9)
!2538 = !DILocation(line: 371, column: 11, scope: !2537)
!2539 = !DILocation(line: 371, column: 9, scope: !2505)
!2540 = !DILocation(line: 372, column: 7, scope: !2537)
!2541 = !DILocation(line: 374, column: 9, scope: !2542)
!2542 = distinct !DILexicalBlock(scope: !2505, file: !294, line: 374, column: 9)
!2543 = !DILocation(line: 374, column: 12, scope: !2542)
!2544 = !DILocation(line: 374, column: 15, scope: !2542)
!2545 = !DILocation(line: 374, column: 9, scope: !2505)
!2546 = !DILocation(line: 375, column: 17, scope: !2542)
!2547 = !DILocation(line: 375, column: 7, scope: !2542)
!2548 = !DILocation(line: 375, column: 10, scope: !2542)
!2549 = !DILocation(line: 375, column: 14, scope: !2542)
!2550 = !DILocation(line: 376, column: 12, scope: !2505)
!2551 = !DILocation(line: 376, column: 5, scope: !2505)
!2552 = !DILocation(line: 379, column: 5, scope: !2553)
!2553 = distinct !DILexicalBlock(scope: !2554, file: !294, line: 379, column: 5)
!2554 = distinct !DILexicalBlock(scope: !2555, file: !294, line: 379, column: 5)
!2555 = distinct !DILexicalBlock(scope: !2501, file: !294, line: 378, column: 8)
!2556 = !DILocation(line: 379, column: 5, scope: !2554)
!2557 = !DILocation(line: 380, column: 19, scope: !2558)
!2558 = distinct !DILexicalBlock(scope: !2555, file: !294, line: 380, column: 9)
!2559 = !DILocation(line: 380, column: 22, scope: !2558)
!2560 = !DILocation(line: 380, column: 29, scope: !2558)
!2561 = !DILocation(line: 380, column: 10, scope: !2558)
!2562 = !DILocation(line: 380, column: 37, scope: !2558)
!2563 = !DILocation(line: 380, column: 40, scope: !2558)
!2564 = !DILocation(line: 380, column: 35, scope: !2558)
!2565 = !DILocation(line: 380, column: 9, scope: !2555)
!2566 = !DILocation(line: 381, column: 7, scope: !2558)
!2567 = !DILocation(line: 384, column: 9, scope: !2568)
!2568 = distinct !DILexicalBlock(scope: !2555, file: !294, line: 384, column: 9)
!2569 = !DILocation(line: 384, column: 12, scope: !2568)
!2570 = !DILocation(line: 384, column: 18, scope: !2568)
!2571 = !DILocation(line: 384, column: 16, scope: !2568)
!2572 = !DILocation(line: 384, column: 26, scope: !2568)
!2573 = !DILocation(line: 384, column: 29, scope: !2568)
!2574 = !DILocation(line: 384, column: 36, scope: !2568)
!2575 = !DILocation(line: 384, column: 24, scope: !2568)
!2576 = !DILocation(line: 384, column: 9, scope: !2555)
!2577 = !DILocation(line: 385, column: 15, scope: !2578)
!2578 = distinct !DILexicalBlock(scope: !2568, file: !294, line: 384, column: 42)
!2579 = !DILocation(line: 385, column: 18, scope: !2578)
!2580 = !DILocation(line: 385, column: 25, scope: !2578)
!2581 = !DILocation(line: 385, column: 32, scope: !2578)
!2582 = !DILocation(line: 385, column: 35, scope: !2578)
!2583 = !DILocation(line: 385, column: 30, scope: !2578)
!2584 = !DILocation(line: 385, column: 13, scope: !2578)
!2585 = !DILocation(line: 386, column: 5, scope: !2578)
!2586 = !DILocation(line: 388, column: 12, scope: !2555)
!2587 = !DILocation(line: 388, column: 17, scope: !2555)
!2588 = !DILocation(line: 388, column: 20, scope: !2555)
!2589 = !DILocation(line: 388, column: 27, scope: !2555)
!2590 = !DILocation(line: 388, column: 38, scope: !2555)
!2591 = !DILocation(line: 388, column: 41, scope: !2555)
!2592 = !DILocation(line: 388, column: 36, scope: !2555)
!2593 = !DILocation(line: 388, column: 46, scope: !2555)
!2594 = !DILocation(line: 388, column: 5, scope: !2555)
!2595 = !DILocation(line: 389, column: 15, scope: !2555)
!2596 = !DILocation(line: 389, column: 5, scope: !2555)
!2597 = !DILocation(line: 389, column: 8, scope: !2555)
!2598 = !DILocation(line: 389, column: 12, scope: !2555)
!2599 = !DILocation(line: 391, column: 12, scope: !2555)
!2600 = !DILocation(line: 391, column: 5, scope: !2555)
!2601 = !DILocation(line: 393, column: 1, scope: !374)
!2602 = !DILocalVariable(name: "fd", arg: 1, scope: !396, file: !294, line: 396, type: !237)
!2603 = !DILocation(line: 396, column: 19, scope: !396)
!2604 = !DILocalVariable(name: "buf", arg: 2, scope: !396, file: !294, line: 396, type: !399)
!2605 = !DILocation(line: 396, column: 35, scope: !396)
!2606 = !DILocalVariable(name: "count", arg: 3, scope: !396, file: !294, line: 396, type: !379)
!2607 = !DILocation(line: 396, column: 47, scope: !396)
!2608 = !DILocalVariable(name: "f", scope: !396, file: !294, line: 398, type: !1935)
!2609 = !DILocation(line: 398, column: 15, scope: !396)
!2610 = !DILocation(line: 400, column: 10, scope: !396)
!2611 = !DILocation(line: 402, column: 18, scope: !396)
!2612 = !DILocation(line: 402, column: 7, scope: !396)
!2613 = !DILocation(line: 402, column: 5, scope: !396)
!2614 = !DILocation(line: 404, column: 8, scope: !2615)
!2615 = distinct !DILexicalBlock(scope: !396, file: !294, line: 404, column: 7)
!2616 = !DILocation(line: 404, column: 7, scope: !396)
!2617 = !DILocation(line: 405, column: 5, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2615, file: !294, line: 404, column: 11)
!2619 = !DILocation(line: 405, column: 11, scope: !2618)
!2620 = !DILocation(line: 406, column: 5, scope: !2618)
!2621 = !DILocation(line: 409, column: 16, scope: !2622)
!2622 = distinct !DILexicalBlock(scope: !396, file: !294, line: 409, column: 7)
!2623 = !DILocation(line: 409, column: 7, scope: !2622)
!2624 = !DILocation(line: 409, column: 29, scope: !2622)
!2625 = !DILocation(line: 409, column: 42, scope: !2622)
!2626 = !DILocation(line: 409, column: 32, scope: !2622)
!2627 = !DILocation(line: 409, column: 56, scope: !2622)
!2628 = !DILocation(line: 409, column: 53, scope: !2622)
!2629 = !DILocation(line: 409, column: 7, scope: !396)
!2630 = !DILocation(line: 410, column: 26, scope: !2631)
!2631 = distinct !DILexicalBlock(scope: !2622, file: !294, line: 409, column: 65)
!2632 = !DILocation(line: 411, column: 5, scope: !2631)
!2633 = !DILocation(line: 411, column: 11, scope: !2631)
!2634 = !DILocation(line: 412, column: 5, scope: !2631)
!2635 = !DILocation(line: 415, column: 8, scope: !2636)
!2636 = distinct !DILexicalBlock(scope: !396, file: !294, line: 415, column: 7)
!2637 = !DILocation(line: 415, column: 11, scope: !2636)
!2638 = !DILocation(line: 415, column: 7, scope: !396)
!2639 = !DILocalVariable(name: "r", scope: !2640, file: !294, line: 416, type: !237)
!2640 = distinct !DILexicalBlock(scope: !2636, file: !294, line: 415, column: 18)
!2641 = !DILocation(line: 416, column: 9, scope: !2640)
!2642 = !DILocation(line: 418, column: 28, scope: !2640)
!2643 = !DILocation(line: 418, column: 11, scope: !2640)
!2644 = !DILocation(line: 418, column: 9, scope: !2640)
!2645 = !DILocation(line: 419, column: 31, scope: !2640)
!2646 = !DILocation(line: 419, column: 13, scope: !2640)
!2647 = !DILocation(line: 419, column: 11, scope: !2640)
!2648 = !DILocation(line: 423, column: 30, scope: !2640)
!2649 = !DILocation(line: 423, column: 35, scope: !2640)
!2650 = !DILocation(line: 423, column: 5, scope: !2640)
!2651 = !DILocation(line: 424, column: 9, scope: !2652)
!2652 = distinct !DILexicalBlock(scope: !2640, file: !294, line: 424, column: 9)
!2653 = !DILocation(line: 424, column: 12, scope: !2652)
!2654 = !DILocation(line: 424, column: 15, scope: !2652)
!2655 = !DILocation(line: 424, column: 20, scope: !2652)
!2656 = !DILocation(line: 424, column: 23, scope: !2652)
!2657 = !DILocation(line: 424, column: 26, scope: !2652)
!2658 = !DILocation(line: 424, column: 29, scope: !2652)
!2659 = !DILocation(line: 424, column: 9, scope: !2640)
!2660 = !DILocation(line: 425, column: 31, scope: !2652)
!2661 = !DILocation(line: 425, column: 34, scope: !2652)
!2662 = !DILocation(line: 425, column: 38, scope: !2652)
!2663 = !DILocation(line: 425, column: 43, scope: !2652)
!2664 = !DILocation(line: 425, column: 11, scope: !2652)
!2665 = !DILocation(line: 425, column: 9, scope: !2652)
!2666 = !DILocation(line: 425, column: 7, scope: !2652)
!2667 = !DILocation(line: 426, column: 37, scope: !2652)
!2668 = !DILocation(line: 426, column: 40, scope: !2652)
!2669 = !DILocation(line: 426, column: 44, scope: !2652)
!2670 = !DILocation(line: 426, column: 49, scope: !2652)
!2671 = !DILocation(line: 426, column: 66, scope: !2652)
!2672 = !DILocation(line: 426, column: 69, scope: !2652)
!2673 = !DILocation(line: 426, column: 14, scope: !2652)
!2674 = !DILocation(line: 426, column: 12, scope: !2652)
!2675 = !DILocation(line: 428, column: 9, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2640, file: !294, line: 428, column: 9)
!2677 = !DILocation(line: 428, column: 11, scope: !2676)
!2678 = !DILocation(line: 428, column: 9, scope: !2640)
!2679 = !DILocation(line: 429, column: 7, scope: !2676)
!2680 = !DILocation(line: 431, column: 5, scope: !2681)
!2681 = distinct !DILexicalBlock(scope: !2682, file: !294, line: 431, column: 5)
!2682 = distinct !DILexicalBlock(scope: !2640, file: !294, line: 431, column: 5)
!2683 = !DILocation(line: 431, column: 5, scope: !2682)
!2684 = !DILocation(line: 432, column: 9, scope: !2685)
!2685 = distinct !DILexicalBlock(scope: !2640, file: !294, line: 432, column: 9)
!2686 = !DILocation(line: 432, column: 12, scope: !2685)
!2687 = !DILocation(line: 432, column: 15, scope: !2685)
!2688 = !DILocation(line: 432, column: 20, scope: !2685)
!2689 = !DILocation(line: 432, column: 23, scope: !2685)
!2690 = !DILocation(line: 432, column: 26, scope: !2685)
!2691 = !DILocation(line: 432, column: 29, scope: !2685)
!2692 = !DILocation(line: 432, column: 9, scope: !2640)
!2693 = !DILocation(line: 433, column: 17, scope: !2685)
!2694 = !DILocation(line: 433, column: 7, scope: !2685)
!2695 = !DILocation(line: 433, column: 10, scope: !2685)
!2696 = !DILocation(line: 433, column: 14, scope: !2685)
!2697 = !DILocation(line: 435, column: 12, scope: !2640)
!2698 = !DILocation(line: 435, column: 5, scope: !2640)
!2699 = !DILocalVariable(name: "actual_count", scope: !2700, file: !294, line: 439, type: !379)
!2700 = distinct !DILexicalBlock(scope: !2636, file: !294, line: 437, column: 8)
!2701 = !DILocation(line: 439, column: 12, scope: !2700)
!2702 = !DILocation(line: 440, column: 9, scope: !2703)
!2703 = distinct !DILexicalBlock(scope: !2700, file: !294, line: 440, column: 9)
!2704 = !DILocation(line: 440, column: 12, scope: !2703)
!2705 = !DILocation(line: 440, column: 18, scope: !2703)
!2706 = !DILocation(line: 440, column: 16, scope: !2703)
!2707 = !DILocation(line: 440, column: 27, scope: !2703)
!2708 = !DILocation(line: 440, column: 30, scope: !2703)
!2709 = !DILocation(line: 440, column: 37, scope: !2703)
!2710 = !DILocation(line: 440, column: 24, scope: !2703)
!2711 = !DILocation(line: 440, column: 9, scope: !2700)
!2712 = !DILocation(line: 441, column: 22, scope: !2703)
!2713 = !DILocation(line: 441, column: 20, scope: !2703)
!2714 = !DILocation(line: 441, column: 7, scope: !2703)
!2715 = !DILocation(line: 443, column: 21, scope: !2716)
!2716 = distinct !DILexicalBlock(scope: !2717, file: !294, line: 443, column: 11)
!2717 = distinct !DILexicalBlock(scope: !2703, file: !294, line: 442, column: 10)
!2718 = !DILocation(line: 443, column: 11, scope: !2716)
!2719 = !DILocation(line: 443, column: 11, scope: !2717)
!2720 = !DILocation(line: 444, column: 2, scope: !2721)
!2721 = distinct !DILexicalBlock(scope: !2722, file: !294, line: 444, column: 2)
!2722 = distinct !DILexicalBlock(scope: !2716, file: !294, line: 444, column: 2)
!2723 = !DILocation(line: 446, column: 6, scope: !2724)
!2724 = distinct !DILexicalBlock(scope: !2725, file: !294, line: 446, column: 6)
!2725 = distinct !DILexicalBlock(scope: !2716, file: !294, line: 445, column: 12)
!2726 = !DILocation(line: 446, column: 9, scope: !2724)
!2727 = !DILocation(line: 446, column: 25, scope: !2724)
!2728 = !DILocation(line: 446, column: 28, scope: !2724)
!2729 = !DILocation(line: 446, column: 35, scope: !2724)
!2730 = !DILocation(line: 446, column: 15, scope: !2724)
!2731 = !DILocation(line: 446, column: 13, scope: !2724)
!2732 = !DILocation(line: 446, column: 6, scope: !2725)
!2733 = !DILocation(line: 447, column: 19, scope: !2724)
!2734 = !DILocation(line: 447, column: 22, scope: !2724)
!2735 = !DILocation(line: 447, column: 29, scope: !2724)
!2736 = !DILocation(line: 447, column: 36, scope: !2724)
!2737 = !DILocation(line: 447, column: 39, scope: !2724)
!2738 = !DILocation(line: 447, column: 34, scope: !2724)
!2739 = !DILocation(line: 447, column: 17, scope: !2724)
!2740 = !DILocation(line: 447, column: 4, scope: !2724)
!2741 = !DILocation(line: 451, column: 9, scope: !2742)
!2742 = distinct !DILexicalBlock(scope: !2700, file: !294, line: 451, column: 9)
!2743 = !DILocation(line: 451, column: 9, scope: !2700)
!2744 = !DILocation(line: 452, column: 14, scope: !2742)
!2745 = !DILocation(line: 452, column: 17, scope: !2742)
!2746 = !DILocation(line: 452, column: 24, scope: !2742)
!2747 = !DILocation(line: 452, column: 35, scope: !2742)
!2748 = !DILocation(line: 452, column: 38, scope: !2742)
!2749 = !DILocation(line: 452, column: 33, scope: !2742)
!2750 = !DILocation(line: 452, column: 43, scope: !2742)
!2751 = !DILocation(line: 452, column: 48, scope: !2742)
!2752 = !DILocation(line: 452, column: 7, scope: !2742)
!2753 = !DILocation(line: 454, column: 9, scope: !2754)
!2754 = distinct !DILexicalBlock(scope: !2700, file: !294, line: 454, column: 9)
!2755 = !DILocation(line: 454, column: 18, scope: !2754)
!2756 = !DILocation(line: 454, column: 15, scope: !2754)
!2757 = !DILocation(line: 454, column: 9, scope: !2700)
!2758 = !DILocation(line: 455, column: 7, scope: !2754)
!2759 = !DILocation(line: 457, column: 9, scope: !2760)
!2760 = distinct !DILexicalBlock(scope: !2700, file: !294, line: 457, column: 9)
!2761 = !DILocation(line: 457, column: 12, scope: !2760)
!2762 = !DILocation(line: 457, column: 30, scope: !2760)
!2763 = !DILocation(line: 457, column: 18, scope: !2760)
!2764 = !DILocation(line: 457, column: 9, scope: !2700)
!2765 = !DILocation(line: 458, column: 33, scope: !2760)
!2766 = !DILocation(line: 458, column: 30, scope: !2760)
!2767 = !DILocation(line: 458, column: 7, scope: !2760)
!2768 = !DILocation(line: 460, column: 15, scope: !2700)
!2769 = !DILocation(line: 460, column: 5, scope: !2700)
!2770 = !DILocation(line: 460, column: 8, scope: !2700)
!2771 = !DILocation(line: 460, column: 12, scope: !2700)
!2772 = !DILocation(line: 461, column: 12, scope: !2700)
!2773 = !DILocation(line: 461, column: 5, scope: !2700)
!2774 = !DILocation(line: 463, column: 1, scope: !396)
!2775 = distinct !DISubprogram(name: "__fd_lseek", scope: !294, file: !294, line: 466, type: !2776, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!2776 = !DISubroutineType(types: !2777)
!2777 = !{!283, !237, !283, !237}
!2778 = !DILocalVariable(name: "fd", arg: 1, scope: !2775, file: !294, line: 466, type: !237)
!2779 = !DILocation(line: 466, column: 24, scope: !2775)
!2780 = !DILocalVariable(name: "offset", arg: 2, scope: !2775, file: !294, line: 466, type: !283)
!2781 = !DILocation(line: 466, column: 36, scope: !2775)
!2782 = !DILocalVariable(name: "whence", arg: 3, scope: !2775, file: !294, line: 466, type: !237)
!2783 = !DILocation(line: 466, column: 48, scope: !2775)
!2784 = !DILocalVariable(name: "new_off", scope: !2775, file: !294, line: 467, type: !283)
!2785 = !DILocation(line: 467, column: 11, scope: !2775)
!2786 = !DILocalVariable(name: "f", scope: !2775, file: !294, line: 468, type: !1935)
!2787 = !DILocation(line: 468, column: 15, scope: !2775)
!2788 = !DILocation(line: 468, column: 30, scope: !2775)
!2789 = !DILocation(line: 468, column: 19, scope: !2775)
!2790 = !DILocation(line: 470, column: 8, scope: !2791)
!2791 = distinct !DILexicalBlock(scope: !2775, file: !294, line: 470, column: 7)
!2792 = !DILocation(line: 470, column: 7, scope: !2775)
!2793 = !DILocation(line: 471, column: 5, scope: !2794)
!2794 = distinct !DILexicalBlock(scope: !2791, file: !294, line: 470, column: 11)
!2795 = !DILocation(line: 471, column: 11, scope: !2794)
!2796 = !DILocation(line: 472, column: 5, scope: !2794)
!2797 = !DILocation(line: 475, column: 8, scope: !2798)
!2798 = distinct !DILexicalBlock(scope: !2775, file: !294, line: 475, column: 7)
!2799 = !DILocation(line: 475, column: 11, scope: !2798)
!2800 = !DILocation(line: 475, column: 7, scope: !2775)
!2801 = !DILocation(line: 482, column: 9, scope: !2802)
!2802 = distinct !DILexicalBlock(scope: !2803, file: !294, line: 482, column: 9)
!2803 = distinct !DILexicalBlock(scope: !2798, file: !294, line: 475, column: 18)
!2804 = !DILocation(line: 482, column: 16, scope: !2802)
!2805 = !DILocation(line: 482, column: 9, scope: !2803)
!2806 = !DILocation(line: 483, column: 37, scope: !2807)
!2807 = distinct !DILexicalBlock(scope: !2802, file: !294, line: 482, column: 29)
!2808 = !DILocation(line: 483, column: 40, scope: !2807)
!2809 = !DILocation(line: 483, column: 44, scope: !2807)
!2810 = !DILocation(line: 483, column: 17, scope: !2807)
!2811 = !DILocation(line: 483, column: 15, scope: !2807)
!2812 = !DILocation(line: 484, column: 5, scope: !2807)
!2813 = !DILocation(line: 485, column: 37, scope: !2814)
!2814 = distinct !DILexicalBlock(scope: !2802, file: !294, line: 484, column: 12)
!2815 = !DILocation(line: 485, column: 40, scope: !2814)
!2816 = !DILocation(line: 485, column: 44, scope: !2814)
!2817 = !DILocation(line: 485, column: 47, scope: !2814)
!2818 = !DILocation(line: 485, column: 17, scope: !2814)
!2819 = !DILocation(line: 485, column: 15, scope: !2814)
!2820 = !DILocation(line: 489, column: 11, scope: !2821)
!2821 = distinct !DILexicalBlock(scope: !2814, file: !294, line: 489, column: 11)
!2822 = !DILocation(line: 489, column: 19, scope: !2821)
!2823 = !DILocation(line: 489, column: 11, scope: !2814)
!2824 = !DILocation(line: 490, column: 9, scope: !2825)
!2825 = distinct !DILexicalBlock(scope: !2826, file: !294, line: 490, column: 9)
!2826 = distinct !DILexicalBlock(scope: !2827, file: !294, line: 490, column: 9)
!2827 = distinct !DILexicalBlock(scope: !2821, file: !294, line: 489, column: 26)
!2828 = !DILocation(line: 490, column: 9, scope: !2826)
!2829 = !DILocation(line: 491, column: 39, scope: !2827)
!2830 = !DILocation(line: 491, column: 42, scope: !2827)
!2831 = !DILocation(line: 491, column: 46, scope: !2827)
!2832 = !DILocation(line: 491, column: 54, scope: !2827)
!2833 = !DILocation(line: 491, column: 19, scope: !2827)
!2834 = !DILocation(line: 491, column: 17, scope: !2827)
!2835 = !DILocation(line: 492, column: 7, scope: !2827)
!2836 = !DILocation(line: 495, column: 9, scope: !2837)
!2837 = distinct !DILexicalBlock(scope: !2803, file: !294, line: 495, column: 9)
!2838 = !DILocation(line: 495, column: 17, scope: !2837)
!2839 = !DILocation(line: 495, column: 9, scope: !2803)
!2840 = !DILocation(line: 496, column: 7, scope: !2837)
!2841 = !DILocation(line: 498, column: 14, scope: !2803)
!2842 = !DILocation(line: 498, column: 5, scope: !2803)
!2843 = !DILocation(line: 498, column: 8, scope: !2803)
!2844 = !DILocation(line: 498, column: 12, scope: !2803)
!2845 = !DILocation(line: 499, column: 12, scope: !2803)
!2846 = !DILocation(line: 499, column: 5, scope: !2803)
!2847 = !DILocation(line: 502, column: 11, scope: !2775)
!2848 = !DILocation(line: 502, column: 3, scope: !2775)
!2849 = !DILocation(line: 503, column: 28, scope: !2850)
!2850 = distinct !DILexicalBlock(scope: !2775, file: !294, line: 502, column: 19)
!2851 = !DILocation(line: 503, column: 26, scope: !2850)
!2852 = !DILocation(line: 503, column: 36, scope: !2850)
!2853 = !DILocation(line: 504, column: 28, scope: !2850)
!2854 = !DILocation(line: 504, column: 31, scope: !2850)
!2855 = !DILocation(line: 504, column: 37, scope: !2850)
!2856 = !DILocation(line: 504, column: 35, scope: !2850)
!2857 = !DILocation(line: 504, column: 26, scope: !2850)
!2858 = !DILocation(line: 504, column: 45, scope: !2850)
!2859 = !DILocation(line: 505, column: 28, scope: !2850)
!2860 = !DILocation(line: 505, column: 31, scope: !2850)
!2861 = !DILocation(line: 505, column: 38, scope: !2850)
!2862 = !DILocation(line: 505, column: 45, scope: !2850)
!2863 = !DILocation(line: 505, column: 43, scope: !2850)
!2864 = !DILocation(line: 505, column: 26, scope: !2850)
!2865 = !DILocation(line: 505, column: 53, scope: !2850)
!2866 = !DILocation(line: 507, column: 5, scope: !2867)
!2867 = distinct !DILexicalBlock(scope: !2850, file: !294, line: 506, column: 12)
!2868 = !DILocation(line: 507, column: 11, scope: !2867)
!2869 = !DILocation(line: 508, column: 5, scope: !2867)
!2870 = !DILocation(line: 512, column: 7, scope: !2871)
!2871 = distinct !DILexicalBlock(scope: !2775, file: !294, line: 512, column: 7)
!2872 = !DILocation(line: 512, column: 15, scope: !2871)
!2873 = !DILocation(line: 512, column: 7, scope: !2775)
!2874 = !DILocation(line: 513, column: 5, scope: !2875)
!2875 = distinct !DILexicalBlock(scope: !2871, file: !294, line: 512, column: 20)
!2876 = !DILocation(line: 513, column: 11, scope: !2875)
!2877 = !DILocation(line: 514, column: 5, scope: !2875)
!2878 = !DILocation(line: 517, column: 12, scope: !2775)
!2879 = !DILocation(line: 517, column: 3, scope: !2775)
!2880 = !DILocation(line: 517, column: 6, scope: !2775)
!2881 = !DILocation(line: 517, column: 10, scope: !2775)
!2882 = !DILocation(line: 518, column: 10, scope: !2775)
!2883 = !DILocation(line: 518, column: 13, scope: !2775)
!2884 = !DILocation(line: 518, column: 3, scope: !2775)
!2885 = !DILocation(line: 519, column: 1, scope: !2775)
!2886 = distinct !DISubprogram(name: "__fd_stat", scope: !294, file: !294, line: 521, type: !2887, scopeLine: 521, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!2887 = !DISubroutineType(types: !2888)
!2888 = !{!237, !433, !1600}
!2889 = !DILocalVariable(name: "path", arg: 1, scope: !2886, file: !294, line: 521, type: !433)
!2890 = !DILocation(line: 521, column: 27, scope: !2886)
!2891 = !DILocalVariable(name: "buf", arg: 2, scope: !2886, file: !294, line: 521, type: !1600)
!2892 = !DILocation(line: 521, column: 48, scope: !2886)
!2893 = !DILocalVariable(name: "dfile", scope: !2886, file: !294, line: 522, type: !1593)
!2894 = !DILocation(line: 522, column: 20, scope: !2886)
!2895 = !DILocation(line: 522, column: 43, scope: !2886)
!2896 = !DILocation(line: 522, column: 28, scope: !2886)
!2897 = !DILocation(line: 523, column: 7, scope: !2898)
!2898 = distinct !DILexicalBlock(scope: !2886, file: !294, line: 523, column: 7)
!2899 = !DILocation(line: 523, column: 7, scope: !2886)
!2900 = !DILocation(line: 524, column: 12, scope: !2901)
!2901 = distinct !DILexicalBlock(scope: !2898, file: !294, line: 523, column: 14)
!2902 = !DILocation(line: 524, column: 17, scope: !2901)
!2903 = !DILocation(line: 524, column: 24, scope: !2901)
!2904 = !DILocation(line: 524, column: 5, scope: !2901)
!2905 = !DILocation(line: 525, column: 5, scope: !2901)
!2906 = !DILocation(line: 530, column: 51, scope: !2907)
!2907 = distinct !DILexicalBlock(scope: !2886, file: !294, line: 528, column: 3)
!2908 = !DILocation(line: 530, column: 31, scope: !2907)
!2909 = !DILocation(line: 530, column: 58, scope: !2907)
!2910 = !DILocation(line: 530, column: 12, scope: !2907)
!2911 = !DILocation(line: 530, column: 5, scope: !2907)
!2912 = !DILocation(line: 535, column: 1, scope: !2886)
!2913 = distinct !DISubprogram(name: "fstatat", scope: !294, file: !294, line: 537, type: !2914, scopeLine: 537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!2914 = !DISubroutineType(types: !2915)
!2915 = !{!237, !237, !433, !347, !237}
!2916 = !DILocalVariable(name: "fd", arg: 1, scope: !2913, file: !294, line: 537, type: !237)
!2917 = !DILocation(line: 537, column: 17, scope: !2913)
!2918 = !DILocalVariable(name: "path", arg: 2, scope: !2913, file: !294, line: 537, type: !433)
!2919 = !DILocation(line: 537, column: 33, scope: !2913)
!2920 = !DILocalVariable(name: "buf", arg: 3, scope: !2913, file: !294, line: 537, type: !347)
!2921 = !DILocation(line: 537, column: 52, scope: !2913)
!2922 = !DILocalVariable(name: "flags", arg: 4, scope: !2913, file: !294, line: 537, type: !237)
!2923 = !DILocation(line: 537, column: 61, scope: !2913)
!2924 = !DILocation(line: 538, column: 7, scope: !2925)
!2925 = distinct !DILexicalBlock(scope: !2913, file: !294, line: 538, column: 7)
!2926 = !DILocation(line: 538, column: 10, scope: !2925)
!2927 = !DILocation(line: 538, column: 7, scope: !2913)
!2928 = !DILocalVariable(name: "f", scope: !2929, file: !294, line: 539, type: !1935)
!2929 = distinct !DILexicalBlock(scope: !2925, file: !294, line: 538, column: 23)
!2930 = !DILocation(line: 539, column: 17, scope: !2929)
!2931 = !DILocation(line: 539, column: 32, scope: !2929)
!2932 = !DILocation(line: 539, column: 21, scope: !2929)
!2933 = !DILocation(line: 541, column: 10, scope: !2934)
!2934 = distinct !DILexicalBlock(scope: !2929, file: !294, line: 541, column: 9)
!2935 = !DILocation(line: 541, column: 9, scope: !2929)
!2936 = !DILocation(line: 542, column: 7, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2934, file: !294, line: 541, column: 13)
!2938 = !DILocation(line: 542, column: 13, scope: !2937)
!2939 = !DILocation(line: 543, column: 7, scope: !2937)
!2940 = !DILocation(line: 544, column: 16, scope: !2941)
!2941 = distinct !DILexicalBlock(scope: !2934, file: !294, line: 544, column: 16)
!2942 = !DILocation(line: 544, column: 19, scope: !2941)
!2943 = !DILocation(line: 544, column: 16, scope: !2934)
!2944 = !DILocation(line: 545, column: 7, scope: !2945)
!2945 = distinct !DILexicalBlock(scope: !2941, file: !294, line: 544, column: 26)
!2946 = !DILocation(line: 546, column: 7, scope: !2945)
!2947 = !DILocation(line: 546, column: 13, scope: !2945)
!2948 = !DILocation(line: 547, column: 7, scope: !2945)
!2949 = !DILocation(line: 549, column: 10, scope: !2929)
!2950 = !DILocation(line: 549, column: 13, scope: !2929)
!2951 = !DILocation(line: 549, column: 8, scope: !2929)
!2952 = !DILocation(line: 550, column: 3, scope: !2929)
!2953 = !DILocalVariable(name: "dfile", scope: !2913, file: !294, line: 551, type: !1593)
!2954 = !DILocation(line: 551, column: 20, scope: !2913)
!2955 = !DILocation(line: 551, column: 43, scope: !2913)
!2956 = !DILocation(line: 551, column: 28, scope: !2913)
!2957 = !DILocation(line: 552, column: 7, scope: !2958)
!2958 = distinct !DILexicalBlock(scope: !2913, file: !294, line: 552, column: 7)
!2959 = !DILocation(line: 552, column: 7, scope: !2913)
!2960 = !DILocation(line: 553, column: 12, scope: !2961)
!2961 = distinct !DILexicalBlock(scope: !2958, file: !294, line: 552, column: 14)
!2962 = !DILocation(line: 553, column: 17, scope: !2961)
!2963 = !DILocation(line: 553, column: 24, scope: !2961)
!2964 = !DILocation(line: 553, column: 5, scope: !2961)
!2965 = !DILocation(line: 554, column: 5, scope: !2961)
!2966 = !DILocation(line: 560, column: 3, scope: !2967)
!2967 = distinct !DILexicalBlock(scope: !2968, file: !294, line: 560, column: 3)
!2968 = distinct !DILexicalBlock(scope: !2913, file: !294, line: 560, column: 3)
!2969 = !DILocation(line: 560, column: 3, scope: !2968)
!2970 = !DILocation(line: 565, column: 41, scope: !2913)
!2971 = !DILocation(line: 565, column: 35, scope: !2913)
!2972 = !DILocation(line: 565, column: 45, scope: !2913)
!2973 = !DILocation(line: 565, column: 56, scope: !2913)
!2974 = !DILocation(line: 565, column: 67, scope: !2913)
!2975 = !DILocation(line: 565, column: 61, scope: !2913)
!2976 = !DILocation(line: 565, column: 10, scope: !2913)
!2977 = !DILocation(line: 565, column: 3, scope: !2913)
!2978 = !DILocation(line: 570, column: 1, scope: !2913)
!2979 = distinct !DISubprogram(name: "__fd_lstat", scope: !294, file: !294, line: 572, type: !2887, scopeLine: 572, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!2980 = !DILocalVariable(name: "path", arg: 1, scope: !2979, file: !294, line: 572, type: !433)
!2981 = !DILocation(line: 572, column: 28, scope: !2979)
!2982 = !DILocalVariable(name: "buf", arg: 2, scope: !2979, file: !294, line: 572, type: !1600)
!2983 = !DILocation(line: 572, column: 49, scope: !2979)
!2984 = !DILocalVariable(name: "dfile", scope: !2979, file: !294, line: 573, type: !1593)
!2985 = !DILocation(line: 573, column: 20, scope: !2979)
!2986 = !DILocation(line: 573, column: 43, scope: !2979)
!2987 = !DILocation(line: 573, column: 28, scope: !2979)
!2988 = !DILocation(line: 574, column: 7, scope: !2989)
!2989 = distinct !DILexicalBlock(scope: !2979, file: !294, line: 574, column: 7)
!2990 = !DILocation(line: 574, column: 7, scope: !2979)
!2991 = !DILocation(line: 575, column: 12, scope: !2992)
!2992 = distinct !DILexicalBlock(scope: !2989, file: !294, line: 574, column: 14)
!2993 = !DILocation(line: 575, column: 17, scope: !2992)
!2994 = !DILocation(line: 575, column: 24, scope: !2992)
!2995 = !DILocation(line: 575, column: 5, scope: !2992)
!2996 = !DILocation(line: 576, column: 5, scope: !2992)
!2997 = !DILocation(line: 581, column: 52, scope: !2998)
!2998 = distinct !DILexicalBlock(scope: !2979, file: !294, line: 579, column: 3)
!2999 = !DILocation(line: 581, column: 32, scope: !2998)
!3000 = !DILocation(line: 581, column: 59, scope: !2998)
!3001 = !DILocation(line: 581, column: 12, scope: !2998)
!3002 = !DILocation(line: 581, column: 5, scope: !2998)
!3003 = !DILocation(line: 586, column: 1, scope: !2979)
!3004 = distinct !DISubprogram(name: "chdir", scope: !294, file: !294, line: 588, type: !3005, scopeLine: 588, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3005 = !DISubroutineType(types: !3006)
!3006 = !{!237, !433}
!3007 = !DILocalVariable(name: "path", arg: 1, scope: !3004, file: !294, line: 588, type: !433)
!3008 = !DILocation(line: 588, column: 23, scope: !3004)
!3009 = !DILocalVariable(name: "dfile", scope: !3004, file: !294, line: 589, type: !1593)
!3010 = !DILocation(line: 589, column: 20, scope: !3004)
!3011 = !DILocation(line: 589, column: 43, scope: !3004)
!3012 = !DILocation(line: 589, column: 28, scope: !3004)
!3013 = !DILocation(line: 591, column: 7, scope: !3014)
!3014 = distinct !DILexicalBlock(scope: !3004, file: !294, line: 591, column: 7)
!3015 = !DILocation(line: 591, column: 7, scope: !3004)
!3016 = !DILocation(line: 593, column: 5, scope: !3017)
!3017 = distinct !DILexicalBlock(scope: !3014, file: !294, line: 591, column: 14)
!3018 = !DILocation(line: 594, column: 5, scope: !3017)
!3019 = !DILocation(line: 594, column: 11, scope: !3017)
!3020 = !DILocation(line: 595, column: 5, scope: !3017)
!3021 = !DILocation(line: 598, column: 50, scope: !3004)
!3022 = !DILocation(line: 598, column: 30, scope: !3004)
!3023 = !DILocation(line: 598, column: 10, scope: !3004)
!3024 = !DILocation(line: 598, column: 3, scope: !3004)
!3025 = !DILocation(line: 599, column: 1, scope: !3004)
!3026 = distinct !DISubprogram(name: "fchdir", scope: !294, file: !294, line: 601, type: !308, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3027 = !DILocalVariable(name: "fd", arg: 1, scope: !3026, file: !294, line: 601, type: !237)
!3028 = !DILocation(line: 601, column: 16, scope: !3026)
!3029 = !DILocalVariable(name: "f", scope: !3026, file: !294, line: 602, type: !1935)
!3030 = !DILocation(line: 602, column: 15, scope: !3026)
!3031 = !DILocation(line: 602, column: 30, scope: !3026)
!3032 = !DILocation(line: 602, column: 19, scope: !3026)
!3033 = !DILocation(line: 604, column: 8, scope: !3034)
!3034 = distinct !DILexicalBlock(scope: !3026, file: !294, line: 604, column: 7)
!3035 = !DILocation(line: 604, column: 7, scope: !3026)
!3036 = !DILocation(line: 605, column: 5, scope: !3037)
!3037 = distinct !DILexicalBlock(scope: !3034, file: !294, line: 604, column: 11)
!3038 = !DILocation(line: 605, column: 11, scope: !3037)
!3039 = !DILocation(line: 606, column: 5, scope: !3037)
!3040 = !DILocation(line: 609, column: 7, scope: !3041)
!3041 = distinct !DILexicalBlock(scope: !3026, file: !294, line: 609, column: 7)
!3042 = !DILocation(line: 609, column: 10, scope: !3041)
!3043 = !DILocation(line: 609, column: 7, scope: !3026)
!3044 = !DILocation(line: 610, column: 5, scope: !3045)
!3045 = distinct !DILexicalBlock(scope: !3041, file: !294, line: 609, column: 17)
!3046 = !DILocation(line: 611, column: 5, scope: !3045)
!3047 = !DILocation(line: 611, column: 11, scope: !3045)
!3048 = !DILocation(line: 612, column: 5, scope: !3045)
!3049 = !DILocation(line: 615, column: 31, scope: !3026)
!3050 = !DILocation(line: 615, column: 34, scope: !3026)
!3051 = !DILocation(line: 615, column: 10, scope: !3026)
!3052 = !DILocation(line: 615, column: 3, scope: !3026)
!3053 = !DILocation(line: 616, column: 1, scope: !3026)
!3054 = !DILocalVariable(name: "path", arg: 1, scope: !430, file: !294, line: 632, type: !433)
!3055 = !DILocation(line: 632, column: 23, scope: !430)
!3056 = !DILocalVariable(name: "mode", arg: 2, scope: !430, file: !294, line: 632, type: !290)
!3057 = !DILocation(line: 632, column: 36, scope: !430)
!3058 = !DILocalVariable(name: "dfile", scope: !430, file: !294, line: 635, type: !1593)
!3059 = !DILocation(line: 635, column: 20, scope: !430)
!3060 = !DILocation(line: 635, column: 43, scope: !430)
!3061 = !DILocation(line: 635, column: 28, scope: !430)
!3062 = !DILocation(line: 637, column: 10, scope: !430)
!3063 = !DILocation(line: 638, column: 16, scope: !3064)
!3064 = distinct !DILexicalBlock(scope: !430, file: !294, line: 638, column: 7)
!3065 = !DILocation(line: 638, column: 7, scope: !3064)
!3066 = !DILocation(line: 638, column: 29, scope: !3064)
!3067 = !DILocation(line: 638, column: 42, scope: !3064)
!3068 = !DILocation(line: 638, column: 32, scope: !3064)
!3069 = !DILocation(line: 638, column: 56, scope: !3064)
!3070 = !DILocation(line: 638, column: 53, scope: !3064)
!3071 = !DILocation(line: 638, column: 7, scope: !430)
!3072 = !DILocation(line: 639, column: 26, scope: !3073)
!3073 = distinct !DILexicalBlock(scope: !3064, file: !294, line: 638, column: 65)
!3074 = !DILocation(line: 640, column: 5, scope: !3073)
!3075 = !DILocation(line: 640, column: 11, scope: !3073)
!3076 = !DILocation(line: 641, column: 5, scope: !3073)
!3077 = !DILocation(line: 644, column: 7, scope: !3078)
!3078 = distinct !DILexicalBlock(scope: !430, file: !294, line: 644, column: 7)
!3079 = !DILocation(line: 644, column: 7, scope: !430)
!3080 = !DILocation(line: 645, column: 23, scope: !3081)
!3081 = distinct !DILexicalBlock(scope: !3078, file: !294, line: 644, column: 14)
!3082 = !DILocation(line: 645, column: 30, scope: !3081)
!3083 = !DILocation(line: 645, column: 12, scope: !3081)
!3084 = !DILocation(line: 645, column: 5, scope: !3081)
!3085 = !DILocation(line: 648, column: 50, scope: !430)
!3086 = !DILocation(line: 648, column: 30, scope: !430)
!3087 = !DILocation(line: 648, column: 57, scope: !430)
!3088 = !DILocation(line: 648, column: 10, scope: !430)
!3089 = !DILocation(line: 648, column: 3, scope: !430)
!3090 = !DILocation(line: 649, column: 1, scope: !430)
!3091 = distinct !DISubprogram(name: "__df_chmod", scope: !294, file: !294, line: 619, type: !3092, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3092 = !DISubroutineType(types: !3093)
!3093 = !{!237, !1593, !290}
!3094 = !DILocalVariable(name: "df", arg: 1, scope: !3091, file: !294, line: 619, type: !1593)
!3095 = !DILocation(line: 619, column: 40, scope: !3091)
!3096 = !DILocalVariable(name: "mode", arg: 2, scope: !3091, file: !294, line: 619, type: !290)
!3097 = !DILocation(line: 619, column: 51, scope: !3091)
!3098 = !DILocation(line: 620, column: 7, scope: !3099)
!3099 = distinct !DILexicalBlock(scope: !3091, file: !294, line: 620, column: 7)
!3100 = !DILocation(line: 620, column: 20, scope: !3099)
!3101 = !DILocation(line: 620, column: 24, scope: !3099)
!3102 = !DILocation(line: 620, column: 30, scope: !3099)
!3103 = !DILocation(line: 620, column: 17, scope: !3099)
!3104 = !DILocation(line: 620, column: 7, scope: !3091)
!3105 = !DILocation(line: 621, column: 9, scope: !3106)
!3106 = distinct !DILexicalBlock(scope: !3107, file: !294, line: 621, column: 9)
!3107 = distinct !DILexicalBlock(scope: !3099, file: !294, line: 620, column: 38)
!3108 = !DILocation(line: 621, column: 21, scope: !3106)
!3109 = !DILocation(line: 621, column: 25, scope: !3106)
!3110 = !DILocation(line: 621, column: 31, scope: !3106)
!3111 = !DILocation(line: 621, column: 18, scope: !3106)
!3112 = !DILocation(line: 621, column: 9, scope: !3107)
!3113 = !DILocation(line: 622, column: 12, scope: !3106)
!3114 = !DILocation(line: 622, column: 7, scope: !3106)
!3115 = !DILocation(line: 623, column: 27, scope: !3107)
!3116 = !DILocation(line: 623, column: 31, scope: !3107)
!3117 = !DILocation(line: 623, column: 37, scope: !3107)
!3118 = !DILocation(line: 623, column: 45, scope: !3107)
!3119 = !DILocation(line: 624, column: 27, scope: !3107)
!3120 = !DILocation(line: 624, column: 32, scope: !3107)
!3121 = !DILocation(line: 623, column: 55, scope: !3107)
!3122 = !DILocation(line: 623, column: 5, scope: !3107)
!3123 = !DILocation(line: 623, column: 9, scope: !3107)
!3124 = !DILocation(line: 623, column: 15, scope: !3107)
!3125 = !DILocation(line: 623, column: 23, scope: !3107)
!3126 = !DILocation(line: 625, column: 5, scope: !3107)
!3127 = !DILocation(line: 627, column: 5, scope: !3128)
!3128 = distinct !DILexicalBlock(scope: !3099, file: !294, line: 626, column: 10)
!3129 = !DILocation(line: 627, column: 11, scope: !3128)
!3130 = !DILocation(line: 628, column: 5, scope: !3128)
!3131 = !DILocation(line: 630, column: 1, scope: !3091)
!3132 = !DILocalVariable(name: "fd", arg: 1, scope: !436, file: !294, line: 651, type: !237)
!3133 = !DILocation(line: 651, column: 16, scope: !436)
!3134 = !DILocalVariable(name: "mode", arg: 2, scope: !436, file: !294, line: 651, type: !290)
!3135 = !DILocation(line: 651, column: 27, scope: !436)
!3136 = !DILocalVariable(name: "f", scope: !436, file: !294, line: 654, type: !1935)
!3137 = !DILocation(line: 654, column: 15, scope: !436)
!3138 = !DILocation(line: 654, column: 30, scope: !436)
!3139 = !DILocation(line: 654, column: 19, scope: !436)
!3140 = !DILocation(line: 656, column: 8, scope: !3141)
!3141 = distinct !DILexicalBlock(scope: !436, file: !294, line: 656, column: 7)
!3142 = !DILocation(line: 656, column: 7, scope: !436)
!3143 = !DILocation(line: 657, column: 5, scope: !3144)
!3144 = distinct !DILexicalBlock(scope: !3141, file: !294, line: 656, column: 11)
!3145 = !DILocation(line: 657, column: 11, scope: !3144)
!3146 = !DILocation(line: 658, column: 5, scope: !3144)
!3147 = !DILocation(line: 661, column: 10, scope: !436)
!3148 = !DILocation(line: 662, column: 16, scope: !3149)
!3149 = distinct !DILexicalBlock(scope: !436, file: !294, line: 662, column: 7)
!3150 = !DILocation(line: 662, column: 7, scope: !3149)
!3151 = !DILocation(line: 662, column: 29, scope: !3149)
!3152 = !DILocation(line: 662, column: 42, scope: !3149)
!3153 = !DILocation(line: 662, column: 32, scope: !3149)
!3154 = !DILocation(line: 662, column: 57, scope: !3149)
!3155 = !DILocation(line: 662, column: 54, scope: !3149)
!3156 = !DILocation(line: 662, column: 7, scope: !436)
!3157 = !DILocation(line: 663, column: 26, scope: !3158)
!3158 = distinct !DILexicalBlock(scope: !3149, file: !294, line: 662, column: 66)
!3159 = !DILocation(line: 664, column: 5, scope: !3158)
!3160 = !DILocation(line: 664, column: 11, scope: !3158)
!3161 = !DILocation(line: 665, column: 5, scope: !3158)
!3162 = !DILocation(line: 668, column: 7, scope: !3163)
!3163 = distinct !DILexicalBlock(scope: !436, file: !294, line: 668, column: 7)
!3164 = !DILocation(line: 668, column: 10, scope: !3163)
!3165 = !DILocation(line: 668, column: 7, scope: !436)
!3166 = !DILocation(line: 669, column: 23, scope: !3167)
!3167 = distinct !DILexicalBlock(scope: !3163, file: !294, line: 668, column: 17)
!3168 = !DILocation(line: 669, column: 26, scope: !3167)
!3169 = !DILocation(line: 669, column: 33, scope: !3167)
!3170 = !DILocation(line: 669, column: 12, scope: !3167)
!3171 = !DILocation(line: 669, column: 5, scope: !3167)
!3172 = !DILocation(line: 672, column: 31, scope: !436)
!3173 = !DILocation(line: 672, column: 34, scope: !436)
!3174 = !DILocation(line: 672, column: 38, scope: !436)
!3175 = !DILocation(line: 672, column: 10, scope: !436)
!3176 = !DILocation(line: 672, column: 3, scope: !436)
!3177 = !DILocation(line: 673, column: 1, scope: !436)
!3178 = distinct !DISubprogram(name: "chown", scope: !294, file: !294, line: 681, type: !3179, scopeLine: 681, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3179 = !DISubroutineType(types: !3180)
!3180 = !{!237, !433, !3181, !3182}
!3181 = !DIDerivedType(tag: DW_TAG_typedef, name: "uid_t", file: !284, line: 79, baseType: !233)
!3182 = !DIDerivedType(tag: DW_TAG_typedef, name: "gid_t", file: !284, line: 64, baseType: !235)
!3183 = !DILocalVariable(name: "path", arg: 1, scope: !3178, file: !294, line: 681, type: !433)
!3184 = !DILocation(line: 681, column: 23, scope: !3178)
!3185 = !DILocalVariable(name: "owner", arg: 2, scope: !3178, file: !294, line: 681, type: !3181)
!3186 = !DILocation(line: 681, column: 35, scope: !3178)
!3187 = !DILocalVariable(name: "group", arg: 3, scope: !3178, file: !294, line: 681, type: !3182)
!3188 = !DILocation(line: 681, column: 48, scope: !3178)
!3189 = !DILocalVariable(name: "df", scope: !3178, file: !294, line: 682, type: !1593)
!3190 = !DILocation(line: 682, column: 20, scope: !3178)
!3191 = !DILocation(line: 682, column: 40, scope: !3178)
!3192 = !DILocation(line: 682, column: 25, scope: !3178)
!3193 = !DILocation(line: 684, column: 7, scope: !3194)
!3194 = distinct !DILexicalBlock(scope: !3178, file: !294, line: 684, column: 7)
!3195 = !DILocation(line: 684, column: 7, scope: !3178)
!3196 = !DILocation(line: 685, column: 23, scope: !3197)
!3197 = distinct !DILexicalBlock(scope: !3194, file: !294, line: 684, column: 11)
!3198 = !DILocation(line: 685, column: 27, scope: !3197)
!3199 = !DILocation(line: 685, column: 34, scope: !3197)
!3200 = !DILocation(line: 685, column: 12, scope: !3197)
!3201 = !DILocation(line: 685, column: 5, scope: !3197)
!3202 = !DILocation(line: 688, column: 50, scope: !3178)
!3203 = !DILocation(line: 688, column: 30, scope: !3178)
!3204 = !DILocation(line: 688, column: 57, scope: !3178)
!3205 = !DILocation(line: 688, column: 64, scope: !3178)
!3206 = !DILocation(line: 688, column: 10, scope: !3178)
!3207 = !DILocation(line: 688, column: 3, scope: !3178)
!3208 = !DILocation(line: 689, column: 1, scope: !3178)
!3209 = distinct !DISubprogram(name: "__df_chown", scope: !294, file: !294, line: 675, type: !3210, scopeLine: 675, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3210 = !DISubroutineType(types: !3211)
!3211 = !{!237, !1593, !3181, !3182}
!3212 = !DILocalVariable(name: "df", arg: 1, scope: !3209, file: !294, line: 675, type: !1593)
!3213 = !DILocation(line: 675, column: 40, scope: !3209)
!3214 = !DILocalVariable(name: "owner", arg: 2, scope: !3209, file: !294, line: 675, type: !3181)
!3215 = !DILocation(line: 675, column: 50, scope: !3209)
!3216 = !DILocalVariable(name: "group", arg: 3, scope: !3209, file: !294, line: 675, type: !3182)
!3217 = !DILocation(line: 675, column: 63, scope: !3209)
!3218 = !DILocation(line: 676, column: 3, scope: !3209)
!3219 = !DILocation(line: 677, column: 3, scope: !3209)
!3220 = !DILocation(line: 677, column: 9, scope: !3209)
!3221 = !DILocation(line: 678, column: 3, scope: !3209)
!3222 = distinct !DISubprogram(name: "fchown", scope: !294, file: !294, line: 691, type: !3223, scopeLine: 691, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3223 = !DISubroutineType(types: !3224)
!3224 = !{!237, !237, !3181, !3182}
!3225 = !DILocalVariable(name: "fd", arg: 1, scope: !3222, file: !294, line: 691, type: !237)
!3226 = !DILocation(line: 691, column: 16, scope: !3222)
!3227 = !DILocalVariable(name: "owner", arg: 2, scope: !3222, file: !294, line: 691, type: !3181)
!3228 = !DILocation(line: 691, column: 26, scope: !3222)
!3229 = !DILocalVariable(name: "group", arg: 3, scope: !3222, file: !294, line: 691, type: !3182)
!3230 = !DILocation(line: 691, column: 39, scope: !3222)
!3231 = !DILocalVariable(name: "f", scope: !3222, file: !294, line: 692, type: !1935)
!3232 = !DILocation(line: 692, column: 15, scope: !3222)
!3233 = !DILocation(line: 692, column: 30, scope: !3222)
!3234 = !DILocation(line: 692, column: 19, scope: !3222)
!3235 = !DILocation(line: 694, column: 8, scope: !3236)
!3236 = distinct !DILexicalBlock(scope: !3222, file: !294, line: 694, column: 7)
!3237 = !DILocation(line: 694, column: 7, scope: !3222)
!3238 = !DILocation(line: 695, column: 5, scope: !3239)
!3239 = distinct !DILexicalBlock(scope: !3236, file: !294, line: 694, column: 11)
!3240 = !DILocation(line: 695, column: 11, scope: !3239)
!3241 = !DILocation(line: 696, column: 5, scope: !3239)
!3242 = !DILocation(line: 699, column: 7, scope: !3243)
!3243 = distinct !DILexicalBlock(scope: !3222, file: !294, line: 699, column: 7)
!3244 = !DILocation(line: 699, column: 10, scope: !3243)
!3245 = !DILocation(line: 699, column: 7, scope: !3222)
!3246 = !DILocation(line: 700, column: 23, scope: !3247)
!3247 = distinct !DILexicalBlock(scope: !3243, file: !294, line: 699, column: 17)
!3248 = !DILocation(line: 700, column: 26, scope: !3247)
!3249 = !DILocation(line: 700, column: 33, scope: !3247)
!3250 = !DILocation(line: 700, column: 40, scope: !3247)
!3251 = !DILocation(line: 700, column: 12, scope: !3247)
!3252 = !DILocation(line: 700, column: 5, scope: !3247)
!3253 = !DILocation(line: 703, column: 31, scope: !3222)
!3254 = !DILocation(line: 703, column: 35, scope: !3222)
!3255 = !DILocation(line: 703, column: 42, scope: !3222)
!3256 = !DILocation(line: 703, column: 10, scope: !3222)
!3257 = !DILocation(line: 703, column: 3, scope: !3222)
!3258 = !DILocation(line: 704, column: 1, scope: !3222)
!3259 = distinct !DISubprogram(name: "lchown", scope: !294, file: !294, line: 706, type: !3179, scopeLine: 706, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3260 = !DILocalVariable(name: "path", arg: 1, scope: !3259, file: !294, line: 706, type: !433)
!3261 = !DILocation(line: 706, column: 24, scope: !3259)
!3262 = !DILocalVariable(name: "owner", arg: 2, scope: !3259, file: !294, line: 706, type: !3181)
!3263 = !DILocation(line: 706, column: 36, scope: !3259)
!3264 = !DILocalVariable(name: "group", arg: 3, scope: !3259, file: !294, line: 706, type: !3182)
!3265 = !DILocation(line: 706, column: 49, scope: !3259)
!3266 = !DILocalVariable(name: "df", scope: !3259, file: !294, line: 708, type: !1593)
!3267 = !DILocation(line: 708, column: 20, scope: !3259)
!3268 = !DILocation(line: 708, column: 40, scope: !3259)
!3269 = !DILocation(line: 708, column: 25, scope: !3259)
!3270 = !DILocation(line: 710, column: 7, scope: !3271)
!3271 = distinct !DILexicalBlock(scope: !3259, file: !294, line: 710, column: 7)
!3272 = !DILocation(line: 710, column: 7, scope: !3259)
!3273 = !DILocation(line: 711, column: 23, scope: !3274)
!3274 = distinct !DILexicalBlock(scope: !3271, file: !294, line: 710, column: 11)
!3275 = !DILocation(line: 711, column: 27, scope: !3274)
!3276 = !DILocation(line: 711, column: 34, scope: !3274)
!3277 = !DILocation(line: 711, column: 12, scope: !3274)
!3278 = !DILocation(line: 711, column: 5, scope: !3274)
!3279 = !DILocation(line: 714, column: 50, scope: !3259)
!3280 = !DILocation(line: 714, column: 30, scope: !3259)
!3281 = !DILocation(line: 714, column: 57, scope: !3259)
!3282 = !DILocation(line: 714, column: 64, scope: !3259)
!3283 = !DILocation(line: 714, column: 10, scope: !3259)
!3284 = !DILocation(line: 714, column: 3, scope: !3259)
!3285 = !DILocation(line: 715, column: 1, scope: !3259)
!3286 = distinct !DISubprogram(name: "__fd_fstat", scope: !294, file: !294, line: 717, type: !2096, scopeLine: 717, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3287 = !DILocalVariable(name: "fd", arg: 1, scope: !3286, file: !294, line: 717, type: !237)
!3288 = !DILocation(line: 717, column: 20, scope: !3286)
!3289 = !DILocalVariable(name: "buf", arg: 2, scope: !3286, file: !294, line: 717, type: !1600)
!3290 = !DILocation(line: 717, column: 39, scope: !3286)
!3291 = !DILocalVariable(name: "f", scope: !3286, file: !294, line: 718, type: !1935)
!3292 = !DILocation(line: 718, column: 15, scope: !3286)
!3293 = !DILocation(line: 718, column: 30, scope: !3286)
!3294 = !DILocation(line: 718, column: 19, scope: !3286)
!3295 = !DILocation(line: 720, column: 8, scope: !3296)
!3296 = distinct !DILexicalBlock(scope: !3286, file: !294, line: 720, column: 7)
!3297 = !DILocation(line: 720, column: 7, scope: !3286)
!3298 = !DILocation(line: 721, column: 5, scope: !3299)
!3299 = distinct !DILexicalBlock(scope: !3296, file: !294, line: 720, column: 11)
!3300 = !DILocation(line: 721, column: 11, scope: !3299)
!3301 = !DILocation(line: 722, column: 5, scope: !3299)
!3302 = !DILocation(line: 725, column: 8, scope: !3303)
!3303 = distinct !DILexicalBlock(scope: !3286, file: !294, line: 725, column: 7)
!3304 = !DILocation(line: 725, column: 11, scope: !3303)
!3305 = !DILocation(line: 725, column: 7, scope: !3286)
!3306 = !DILocation(line: 727, column: 32, scope: !3307)
!3307 = distinct !DILexicalBlock(scope: !3303, file: !294, line: 725, column: 18)
!3308 = !DILocation(line: 727, column: 35, scope: !3307)
!3309 = !DILocation(line: 727, column: 39, scope: !3307)
!3310 = !DILocation(line: 727, column: 12, scope: !3307)
!3311 = !DILocation(line: 727, column: 5, scope: !3307)
!3312 = !DILocation(line: 733, column: 10, scope: !3286)
!3313 = !DILocation(line: 733, column: 15, scope: !3286)
!3314 = !DILocation(line: 733, column: 18, scope: !3286)
!3315 = !DILocation(line: 733, column: 25, scope: !3286)
!3316 = !DILocation(line: 733, column: 3, scope: !3286)
!3317 = !DILocation(line: 734, column: 3, scope: !3286)
!3318 = !DILocation(line: 735, column: 1, scope: !3286)
!3319 = !DILocalVariable(name: "fd", arg: 1, scope: !441, file: !294, line: 737, type: !237)
!3320 = !DILocation(line: 737, column: 24, scope: !441)
!3321 = !DILocalVariable(name: "length", arg: 2, scope: !441, file: !294, line: 737, type: !283)
!3322 = !DILocation(line: 737, column: 36, scope: !441)
!3323 = !DILocalVariable(name: "f", scope: !441, file: !294, line: 739, type: !1935)
!3324 = !DILocation(line: 739, column: 15, scope: !441)
!3325 = !DILocation(line: 739, column: 30, scope: !441)
!3326 = !DILocation(line: 739, column: 19, scope: !441)
!3327 = !DILocation(line: 741, column: 10, scope: !441)
!3328 = !DILocation(line: 743, column: 8, scope: !3329)
!3329 = distinct !DILexicalBlock(scope: !441, file: !294, line: 743, column: 7)
!3330 = !DILocation(line: 743, column: 7, scope: !441)
!3331 = !DILocation(line: 744, column: 5, scope: !3332)
!3332 = distinct !DILexicalBlock(scope: !3329, file: !294, line: 743, column: 11)
!3333 = !DILocation(line: 744, column: 11, scope: !3332)
!3334 = !DILocation(line: 745, column: 5, scope: !3332)
!3335 = !DILocation(line: 748, column: 16, scope: !3336)
!3336 = distinct !DILexicalBlock(scope: !441, file: !294, line: 748, column: 7)
!3337 = !DILocation(line: 748, column: 7, scope: !3336)
!3338 = !DILocation(line: 748, column: 29, scope: !3336)
!3339 = !DILocation(line: 748, column: 42, scope: !3336)
!3340 = !DILocation(line: 748, column: 32, scope: !3336)
!3341 = !DILocation(line: 748, column: 60, scope: !3336)
!3342 = !DILocation(line: 748, column: 57, scope: !3336)
!3343 = !DILocation(line: 748, column: 7, scope: !441)
!3344 = !DILocation(line: 749, column: 26, scope: !3345)
!3345 = distinct !DILexicalBlock(scope: !3336, file: !294, line: 748, column: 69)
!3346 = !DILocation(line: 750, column: 5, scope: !3345)
!3347 = !DILocation(line: 750, column: 11, scope: !3345)
!3348 = !DILocation(line: 751, column: 5, scope: !3345)
!3349 = !DILocation(line: 754, column: 7, scope: !3350)
!3350 = distinct !DILexicalBlock(scope: !441, file: !294, line: 754, column: 7)
!3351 = !DILocation(line: 754, column: 10, scope: !3350)
!3352 = !DILocation(line: 754, column: 7, scope: !441)
!3353 = !DILocation(line: 755, column: 5, scope: !3354)
!3354 = distinct !DILexicalBlock(scope: !3350, file: !294, line: 754, column: 17)
!3355 = !DILocation(line: 756, column: 5, scope: !3354)
!3356 = !DILocation(line: 756, column: 11, scope: !3354)
!3357 = !DILocation(line: 757, column: 5, scope: !3354)
!3358 = !DILocation(line: 760, column: 34, scope: !441)
!3359 = !DILocation(line: 760, column: 37, scope: !441)
!3360 = !DILocation(line: 760, column: 41, scope: !441)
!3361 = !DILocation(line: 760, column: 10, scope: !441)
!3362 = !DILocation(line: 760, column: 3, scope: !441)
!3363 = !DILocation(line: 764, column: 1, scope: !441)
!3364 = distinct !DISubprogram(name: "__fd_getdents", scope: !294, file: !294, line: 766, type: !3365, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3365 = !DISubroutineType(types: !3366)
!3366 = !{!237, !208, !333, !208}
!3367 = !DILocalVariable(name: "fd", arg: 1, scope: !3364, file: !294, line: 766, type: !208)
!3368 = !DILocation(line: 766, column: 32, scope: !3364)
!3369 = !DILocalVariable(name: "dirp", arg: 2, scope: !3364, file: !294, line: 766, type: !333)
!3370 = !DILocation(line: 766, column: 53, scope: !3364)
!3371 = !DILocalVariable(name: "count", arg: 3, scope: !3364, file: !294, line: 766, type: !208)
!3372 = !DILocation(line: 766, column: 72, scope: !3364)
!3373 = !DILocalVariable(name: "f", scope: !3364, file: !294, line: 767, type: !1935)
!3374 = !DILocation(line: 767, column: 15, scope: !3364)
!3375 = !DILocation(line: 767, column: 30, scope: !3364)
!3376 = !DILocation(line: 767, column: 19, scope: !3364)
!3377 = !DILocation(line: 769, column: 8, scope: !3378)
!3378 = distinct !DILexicalBlock(scope: !3364, file: !294, line: 769, column: 7)
!3379 = !DILocation(line: 769, column: 7, scope: !3364)
!3380 = !DILocation(line: 770, column: 5, scope: !3381)
!3381 = distinct !DILexicalBlock(scope: !3378, file: !294, line: 769, column: 11)
!3382 = !DILocation(line: 770, column: 11, scope: !3381)
!3383 = !DILocation(line: 771, column: 5, scope: !3381)
!3384 = !DILocation(line: 774, column: 7, scope: !3385)
!3385 = distinct !DILexicalBlock(scope: !3364, file: !294, line: 774, column: 7)
!3386 = !DILocation(line: 774, column: 10, scope: !3385)
!3387 = !DILocation(line: 774, column: 7, scope: !3364)
!3388 = !DILocation(line: 775, column: 5, scope: !3389)
!3389 = distinct !DILexicalBlock(scope: !3385, file: !294, line: 774, column: 17)
!3390 = !DILocation(line: 776, column: 5, scope: !3389)
!3391 = !DILocation(line: 776, column: 11, scope: !3389)
!3392 = !DILocation(line: 777, column: 5, scope: !3389)
!3393 = !DILocation(line: 779, column: 25, scope: !3394)
!3394 = distinct !DILexicalBlock(scope: !3395, file: !294, line: 779, column: 9)
!3395 = distinct !DILexicalBlock(scope: !3385, file: !294, line: 778, column: 10)
!3396 = !DILocation(line: 779, column: 28, scope: !3394)
!3397 = !DILocation(line: 779, column: 32, scope: !3394)
!3398 = !DILocation(line: 779, column: 9, scope: !3395)
!3399 = !DILocalVariable(name: "i", scope: !3400, file: !294, line: 781, type: !283)
!3400 = distinct !DILexicalBlock(scope: !3394, file: !294, line: 779, column: 41)
!3401 = !DILocation(line: 781, column: 15, scope: !3400)
!3402 = !DILocalVariable(name: "pad", scope: !3400, file: !294, line: 781, type: !283)
!3403 = !DILocation(line: 781, column: 18, scope: !3400)
!3404 = !DILocalVariable(name: "bytes", scope: !3400, file: !294, line: 781, type: !283)
!3405 = !DILocation(line: 781, column: 23, scope: !3400)
!3406 = !DILocation(line: 784, column: 11, scope: !3400)
!3407 = !DILocation(line: 784, column: 14, scope: !3400)
!3408 = !DILocation(line: 784, column: 18, scope: !3400)
!3409 = !DILocation(line: 784, column: 9, scope: !3400)
!3410 = !DILocation(line: 785, column: 23, scope: !3411)
!3411 = distinct !DILexicalBlock(scope: !3400, file: !294, line: 785, column: 11)
!3412 = !DILocation(line: 785, column: 25, scope: !3411)
!3413 = !DILocation(line: 785, column: 45, scope: !3411)
!3414 = !DILocation(line: 785, column: 48, scope: !3411)
!3415 = !DILocation(line: 785, column: 42, scope: !3411)
!3416 = !DILocation(line: 785, column: 53, scope: !3411)
!3417 = !DILocation(line: 786, column: 11, scope: !3411)
!3418 = !DILocation(line: 786, column: 24, scope: !3411)
!3419 = !DILocation(line: 786, column: 15, scope: !3411)
!3420 = !DILocation(line: 786, column: 13, scope: !3411)
!3421 = !DILocation(line: 785, column: 11, scope: !3400)
!3422 = !DILocation(line: 787, column: 9, scope: !3423)
!3423 = distinct !DILexicalBlock(scope: !3411, file: !294, line: 786, column: 37)
!3424 = !DILocation(line: 787, column: 15, scope: !3423)
!3425 = !DILocation(line: 788, column: 9, scope: !3423)
!3426 = !DILocation(line: 790, column: 14, scope: !3427)
!3427 = distinct !DILexicalBlock(scope: !3428, file: !294, line: 790, column: 7)
!3428 = distinct !DILexicalBlock(scope: !3400, file: !294, line: 790, column: 7)
!3429 = !DILocation(line: 790, column: 25, scope: !3427)
!3430 = !DILocation(line: 790, column: 16, scope: !3427)
!3431 = !DILocation(line: 790, column: 15, scope: !3427)
!3432 = !DILocation(line: 790, column: 7, scope: !3428)
!3433 = !DILocalVariable(name: "df", scope: !3434, file: !294, line: 791, type: !1593)
!3434 = distinct !DILexicalBlock(scope: !3427, file: !294, line: 790, column: 43)
!3435 = !DILocation(line: 791, column: 26, scope: !3434)
!3436 = !DILocation(line: 791, column: 41, scope: !3434)
!3437 = !DILocation(line: 791, column: 51, scope: !3434)
!3438 = !DILocation(line: 791, column: 32, scope: !3434)
!3439 = !DILocation(line: 792, column: 23, scope: !3434)
!3440 = !DILocation(line: 792, column: 27, scope: !3434)
!3441 = !DILocation(line: 792, column: 33, scope: !3434)
!3442 = !DILocation(line: 792, column: 9, scope: !3434)
!3443 = !DILocation(line: 792, column: 15, scope: !3434)
!3444 = !DILocation(line: 792, column: 21, scope: !3434)
!3445 = !DILocation(line: 793, column: 9, scope: !3434)
!3446 = !DILocation(line: 793, column: 15, scope: !3434)
!3447 = !DILocation(line: 793, column: 24, scope: !3434)
!3448 = !DILocation(line: 794, column: 24, scope: !3434)
!3449 = !DILocation(line: 794, column: 9, scope: !3434)
!3450 = !DILocation(line: 794, column: 15, scope: !3434)
!3451 = !DILocation(line: 794, column: 22, scope: !3434)
!3452 = !DILocation(line: 795, column: 33, scope: !3434)
!3453 = !DILocation(line: 795, column: 31, scope: !3434)
!3454 = !DILocation(line: 795, column: 27, scope: !3434)
!3455 = !DILocation(line: 795, column: 9, scope: !3434)
!3456 = !DILocation(line: 795, column: 15, scope: !3434)
!3457 = !DILocation(line: 795, column: 25, scope: !3434)
!3458 = !DILocation(line: 796, column: 9, scope: !3434)
!3459 = !DILocation(line: 796, column: 15, scope: !3434)
!3460 = !DILocation(line: 796, column: 25, scope: !3434)
!3461 = !DILocation(line: 798, column: 24, scope: !3434)
!3462 = !DILocation(line: 798, column: 25, scope: !3434)
!3463 = !DILocation(line: 798, column: 29, scope: !3434)
!3464 = !DILocation(line: 798, column: 9, scope: !3434)
!3465 = !DILocation(line: 798, column: 15, scope: !3434)
!3466 = !DILocation(line: 798, column: 21, scope: !3434)
!3467 = !DILocation(line: 800, column: 18, scope: !3434)
!3468 = !DILocation(line: 800, column: 24, scope: !3434)
!3469 = !DILocation(line: 800, column: 15, scope: !3434)
!3470 = !DILocation(line: 801, column: 9, scope: !3434)
!3471 = !DILocation(line: 790, column: 38, scope: !3427)
!3472 = !DILocation(line: 790, column: 7, scope: !3427)
!3473 = distinct !{!3473, !3432, !3474}
!3474 = !DILocation(line: 802, column: 7, scope: !3428)
!3475 = !DILocation(line: 805, column: 13, scope: !3400)
!3476 = !DILocation(line: 805, column: 18, scope: !3400)
!3477 = !DILocation(line: 805, column: 11, scope: !3400)
!3478 = !DILocation(line: 806, column: 7, scope: !3400)
!3479 = !DILocation(line: 806, column: 13, scope: !3400)
!3480 = !DILocation(line: 806, column: 19, scope: !3400)
!3481 = !DILocation(line: 807, column: 24, scope: !3400)
!3482 = !DILocation(line: 807, column: 30, scope: !3400)
!3483 = !DILocation(line: 807, column: 28, scope: !3400)
!3484 = !DILocation(line: 807, column: 7, scope: !3400)
!3485 = !DILocation(line: 807, column: 13, scope: !3400)
!3486 = !DILocation(line: 807, column: 22, scope: !3400)
!3487 = !DILocation(line: 808, column: 7, scope: !3400)
!3488 = !DILocation(line: 808, column: 13, scope: !3400)
!3489 = !DILocation(line: 808, column: 20, scope: !3400)
!3490 = !DILocation(line: 809, column: 7, scope: !3400)
!3491 = !DILocation(line: 809, column: 13, scope: !3400)
!3492 = !DILocation(line: 809, column: 23, scope: !3400)
!3493 = !DILocation(line: 811, column: 7, scope: !3400)
!3494 = !DILocation(line: 811, column: 13, scope: !3400)
!3495 = !DILocation(line: 811, column: 19, scope: !3400)
!3496 = !DILocation(line: 813, column: 16, scope: !3400)
!3497 = !DILocation(line: 813, column: 22, scope: !3400)
!3498 = !DILocation(line: 813, column: 13, scope: !3400)
!3499 = !DILocation(line: 814, column: 16, scope: !3400)
!3500 = !DILocation(line: 814, column: 7, scope: !3400)
!3501 = !DILocation(line: 814, column: 10, scope: !3400)
!3502 = !DILocation(line: 814, column: 14, scope: !3400)
!3503 = !DILocation(line: 816, column: 14, scope: !3400)
!3504 = !DILocation(line: 816, column: 7, scope: !3400)
!3505 = !DILocalVariable(name: "os_pos", scope: !3506, file: !294, line: 818, type: !283)
!3506 = distinct !DILexicalBlock(scope: !3394, file: !294, line: 817, column: 12)
!3507 = !DILocation(line: 818, column: 15, scope: !3506)
!3508 = !DILocation(line: 818, column: 24, scope: !3506)
!3509 = !DILocation(line: 818, column: 27, scope: !3506)
!3510 = !DILocation(line: 818, column: 31, scope: !3506)
!3511 = !DILocation(line: 827, column: 14, scope: !3506)
!3512 = !DILocation(line: 827, column: 23, scope: !3506)
!3513 = !DILocation(line: 827, column: 7, scope: !3506)
!3514 = !DILocalVariable(name: "s", scope: !3506, file: !294, line: 828, type: !283)
!3515 = !DILocation(line: 828, column: 15, scope: !3506)
!3516 = !DILocation(line: 828, column: 39, scope: !3506)
!3517 = !DILocation(line: 828, column: 42, scope: !3506)
!3518 = !DILocation(line: 828, column: 46, scope: !3506)
!3519 = !DILocation(line: 828, column: 19, scope: !3506)
!3520 = !DILocation(line: 829, column: 13, scope: !3506)
!3521 = !DILocation(line: 830, column: 7, scope: !3522)
!3522 = distinct !DILexicalBlock(scope: !3523, file: !294, line: 830, column: 7)
!3523 = distinct !DILexicalBlock(scope: !3506, file: !294, line: 830, column: 7)
!3524 = !DILocation(line: 830, column: 7, scope: !3523)
!3525 = !DILocalVariable(name: "res", scope: !3506, file: !294, line: 831, type: !237)
!3526 = !DILocation(line: 831, column: 11, scope: !3506)
!3527 = !DILocation(line: 831, column: 42, scope: !3506)
!3528 = !DILocation(line: 831, column: 45, scope: !3506)
!3529 = !DILocation(line: 831, column: 49, scope: !3506)
!3530 = !DILocation(line: 831, column: 55, scope: !3506)
!3531 = !DILocation(line: 831, column: 17, scope: !3506)
!3532 = !DILocation(line: 832, column: 11, scope: !3533)
!3533 = distinct !DILexicalBlock(scope: !3506, file: !294, line: 832, column: 11)
!3534 = !DILocation(line: 832, column: 15, scope: !3533)
!3535 = !DILocation(line: 832, column: 11, scope: !3506)
!3536 = !DILocalVariable(name: "pos", scope: !3537, file: !294, line: 833, type: !237)
!3537 = distinct !DILexicalBlock(scope: !3533, file: !294, line: 832, column: 21)
!3538 = !DILocation(line: 833, column: 13, scope: !3537)
!3539 = !DILocation(line: 834, column: 38, scope: !3537)
!3540 = !DILocation(line: 834, column: 41, scope: !3537)
!3541 = !DILocation(line: 834, column: 18, scope: !3537)
!3542 = !DILocation(line: 834, column: 9, scope: !3537)
!3543 = !DILocation(line: 834, column: 12, scope: !3537)
!3544 = !DILocation(line: 834, column: 16, scope: !3537)
!3545 = !DILocation(line: 835, column: 9, scope: !3546)
!3546 = distinct !DILexicalBlock(scope: !3547, file: !294, line: 835, column: 9)
!3547 = distinct !DILexicalBlock(scope: !3537, file: !294, line: 835, column: 9)
!3548 = !DILocation(line: 835, column: 9, scope: !3547)
!3549 = !DILocation(line: 836, column: 9, scope: !3537)
!3550 = !DILocation(line: 836, column: 12, scope: !3537)
!3551 = !DILocation(line: 836, column: 16, scope: !3537)
!3552 = !DILocation(line: 839, column: 9, scope: !3537)
!3553 = !DILocation(line: 839, column: 16, scope: !3537)
!3554 = !DILocation(line: 839, column: 22, scope: !3537)
!3555 = !DILocation(line: 839, column: 20, scope: !3537)
!3556 = !DILocalVariable(name: "dp", scope: !3557, file: !294, line: 840, type: !333)
!3557 = distinct !DILexicalBlock(scope: !3537, file: !294, line: 839, column: 27)
!3558 = !DILocation(line: 840, column: 28, scope: !3557)
!3559 = !DILocation(line: 840, column: 61, scope: !3557)
!3560 = !DILocation(line: 840, column: 68, scope: !3557)
!3561 = !DILocation(line: 840, column: 66, scope: !3557)
!3562 = !DILocation(line: 842, column: 11, scope: !3557)
!3563 = !DILocation(line: 842, column: 15, scope: !3557)
!3564 = !DILocation(line: 842, column: 21, scope: !3557)
!3565 = !DILocation(line: 844, column: 18, scope: !3557)
!3566 = !DILocation(line: 844, column: 22, scope: !3557)
!3567 = !DILocation(line: 844, column: 15, scope: !3557)
!3568 = distinct !{!3568, !3552, !3569}
!3569 = !DILocation(line: 845, column: 9, scope: !3537)
!3570 = !DILocation(line: 847, column: 14, scope: !3506)
!3571 = !DILocation(line: 847, column: 7, scope: !3506)
!3572 = !DILocation(line: 850, column: 1, scope: !3364)
!3573 = distinct !DISubprogram(name: "ioctl", scope: !294, file: !294, line: 853, type: !3574, scopeLine: 853, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3574 = !DISubroutineType(types: !3575)
!3575 = !{!237, !237, !225, null}
!3576 = !DILocalVariable(name: "fd", arg: 1, scope: !3573, file: !294, line: 853, type: !237)
!3577 = !DILocation(line: 853, column: 15, scope: !3573)
!3578 = !DILocalVariable(name: "request", arg: 2, scope: !3573, file: !294, line: 853, type: !225)
!3579 = !DILocation(line: 853, column: 37, scope: !3573)
!3580 = !DILocalVariable(name: "f", scope: !3573, file: !294, line: 857, type: !1935)
!3581 = !DILocation(line: 857, column: 15, scope: !3573)
!3582 = !DILocation(line: 857, column: 30, scope: !3573)
!3583 = !DILocation(line: 857, column: 19, scope: !3573)
!3584 = !DILocalVariable(name: "ap", scope: !3573, file: !294, line: 858, type: !3585)
!3585 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !3586, line: 52, baseType: !3587)
!3586 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!3587 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !3588, line: 14, baseType: !3589)
!3588 = !DIFile(filename: "llvm-160-install_O_D_A/lib/clang/16/include/stdarg.h", directory: "/tmp", checksumkind: CSK_MD5, checksum: "4c819f80dd915987182e9ab226e27a5a")
!3589 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !3590, baseType: !3591)
!3590 = !DIFile(filename: "klee_src/runtime/POSIX/fd.c", directory: "/tmp")
!3591 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3592, size: 192, elements: !3598)
!3592 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !3593)
!3593 = !{!3594, !3595, !3596, !3597}
!3594 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !3592, file: !3590, line: 858, baseType: !208, size: 32)
!3595 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !3592, file: !3590, line: 858, baseType: !208, size: 32, offset: 32)
!3596 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !3592, file: !3590, line: 858, baseType: !332, size: 64, offset: 64)
!3597 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !3592, file: !3590, line: 858, baseType: !332, size: 64, offset: 128)
!3598 = !{!3599}
!3599 = !DISubrange(count: 1)
!3600 = !DILocation(line: 858, column: 11, scope: !3573)
!3601 = !DILocalVariable(name: "buf", scope: !3573, file: !294, line: 859, type: !332)
!3602 = !DILocation(line: 859, column: 9, scope: !3573)
!3603 = !DILocation(line: 865, column: 8, scope: !3604)
!3604 = distinct !DILexicalBlock(scope: !3573, file: !294, line: 865, column: 7)
!3605 = !DILocation(line: 865, column: 7, scope: !3573)
!3606 = !DILocation(line: 866, column: 5, scope: !3607)
!3607 = distinct !DILexicalBlock(scope: !3604, file: !294, line: 865, column: 11)
!3608 = !DILocation(line: 866, column: 11, scope: !3607)
!3609 = !DILocation(line: 867, column: 5, scope: !3607)
!3610 = !DILocation(line: 870, column: 3, scope: !3573)
!3611 = !DILocation(line: 871, column: 9, scope: !3573)
!3612 = !DILocation(line: 871, column: 7, scope: !3573)
!3613 = !DILocation(line: 872, column: 3, scope: !3573)
!3614 = !DILocation(line: 873, column: 7, scope: !3615)
!3615 = distinct !DILexicalBlock(scope: !3573, file: !294, line: 873, column: 7)
!3616 = !DILocation(line: 873, column: 10, scope: !3615)
!3617 = !DILocation(line: 873, column: 7, scope: !3573)
!3618 = !DILocalVariable(name: "stat", scope: !3619, file: !294, line: 874, type: !347)
!3619 = distinct !DILexicalBlock(scope: !3615, file: !294, line: 873, column: 17)
!3620 = !DILocation(line: 874, column: 18, scope: !3619)
!3621 = !DILocation(line: 874, column: 40, scope: !3619)
!3622 = !DILocation(line: 874, column: 43, scope: !3619)
!3623 = !DILocation(line: 874, column: 50, scope: !3619)
!3624 = !DILocation(line: 876, column: 13, scope: !3619)
!3625 = !DILocation(line: 876, column: 5, scope: !3619)
!3626 = !DILocalVariable(name: "ts", scope: !3627, file: !294, line: 878, type: !3629)
!3627 = distinct !DILexicalBlock(scope: !3628, file: !294, line: 877, column: 18)
!3628 = distinct !DILexicalBlock(scope: !3619, file: !294, line: 876, column: 22)
!3629 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3630, size: 64)
!3630 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "termios", file: !3631, line: 24, size: 480, elements: !3632)
!3631 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/termios-struct.h", directory: "", checksumkind: CSK_MD5, checksum: "a512dc8866a1d12d70982670557f907e")
!3632 = !{!3633, !3636, !3637, !3638, !3639, !3641, !3643, !3645}
!3633 = !DIDerivedType(tag: DW_TAG_member, name: "c_iflag", scope: !3630, file: !3631, line: 26, baseType: !3634, size: 32)
!3634 = !DIDerivedType(tag: DW_TAG_typedef, name: "tcflag_t", file: !3635, line: 25, baseType: !208)
!3635 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/termios.h", directory: "", checksumkind: CSK_MD5, checksum: "8fb85635ee384e33fd6386ce833e946a")
!3636 = !DIDerivedType(tag: DW_TAG_member, name: "c_oflag", scope: !3630, file: !3631, line: 27, baseType: !3634, size: 32, offset: 32)
!3637 = !DIDerivedType(tag: DW_TAG_member, name: "c_cflag", scope: !3630, file: !3631, line: 28, baseType: !3634, size: 32, offset: 64)
!3638 = !DIDerivedType(tag: DW_TAG_member, name: "c_lflag", scope: !3630, file: !3631, line: 29, baseType: !3634, size: 32, offset: 96)
!3639 = !DIDerivedType(tag: DW_TAG_member, name: "c_line", scope: !3630, file: !3631, line: 30, baseType: !3640, size: 8, offset: 128)
!3640 = !DIDerivedType(tag: DW_TAG_typedef, name: "cc_t", file: !3635, line: 23, baseType: !342)
!3641 = !DIDerivedType(tag: DW_TAG_member, name: "c_cc", scope: !3630, file: !3631, line: 31, baseType: !3642, size: 256, offset: 136)
!3642 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3640, size: 256, elements: !287)
!3643 = !DIDerivedType(tag: DW_TAG_member, name: "c_ispeed", scope: !3630, file: !3631, line: 32, baseType: !3644, size: 32, offset: 416)
!3644 = !DIDerivedType(tag: DW_TAG_typedef, name: "speed_t", file: !3635, line: 24, baseType: !208)
!3645 = !DIDerivedType(tag: DW_TAG_member, name: "c_ospeed", scope: !3630, file: !3631, line: 33, baseType: !3644, size: 32, offset: 448)
!3646 = !DILocation(line: 878, column: 23, scope: !3627)
!3647 = !DILocation(line: 878, column: 28, scope: !3627)
!3648 = !DILocation(line: 880, column: 7, scope: !3627)
!3649 = !DILocation(line: 883, column: 11, scope: !3650)
!3650 = distinct !DILexicalBlock(scope: !3627, file: !294, line: 883, column: 11)
!3651 = !DILocation(line: 883, column: 11, scope: !3627)
!3652 = !DILocation(line: 886, column: 9, scope: !3653)
!3653 = distinct !DILexicalBlock(scope: !3650, file: !294, line: 883, column: 35)
!3654 = !DILocation(line: 886, column: 13, scope: !3653)
!3655 = !DILocation(line: 886, column: 21, scope: !3653)
!3656 = !DILocation(line: 887, column: 9, scope: !3653)
!3657 = !DILocation(line: 887, column: 13, scope: !3653)
!3658 = !DILocation(line: 887, column: 21, scope: !3653)
!3659 = !DILocation(line: 888, column: 9, scope: !3653)
!3660 = !DILocation(line: 888, column: 13, scope: !3653)
!3661 = !DILocation(line: 888, column: 21, scope: !3653)
!3662 = !DILocation(line: 889, column: 9, scope: !3653)
!3663 = !DILocation(line: 889, column: 13, scope: !3653)
!3664 = !DILocation(line: 889, column: 21, scope: !3653)
!3665 = !DILocation(line: 891, column: 9, scope: !3653)
!3666 = !DILocation(line: 891, column: 13, scope: !3653)
!3667 = !DILocation(line: 891, column: 20, scope: !3653)
!3668 = !DILocation(line: 893, column: 9, scope: !3653)
!3669 = !DILocation(line: 893, column: 13, scope: !3653)
!3670 = !DILocation(line: 893, column: 21, scope: !3653)
!3671 = !DILocation(line: 894, column: 9, scope: !3653)
!3672 = !DILocation(line: 894, column: 13, scope: !3653)
!3673 = !DILocation(line: 894, column: 21, scope: !3653)
!3674 = !DILocation(line: 895, column: 9, scope: !3653)
!3675 = !DILocation(line: 895, column: 13, scope: !3653)
!3676 = !DILocation(line: 895, column: 21, scope: !3653)
!3677 = !DILocation(line: 896, column: 9, scope: !3653)
!3678 = !DILocation(line: 896, column: 13, scope: !3653)
!3679 = !DILocation(line: 896, column: 21, scope: !3653)
!3680 = !DILocation(line: 897, column: 9, scope: !3653)
!3681 = !DILocation(line: 897, column: 13, scope: !3653)
!3682 = !DILocation(line: 897, column: 21, scope: !3653)
!3683 = !DILocation(line: 898, column: 9, scope: !3653)
!3684 = !DILocation(line: 898, column: 13, scope: !3653)
!3685 = !DILocation(line: 898, column: 21, scope: !3653)
!3686 = !DILocation(line: 899, column: 9, scope: !3653)
!3687 = !DILocation(line: 899, column: 13, scope: !3653)
!3688 = !DILocation(line: 899, column: 21, scope: !3653)
!3689 = !DILocation(line: 900, column: 9, scope: !3653)
!3690 = !DILocation(line: 900, column: 13, scope: !3653)
!3691 = !DILocation(line: 900, column: 21, scope: !3653)
!3692 = !DILocation(line: 901, column: 9, scope: !3653)
!3693 = !DILocation(line: 901, column: 13, scope: !3653)
!3694 = !DILocation(line: 901, column: 21, scope: !3653)
!3695 = !DILocation(line: 902, column: 9, scope: !3653)
!3696 = !DILocation(line: 902, column: 13, scope: !3653)
!3697 = !DILocation(line: 902, column: 21, scope: !3653)
!3698 = !DILocation(line: 903, column: 9, scope: !3653)
!3699 = !DILocation(line: 903, column: 13, scope: !3653)
!3700 = !DILocation(line: 903, column: 22, scope: !3653)
!3701 = !DILocation(line: 904, column: 9, scope: !3653)
!3702 = !DILocation(line: 904, column: 13, scope: !3653)
!3703 = !DILocation(line: 904, column: 22, scope: !3653)
!3704 = !DILocation(line: 905, column: 9, scope: !3653)
!3705 = !DILocation(line: 905, column: 13, scope: !3653)
!3706 = !DILocation(line: 905, column: 22, scope: !3653)
!3707 = !DILocation(line: 906, column: 9, scope: !3653)
!3708 = !DILocation(line: 906, column: 13, scope: !3653)
!3709 = !DILocation(line: 906, column: 22, scope: !3653)
!3710 = !DILocation(line: 907, column: 9, scope: !3653)
!3711 = !DILocation(line: 907, column: 13, scope: !3653)
!3712 = !DILocation(line: 907, column: 22, scope: !3653)
!3713 = !DILocation(line: 908, column: 9, scope: !3653)
!3714 = !DILocation(line: 908, column: 13, scope: !3653)
!3715 = !DILocation(line: 908, column: 22, scope: !3653)
!3716 = !DILocation(line: 909, column: 9, scope: !3653)
!3717 = !DILocation(line: 909, column: 13, scope: !3653)
!3718 = !DILocation(line: 909, column: 22, scope: !3653)
!3719 = !DILocation(line: 910, column: 9, scope: !3653)
!3720 = !DILocation(line: 910, column: 13, scope: !3653)
!3721 = !DILocation(line: 910, column: 22, scope: !3653)
!3722 = !DILocation(line: 911, column: 9, scope: !3653)
!3723 = !DILocation(line: 911, column: 13, scope: !3653)
!3724 = !DILocation(line: 911, column: 22, scope: !3653)
!3725 = !DILocation(line: 912, column: 9, scope: !3653)
!3726 = !DILocation(line: 914, column: 9, scope: !3727)
!3727 = distinct !DILexicalBlock(scope: !3650, file: !294, line: 913, column: 14)
!3728 = !DILocation(line: 914, column: 15, scope: !3727)
!3729 = !DILocation(line: 915, column: 9, scope: !3727)
!3730 = !DILocation(line: 920, column: 7, scope: !3731)
!3731 = distinct !DILexicalBlock(scope: !3628, file: !294, line: 918, column: 18)
!3732 = !DILocation(line: 921, column: 11, scope: !3733)
!3733 = distinct !DILexicalBlock(scope: !3731, file: !294, line: 921, column: 11)
!3734 = !DILocation(line: 921, column: 11, scope: !3731)
!3735 = !DILocation(line: 922, column: 9, scope: !3736)
!3736 = distinct !DILexicalBlock(scope: !3733, file: !294, line: 921, column: 35)
!3737 = !DILocation(line: 924, column: 9, scope: !3738)
!3738 = distinct !DILexicalBlock(scope: !3733, file: !294, line: 923, column: 14)
!3739 = !DILocation(line: 924, column: 15, scope: !3738)
!3740 = !DILocation(line: 925, column: 9, scope: !3738)
!3741 = !DILocation(line: 930, column: 7, scope: !3742)
!3742 = distinct !DILexicalBlock(scope: !3628, file: !294, line: 928, column: 19)
!3743 = !DILocation(line: 931, column: 11, scope: !3744)
!3744 = distinct !DILexicalBlock(scope: !3742, file: !294, line: 931, column: 11)
!3745 = !DILocation(line: 931, column: 13, scope: !3744)
!3746 = !DILocation(line: 931, column: 11, scope: !3742)
!3747 = !DILocation(line: 932, column: 9, scope: !3748)
!3748 = distinct !DILexicalBlock(scope: !3744, file: !294, line: 931, column: 18)
!3749 = !DILocation(line: 934, column: 9, scope: !3750)
!3750 = distinct !DILexicalBlock(scope: !3744, file: !294, line: 933, column: 14)
!3751 = !DILocation(line: 934, column: 15, scope: !3750)
!3752 = !DILocation(line: 935, column: 9, scope: !3750)
!3753 = !DILocation(line: 940, column: 7, scope: !3754)
!3754 = distinct !DILexicalBlock(scope: !3628, file: !294, line: 938, column: 19)
!3755 = !DILocation(line: 941, column: 11, scope: !3756)
!3756 = distinct !DILexicalBlock(scope: !3754, file: !294, line: 941, column: 11)
!3757 = !DILocation(line: 941, column: 11, scope: !3754)
!3758 = !DILocation(line: 942, column: 9, scope: !3759)
!3759 = distinct !DILexicalBlock(scope: !3756, file: !294, line: 941, column: 35)
!3760 = !DILocation(line: 944, column: 9, scope: !3761)
!3761 = distinct !DILexicalBlock(scope: !3756, file: !294, line: 943, column: 14)
!3762 = !DILocation(line: 944, column: 15, scope: !3761)
!3763 = !DILocation(line: 945, column: 9, scope: !3761)
!3764 = !DILocalVariable(name: "ws", scope: !3765, file: !294, line: 949, type: !3766)
!3765 = distinct !DILexicalBlock(scope: !3628, file: !294, line: 948, column: 22)
!3766 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3767, size: 64)
!3767 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "winsize", file: !3768, line: 27, size: 64, elements: !3769)
!3768 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", directory: "", checksumkind: CSK_MD5, checksum: "9c5f7d5180137ced2d76aeb981aa912b")
!3769 = !{!3770, !3771, !3772, !3773}
!3770 = !DIDerivedType(tag: DW_TAG_member, name: "ws_row", scope: !3767, file: !3768, line: 29, baseType: !340, size: 16)
!3771 = !DIDerivedType(tag: DW_TAG_member, name: "ws_col", scope: !3767, file: !3768, line: 30, baseType: !340, size: 16, offset: 16)
!3772 = !DIDerivedType(tag: DW_TAG_member, name: "ws_xpixel", scope: !3767, file: !3768, line: 31, baseType: !340, size: 16, offset: 32)
!3773 = !DIDerivedType(tag: DW_TAG_member, name: "ws_ypixel", scope: !3767, file: !3768, line: 32, baseType: !340, size: 16, offset: 48)
!3774 = !DILocation(line: 949, column: 23, scope: !3765)
!3775 = !DILocation(line: 949, column: 28, scope: !3765)
!3776 = !DILocation(line: 950, column: 7, scope: !3765)
!3777 = !DILocation(line: 950, column: 11, scope: !3765)
!3778 = !DILocation(line: 950, column: 18, scope: !3765)
!3779 = !DILocation(line: 951, column: 7, scope: !3765)
!3780 = !DILocation(line: 951, column: 11, scope: !3765)
!3781 = !DILocation(line: 951, column: 18, scope: !3765)
!3782 = !DILocation(line: 952, column: 7, scope: !3765)
!3783 = !DILocation(line: 953, column: 11, scope: !3784)
!3784 = distinct !DILexicalBlock(scope: !3765, file: !294, line: 953, column: 11)
!3785 = !DILocation(line: 953, column: 11, scope: !3765)
!3786 = !DILocation(line: 954, column: 9, scope: !3787)
!3787 = distinct !DILexicalBlock(scope: !3784, file: !294, line: 953, column: 35)
!3788 = !DILocation(line: 956, column: 9, scope: !3789)
!3789 = distinct !DILexicalBlock(scope: !3784, file: !294, line: 955, column: 14)
!3790 = !DILocation(line: 956, column: 15, scope: !3789)
!3791 = !DILocation(line: 957, column: 9, scope: !3789)
!3792 = !DILocation(line: 962, column: 7, scope: !3793)
!3793 = distinct !DILexicalBlock(scope: !3628, file: !294, line: 960, column: 22)
!3794 = !DILocation(line: 963, column: 11, scope: !3795)
!3795 = distinct !DILexicalBlock(scope: !3793, file: !294, line: 963, column: 11)
!3796 = !DILocation(line: 963, column: 11, scope: !3793)
!3797 = !DILocation(line: 964, column: 9, scope: !3798)
!3798 = distinct !DILexicalBlock(scope: !3795, file: !294, line: 963, column: 35)
!3799 = !DILocation(line: 964, column: 15, scope: !3798)
!3800 = !DILocation(line: 965, column: 9, scope: !3798)
!3801 = !DILocation(line: 967, column: 9, scope: !3802)
!3802 = distinct !DILexicalBlock(scope: !3795, file: !294, line: 966, column: 14)
!3803 = !DILocation(line: 967, column: 15, scope: !3802)
!3804 = !DILocation(line: 968, column: 9, scope: !3802)
!3805 = !DILocalVariable(name: "res", scope: !3806, file: !294, line: 972, type: !265)
!3806 = distinct !DILexicalBlock(scope: !3628, file: !294, line: 971, column: 20)
!3807 = !DILocation(line: 972, column: 12, scope: !3806)
!3808 = !DILocation(line: 972, column: 18, scope: !3806)
!3809 = !DILocation(line: 973, column: 7, scope: !3806)
!3810 = !DILocation(line: 974, column: 11, scope: !3811)
!3811 = distinct !DILexicalBlock(scope: !3806, file: !294, line: 974, column: 11)
!3812 = !DILocation(line: 974, column: 11, scope: !3806)
!3813 = !DILocation(line: 975, column: 13, scope: !3814)
!3814 = distinct !DILexicalBlock(scope: !3815, file: !294, line: 975, column: 13)
!3815 = distinct !DILexicalBlock(scope: !3811, file: !294, line: 974, column: 35)
!3816 = !DILocation(line: 975, column: 16, scope: !3814)
!3817 = !DILocation(line: 975, column: 32, scope: !3814)
!3818 = !DILocation(line: 975, column: 35, scope: !3814)
!3819 = !DILocation(line: 975, column: 42, scope: !3814)
!3820 = !DILocation(line: 975, column: 22, scope: !3814)
!3821 = !DILocation(line: 975, column: 20, scope: !3814)
!3822 = !DILocation(line: 975, column: 13, scope: !3815)
!3823 = !DILocation(line: 976, column: 18, scope: !3824)
!3824 = distinct !DILexicalBlock(scope: !3814, file: !294, line: 975, column: 48)
!3825 = !DILocation(line: 976, column: 21, scope: !3824)
!3826 = !DILocation(line: 976, column: 28, scope: !3824)
!3827 = !DILocation(line: 976, column: 35, scope: !3824)
!3828 = !DILocation(line: 976, column: 38, scope: !3824)
!3829 = !DILocation(line: 976, column: 33, scope: !3824)
!3830 = !DILocation(line: 976, column: 12, scope: !3824)
!3831 = !DILocation(line: 976, column: 16, scope: !3824)
!3832 = !DILocation(line: 977, column: 9, scope: !3824)
!3833 = !DILocation(line: 978, column: 12, scope: !3834)
!3834 = distinct !DILexicalBlock(scope: !3814, file: !294, line: 977, column: 16)
!3835 = !DILocation(line: 978, column: 16, scope: !3834)
!3836 = !DILocation(line: 980, column: 9, scope: !3815)
!3837 = !DILocation(line: 982, column: 9, scope: !3838)
!3838 = distinct !DILexicalBlock(scope: !3811, file: !294, line: 981, column: 14)
!3839 = !DILocation(line: 982, column: 15, scope: !3838)
!3840 = !DILocation(line: 983, column: 9, scope: !3838)
!3841 = !DILocation(line: 987, column: 7, scope: !3842)
!3842 = distinct !DILexicalBlock(scope: !3628, file: !294, line: 986, column: 20)
!3843 = !DILocation(line: 988, column: 7, scope: !3842)
!3844 = !DILocation(line: 988, column: 13, scope: !3842)
!3845 = !DILocation(line: 989, column: 7, scope: !3842)
!3846 = !DILocation(line: 992, column: 7, scope: !3628)
!3847 = !DILocation(line: 993, column: 7, scope: !3628)
!3848 = !DILocation(line: 993, column: 13, scope: !3628)
!3849 = !DILocation(line: 994, column: 7, scope: !3628)
!3850 = !DILocation(line: 997, column: 30, scope: !3573)
!3851 = !DILocation(line: 997, column: 33, scope: !3573)
!3852 = !DILocation(line: 997, column: 37, scope: !3573)
!3853 = !DILocation(line: 997, column: 46, scope: !3573)
!3854 = !DILocation(line: 997, column: 10, scope: !3573)
!3855 = !DILocation(line: 997, column: 3, scope: !3573)
!3856 = !DILocation(line: 998, column: 1, scope: !3573)
!3857 = distinct !DISubprogram(name: "fcntl", scope: !294, file: !294, line: 1000, type: !3858, scopeLine: 1000, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3858 = !DISubroutineType(types: !3859)
!3859 = !{!237, !237, !237, null}
!3860 = !DILocalVariable(name: "fd", arg: 1, scope: !3857, file: !294, line: 1000, type: !237)
!3861 = !DILocation(line: 1000, column: 15, scope: !3857)
!3862 = !DILocalVariable(name: "cmd", arg: 2, scope: !3857, file: !294, line: 1000, type: !237)
!3863 = !DILocation(line: 1000, column: 23, scope: !3857)
!3864 = !DILocalVariable(name: "f", scope: !3857, file: !294, line: 1001, type: !1935)
!3865 = !DILocation(line: 1001, column: 15, scope: !3857)
!3866 = !DILocation(line: 1001, column: 30, scope: !3857)
!3867 = !DILocation(line: 1001, column: 19, scope: !3857)
!3868 = !DILocalVariable(name: "ap", scope: !3857, file: !294, line: 1002, type: !3585)
!3869 = !DILocation(line: 1002, column: 11, scope: !3857)
!3870 = !DILocalVariable(name: "arg", scope: !3857, file: !294, line: 1003, type: !208)
!3871 = !DILocation(line: 1003, column: 12, scope: !3857)
!3872 = !DILocalVariable(name: "lock", scope: !3857, file: !294, line: 1004, type: !3873)
!3873 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3874, size: 64)
!3874 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flock", file: !3875, line: 35, size: 256, elements: !3876)
!3875 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/fcntl.h", directory: "", checksumkind: CSK_MD5, checksum: "3ed8466d7581e54a3f782dda83e77be7")
!3876 = !{!3877, !3879, !3880, !3881, !3882}
!3877 = !DIDerivedType(tag: DW_TAG_member, name: "l_type", scope: !3874, file: !3875, line: 37, baseType: !3878, size: 16)
!3878 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!3879 = !DIDerivedType(tag: DW_TAG_member, name: "l_whence", scope: !3874, file: !3875, line: 38, baseType: !3878, size: 16, offset: 16)
!3880 = !DIDerivedType(tag: DW_TAG_member, name: "l_start", scope: !3874, file: !3875, line: 40, baseType: !240, size: 64, offset: 64)
!3881 = !DIDerivedType(tag: DW_TAG_member, name: "l_len", scope: !3874, file: !3875, line: 41, baseType: !240, size: 64, offset: 128)
!3882 = !DIDerivedType(tag: DW_TAG_member, name: "l_pid", scope: !3874, file: !3875, line: 46, baseType: !3883, size: 32, offset: 192)
!3883 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pid_t", file: !224, line: 154, baseType: !237)
!3884 = !DILocation(line: 1004, column: 17, scope: !3857)
!3885 = !DILocation(line: 1006, column: 8, scope: !3886)
!3886 = distinct !DILexicalBlock(scope: !3857, file: !294, line: 1006, column: 7)
!3887 = !DILocation(line: 1006, column: 7, scope: !3857)
!3888 = !DILocation(line: 1007, column: 5, scope: !3889)
!3889 = distinct !DILexicalBlock(scope: !3886, file: !294, line: 1006, column: 11)
!3890 = !DILocation(line: 1007, column: 11, scope: !3889)
!3891 = !DILocation(line: 1008, column: 5, scope: !3889)
!3892 = !DILocation(line: 1011, column: 7, scope: !3893)
!3893 = distinct !DILexicalBlock(scope: !3857, file: !294, line: 1011, column: 7)
!3894 = !DILocation(line: 1011, column: 10, scope: !3893)
!3895 = !DILocation(line: 1011, column: 20, scope: !3893)
!3896 = !DILocation(line: 1016, column: 9, scope: !3897)
!3897 = distinct !DILexicalBlock(scope: !3893, file: !294, line: 1012, column: 41)
!3898 = !DILocation(line: 1017, column: 3, scope: !3897)
!3899 = !DILocation(line: 1017, column: 14, scope: !3900)
!3900 = distinct !DILexicalBlock(scope: !3893, file: !294, line: 1017, column: 14)
!3901 = !DILocation(line: 1017, column: 18, scope: !3900)
!3902 = !DILocation(line: 1017, column: 29, scope: !3900)
!3903 = !DILocation(line: 1018, column: 5, scope: !3904)
!3904 = distinct !DILexicalBlock(scope: !3900, file: !294, line: 1017, column: 67)
!3905 = !DILocation(line: 1019, column: 12, scope: !3904)
!3906 = !DILocation(line: 1019, column: 10, scope: !3904)
!3907 = !DILocation(line: 1020, column: 5, scope: !3904)
!3908 = !DILocation(line: 1021, column: 3, scope: !3904)
!3909 = !DILocation(line: 1022, column: 5, scope: !3910)
!3910 = distinct !DILexicalBlock(scope: !3900, file: !294, line: 1021, column: 10)
!3911 = !DILocation(line: 1023, column: 11, scope: !3910)
!3912 = !DILocation(line: 1023, column: 9, scope: !3910)
!3913 = !DILocation(line: 1024, column: 5, scope: !3910)
!3914 = !DILocation(line: 1027, column: 7, scope: !3915)
!3915 = distinct !DILexicalBlock(scope: !3857, file: !294, line: 1027, column: 7)
!3916 = !DILocation(line: 1027, column: 10, scope: !3915)
!3917 = !DILocation(line: 1027, column: 7, scope: !3857)
!3918 = !DILocation(line: 1028, column: 12, scope: !3919)
!3919 = distinct !DILexicalBlock(scope: !3915, file: !294, line: 1027, column: 17)
!3920 = !DILocation(line: 1028, column: 5, scope: !3919)
!3921 = !DILocalVariable(name: "flags", scope: !3922, file: !294, line: 1030, type: !237)
!3922 = distinct !DILexicalBlock(scope: !3923, file: !294, line: 1029, column: 19)
!3923 = distinct !DILexicalBlock(scope: !3919, file: !294, line: 1028, column: 17)
!3924 = !DILocation(line: 1030, column: 11, scope: !3922)
!3925 = !DILocation(line: 1031, column: 11, scope: !3926)
!3926 = distinct !DILexicalBlock(scope: !3922, file: !294, line: 1031, column: 11)
!3927 = !DILocation(line: 1031, column: 14, scope: !3926)
!3928 = !DILocation(line: 1031, column: 20, scope: !3926)
!3929 = !DILocation(line: 1031, column: 11, scope: !3922)
!3930 = !DILocation(line: 1032, column: 15, scope: !3926)
!3931 = !DILocation(line: 1032, column: 9, scope: !3926)
!3932 = !DILocation(line: 1033, column: 14, scope: !3922)
!3933 = !DILocation(line: 1033, column: 7, scope: !3922)
!3934 = !DILocation(line: 1036, column: 7, scope: !3935)
!3935 = distinct !DILexicalBlock(scope: !3923, file: !294, line: 1035, column: 19)
!3936 = !DILocation(line: 1036, column: 10, scope: !3935)
!3937 = !DILocation(line: 1036, column: 16, scope: !3935)
!3938 = !DILocation(line: 1037, column: 11, scope: !3939)
!3939 = distinct !DILexicalBlock(scope: !3935, file: !294, line: 1037, column: 11)
!3940 = !DILocation(line: 1037, column: 15, scope: !3939)
!3941 = !DILocation(line: 1037, column: 11, scope: !3935)
!3942 = !DILocation(line: 1038, column: 9, scope: !3939)
!3943 = !DILocation(line: 1038, column: 12, scope: !3939)
!3944 = !DILocation(line: 1038, column: 18, scope: !3939)
!3945 = !DILocation(line: 1039, column: 7, scope: !3935)
!3946 = !DILocation(line: 1048, column: 7, scope: !3947)
!3947 = distinct !DILexicalBlock(scope: !3923, file: !294, line: 1041, column: 19)
!3948 = !DILocation(line: 1055, column: 7, scope: !3949)
!3949 = distinct !DILexicalBlock(scope: !3923, file: !294, line: 1054, column: 19)
!3950 = !DILocation(line: 1055, column: 13, scope: !3949)
!3951 = !DILocation(line: 1055, column: 20, scope: !3949)
!3952 = !DILocation(line: 1056, column: 7, scope: !3949)
!3953 = !DILocation(line: 1062, column: 7, scope: !3954)
!3954 = distinct !DILexicalBlock(scope: !3923, file: !294, line: 1061, column: 19)
!3955 = !DILocation(line: 1065, column: 7, scope: !3923)
!3956 = !DILocation(line: 1066, column: 7, scope: !3923)
!3957 = !DILocation(line: 1066, column: 13, scope: !3923)
!3958 = !DILocation(line: 1067, column: 7, scope: !3923)
!3959 = !DILocation(line: 1070, column: 30, scope: !3857)
!3960 = !DILocation(line: 1070, column: 33, scope: !3857)
!3961 = !DILocation(line: 1070, column: 37, scope: !3857)
!3962 = !DILocation(line: 1070, column: 42, scope: !3857)
!3963 = !DILocation(line: 1070, column: 10, scope: !3857)
!3964 = !DILocation(line: 1070, column: 3, scope: !3857)
!3965 = !DILocation(line: 1071, column: 1, scope: !3857)
!3966 = distinct !DISubprogram(name: "__fd_statfs", scope: !294, file: !294, line: 1073, type: !3967, scopeLine: 1073, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!3967 = !DISubroutineType(types: !3968)
!3968 = !{!237, !433, !3969}
!3969 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3970, size: 64)
!3970 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "statfs", file: !3971, line: 24, size: 960, elements: !3972)
!3971 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/statfs.h", directory: "", checksumkind: CSK_MD5, checksum: "4c379ce582232e44e7b8fa7ccdecac58")
!3972 = !{!3973, !3975, !3976, !3978, !3979, !3980, !3982, !3983, !3989, !3990, !3991, !3992}
!3973 = !DIDerivedType(tag: DW_TAG_member, name: "f_type", scope: !3970, file: !3971, line: 26, baseType: !3974, size: 64)
!3974 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsword_t", file: !224, line: 192, baseType: !241)
!3975 = !DIDerivedType(tag: DW_TAG_member, name: "f_bsize", scope: !3970, file: !3971, line: 27, baseType: !3974, size: 64, offset: 64)
!3976 = !DIDerivedType(tag: DW_TAG_member, name: "f_blocks", scope: !3970, file: !3971, line: 29, baseType: !3977, size: 64, offset: 128)
!3977 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsblkcnt_t", file: !224, line: 184, baseType: !225)
!3978 = !DIDerivedType(tag: DW_TAG_member, name: "f_bfree", scope: !3970, file: !3971, line: 30, baseType: !3977, size: 64, offset: 192)
!3979 = !DIDerivedType(tag: DW_TAG_member, name: "f_bavail", scope: !3970, file: !3971, line: 31, baseType: !3977, size: 64, offset: 256)
!3980 = !DIDerivedType(tag: DW_TAG_member, name: "f_files", scope: !3970, file: !3971, line: 32, baseType: !3981, size: 64, offset: 320)
!3981 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsfilcnt_t", file: !224, line: 188, baseType: !225)
!3982 = !DIDerivedType(tag: DW_TAG_member, name: "f_ffree", scope: !3970, file: !3971, line: 33, baseType: !3981, size: 64, offset: 384)
!3983 = !DIDerivedType(tag: DW_TAG_member, name: "f_fsid", scope: !3970, file: !3971, line: 41, baseType: !3984, size: 64, offset: 448)
!3984 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsid_t", file: !224, line: 155, baseType: !3985)
!3985 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !224, line: 155, size: 64, elements: !3986)
!3986 = !{!3987}
!3987 = !DIDerivedType(tag: DW_TAG_member, name: "__val", scope: !3985, file: !224, line: 155, baseType: !3988, size: 64)
!3988 = !DICompositeType(tag: DW_TAG_array_type, baseType: !237, size: 64, elements: !143)
!3989 = !DIDerivedType(tag: DW_TAG_member, name: "f_namelen", scope: !3970, file: !3971, line: 42, baseType: !3974, size: 64, offset: 512)
!3990 = !DIDerivedType(tag: DW_TAG_member, name: "f_frsize", scope: !3970, file: !3971, line: 43, baseType: !3974, size: 64, offset: 576)
!3991 = !DIDerivedType(tag: DW_TAG_member, name: "f_flags", scope: !3970, file: !3971, line: 44, baseType: !3974, size: 64, offset: 640)
!3992 = !DIDerivedType(tag: DW_TAG_member, name: "f_spare", scope: !3970, file: !3971, line: 45, baseType: !3993, size: 256, offset: 704)
!3993 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3974, size: 256, elements: !3994)
!3994 = !{!3995}
!3995 = !DISubrange(count: 4)
!3996 = !DILocalVariable(name: "path", arg: 1, scope: !3966, file: !294, line: 1073, type: !433)
!3997 = !DILocation(line: 1073, column: 29, scope: !3966)
!3998 = !DILocalVariable(name: "buf", arg: 2, scope: !3966, file: !294, line: 1073, type: !3969)
!3999 = !DILocation(line: 1073, column: 50, scope: !3966)
!4000 = !DILocalVariable(name: "dfile", scope: !3966, file: !294, line: 1074, type: !1593)
!4001 = !DILocation(line: 1074, column: 20, scope: !3966)
!4002 = !DILocation(line: 1074, column: 43, scope: !3966)
!4003 = !DILocation(line: 1074, column: 28, scope: !3966)
!4004 = !DILocation(line: 1075, column: 7, scope: !4005)
!4005 = distinct !DILexicalBlock(scope: !3966, file: !294, line: 1075, column: 7)
!4006 = !DILocation(line: 1075, column: 7, scope: !3966)
!4007 = !DILocation(line: 1077, column: 5, scope: !4008)
!4008 = distinct !DILexicalBlock(scope: !4005, file: !294, line: 1075, column: 14)
!4009 = !DILocation(line: 1078, column: 5, scope: !4008)
!4010 = !DILocation(line: 1078, column: 11, scope: !4008)
!4011 = !DILocation(line: 1079, column: 5, scope: !4008)
!4012 = !DILocation(line: 1082, column: 51, scope: !3966)
!4013 = !DILocation(line: 1082, column: 31, scope: !3966)
!4014 = !DILocation(line: 1082, column: 58, scope: !3966)
!4015 = !DILocation(line: 1082, column: 10, scope: !3966)
!4016 = !DILocation(line: 1082, column: 3, scope: !3966)
!4017 = !DILocation(line: 1083, column: 1, scope: !3966)
!4018 = distinct !DISubprogram(name: "fstatfs", scope: !294, file: !294, line: 1085, type: !4019, scopeLine: 1085, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4019 = !DISubroutineType(types: !4020)
!4020 = !{!237, !237, !3969}
!4021 = !DILocalVariable(name: "fd", arg: 1, scope: !4018, file: !294, line: 1085, type: !237)
!4022 = !DILocation(line: 1085, column: 17, scope: !4018)
!4023 = !DILocalVariable(name: "buf", arg: 2, scope: !4018, file: !294, line: 1085, type: !3969)
!4024 = !DILocation(line: 1085, column: 36, scope: !4018)
!4025 = !DILocalVariable(name: "f", scope: !4018, file: !294, line: 1086, type: !1935)
!4026 = !DILocation(line: 1086, column: 15, scope: !4018)
!4027 = !DILocation(line: 1086, column: 30, scope: !4018)
!4028 = !DILocation(line: 1086, column: 19, scope: !4018)
!4029 = !DILocation(line: 1088, column: 8, scope: !4030)
!4030 = distinct !DILexicalBlock(scope: !4018, file: !294, line: 1088, column: 7)
!4031 = !DILocation(line: 1088, column: 7, scope: !4018)
!4032 = !DILocation(line: 1089, column: 5, scope: !4033)
!4033 = distinct !DILexicalBlock(scope: !4030, file: !294, line: 1088, column: 11)
!4034 = !DILocation(line: 1089, column: 11, scope: !4033)
!4035 = !DILocation(line: 1090, column: 5, scope: !4033)
!4036 = !DILocation(line: 1093, column: 7, scope: !4037)
!4037 = distinct !DILexicalBlock(scope: !4018, file: !294, line: 1093, column: 7)
!4038 = !DILocation(line: 1093, column: 10, scope: !4037)
!4039 = !DILocation(line: 1093, column: 7, scope: !4018)
!4040 = !DILocation(line: 1094, column: 5, scope: !4041)
!4041 = distinct !DILexicalBlock(scope: !4037, file: !294, line: 1093, column: 17)
!4042 = !DILocation(line: 1095, column: 5, scope: !4041)
!4043 = !DILocation(line: 1095, column: 11, scope: !4041)
!4044 = !DILocation(line: 1096, column: 5, scope: !4041)
!4045 = !DILocation(line: 1098, column: 32, scope: !4018)
!4046 = !DILocation(line: 1098, column: 35, scope: !4018)
!4047 = !DILocation(line: 1098, column: 39, scope: !4018)
!4048 = !DILocation(line: 1098, column: 10, scope: !4018)
!4049 = !DILocation(line: 1098, column: 3, scope: !4018)
!4050 = !DILocation(line: 1099, column: 1, scope: !4018)
!4051 = distinct !DISubprogram(name: "fsync", scope: !294, file: !294, line: 1101, type: !308, scopeLine: 1101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4052 = !DILocalVariable(name: "fd", arg: 1, scope: !4051, file: !294, line: 1101, type: !237)
!4053 = !DILocation(line: 1101, column: 15, scope: !4051)
!4054 = !DILocalVariable(name: "f", scope: !4051, file: !294, line: 1102, type: !1935)
!4055 = !DILocation(line: 1102, column: 15, scope: !4051)
!4056 = !DILocation(line: 1102, column: 30, scope: !4051)
!4057 = !DILocation(line: 1102, column: 19, scope: !4051)
!4058 = !DILocation(line: 1104, column: 8, scope: !4059)
!4059 = distinct !DILexicalBlock(scope: !4051, file: !294, line: 1104, column: 7)
!4060 = !DILocation(line: 1104, column: 7, scope: !4051)
!4061 = !DILocation(line: 1105, column: 5, scope: !4062)
!4062 = distinct !DILexicalBlock(scope: !4059, file: !294, line: 1104, column: 11)
!4063 = !DILocation(line: 1105, column: 11, scope: !4062)
!4064 = !DILocation(line: 1106, column: 5, scope: !4062)
!4065 = !DILocation(line: 1107, column: 14, scope: !4066)
!4066 = distinct !DILexicalBlock(scope: !4059, file: !294, line: 1107, column: 14)
!4067 = !DILocation(line: 1107, column: 17, scope: !4066)
!4068 = !DILocation(line: 1107, column: 14, scope: !4059)
!4069 = !DILocation(line: 1108, column: 5, scope: !4070)
!4070 = distinct !DILexicalBlock(scope: !4066, file: !294, line: 1107, column: 24)
!4071 = !DILocation(line: 1110, column: 30, scope: !4051)
!4072 = !DILocation(line: 1110, column: 33, scope: !4051)
!4073 = !DILocation(line: 1110, column: 10, scope: !4051)
!4074 = !DILocation(line: 1110, column: 3, scope: !4051)
!4075 = !DILocation(line: 1111, column: 1, scope: !4051)
!4076 = distinct !DISubprogram(name: "dup2", scope: !294, file: !294, line: 1113, type: !4077, scopeLine: 1113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4077 = !DISubroutineType(types: !4078)
!4078 = !{!237, !237, !237}
!4079 = !DILocalVariable(name: "oldfd", arg: 1, scope: !4076, file: !294, line: 1113, type: !237)
!4080 = !DILocation(line: 1113, column: 14, scope: !4076)
!4081 = !DILocalVariable(name: "newfd", arg: 2, scope: !4076, file: !294, line: 1113, type: !237)
!4082 = !DILocation(line: 1113, column: 25, scope: !4076)
!4083 = !DILocalVariable(name: "f", scope: !4076, file: !294, line: 1114, type: !1935)
!4084 = !DILocation(line: 1114, column: 15, scope: !4076)
!4085 = !DILocation(line: 1114, column: 30, scope: !4076)
!4086 = !DILocation(line: 1114, column: 19, scope: !4076)
!4087 = !DILocation(line: 1116, column: 8, scope: !4088)
!4088 = distinct !DILexicalBlock(scope: !4076, file: !294, line: 1116, column: 7)
!4089 = !DILocation(line: 1116, column: 10, scope: !4088)
!4090 = !DILocation(line: 1117, column: 5, scope: !4091)
!4091 = distinct !DILexicalBlock(scope: !4088, file: !294, line: 1116, column: 43)
!4092 = !DILocation(line: 1117, column: 11, scope: !4091)
!4093 = !DILocation(line: 1118, column: 5, scope: !4091)
!4094 = !DILocalVariable(name: "f2", scope: !4095, file: !294, line: 1120, type: !1935)
!4095 = distinct !DILexicalBlock(scope: !4088, file: !294, line: 1119, column: 10)
!4096 = !DILocation(line: 1120, column: 17, scope: !4095)
!4097 = !DILocation(line: 1120, column: 37, scope: !4095)
!4098 = !DILocation(line: 1120, column: 23, scope: !4095)
!4099 = !DILocation(line: 1121, column: 9, scope: !4100)
!4100 = distinct !DILexicalBlock(scope: !4095, file: !294, line: 1121, column: 9)
!4101 = !DILocation(line: 1121, column: 13, scope: !4100)
!4102 = !DILocation(line: 1121, column: 19, scope: !4100)
!4103 = !DILocation(line: 1121, column: 9, scope: !4095)
!4104 = !DILocation(line: 1121, column: 34, scope: !4100)
!4105 = !DILocation(line: 1121, column: 28, scope: !4100)
!4106 = !DILocation(line: 1125, column: 6, scope: !4095)
!4107 = !DILocation(line: 1125, column: 12, scope: !4095)
!4108 = !DILocation(line: 1125, column: 11, scope: !4095)
!4109 = !DILocation(line: 1127, column: 5, scope: !4095)
!4110 = !DILocation(line: 1127, column: 9, scope: !4095)
!4111 = !DILocation(line: 1127, column: 15, scope: !4095)
!4112 = !DILocation(line: 1134, column: 12, scope: !4095)
!4113 = !DILocation(line: 1134, column: 5, scope: !4095)
!4114 = !DILocation(line: 1136, column: 1, scope: !4076)
!4115 = distinct !DISubprogram(name: "dup", scope: !294, file: !294, line: 1138, type: !308, scopeLine: 1138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4116 = !DILocalVariable(name: "oldfd", arg: 1, scope: !4115, file: !294, line: 1138, type: !237)
!4117 = !DILocation(line: 1138, column: 13, scope: !4115)
!4118 = !DILocalVariable(name: "f", scope: !4115, file: !294, line: 1139, type: !1935)
!4119 = !DILocation(line: 1139, column: 15, scope: !4115)
!4120 = !DILocation(line: 1139, column: 30, scope: !4115)
!4121 = !DILocation(line: 1139, column: 19, scope: !4115)
!4122 = !DILocation(line: 1140, column: 8, scope: !4123)
!4123 = distinct !DILexicalBlock(scope: !4115, file: !294, line: 1140, column: 7)
!4124 = !DILocation(line: 1140, column: 7, scope: !4115)
!4125 = !DILocation(line: 1141, column: 5, scope: !4126)
!4126 = distinct !DILexicalBlock(scope: !4123, file: !294, line: 1140, column: 11)
!4127 = !DILocation(line: 1141, column: 11, scope: !4126)
!4128 = !DILocation(line: 1142, column: 5, scope: !4126)
!4129 = !DILocalVariable(name: "fd", scope: !4130, file: !294, line: 1144, type: !237)
!4130 = distinct !DILexicalBlock(scope: !4123, file: !294, line: 1143, column: 10)
!4131 = !DILocation(line: 1144, column: 9, scope: !4130)
!4132 = !DILocation(line: 1145, column: 13, scope: !4133)
!4133 = distinct !DILexicalBlock(scope: !4130, file: !294, line: 1145, column: 5)
!4134 = !DILocation(line: 1145, column: 10, scope: !4133)
!4135 = !DILocation(line: 1145, column: 18, scope: !4136)
!4136 = distinct !DILexicalBlock(scope: !4133, file: !294, line: 1145, column: 5)
!4137 = !DILocation(line: 1145, column: 21, scope: !4136)
!4138 = !DILocation(line: 1145, column: 5, scope: !4133)
!4139 = !DILocation(line: 1146, column: 27, scope: !4140)
!4140 = distinct !DILexicalBlock(scope: !4136, file: !294, line: 1146, column: 11)
!4141 = !DILocation(line: 1146, column: 13, scope: !4140)
!4142 = !DILocation(line: 1146, column: 31, scope: !4140)
!4143 = !DILocation(line: 1146, column: 37, scope: !4140)
!4144 = !DILocation(line: 1146, column: 11, scope: !4136)
!4145 = !DILocation(line: 1145, column: 32, scope: !4136)
!4146 = !DILocation(line: 1145, column: 5, scope: !4136)
!4147 = distinct !{!4147, !4138, !4148}
!4148 = !DILocation(line: 1147, column: 9, scope: !4133)
!4149 = !DILocation(line: 1148, column: 9, scope: !4150)
!4150 = distinct !DILexicalBlock(scope: !4130, file: !294, line: 1148, column: 9)
!4151 = !DILocation(line: 1148, column: 12, scope: !4150)
!4152 = !DILocation(line: 1148, column: 9, scope: !4130)
!4153 = !DILocation(line: 1149, column: 7, scope: !4154)
!4154 = distinct !DILexicalBlock(scope: !4150, file: !294, line: 1148, column: 24)
!4155 = !DILocation(line: 1149, column: 13, scope: !4154)
!4156 = !DILocation(line: 1150, column: 7, scope: !4154)
!4157 = !DILocation(line: 1152, column: 19, scope: !4158)
!4158 = distinct !DILexicalBlock(scope: !4150, file: !294, line: 1151, column: 12)
!4159 = !DILocation(line: 1152, column: 26, scope: !4158)
!4160 = !DILocation(line: 1152, column: 14, scope: !4158)
!4161 = !DILocation(line: 1152, column: 7, scope: !4158)
!4162 = !DILocation(line: 1155, column: 1, scope: !4115)
!4163 = distinct !DISubprogram(name: "rmdir", scope: !294, file: !294, line: 1157, type: !3005, scopeLine: 1157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4164 = !DILocalVariable(name: "pathname", arg: 1, scope: !4163, file: !294, line: 1157, type: !433)
!4165 = !DILocation(line: 1157, column: 23, scope: !4163)
!4166 = !DILocalVariable(name: "dfile", scope: !4163, file: !294, line: 1158, type: !1593)
!4167 = !DILocation(line: 1158, column: 20, scope: !4163)
!4168 = !DILocation(line: 1158, column: 43, scope: !4163)
!4169 = !DILocation(line: 1158, column: 28, scope: !4163)
!4170 = !DILocation(line: 1159, column: 7, scope: !4171)
!4171 = distinct !DILexicalBlock(scope: !4163, file: !294, line: 1159, column: 7)
!4172 = !DILocation(line: 1159, column: 7, scope: !4163)
!4173 = !DILocation(line: 1161, column: 9, scope: !4174)
!4174 = distinct !DILexicalBlock(scope: !4175, file: !294, line: 1161, column: 9)
!4175 = distinct !DILexicalBlock(scope: !4171, file: !294, line: 1159, column: 14)
!4176 = !DILocation(line: 1161, column: 9, scope: !4175)
!4177 = !DILocation(line: 1162, column: 7, scope: !4178)
!4178 = distinct !DILexicalBlock(scope: !4174, file: !294, line: 1161, column: 40)
!4179 = !DILocation(line: 1162, column: 14, scope: !4178)
!4180 = !DILocation(line: 1162, column: 20, scope: !4178)
!4181 = !DILocation(line: 1162, column: 27, scope: !4178)
!4182 = !DILocation(line: 1163, column: 7, scope: !4178)
!4183 = !DILocation(line: 1165, column: 7, scope: !4184)
!4184 = distinct !DILexicalBlock(scope: !4174, file: !294, line: 1164, column: 12)
!4185 = !DILocation(line: 1165, column: 13, scope: !4184)
!4186 = !DILocation(line: 1166, column: 7, scope: !4184)
!4187 = !DILocation(line: 1170, column: 3, scope: !4163)
!4188 = !DILocation(line: 1171, column: 3, scope: !4163)
!4189 = !DILocation(line: 1171, column: 9, scope: !4163)
!4190 = !DILocation(line: 1172, column: 3, scope: !4163)
!4191 = !DILocation(line: 1173, column: 1, scope: !4163)
!4192 = distinct !DISubprogram(name: "unlink", scope: !294, file: !294, line: 1175, type: !3005, scopeLine: 1175, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4193 = !DILocalVariable(name: "pathname", arg: 1, scope: !4192, file: !294, line: 1175, type: !433)
!4194 = !DILocation(line: 1175, column: 24, scope: !4192)
!4195 = !DILocalVariable(name: "dfile", scope: !4192, file: !294, line: 1176, type: !1593)
!4196 = !DILocation(line: 1176, column: 20, scope: !4192)
!4197 = !DILocation(line: 1176, column: 43, scope: !4192)
!4198 = !DILocation(line: 1176, column: 28, scope: !4192)
!4199 = !DILocation(line: 1177, column: 7, scope: !4200)
!4200 = distinct !DILexicalBlock(scope: !4192, file: !294, line: 1177, column: 7)
!4201 = !DILocation(line: 1177, column: 7, scope: !4192)
!4202 = !DILocation(line: 1179, column: 9, scope: !4203)
!4203 = distinct !DILexicalBlock(scope: !4204, file: !294, line: 1179, column: 9)
!4204 = distinct !DILexicalBlock(scope: !4200, file: !294, line: 1177, column: 14)
!4205 = !DILocation(line: 1179, column: 9, scope: !4204)
!4206 = !DILocation(line: 1180, column: 7, scope: !4207)
!4207 = distinct !DILexicalBlock(scope: !4203, file: !294, line: 1179, column: 40)
!4208 = !DILocation(line: 1180, column: 14, scope: !4207)
!4209 = !DILocation(line: 1180, column: 20, scope: !4207)
!4210 = !DILocation(line: 1180, column: 27, scope: !4207)
!4211 = !DILocation(line: 1181, column: 7, scope: !4207)
!4212 = !DILocation(line: 1182, column: 16, scope: !4213)
!4213 = distinct !DILexicalBlock(scope: !4203, file: !294, line: 1182, column: 16)
!4214 = !DILocation(line: 1182, column: 16, scope: !4203)
!4215 = !DILocation(line: 1183, column: 7, scope: !4216)
!4216 = distinct !DILexicalBlock(scope: !4213, file: !294, line: 1182, column: 47)
!4217 = !DILocation(line: 1183, column: 13, scope: !4216)
!4218 = !DILocation(line: 1184, column: 7, scope: !4216)
!4219 = !DILocation(line: 1186, column: 7, scope: !4220)
!4220 = distinct !DILexicalBlock(scope: !4213, file: !294, line: 1185, column: 12)
!4221 = !DILocation(line: 1186, column: 13, scope: !4220)
!4222 = !DILocation(line: 1187, column: 7, scope: !4220)
!4223 = !DILocation(line: 1191, column: 3, scope: !4192)
!4224 = !DILocation(line: 1192, column: 3, scope: !4192)
!4225 = !DILocation(line: 1192, column: 9, scope: !4192)
!4226 = !DILocation(line: 1193, column: 3, scope: !4192)
!4227 = !DILocation(line: 1194, column: 1, scope: !4192)
!4228 = distinct !DISubprogram(name: "unlinkat", scope: !294, file: !294, line: 1196, type: !4229, scopeLine: 1196, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4229 = !DISubroutineType(types: !4230)
!4230 = !{!237, !237, !433, !237}
!4231 = !DILocalVariable(name: "dirfd", arg: 1, scope: !4228, file: !294, line: 1196, type: !237)
!4232 = !DILocation(line: 1196, column: 18, scope: !4228)
!4233 = !DILocalVariable(name: "pathname", arg: 2, scope: !4228, file: !294, line: 1196, type: !433)
!4234 = !DILocation(line: 1196, column: 37, scope: !4228)
!4235 = !DILocalVariable(name: "flags", arg: 3, scope: !4228, file: !294, line: 1196, type: !237)
!4236 = !DILocation(line: 1196, column: 51, scope: !4228)
!4237 = !DILocalVariable(name: "dfile", scope: !4228, file: !294, line: 1199, type: !1593)
!4238 = !DILocation(line: 1199, column: 20, scope: !4228)
!4239 = !DILocation(line: 1199, column: 43, scope: !4228)
!4240 = !DILocation(line: 1199, column: 28, scope: !4228)
!4241 = !DILocation(line: 1200, column: 7, scope: !4242)
!4242 = distinct !DILexicalBlock(scope: !4228, file: !294, line: 1200, column: 7)
!4243 = !DILocation(line: 1200, column: 7, scope: !4228)
!4244 = !DILocation(line: 1202, column: 9, scope: !4245)
!4245 = distinct !DILexicalBlock(scope: !4246, file: !294, line: 1202, column: 9)
!4246 = distinct !DILexicalBlock(scope: !4242, file: !294, line: 1200, column: 14)
!4247 = !DILocation(line: 1202, column: 9, scope: !4246)
!4248 = !DILocation(line: 1203, column: 7, scope: !4249)
!4249 = distinct !DILexicalBlock(scope: !4245, file: !294, line: 1202, column: 40)
!4250 = !DILocation(line: 1203, column: 14, scope: !4249)
!4251 = !DILocation(line: 1203, column: 20, scope: !4249)
!4252 = !DILocation(line: 1203, column: 27, scope: !4249)
!4253 = !DILocation(line: 1204, column: 7, scope: !4249)
!4254 = !DILocation(line: 1205, column: 16, scope: !4255)
!4255 = distinct !DILexicalBlock(scope: !4245, file: !294, line: 1205, column: 16)
!4256 = !DILocation(line: 1205, column: 16, scope: !4245)
!4257 = !DILocation(line: 1206, column: 7, scope: !4258)
!4258 = distinct !DILexicalBlock(scope: !4255, file: !294, line: 1205, column: 47)
!4259 = !DILocation(line: 1206, column: 13, scope: !4258)
!4260 = !DILocation(line: 1207, column: 7, scope: !4258)
!4261 = !DILocation(line: 1209, column: 7, scope: !4262)
!4262 = distinct !DILexicalBlock(scope: !4255, file: !294, line: 1208, column: 12)
!4263 = !DILocation(line: 1209, column: 13, scope: !4262)
!4264 = !DILocation(line: 1210, column: 7, scope: !4262)
!4265 = !DILocation(line: 1214, column: 3, scope: !4228)
!4266 = !DILocation(line: 1215, column: 3, scope: !4228)
!4267 = !DILocation(line: 1215, column: 9, scope: !4228)
!4268 = !DILocation(line: 1216, column: 3, scope: !4228)
!4269 = !DILocation(line: 1217, column: 1, scope: !4228)
!4270 = distinct !DISubprogram(name: "readlink", scope: !294, file: !294, line: 1219, type: !4271, scopeLine: 1219, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4271 = !DISubroutineType(types: !4272)
!4272 = !{!377, !433, !216, !379}
!4273 = !DILocalVariable(name: "path", arg: 1, scope: !4270, file: !294, line: 1219, type: !433)
!4274 = !DILocation(line: 1219, column: 30, scope: !4270)
!4275 = !DILocalVariable(name: "buf", arg: 2, scope: !4270, file: !294, line: 1219, type: !216)
!4276 = !DILocation(line: 1219, column: 42, scope: !4270)
!4277 = !DILocalVariable(name: "bufsize", arg: 3, scope: !4270, file: !294, line: 1219, type: !379)
!4278 = !DILocation(line: 1219, column: 54, scope: !4270)
!4279 = !DILocalVariable(name: "dfile", scope: !4270, file: !294, line: 1220, type: !1593)
!4280 = !DILocation(line: 1220, column: 20, scope: !4270)
!4281 = !DILocation(line: 1220, column: 43, scope: !4270)
!4282 = !DILocation(line: 1220, column: 28, scope: !4270)
!4283 = !DILocation(line: 1221, column: 7, scope: !4284)
!4284 = distinct !DILexicalBlock(scope: !4270, file: !294, line: 1221, column: 7)
!4285 = !DILocation(line: 1221, column: 7, scope: !4270)
!4286 = !DILocation(line: 1224, column: 9, scope: !4287)
!4287 = distinct !DILexicalBlock(scope: !4288, file: !294, line: 1224, column: 9)
!4288 = distinct !DILexicalBlock(scope: !4284, file: !294, line: 1221, column: 14)
!4289 = !DILocation(line: 1224, column: 9, scope: !4288)
!4290 = !DILocation(line: 1225, column: 16, scope: !4291)
!4291 = distinct !DILexicalBlock(scope: !4287, file: !294, line: 1224, column: 40)
!4292 = !DILocation(line: 1225, column: 7, scope: !4291)
!4293 = !DILocation(line: 1225, column: 14, scope: !4291)
!4294 = !DILocation(line: 1226, column: 11, scope: !4295)
!4295 = distinct !DILexicalBlock(scope: !4291, file: !294, line: 1226, column: 11)
!4296 = !DILocation(line: 1226, column: 18, scope: !4295)
!4297 = !DILocation(line: 1226, column: 11, scope: !4291)
!4298 = !DILocation(line: 1226, column: 22, scope: !4295)
!4299 = !DILocation(line: 1226, column: 29, scope: !4295)
!4300 = !DILocation(line: 1227, column: 11, scope: !4301)
!4301 = distinct !DILexicalBlock(scope: !4291, file: !294, line: 1227, column: 11)
!4302 = !DILocation(line: 1227, column: 18, scope: !4301)
!4303 = !DILocation(line: 1227, column: 11, scope: !4291)
!4304 = !DILocation(line: 1227, column: 22, scope: !4301)
!4305 = !DILocation(line: 1227, column: 29, scope: !4301)
!4306 = !DILocation(line: 1228, column: 11, scope: !4307)
!4307 = distinct !DILexicalBlock(scope: !4291, file: !294, line: 1228, column: 11)
!4308 = !DILocation(line: 1228, column: 18, scope: !4307)
!4309 = !DILocation(line: 1228, column: 11, scope: !4291)
!4310 = !DILocation(line: 1228, column: 22, scope: !4307)
!4311 = !DILocation(line: 1228, column: 29, scope: !4307)
!4312 = !DILocation(line: 1229, column: 11, scope: !4313)
!4313 = distinct !DILexicalBlock(scope: !4291, file: !294, line: 1229, column: 11)
!4314 = !DILocation(line: 1229, column: 18, scope: !4313)
!4315 = !DILocation(line: 1229, column: 11, scope: !4291)
!4316 = !DILocation(line: 1229, column: 22, scope: !4313)
!4317 = !DILocation(line: 1229, column: 29, scope: !4313)
!4318 = !DILocation(line: 1230, column: 15, scope: !4291)
!4319 = !DILocation(line: 1230, column: 22, scope: !4291)
!4320 = !DILocation(line: 1230, column: 14, scope: !4291)
!4321 = !DILocation(line: 1230, column: 7, scope: !4291)
!4322 = !DILocation(line: 1232, column: 7, scope: !4323)
!4323 = distinct !DILexicalBlock(scope: !4287, file: !294, line: 1231, column: 12)
!4324 = !DILocation(line: 1232, column: 13, scope: !4323)
!4325 = !DILocation(line: 1233, column: 7, scope: !4323)
!4326 = !DILocation(line: 1236, column: 33, scope: !4270)
!4327 = !DILocation(line: 1236, column: 39, scope: !4270)
!4328 = !DILocation(line: 1236, column: 44, scope: !4270)
!4329 = !DILocation(line: 1236, column: 10, scope: !4270)
!4330 = !DILocation(line: 1236, column: 3, scope: !4270)
!4331 = !DILocation(line: 1237, column: 1, scope: !4270)
!4332 = distinct !DISubprogram(name: "select", scope: !294, file: !294, line: 1247, type: !4333, scopeLine: 1248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4333 = !DISubroutineType(types: !4334)
!4334 = !{!237, !237, !4335, !4335, !4335, !4343}
!4335 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4336, size: 64)
!4336 = !DIDerivedType(tag: DW_TAG_typedef, name: "fd_set", file: !4337, line: 70, baseType: !4338)
!4337 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/select.h", directory: "", checksumkind: CSK_MD5, checksum: "5ab727ca201ba12ae255687119da3fa7")
!4338 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !4337, line: 59, size: 1024, elements: !4339)
!4339 = !{!4340}
!4340 = !DIDerivedType(tag: DW_TAG_member, name: "fds_bits", scope: !4338, file: !4337, line: 64, baseType: !4341, size: 1024)
!4341 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4342, size: 1024, elements: !505)
!4342 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fd_mask", file: !4337, line: 49, baseType: !241)
!4343 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2311, size: 64)
!4344 = !DILocalVariable(name: "nfds", arg: 1, scope: !4332, file: !294, line: 1247, type: !237)
!4345 = !DILocation(line: 1247, column: 16, scope: !4332)
!4346 = !DILocalVariable(name: "read", arg: 2, scope: !4332, file: !294, line: 1247, type: !4335)
!4347 = !DILocation(line: 1247, column: 30, scope: !4332)
!4348 = !DILocalVariable(name: "write", arg: 3, scope: !4332, file: !294, line: 1247, type: !4335)
!4349 = !DILocation(line: 1247, column: 44, scope: !4332)
!4350 = !DILocalVariable(name: "except", arg: 4, scope: !4332, file: !294, line: 1248, type: !4335)
!4351 = !DILocation(line: 1248, column: 20, scope: !4332)
!4352 = !DILocalVariable(name: "timeout", arg: 5, scope: !4332, file: !294, line: 1248, type: !4343)
!4353 = !DILocation(line: 1248, column: 44, scope: !4332)
!4354 = !DILocalVariable(name: "in_read", scope: !4332, file: !294, line: 1249, type: !4336)
!4355 = !DILocation(line: 1249, column: 10, scope: !4332)
!4356 = !DILocalVariable(name: "in_write", scope: !4332, file: !294, line: 1249, type: !4336)
!4357 = !DILocation(line: 1249, column: 19, scope: !4332)
!4358 = !DILocalVariable(name: "in_except", scope: !4332, file: !294, line: 1249, type: !4336)
!4359 = !DILocation(line: 1249, column: 29, scope: !4332)
!4360 = !DILocalVariable(name: "os_read", scope: !4332, file: !294, line: 1249, type: !4336)
!4361 = !DILocation(line: 1249, column: 40, scope: !4332)
!4362 = !DILocalVariable(name: "os_write", scope: !4332, file: !294, line: 1249, type: !4336)
!4363 = !DILocation(line: 1249, column: 49, scope: !4332)
!4364 = !DILocalVariable(name: "os_except", scope: !4332, file: !294, line: 1249, type: !4336)
!4365 = !DILocation(line: 1249, column: 59, scope: !4332)
!4366 = !DILocalVariable(name: "i", scope: !4332, file: !294, line: 1250, type: !237)
!4367 = !DILocation(line: 1250, column: 7, scope: !4332)
!4368 = !DILocalVariable(name: "count", scope: !4332, file: !294, line: 1250, type: !237)
!4369 = !DILocation(line: 1250, column: 10, scope: !4332)
!4370 = !DILocalVariable(name: "os_nfds", scope: !4332, file: !294, line: 1250, type: !237)
!4371 = !DILocation(line: 1250, column: 21, scope: !4332)
!4372 = !DILocation(line: 1252, column: 7, scope: !4373)
!4373 = distinct !DILexicalBlock(scope: !4332, file: !294, line: 1252, column: 7)
!4374 = !DILocation(line: 1252, column: 7, scope: !4332)
!4375 = !DILocation(line: 1253, column: 16, scope: !4376)
!4376 = distinct !DILexicalBlock(scope: !4373, file: !294, line: 1252, column: 13)
!4377 = !DILocation(line: 1253, column: 15, scope: !4376)
!4378 = !DILocation(line: 1254, column: 5, scope: !4376)
!4379 = !DILocation(line: 1255, column: 3, scope: !4376)
!4380 = !DILocation(line: 1256, column: 5, scope: !4381)
!4381 = distinct !DILexicalBlock(scope: !4373, file: !294, line: 1255, column: 10)
!4382 = !DILocation(line: 1259, column: 7, scope: !4383)
!4383 = distinct !DILexicalBlock(scope: !4332, file: !294, line: 1259, column: 7)
!4384 = !DILocation(line: 1259, column: 7, scope: !4332)
!4385 = !DILocation(line: 1260, column: 17, scope: !4386)
!4386 = distinct !DILexicalBlock(scope: !4383, file: !294, line: 1259, column: 14)
!4387 = !DILocation(line: 1260, column: 16, scope: !4386)
!4388 = !DILocation(line: 1261, column: 5, scope: !4386)
!4389 = !DILocation(line: 1262, column: 3, scope: !4386)
!4390 = !DILocation(line: 1263, column: 5, scope: !4391)
!4391 = distinct !DILexicalBlock(scope: !4383, file: !294, line: 1262, column: 10)
!4392 = !DILocation(line: 1266, column: 7, scope: !4393)
!4393 = distinct !DILexicalBlock(scope: !4332, file: !294, line: 1266, column: 7)
!4394 = !DILocation(line: 1266, column: 7, scope: !4332)
!4395 = !DILocation(line: 1267, column: 18, scope: !4396)
!4396 = distinct !DILexicalBlock(scope: !4393, file: !294, line: 1266, column: 15)
!4397 = !DILocation(line: 1267, column: 17, scope: !4396)
!4398 = !DILocation(line: 1268, column: 5, scope: !4396)
!4399 = !DILocation(line: 1269, column: 3, scope: !4396)
!4400 = !DILocation(line: 1270, column: 5, scope: !4401)
!4401 = distinct !DILexicalBlock(scope: !4393, file: !294, line: 1269, column: 10)
!4402 = !DILocation(line: 1273, column: 3, scope: !4332)
!4403 = !DILocation(line: 1274, column: 3, scope: !4332)
!4404 = !DILocation(line: 1275, column: 3, scope: !4332)
!4405 = !DILocation(line: 1278, column: 9, scope: !4406)
!4406 = distinct !DILexicalBlock(scope: !4332, file: !294, line: 1278, column: 3)
!4407 = !DILocation(line: 1278, column: 8, scope: !4406)
!4408 = !DILocation(line: 1278, column: 13, scope: !4409)
!4409 = distinct !DILexicalBlock(scope: !4406, file: !294, line: 1278, column: 3)
!4410 = !DILocation(line: 1278, column: 15, scope: !4409)
!4411 = !DILocation(line: 1278, column: 14, scope: !4409)
!4412 = !DILocation(line: 1278, column: 3, scope: !4406)
!4413 = !DILocation(line: 1279, column: 9, scope: !4414)
!4414 = distinct !DILexicalBlock(scope: !4415, file: !294, line: 1279, column: 9)
!4415 = distinct !DILexicalBlock(scope: !4409, file: !294, line: 1278, column: 26)
!4416 = !{!"True"}
!4417 = !DILocation(line: 1279, column: 31, scope: !4414)
!4418 = !DILocation(line: 1279, column: 34, scope: !4414)
!4419 = !DILocation(line: 1279, column: 57, scope: !4414)
!4420 = !DILocation(line: 1279, column: 60, scope: !4414)
!4421 = !DILocation(line: 1279, column: 9, scope: !4415)
!4422 = !DILocalVariable(name: "f", scope: !4423, file: !294, line: 1280, type: !1935)
!4423 = distinct !DILexicalBlock(scope: !4414, file: !294, line: 1279, column: 85)
!4424 = !DILocation(line: 1280, column: 19, scope: !4423)
!4425 = !DILocation(line: 1280, column: 34, scope: !4423)
!4426 = !DILocation(line: 1280, column: 23, scope: !4423)
!4427 = !DILocation(line: 1281, column: 12, scope: !4428)
!4428 = distinct !DILexicalBlock(scope: !4423, file: !294, line: 1281, column: 11)
!4429 = !DILocation(line: 1281, column: 11, scope: !4423)
!4430 = !DILocation(line: 1282, column: 9, scope: !4431)
!4431 = distinct !DILexicalBlock(scope: !4428, file: !294, line: 1281, column: 15)
!4432 = !DILocation(line: 1282, column: 15, scope: !4431)
!4433 = !DILocation(line: 1283, column: 9, scope: !4431)
!4434 = !DILocation(line: 1284, column: 18, scope: !4435)
!4435 = distinct !DILexicalBlock(scope: !4428, file: !294, line: 1284, column: 18)
!4436 = !DILocation(line: 1284, column: 21, scope: !4435)
!4437 = !DILocation(line: 1284, column: 18, scope: !4428)
!4438 = !DILocation(line: 1286, column: 13, scope: !4439)
!4439 = distinct !DILexicalBlock(scope: !4440, file: !294, line: 1286, column: 13)
!4440 = distinct !DILexicalBlock(scope: !4435, file: !294, line: 1284, column: 28)
!4441 = !DILocation(line: 1286, column: 13, scope: !4440)
!4442 = !DILocation(line: 1286, column: 36, scope: !4439)
!4443 = !DILocation(line: 1287, column: 13, scope: !4444)
!4444 = distinct !DILexicalBlock(scope: !4440, file: !294, line: 1287, column: 13)
!4445 = !DILocation(line: 1287, column: 13, scope: !4440)
!4446 = !DILocation(line: 1287, column: 37, scope: !4444)
!4447 = !DILocation(line: 1288, column: 13, scope: !4448)
!4448 = distinct !DILexicalBlock(scope: !4440, file: !294, line: 1288, column: 13)
!4449 = !DILocation(line: 1288, column: 13, scope: !4440)
!4450 = !DILocation(line: 1288, column: 38, scope: !4448)
!4451 = !DILocation(line: 1289, column: 9, scope: !4440)
!4452 = !DILocation(line: 1290, column: 7, scope: !4440)
!4453 = !DILocation(line: 1291, column: 13, scope: !4454)
!4454 = distinct !DILexicalBlock(scope: !4455, file: !294, line: 1291, column: 13)
!4455 = distinct !DILexicalBlock(scope: !4435, file: !294, line: 1290, column: 14)
!4456 = !DILocation(line: 1291, column: 13, scope: !4455)
!4457 = !DILocation(line: 1291, column: 36, scope: !4454)
!4458 = !DILocation(line: 1292, column: 13, scope: !4459)
!4459 = distinct !DILexicalBlock(scope: !4455, file: !294, line: 1292, column: 13)
!4460 = !DILocation(line: 1292, column: 13, scope: !4455)
!4461 = !DILocation(line: 1292, column: 37, scope: !4459)
!4462 = !DILocation(line: 1293, column: 13, scope: !4463)
!4463 = distinct !DILexicalBlock(scope: !4455, file: !294, line: 1293, column: 13)
!4464 = !DILocation(line: 1293, column: 13, scope: !4455)
!4465 = !DILocation(line: 1293, column: 38, scope: !4463)
!4466 = !DILocation(line: 1294, column: 13, scope: !4467)
!4467 = distinct !DILexicalBlock(scope: !4455, file: !294, line: 1294, column: 13)
!4468 = !DILocation(line: 1294, column: 16, scope: !4467)
!4469 = !DILocation(line: 1294, column: 22, scope: !4467)
!4470 = !DILocation(line: 1294, column: 19, scope: !4467)
!4471 = !DILocation(line: 1294, column: 13, scope: !4455)
!4472 = !DILocation(line: 1294, column: 41, scope: !4467)
!4473 = !DILocation(line: 1294, column: 44, scope: !4467)
!4474 = !DILocation(line: 1294, column: 47, scope: !4467)
!4475 = !DILocation(line: 1294, column: 39, scope: !4467)
!4476 = !DILocation(line: 1294, column: 31, scope: !4467)
!4477 = !DILocation(line: 1278, column: 22, scope: !4409)
!4478 = !DILocation(line: 1278, column: 3, scope: !4409)
!4479 = distinct !{!4479, !4412, !4480}
!4480 = !DILocation(line: 1297, column: 3, scope: !4406)
!4481 = !DILocation(line: 1299, column: 7, scope: !4482)
!4482 = distinct !DILexicalBlock(scope: !4332, file: !294, line: 1299, column: 7)
!4483 = !DILocation(line: 1299, column: 15, scope: !4482)
!4484 = !DILocation(line: 1299, column: 7, scope: !4332)
!4485 = !DILocalVariable(name: "tv", scope: !4486, file: !294, line: 1302, type: !2311)
!4486 = distinct !DILexicalBlock(scope: !4482, file: !294, line: 1299, column: 20)
!4487 = !DILocation(line: 1302, column: 20, scope: !4486)
!4488 = !DILocalVariable(name: "r", scope: !4486, file: !294, line: 1303, type: !237)
!4489 = !DILocation(line: 1303, column: 9, scope: !4486)
!4490 = !DILocation(line: 1303, column: 34, scope: !4486)
!4491 = !DILocation(line: 1303, column: 13, scope: !4486)
!4492 = !DILocation(line: 1306, column: 9, scope: !4493)
!4493 = distinct !DILexicalBlock(scope: !4486, file: !294, line: 1306, column: 9)
!4494 = !DILocation(line: 1306, column: 11, scope: !4493)
!4495 = !DILocation(line: 1306, column: 9, scope: !4486)
!4496 = !DILocation(line: 1309, column: 12, scope: !4497)
!4497 = distinct !DILexicalBlock(scope: !4498, file: !294, line: 1309, column: 11)
!4498 = distinct !DILexicalBlock(scope: !4493, file: !294, line: 1306, column: 18)
!4499 = !DILocation(line: 1309, column: 11, scope: !4498)
!4500 = !DILocation(line: 1310, column: 9, scope: !4497)
!4501 = !DILocation(line: 1312, column: 16, scope: !4502)
!4502 = distinct !DILexicalBlock(scope: !4493, file: !294, line: 1311, column: 12)
!4503 = !DILocation(line: 1312, column: 13, scope: !4502)
!4504 = !DILocation(line: 1315, column: 13, scope: !4505)
!4505 = distinct !DILexicalBlock(scope: !4502, file: !294, line: 1315, column: 7)
!4506 = !DILocation(line: 1315, column: 12, scope: !4505)
!4507 = !DILocation(line: 1315, column: 17, scope: !4508)
!4508 = distinct !DILexicalBlock(scope: !4505, file: !294, line: 1315, column: 7)
!4509 = !DILocation(line: 1315, column: 19, scope: !4508)
!4510 = !DILocation(line: 1315, column: 18, scope: !4508)
!4511 = !DILocation(line: 1315, column: 7, scope: !4505)
!4512 = !DILocalVariable(name: "f", scope: !4513, file: !294, line: 1316, type: !1935)
!4513 = distinct !DILexicalBlock(scope: !4508, file: !294, line: 1315, column: 30)
!4514 = !DILocation(line: 1316, column: 21, scope: !4513)
!4515 = !DILocation(line: 1316, column: 36, scope: !4513)
!4516 = !DILocation(line: 1316, column: 25, scope: !4513)
!4517 = !DILocation(line: 1317, column: 13, scope: !4518)
!4518 = distinct !DILexicalBlock(scope: !4513, file: !294, line: 1317, column: 13)
!4519 = !DILocation(line: 1317, column: 15, scope: !4518)
!4520 = !DILocation(line: 1317, column: 19, scope: !4518)
!4521 = !DILocation(line: 1317, column: 22, scope: !4518)
!4522 = !DILocation(line: 1317, column: 13, scope: !4513)
!4523 = !DILocation(line: 1318, column: 15, scope: !4524)
!4524 = distinct !DILexicalBlock(scope: !4525, file: !294, line: 1318, column: 15)
!4525 = distinct !DILexicalBlock(scope: !4518, file: !294, line: 1317, column: 29)
!4526 = !DILocation(line: 1318, column: 20, scope: !4524)
!4527 = !DILocation(line: 1318, column: 23, scope: !4524)
!4528 = !DILocation(line: 1318, column: 15, scope: !4525)
!4529 = !DILocation(line: 1318, column: 50, scope: !4524)
!4530 = !DILocation(line: 1319, column: 15, scope: !4531)
!4531 = distinct !DILexicalBlock(scope: !4525, file: !294, line: 1319, column: 15)
!4532 = !DILocation(line: 1319, column: 21, scope: !4531)
!4533 = !DILocation(line: 1319, column: 24, scope: !4531)
!4534 = !DILocation(line: 1319, column: 15, scope: !4525)
!4535 = !DILocation(line: 1319, column: 52, scope: !4531)
!4536 = !DILocation(line: 1320, column: 15, scope: !4537)
!4537 = distinct !DILexicalBlock(scope: !4525, file: !294, line: 1320, column: 15)
!4538 = !DILocation(line: 1320, column: 22, scope: !4537)
!4539 = !DILocation(line: 1320, column: 25, scope: !4537)
!4540 = !DILocation(line: 1320, column: 15, scope: !4525)
!4541 = !DILocation(line: 1320, column: 54, scope: !4537)
!4542 = !DILocation(line: 1315, column: 26, scope: !4508)
!4543 = !DILocation(line: 1315, column: 7, scope: !4508)
!4544 = distinct !{!4544, !4511, !4545}
!4545 = !DILocation(line: 1322, column: 7, scope: !4505)
!4546 = !DILocation(line: 1326, column: 10, scope: !4332)
!4547 = !DILocation(line: 1326, column: 3, scope: !4332)
!4548 = !DILocation(line: 1327, column: 1, scope: !4332)
!4549 = distinct !DISubprogram(name: "chroot", scope: !294, file: !294, line: 1417, type: !3005, scopeLine: 1417, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !310, retainedNodes: !381)
!4550 = !DILocalVariable(name: "path", arg: 1, scope: !4549, file: !294, line: 1417, type: !433)
!4551 = !DILocation(line: 1417, column: 24, scope: !4549)
!4552 = !DILocation(line: 1418, column: 7, scope: !4553)
!4553 = distinct !DILexicalBlock(scope: !4549, file: !294, line: 1418, column: 7)
!4554 = !DILocation(line: 1418, column: 15, scope: !4553)
!4555 = !DILocation(line: 1418, column: 7, scope: !4549)
!4556 = !DILocation(line: 1419, column: 5, scope: !4557)
!4557 = distinct !DILexicalBlock(scope: !4553, file: !294, line: 1418, column: 24)
!4558 = !DILocation(line: 1419, column: 11, scope: !4557)
!4559 = !DILocation(line: 1420, column: 5, scope: !4557)
!4560 = !DILocation(line: 1423, column: 7, scope: !4561)
!4561 = distinct !DILexicalBlock(scope: !4549, file: !294, line: 1423, column: 7)
!4562 = !DILocation(line: 1423, column: 15, scope: !4561)
!4563 = !DILocation(line: 1423, column: 22, scope: !4561)
!4564 = !DILocation(line: 1423, column: 25, scope: !4561)
!4565 = !DILocation(line: 1423, column: 33, scope: !4561)
!4566 = !DILocation(line: 1423, column: 7, scope: !4549)
!4567 = !DILocation(line: 1424, column: 5, scope: !4568)
!4568 = distinct !DILexicalBlock(scope: !4561, file: !294, line: 1423, column: 42)
!4569 = !DILocation(line: 1427, column: 3, scope: !4549)
!4570 = !DILocation(line: 1428, column: 3, scope: !4549)
!4571 = !DILocation(line: 1428, column: 9, scope: !4549)
!4572 = !DILocation(line: 1429, column: 3, scope: !4549)
!4573 = !DILocation(line: 1430, column: 1, scope: !4549)
!4574 = distinct !DISubprogram(name: "open", linkageName: "open64", scope: !4575, file: !4575, line: 48, type: !4576, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4575 = !DIFile(filename: "klee_src/runtime/POSIX/fd_64.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "cc9a465ed9cbb2f7acded7c1ccec6e43")
!4576 = !DISubroutineType(types: !4577)
!4577 = !{!237, !433, !237, null}
!4578 = !DILocalVariable(name: "pathname", arg: 1, scope: !4574, file: !4575, line: 48, type: !433)
!4579 = !DILocation(line: 48, column: 22, scope: !4574)
!4580 = !DILocalVariable(name: "flags", arg: 2, scope: !4574, file: !4575, line: 48, type: !237)
!4581 = !DILocation(line: 48, column: 36, scope: !4574)
!4582 = !DILocalVariable(name: "mode", scope: !4574, file: !4575, line: 49, type: !290)
!4583 = !DILocation(line: 49, column: 10, scope: !4574)
!4584 = !DILocation(line: 51, column: 7, scope: !4585)
!4585 = distinct !DILexicalBlock(scope: !4574, file: !4575, line: 51, column: 7)
!4586 = !DILocation(line: 51, column: 13, scope: !4585)
!4587 = !DILocation(line: 51, column: 7, scope: !4574)
!4588 = !DILocalVariable(name: "ap", scope: !4589, file: !4575, line: 53, type: !4590)
!4589 = distinct !DILexicalBlock(scope: !4585, file: !4575, line: 51, column: 24)
!4590 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !3586, line: 52, baseType: !4591)
!4591 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !3588, line: 14, baseType: !4592)
!4592 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !4593, baseType: !4594)
!4593 = !DIFile(filename: "klee_src/runtime/POSIX/fd_64.c", directory: "/tmp")
!4594 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4595, size: 192, elements: !3598)
!4595 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !4596)
!4596 = !{!4597, !4598, !4599, !4600}
!4597 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !4595, file: !4593, line: 53, baseType: !208, size: 32)
!4598 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !4595, file: !4593, line: 53, baseType: !208, size: 32, offset: 32)
!4599 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !4595, file: !4593, line: 53, baseType: !332, size: 64, offset: 64)
!4600 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !4595, file: !4593, line: 53, baseType: !332, size: 64, offset: 128)
!4601 = !DILocation(line: 53, column: 13, scope: !4589)
!4602 = !DILocation(line: 54, column: 5, scope: !4589)
!4603 = !DILocation(line: 55, column: 12, scope: !4589)
!4604 = !DILocation(line: 55, column: 10, scope: !4589)
!4605 = !DILocation(line: 56, column: 5, scope: !4589)
!4606 = !DILocation(line: 57, column: 3, scope: !4589)
!4607 = !DILocation(line: 59, column: 20, scope: !4574)
!4608 = !DILocation(line: 59, column: 30, scope: !4574)
!4609 = !DILocation(line: 59, column: 37, scope: !4574)
!4610 = !DILocation(line: 59, column: 10, scope: !4574)
!4611 = !DILocation(line: 59, column: 3, scope: !4574)
!4612 = distinct !DISubprogram(name: "openat", linkageName: "openat64", scope: !4575, file: !4575, line: 62, type: !4613, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4613 = !DISubroutineType(types: !4614)
!4614 = !{!237, !237, !433, !237, null}
!4615 = !DILocalVariable(name: "fd", arg: 1, scope: !4612, file: !4575, line: 62, type: !237)
!4616 = !DILocation(line: 62, column: 16, scope: !4612)
!4617 = !DILocalVariable(name: "pathname", arg: 2, scope: !4612, file: !4575, line: 62, type: !433)
!4618 = !DILocation(line: 62, column: 32, scope: !4612)
!4619 = !DILocalVariable(name: "flags", arg: 3, scope: !4612, file: !4575, line: 62, type: !237)
!4620 = !DILocation(line: 62, column: 46, scope: !4612)
!4621 = !DILocalVariable(name: "mode", scope: !4612, file: !4575, line: 63, type: !290)
!4622 = !DILocation(line: 63, column: 10, scope: !4612)
!4623 = !DILocation(line: 65, column: 7, scope: !4624)
!4624 = distinct !DILexicalBlock(scope: !4612, file: !4575, line: 65, column: 7)
!4625 = !DILocation(line: 65, column: 13, scope: !4624)
!4626 = !DILocation(line: 65, column: 7, scope: !4612)
!4627 = !DILocalVariable(name: "ap", scope: !4628, file: !4575, line: 67, type: !4590)
!4628 = distinct !DILexicalBlock(scope: !4624, file: !4575, line: 65, column: 24)
!4629 = !DILocation(line: 67, column: 13, scope: !4628)
!4630 = !DILocation(line: 68, column: 5, scope: !4628)
!4631 = !DILocation(line: 69, column: 12, scope: !4628)
!4632 = !DILocation(line: 69, column: 10, scope: !4628)
!4633 = !DILocation(line: 70, column: 5, scope: !4628)
!4634 = !DILocation(line: 71, column: 3, scope: !4628)
!4635 = !DILocation(line: 73, column: 22, scope: !4612)
!4636 = !DILocation(line: 73, column: 26, scope: !4612)
!4637 = !DILocation(line: 73, column: 36, scope: !4612)
!4638 = !DILocation(line: 73, column: 43, scope: !4612)
!4639 = !DILocation(line: 73, column: 10, scope: !4612)
!4640 = !DILocation(line: 73, column: 3, scope: !4612)
!4641 = distinct !DISubprogram(name: "lseek", linkageName: "lseek64", scope: !4575, file: !4575, line: 86, type: !4642, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4642 = !DISubroutineType(types: !4643)
!4643 = !{!285, !237, !283, !237}
!4644 = !DILocalVariable(name: "fd", arg: 1, scope: !4641, file: !4575, line: 86, type: !237)
!4645 = !DILocation(line: 86, column: 19, scope: !4641)
!4646 = !DILocalVariable(name: "offset", arg: 2, scope: !4641, file: !4575, line: 86, type: !283)
!4647 = !DILocation(line: 86, column: 31, scope: !4641)
!4648 = !DILocalVariable(name: "whence", arg: 3, scope: !4641, file: !4575, line: 86, type: !237)
!4649 = !DILocation(line: 86, column: 43, scope: !4641)
!4650 = !DILocation(line: 87, column: 21, scope: !4641)
!4651 = !DILocation(line: 87, column: 25, scope: !4641)
!4652 = !DILocation(line: 87, column: 33, scope: !4641)
!4653 = !DILocation(line: 87, column: 10, scope: !4641)
!4654 = !DILocation(line: 87, column: 3, scope: !4641)
!4655 = distinct !DISubprogram(name: "__xstat", linkageName: "__xstat64", scope: !4575, file: !4575, line: 90, type: !4656, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4656 = !DISubroutineType(types: !4657)
!4657 = !{!237, !237, !433, !4658}
!4658 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4659, size: 64)
!4659 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !220, line: 26, size: 1152, elements: !4660)
!4660 = !{!4661, !4662, !4663, !4664, !4665, !4666, !4667, !4668, !4669, !4670, !4671, !4672, !4673, !4674, !4675}
!4661 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !4659, file: !220, line: 31, baseType: !223, size: 64)
!4662 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !4659, file: !220, line: 36, baseType: !352, size: 64, offset: 64)
!4663 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !4659, file: !220, line: 44, baseType: !229, size: 64, offset: 128)
!4664 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !4659, file: !220, line: 45, baseType: !231, size: 32, offset: 192)
!4665 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !4659, file: !220, line: 47, baseType: !233, size: 32, offset: 224)
!4666 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !4659, file: !220, line: 48, baseType: !235, size: 32, offset: 256)
!4667 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !4659, file: !220, line: 50, baseType: !237, size: 32, offset: 288)
!4668 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !4659, file: !220, line: 52, baseType: !223, size: 64, offset: 320)
!4669 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !4659, file: !220, line: 57, baseType: !240, size: 64, offset: 384)
!4670 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !4659, file: !220, line: 61, baseType: !243, size: 64, offset: 448)
!4671 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !4659, file: !220, line: 63, baseType: !362, size: 64, offset: 512)
!4672 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !4659, file: !220, line: 74, baseType: !538, size: 128, offset: 576)
!4673 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !4659, file: !220, line: 75, baseType: !538, size: 128, offset: 704)
!4674 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !4659, file: !220, line: 76, baseType: !538, size: 128, offset: 832)
!4675 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !4659, file: !220, line: 89, baseType: !257, size: 192, offset: 960)
!4676 = !DILocalVariable(name: "vers", arg: 1, scope: !4655, file: !4575, line: 90, type: !237)
!4677 = !DILocation(line: 90, column: 17, scope: !4655)
!4678 = !DILocalVariable(name: "path", arg: 2, scope: !4655, file: !4575, line: 90, type: !433)
!4679 = !DILocation(line: 90, column: 35, scope: !4655)
!4680 = !DILocalVariable(name: "buf", arg: 3, scope: !4655, file: !4575, line: 90, type: !4658)
!4681 = !DILocation(line: 90, column: 54, scope: !4655)
!4682 = !DILocation(line: 91, column: 20, scope: !4655)
!4683 = !DILocation(line: 91, column: 43, scope: !4655)
!4684 = !DILocation(line: 91, column: 10, scope: !4655)
!4685 = !DILocation(line: 91, column: 3, scope: !4655)
!4686 = distinct !DISubprogram(name: "stat", linkageName: "stat64", scope: !4575, file: !4575, line: 94, type: !4687, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4687 = !DISubroutineType(types: !4688)
!4688 = !{!237, !433, !4658}
!4689 = !DILocalVariable(name: "path", arg: 1, scope: !4686, file: !4575, line: 94, type: !433)
!4690 = !DILocation(line: 94, column: 22, scope: !4686)
!4691 = !DILocalVariable(name: "buf", arg: 2, scope: !4686, file: !4575, line: 94, type: !4658)
!4692 = !DILocation(line: 94, column: 41, scope: !4686)
!4693 = !DILocation(line: 95, column: 20, scope: !4686)
!4694 = !DILocation(line: 95, column: 43, scope: !4686)
!4695 = !DILocation(line: 95, column: 10, scope: !4686)
!4696 = !DILocation(line: 95, column: 3, scope: !4686)
!4697 = distinct !DISubprogram(name: "__lxstat", linkageName: "__lxstat64", scope: !4575, file: !4575, line: 98, type: !4656, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4698 = !DILocalVariable(name: "vers", arg: 1, scope: !4697, file: !4575, line: 98, type: !237)
!4699 = !DILocation(line: 98, column: 18, scope: !4697)
!4700 = !DILocalVariable(name: "path", arg: 2, scope: !4697, file: !4575, line: 98, type: !433)
!4701 = !DILocation(line: 98, column: 36, scope: !4697)
!4702 = !DILocalVariable(name: "buf", arg: 3, scope: !4697, file: !4575, line: 98, type: !4658)
!4703 = !DILocation(line: 98, column: 55, scope: !4697)
!4704 = !DILocation(line: 99, column: 21, scope: !4697)
!4705 = !DILocation(line: 99, column: 44, scope: !4697)
!4706 = !DILocation(line: 99, column: 10, scope: !4697)
!4707 = !DILocation(line: 99, column: 3, scope: !4697)
!4708 = distinct !DISubprogram(name: "lstat", linkageName: "lstat64", scope: !4575, file: !4575, line: 102, type: !4687, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4709 = !DILocalVariable(name: "path", arg: 1, scope: !4708, file: !4575, line: 102, type: !433)
!4710 = !DILocation(line: 102, column: 23, scope: !4708)
!4711 = !DILocalVariable(name: "buf", arg: 2, scope: !4708, file: !4575, line: 102, type: !4658)
!4712 = !DILocation(line: 102, column: 42, scope: !4708)
!4713 = !DILocation(line: 103, column: 21, scope: !4708)
!4714 = !DILocation(line: 103, column: 44, scope: !4708)
!4715 = !DILocation(line: 103, column: 10, scope: !4708)
!4716 = !DILocation(line: 103, column: 3, scope: !4708)
!4717 = distinct !DISubprogram(name: "__fxstat", linkageName: "__fxstat64", scope: !4575, file: !4575, line: 106, type: !4718, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4718 = !DISubroutineType(types: !4719)
!4719 = !{!237, !237, !237, !4658}
!4720 = !DILocalVariable(name: "vers", arg: 1, scope: !4717, file: !4575, line: 106, type: !237)
!4721 = !DILocation(line: 106, column: 18, scope: !4717)
!4722 = !DILocalVariable(name: "fd", arg: 2, scope: !4717, file: !4575, line: 106, type: !237)
!4723 = !DILocation(line: 106, column: 28, scope: !4717)
!4724 = !DILocalVariable(name: "buf", arg: 3, scope: !4717, file: !4575, line: 106, type: !4658)
!4725 = !DILocation(line: 106, column: 45, scope: !4717)
!4726 = !DILocation(line: 107, column: 21, scope: !4717)
!4727 = !DILocation(line: 107, column: 42, scope: !4717)
!4728 = !DILocation(line: 107, column: 10, scope: !4717)
!4729 = !DILocation(line: 107, column: 3, scope: !4717)
!4730 = distinct !DISubprogram(name: "fstat", linkageName: "fstat64", scope: !4575, file: !4575, line: 110, type: !4731, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4731 = !DISubroutineType(types: !4732)
!4732 = !{!237, !237, !4658}
!4733 = !DILocalVariable(name: "fd", arg: 1, scope: !4730, file: !4575, line: 110, type: !237)
!4734 = !DILocation(line: 110, column: 15, scope: !4730)
!4735 = !DILocalVariable(name: "buf", arg: 2, scope: !4730, file: !4575, line: 110, type: !4658)
!4736 = !DILocation(line: 110, column: 32, scope: !4730)
!4737 = !DILocation(line: 111, column: 21, scope: !4730)
!4738 = !DILocation(line: 111, column: 42, scope: !4730)
!4739 = !DILocation(line: 111, column: 10, scope: !4730)
!4740 = !DILocation(line: 111, column: 3, scope: !4730)
!4741 = distinct !DISubprogram(name: "ftruncate64", scope: !4575, file: !4575, line: 114, type: !442, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4742 = !DILocalVariable(name: "fd", arg: 1, scope: !4741, file: !4575, line: 114, type: !237)
!4743 = !DILocation(line: 114, column: 21, scope: !4741)
!4744 = !DILocalVariable(name: "length", arg: 2, scope: !4741, file: !4575, line: 114, type: !283)
!4745 = !DILocation(line: 114, column: 33, scope: !4741)
!4746 = !DILocation(line: 115, column: 25, scope: !4741)
!4747 = !DILocation(line: 115, column: 29, scope: !4741)
!4748 = !DILocation(line: 115, column: 10, scope: !4741)
!4749 = !DILocation(line: 115, column: 3, scope: !4741)
!4750 = distinct !DISubprogram(name: "statfs", linkageName: "statfs64", scope: !4575, file: !4575, line: 119, type: !4751, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4751 = !DISubroutineType(types: !4752)
!4752 = !{!237, !433, !4753}
!4753 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4754, size: 64)
!4754 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "statfs", file: !3971, line: 24, size: 960, elements: !4755)
!4755 = !{!4756, !4757, !4758, !4760, !4761, !4762, !4764, !4765, !4770, !4771, !4772, !4773}
!4756 = !DIDerivedType(tag: DW_TAG_member, name: "f_type", scope: !4754, file: !3971, line: 26, baseType: !3974, size: 64)
!4757 = !DIDerivedType(tag: DW_TAG_member, name: "f_bsize", scope: !4754, file: !3971, line: 27, baseType: !3974, size: 64, offset: 64)
!4758 = !DIDerivedType(tag: DW_TAG_member, name: "f_blocks", scope: !4754, file: !3971, line: 35, baseType: !4759, size: 64, offset: 128)
!4759 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsblkcnt64_t", file: !224, line: 185, baseType: !225)
!4760 = !DIDerivedType(tag: DW_TAG_member, name: "f_bfree", scope: !4754, file: !3971, line: 36, baseType: !4759, size: 64, offset: 192)
!4761 = !DIDerivedType(tag: DW_TAG_member, name: "f_bavail", scope: !4754, file: !3971, line: 37, baseType: !4759, size: 64, offset: 256)
!4762 = !DIDerivedType(tag: DW_TAG_member, name: "f_files", scope: !4754, file: !3971, line: 38, baseType: !4763, size: 64, offset: 320)
!4763 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsfilcnt64_t", file: !224, line: 189, baseType: !225)
!4764 = !DIDerivedType(tag: DW_TAG_member, name: "f_ffree", scope: !4754, file: !3971, line: 39, baseType: !4763, size: 64, offset: 384)
!4765 = !DIDerivedType(tag: DW_TAG_member, name: "f_fsid", scope: !4754, file: !3971, line: 41, baseType: !4766, size: 64, offset: 448)
!4766 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fsid_t", file: !224, line: 155, baseType: !4767)
!4767 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !224, line: 155, size: 64, elements: !4768)
!4768 = !{!4769}
!4769 = !DIDerivedType(tag: DW_TAG_member, name: "__val", scope: !4767, file: !224, line: 155, baseType: !3988, size: 64)
!4770 = !DIDerivedType(tag: DW_TAG_member, name: "f_namelen", scope: !4754, file: !3971, line: 42, baseType: !3974, size: 64, offset: 512)
!4771 = !DIDerivedType(tag: DW_TAG_member, name: "f_frsize", scope: !4754, file: !3971, line: 43, baseType: !3974, size: 64, offset: 576)
!4772 = !DIDerivedType(tag: DW_TAG_member, name: "f_flags", scope: !4754, file: !3971, line: 44, baseType: !3974, size: 64, offset: 640)
!4773 = !DIDerivedType(tag: DW_TAG_member, name: "f_spare", scope: !4754, file: !3971, line: 45, baseType: !3993, size: 256, offset: 704)
!4774 = !DILocalVariable(name: "path", arg: 1, scope: !4750, file: !4575, line: 119, type: !433)
!4775 = !DILocation(line: 119, column: 24, scope: !4750)
!4776 = !DILocalVariable(name: "buf", arg: 2, scope: !4750, file: !4575, line: 119, type: !4753)
!4777 = !DILocation(line: 119, column: 45, scope: !4750)
!4778 = !DILocation(line: 120, column: 22, scope: !4750)
!4779 = !DILocation(line: 120, column: 28, scope: !4750)
!4780 = !DILocation(line: 120, column: 10, scope: !4750)
!4781 = !DILocation(line: 120, column: 3, scope: !4750)
!4782 = distinct !DISubprogram(name: "getdents64", scope: !4575, file: !4575, line: 123, type: !4783, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !520, retainedNodes: !381)
!4783 = !DISubroutineType(types: !4784)
!4784 = !{!378, !237, !332, !379}
!4785 = !DILocalVariable(name: "fd", arg: 1, scope: !4782, file: !4575, line: 123, type: !237)
!4786 = !DILocation(line: 123, column: 24, scope: !4782)
!4787 = !DILocalVariable(name: "dirp", arg: 2, scope: !4782, file: !4575, line: 123, type: !332)
!4788 = !DILocation(line: 123, column: 34, scope: !4782)
!4789 = !DILocalVariable(name: "count", arg: 3, scope: !4782, file: !4575, line: 123, type: !379)
!4790 = !DILocation(line: 123, column: 47, scope: !4782)
!4791 = !DILocation(line: 124, column: 24, scope: !4782)
!4792 = !DILocation(line: 124, column: 47, scope: !4782)
!4793 = !DILocation(line: 124, column: 53, scope: !4782)
!4794 = !DILocation(line: 124, column: 10, scope: !4782)
!4795 = !DILocation(line: 124, column: 3, scope: !4782)
!4796 = distinct !DISubprogram(name: "memcpy", scope: !4797, file: !4797, line: 12, type: !4798, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !553, retainedNodes: !381)
!4797 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!4798 = !DISubroutineType(types: !4799)
!4799 = !{!332, !332, !399, !379}
!4800 = !DILocalVariable(name: "destaddr", arg: 1, scope: !4796, file: !4797, line: 12, type: !332)
!4801 = !DILocation(line: 12, column: 20, scope: !4796)
!4802 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !4796, file: !4797, line: 12, type: !399)
!4803 = !DILocation(line: 12, column: 42, scope: !4796)
!4804 = !DILocalVariable(name: "len", arg: 3, scope: !4796, file: !4797, line: 12, type: !379)
!4805 = !DILocation(line: 12, column: 58, scope: !4796)
!4806 = !DILocalVariable(name: "dest", scope: !4796, file: !4797, line: 13, type: !216)
!4807 = !DILocation(line: 13, column: 9, scope: !4796)
!4808 = !DILocation(line: 13, column: 16, scope: !4796)
!4809 = !DILocalVariable(name: "src", scope: !4796, file: !4797, line: 14, type: !433)
!4810 = !DILocation(line: 14, column: 15, scope: !4796)
!4811 = !DILocation(line: 14, column: 21, scope: !4796)
!4812 = !DILocation(line: 16, column: 3, scope: !4796)
!4813 = !DILocation(line: 16, column: 13, scope: !4796)
!4814 = !DILocation(line: 16, column: 16, scope: !4796)
!4815 = !DILocation(line: 17, column: 19, scope: !4796)
!4816 = !DILocation(line: 17, column: 15, scope: !4796)
!4817 = !DILocation(line: 17, column: 10, scope: !4796)
!4818 = !DILocation(line: 17, column: 13, scope: !4796)
!4819 = distinct !{!4819, !4812, !4815, !4820}
!4820 = !{!"llvm.loop.mustprogress"}
!4821 = !DILocation(line: 18, column: 10, scope: !4796)
!4822 = !DILocation(line: 18, column: 3, scope: !4796)
!4823 = distinct !DISubprogram(name: "memset", scope: !4824, file: !4824, line: 12, type: !4825, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !555, retainedNodes: !381)
!4824 = !DIFile(filename: "klee_src/runtime/Freestanding/memset.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "f66ef9ef9131ab198e93a41b1a9ae1fc")
!4825 = !DISubroutineType(types: !4826)
!4826 = !{!332, !332, !237, !379}
!4827 = !DILocalVariable(name: "dst", arg: 1, scope: !4823, file: !4824, line: 12, type: !332)
!4828 = !DILocation(line: 12, column: 20, scope: !4823)
!4829 = !DILocalVariable(name: "s", arg: 2, scope: !4823, file: !4824, line: 12, type: !237)
!4830 = !DILocation(line: 12, column: 29, scope: !4823)
!4831 = !DILocalVariable(name: "count", arg: 3, scope: !4823, file: !4824, line: 12, type: !379)
!4832 = !DILocation(line: 12, column: 39, scope: !4823)
!4833 = !DILocalVariable(name: "a", scope: !4823, file: !4824, line: 13, type: !216)
!4834 = !DILocation(line: 13, column: 9, scope: !4823)
!4835 = !DILocation(line: 13, column: 13, scope: !4823)
!4836 = !DILocation(line: 14, column: 3, scope: !4823)
!4837 = !DILocation(line: 14, column: 15, scope: !4823)
!4838 = !DILocation(line: 14, column: 18, scope: !4823)
!4839 = !DILocation(line: 15, column: 12, scope: !4823)
!4840 = !DILocation(line: 15, column: 7, scope: !4823)
!4841 = !DILocation(line: 15, column: 10, scope: !4823)
!4842 = distinct !{!4842, !4836, !4839, !4820}
!4843 = !DILocation(line: 16, column: 10, scope: !4823)
!4844 = !DILocation(line: 16, column: 3, scope: !4823)
!4845 = distinct !DISubprogram(name: "klee_overshift_check", scope: !498, file: !498, line: 20, type: !4846, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !557, retainedNodes: !381)
!4846 = !DISubroutineType(types: !4847)
!4847 = !{null, !4848, !4848}
!4848 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!4849 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4845, file: !498, line: 20, type: !4848)
!4850 = !DILocation(line: 20, column: 46, scope: !4845)
!4851 = !DILocalVariable(name: "shift", arg: 2, scope: !4845, file: !498, line: 20, type: !4848)
!4852 = !DILocation(line: 20, column: 75, scope: !4845)
!4853 = !DILocation(line: 21, column: 7, scope: !4854)
!4854 = distinct !DILexicalBlock(scope: !4845, file: !498, line: 21, column: 7)
!4855 = !DILocation(line: 21, column: 16, scope: !4854)
!4856 = !DILocation(line: 21, column: 13, scope: !4854)
!4857 = !DILocation(line: 21, column: 7, scope: !4845)
!4858 = !DILocation(line: 27, column: 5, scope: !4859)
!4859 = distinct !DILexicalBlock(scope: !4854, file: !498, line: 21, column: 26)
!4860 = !DILocation(line: 29, column: 1, scope: !4845)
