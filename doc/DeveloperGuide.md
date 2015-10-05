# InstCov Developer Guide

InstCov is a code instrumentation tool based on Clang. It instruments code at
the source-code level, which can be used for coverage analysis, runtime
verification, etc. Currently, InstCov can instrument code for function, branch
and MC/DC coverage analysis. However, you can easily extend InstCov to support
customized instrumentation. In this developer guide, we will introduce how to
extend InstCov for your customized instrumentation.

## Workflow

The workflow of InstCov is as follows:

1. You need to preprocess the source file using `-I instcov_rt.h` option to
   include the declarations of function names you want to instrument (such as
   functions for logging or checking). This should be done first because your
   code should be preprocessed only once. The preprocessing will also eliminate
   macros and other preprocessor directives, which may cause problem in the
   instrumentation stage and compilation stage;

2. Run InstCov to instrument the source file. Note that the behaviors of InstCov
   are based on "actions". Each action is an instrumentation step for InstCov to
   perform. Suppose you have specified `func` and `dc` actions, then InstCov
   will instrument for function coverage first, and then instrument
   decisions/conditions for MC/DC analysis. After running InstCov, it will
   produce the instrumented code and a debug information file as well;

3. Compile the instrumented code. Note that `libinstcov_rt.a` should be linked
   during the linking stage, which contains the definitions of the instrumented
   functions;

4. Run the program. According to your instrumented code, the program will be
   dynamically verified, or the execution trace will be recorded;

5. You may analyze the trace using the debug information file generated in
   Step 2.

## Instrumentation Guideline

### InstCov Actions

The instrumentation steps conducted in InstCov are specified using `actions`. An
action performs a specific instrumentation job, such as instrumentation for
function coverage, branch coverage, etc. If you want a new instrumentation
functionality, please write your own action.

### `Clang::ASTRecursiveVisitor`

The underlying instrumentation of each action is done by an ASTVisitor, which
utilizes the utilities provided by Clang. An ASTVisitor recursively visits the
AST of the program, and you can do your instrumentation when visiting certain
kinds of AST nodes (Decl/Stmt/Expr). For example, if you want to instrument for
function coverage, overwriting `VisitFunctionDecl` should be your choice, and if
you want to instrument for branch coverage, overwriting `VisitIfStmt`,
`VisitForStmt`, and so on should be done.


### `Clang::Rewriter`

Your instrumented code should be inserted the source file by using
`Clang::Rewriter::InsertText()`. You need to specify a certain `SourceLocation`,
a string to insert. Also, please note that the third argument of `InsertText` is
a boolean value `InsertAfter`, which specifies whether the newly instrumented
code in inserted before/after all the previous inserts.

### Debug Information

According to your instrumentation purpose, you may need to attach debug
information to AST entities. For example, you may want to use a data structure
to store the information of a function when instrumenting for function
coverage. In InstCov, each debug information is assigned an UUID (128-bit
unsigned integer), and contains the source location. The base class of debug
information is `DbgInfo`, which contains the UUID and location info. You should
derive your own class from `DbgInfo`.

All `DbgInfo`'s are maintained using `DbgInfoMgr`. All `DbgInfo`'s should be
registered and queried through `DbgInfoMgr`. However, due to the current design
pattern issues, you need to add additional code to `DbgInfoMgr` to maintain your
new `DbgInfo`. Please note that `DbgInfoMgr` only identifies each `DbgInfo` by
its UUID. You need to write a wrapper class for `DbgInfoMgr` to maintain the
relation of AST nodes to their UUIDs (e.g. see `InstDIBuilderFunc`).

Also, you can also dump all the `DbgInfo`'s into or load them
from a file. The debug information file format is as follows:

1. The file begins with a header containing a magic string `INSTCOV` and a
   numeric version.

2. The body contains a sequence of `DbgInfo`'s. Each `DbgInfo` comes with a
   4-byte magic number to identify its type, then the location information, and
   additional information specific to this type of `DbgInfo` (if applicable).
   Note that the data should be 64-bit-aligned.

### The `instcov_rt` library

The `instcov_rt` library contains your instrumented functions for tracing or
dynamic checking. If you are doing tracing instrumentation, your instrumented
functions should dump the UUID of the program entity, and additioal information
if applicable. Note that the trace file should also be 64-bit-aligned.

The format of tracing files is as follows:

1. The file begins with a header containing a magic string `INSTCOV_DUMP` and a
   numeric version.

2. The body contains a sequence of records, each contains a UUID from the
   `DbgInfo`, and other information if applicable (such as a branch ID).

### Reading, printing and analyzing the traces

Now it's the time to analyze the traces. You need to do the following steps:

1. Load the debug information files using `DbgInfoMgr`;

2. Load the trace(s) using `RawRecordMgr`. The entries in the trace files are
   called `RawRecord`'s because they are in plain format and are unstructured.
   Each `RawRecord` contains only the UUID and its additional information.
   You need to derive your own class from `RawRecord` base class for each of
   your `DbgInfo` type;

3. If you want to print your records for human reading, you can use
   `instcov-view` to print the traces/debug information in a pretty way;

4. If you want to analyze the traces, you can process directly on the
   `RawRecord`'s from the `RawRecordMgr`, or you can organize the `RawRecord`'s
   into structured format, and then process on the structured form.

## Setting up your development environment

InstCov works as a clang tool. Currently, it builts with LLVM & Clang 3.6.  To
set up your build environment, you need to first download and unpack the source
code of LLVM and Clang 3.6. Then you should put the root source directory of
clang into `llvm/tools`. Afterwards, you need to put the root source directory
into `llvm/tools/clang/tools/extra` (alternatively, you can create a soft link,
thus you won't need to go so deep to reach the `instcov` root directory), and
add `add_subdirectory(instcov)` to
`llvm/tools/clang/tools/extra/CMakeLists.txt`. Then you need to install `cmake`
to generate the build scripts. Then you are good to go, just build the project!

Alternatively, you can use the `Ninja` build tool instead of `make`, since it
claims that it builds faster than make. In this case, you need to add `-G Ninja`
argument to `cmake`.

An example:

	wget http://llvm.org/releases/3.6.0/llvm-3.6.0.src.tar.xz
	wget http://llvm.org/releases/3.6.0/cfe-3.6.0.src.tar.xz
	tar -xf llvm-3.6.0.src.tar.xz
	tar -xf cfe-3.6.0.src.tar.xz
	mv llvm-3.6.0 llvm
	mv cfe-3.6.0 llvm/tools/clang
	git clone <instcov-git-repo> instcov
	ln -s instcov llvm/tools/clang/tools/extra/instcov
	echo add_subdirectory(instcov) >> llvm/tools/clang/tools/extra/CMakeLists.txt
	mkdir build && cd build

	cmake ../llvm
	make

	[Alternatively]
	cmake ../llvm -G Ninja
	ninja
