# InstCov Internal Implementations

The internal Implementation of InstCov is based on Clang.  InstCov operates on
Clang AST. It recursively traverses the AST, and when a conditional statement
node is visited, it instruments necessary recording code into the original
source code using clang::Rewriter.

The current implementation works with Clang 3.6.

## Implementation choices

Theoretically, there are three possible implementation strategies:

* Source-to-source transformation, which means to insert new text into the
original source code;

* AST-level instrumentation, which means to modify the AST to add new recoding
AST nodes;

* CFG-level instrumentation, which means to insert new statements or basic
blocks into the CFG. Note that in this solution, the CFG might have broken a
conditional statement into multiple basic blocks with conditional
jumps. Therefore it may be hard to align the CFG-level jumps with the
source-level conditional statements.

We choose the first strategy in InstCov, since libclang does not recommend users
to modify the AST (it is not safe and may cause serious problems), and clang CFG
does not have information to map the BB branches back to the source code
(ref. Zhenbo Xu).

## Important Clang classes/methods used

In our implementation, the following clang classes/methods are very important:

* `ClangTool`: this is used when creating a standalone tool based on libclang;

* `RecursiveASTVisitor`: an infrastructure in libclang, which provides a
  mechanism to visit the AST tree recursively;

* `Rewriter`: a class provided by libclang, which is used to insert text into
  the original source code;

* `Stmt`: class for statements in clang;

* `Expr`: class for expressions in clang, inherited from `Stmt`;

* `getLocStart()`: a method to get the starting location of the first token in a
  `Stmt` or `Expr`;

* `getLocEnd()`: a method to get the starting location of the last token in a
  `Stmt` or `Expr`, usually used with `Lexer::getLocForEndOfToken()`;

* `dumpPretty()`: this method is used to dump an `Stmt` into the original source
language.

* `PresumedLoc`: the original source location, which is computed using the
  `#line` directives.


A notable thing is that, when using `getLocEnd()`, the returned `SourceLocation`
might not always be the last location of a statement. If the statement
terminates with right brace `}`, then the location will be fine. However if a
statement terminates with semicolon `;`, then `getLocEnd()` will return the
beginning of the token before `;`. This is not a desired behavior, so we need to
use `clang::Lexer` to search backwards to find a `;` token. This may be awkward,
but it seems to be the only way.

## What is Instrumented?

We need to dump corresponding record into a log file when some point is
visited. We need to assign each recording point a unique number for
identification. We are planning to assign each conditional statement and each
expression a unique id. (This feature is currently not implemented)

What is actually instrumented into the source code is a `instcov_dump()`
function calling the InstCov runtime library to log corresponding records.

### `if` statement

Since `if` statement allows variable declaration in the condition, we'd better
not modify the condition.

We have identified several patterns of `if` statement, and tackle each of them:

* If the `then` or `else` branch is a single statement (i.e. terminating with
`;`), we surround the statement with braces `{}` and add a `instcov_dump()` call
just before the statement;

* If the `then` branch is a compound statement (i.e. surrounded with `{}`), we
just insert a `instcov_dump()` after `{`;

* If the `else` branch is missing, we add

		else instcov_dump();

  just after the then block.


### `while` statement

Since `while` statement allows variable declaration in the condition, we'd
better not modify the condition.

We have identified several patterns of `while` statement, and tackle each of
them:

* If the loop body is a single statement (i.e. terminating with `;`), we
surround the statement with braces `{}` and add a `instcov_dump()` call just
before the statement;

* If the loop body is a compound statement (i.e. surrounded with `{}`), we just
insert a `instcov_dump()` after `{`;

* We insert a `instcov_dump()` call just after the loop body to record that the
loop condition is evaluated to false.

### `for` statement

The treatment for `for` statements are exactly the same with `while` statement.

### `do` statement

The treatment for `do` statements is a little bit tricky. The reason why it is
different is that the first iteration is unconditional, and no record should be
logged.

To instrument a `do` statement we surround the loop condition with parentheses
`()`, and change it into a tenary operator. Suppose the original form is:

	do { } while (cond);

The instrumented code will be (we use `0` and `1` for C-compatibility):

	do { } while ((cond) ? (instcov_dump(), 1) : (instcov_dump(), 0));

### `switch` statement

The implementation for `switch` statement recording is a little bit awkward.
The most difficult part is that the execution can escape to the next switch case
if the current switch case has no break statements. Therefore, if we only inject
a `dump()` function at the front of each switch case body, one execution may
have multiple dumps.

The solution for this is to set up a flag before the switch statement is
executed. Before dumping a record, we need to check the flag in advance, and
then flip the flag. Note that the flag name uses the UUID to avoid conflict.

Suppose the original program piece is:

	switch (var) {
	case value1:
	case value2:
		body1;
	default:
		body2;
	}

The instrumented code would be:
	
	int flag = 1;
	switch (var) {
	case value1:
	case value2:
		if (flag == 1) {
			dump();
			flag = 0;
		}
		body1;
	default:
		if (flag == 1) {
			dump();
			flag = 0;
		}
		body2;
	}

### MC/DC instrumentation

For recording MC/DC coverage, we need to record the evaluation of conditions in
each decision (`if/for/while/do` statement).  Note that the evaluation of
logical expressions has the short-circuit symptom. Thus some conditions may not
be evaluated. However, for MC/DC recording, we need to record each condition of
the decision.  In InstCov, we collect all the atomic expressions, and dump their
evaluation result before the decision is evaluated. A consequence of this
treatment is that some condition may be evaluated twice. If some conditions has
side effects (such as `++a > 0`), then the instrumented code will have different
behavior with the original one.

Suppose the original condition expression in the conditional statement is
`cond`, which has decisions `a`, `b` and `c`. The trasformed condition
expression will be:

`(a) ? instcov_dump() : instcov_dump(), (b) ? instcov_dump() :
instcov_dump(), (c) ? instcov_dump() : instcov_dump(), expr`

## About the `dump` function

Here we give each program entity (decisions & conditions) a UUID (128-bit
unsigned integer). The `dump` function is declared as follows:

    #ifdef __cplusplus
    extern "C" {
    #endif  // __cplusplus
    void dump(uint64_t uuid_high, uint64_t uuid_low, uint64_t bid);
    #ifdef __cplusplus
    }
    #endif  // __cplusplus

Here `bid` is the branch id. We use `1` for the true branch and `0` for the
false branch.

Before dumping the trace, a magic string is inserted first for file type
recognition. All dumping is in binary format and is aligned by the size of
`uint64_t`.

## Debug information

The debug information contains the UUID of this entity, the UUID of the
parent entity, the file name, the line number and the column number. 

Before dumping the debug information, a magic string is inserted first for file
type recognition. All dumping is in binary format and is aligned by the size of
`uint64_t`.

## Trace analysis

Note that the trace file only contains a sequence of UUID-bid pairs.  We need
to associate them with each other in MCDC coverage analysis.

What `instcov-view` does is actually read the debug information from `.dbginfo`
files, read the trace file, and link the trace entries.

The trace entries are restructured into several tree structures. The root node
of each tree is a decision. The leaf nodes are conditions. Other non-leaf nodes
are sub-decisions ( **sub-decisions are currently not supported** ).

When a new entry is read from the trace file, `instcov-view` goes upwards to
find the root node, and set up a tree of empty slots. The tree is built
according to the debug information. Each slot needs to be filled with a
corresponding trace entry. After the root node (decision) is filled, the total
information for a visit to the root decision is completed, and is dumped as tree
format. Then `instcov-view` starts over, reads new entries, build and dumps new
slot trees.

Sometimes a node outside the tree may be read, or the node may be already filled
inside the current tree. This means that the new node is definitely in a deeper
function call. To deal with this, we use a stack structure to store the
incompleted trees, if the current tree cannot accept the new node, we construct
a new tree with the root of the new node, and push it into the stack. If the
decision of the top tree is read, then the top tree is complete. We store the
top tree, and pop it from the stack. Note that this can be guaranteed correct
since we always dump the conditions in a fixed order, and then dump the decision
in the end.

## Which Files to Instrument?

Sometimes we only want to instrument some of these files, however the
preprocessor contains all the included files. We usually don't care about the
included files. It is almost always a bad idea to write function definitions in
the header (except VERY SIMPLE C++ class methods). Thus, we want to let the user
to instrument those files they want. There are two possible implementations I
have tried.

### Expanding the macros only, and then instrument

This seems very desirable choice, since Clang provides a smart preprocessing
option that enables you to expand the macros only and not the included files.
However, this may be problematic if there are some macro that defines to itself.

For example, I have encountered such situation in `<stdio.h>` in Ubuntu
distribution, which has the following line:

	#define stdin stdin

So, this idea is not good, since the macro will be expanded again, and the
source location of `stdin` is still inside a macro.

### Do a full preprocess, and then instrument

Now we know that the file should be preprocessed only once, thus we need to work
on a fully preprocessed file. Fortunately, a preprocessed files has `#line`
directives indicating the original source location (file and line number) before
expansion. LibClang uses these directives to guess the location in the original
file, which is called the [[ presumed ]] location. We use the presumed file name
to determine whether the file need to be instrumented.

## Analyzing MC/DC coverage

After we obtained the execution records, the next problem is how to analyze the
MC/DC coverage on it. Our goal is to do it right and fast.

Firstly, each test case may visit a decision multiple times. We need to
distinguish between different visits. We mark each visit by the test ID and
visit ID.

To quickly identify the MC/DC pairs. Here we use a hashing trick. We know that a
MC/DC pair is two visits of a decision, having one of the conditions be
evaluated differently, and all other conditions be evaluated the same, making
the whole decision evaluated differently. Here we hash each visit into a integer
value, making MC/DC pairs to be hashed into the same value.

This is done as follows:

1. For each condition of each decision, we initialize an empty hash table,
   mapping integer values into pairs of containers (denote as the
   [[ True side ]] and the [[ False Side ]]).
2. For each visit, we build a Boolean vector, storing all the condition values,
as well as the decision result.

3. For each condition of each visit, if the condition is evaluated to True, then
   the Boolean vector is kept the same, and the corresponding hash value is
   computed using the vector. Then we put the visit into the True side
   container.

	If the condition is evaluated to False, then the value of this condition and
    the decision is flipped, and the corresponding hash value is computed using
    the vector. Then we put the visit into the False side container.

4. If for some hash value, the True side container and the False side container
   are both non-empty, then any one from the True side and any one from the
   False side forms a MC/DC pair on the condition.

Here is an example:

Suppose decision `d` is `a||b`. We have test cases:

	T1: 0 0 -> 0
	T2: 1 0 -> 1
	T3: 0 1 -> 1
	T4: 1 1 -> 1

For the T1, we have vector `000`.  Decision `a` is false, so it is flipped into
`101`, we store the visit on the false side of `a:101`.  Similarily, we store
the visit on the false side of `b:011`.  We omit the following process. The
resulting table is as follows (note that we omitted the visit ID):

	`a:101`: {T2}, {T1} >> MC/DC pair
	`a:110`: {}, {T3}
	`a:111`: {T4}, {}

	`b:011`: {T3}, {T1} >> MC/DC pair
	`b:110`: {}, {T2}
	`b:111`: {T4}, {}

Now we recognized an MC/DC pair for `a`, which is `<T2,T1>`, and an MC/DC pair
for `b`, which is `<T3,T1>`.

By using the hasing technique, we can avoid enumerating visit pairs and check
whether they are MC/DC pairs. The complexity is reduced from `O(v*v*d)` to
`O(v*d)`, where `v` is the number of visits, and `d` is the maximum number of
conditions in a decision.

## Developer FAQs

Here are some useful tips for building InstCov with LLVM/Clang. It is a little
bit tedious, but EVERY entry is very important and will save you a lot of time
on tackling building issues. Please read carefully.

### Prerequisites

* `gcc-4.7` or higher or `clang` (in a word, a compiler that supports `c++11`)
* `cmake` (I guess 3.0 or higher?)
* `ninja`: a fast build tool similar to `make`. See
[here](http://clang.llvm.org/docs/HowToSetupToolingForLLVM.html).
* `uuid-dev` (for Linux): UUID library used by InstCov
* `libxml2-dev` (for Linux)
* `MSVC 2012` or later (for Windows)

### Easy set up

We have provided a easy set up script. Use `set_up_cmake.sh` in Linux/OS X
and `set_up_cmake.bat` in Windows. The usage is:

    <path-to-set-up-cmake> <x86|x64> [<static|dynamic> <llvm-root-dir>] (for Windows)
	<path-to-set-up-cmake> <static|dynamic> <llvm-root-dir> (for Linux/OS X)


Argument `<x86|x64>` specifies compiling 32-bit or 64-bit executables.  Argument
`<static|dynamic>` specifies linking with static or dynamic runtime library
(must be `dynamic` for OS X). Argument `<llvm-root-dir>` specifies the root
directory of llvm.

For Windows, you can call the script with only the 1st argument. The
environmental variables will be set, and the makefiles won't be generated. This
is quite convenient since you have to set up the variables each time you open a
new command line window before building.

For Linux and OS X, it is usually hard to get the cross-compilation done. Thus
we do not allow compile x86 executables on a x64 machine, or vice versa.

### Setting up your build environment

You need to unpack `llvm` and `clang`, and put `clang` into `llvm/tools`.
Afterwards, you unpack or clone the source code of `instcov`, and put it into
`llvm/tools/clang/tools/extra` (another way is to create a soft link using `ln
-s`). After this, you need to add the following line to
`llvm/tools/clang/tools/extra/CMakeLists.txt` (or create the file if not exist):

	add_subdirectory(instcov)

Now we need to invoke `cmake` to generate the Makefiles. For me, I prefer an
out-of-source build. Suppose you are in the root source directory of `llvm`, and
you want to build in a directory in `build`.

	cd ../
	mkdir build && cd build
	cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../llvm
	ninja

If you want to save build time, please add `-DLLVM_TARGETS_TO_BUILD="X86"`, so
that LLVM will only build targets for x86 machines.

On Windows, you might need to run `<path-to-visual-studio>/VC/vcvarsall.bat` to
set your environmental variables correct before running `cmake` and `ninja`.  To
perform a 32-bit build, call `vcvarsall.bat` with argument `x86`.  To perform a
64-bit build, call `vcvarsall.bat` with argument `amd64`.  By default, the
platform toolset in VS 2012+ is set to `vc110` or so. The resulting executable
won't be compatible to Windows XP. Please reference
[here](http://blogs.msdn.com/b/vcblog/archive/2012/10/08/10357555.aspx).
Alternatively, you can use the Visual Studio generator in `cmake`.  In this
case, you need to go into the project properties of `ALL_BUILDS`, and change the
platform toolset into `vxxx_xp` in `Configuration Properties -> Generate`.

### The `llvm` source on my Mac OS X doesn't compile

On OS X, you need to download the `libcxx` and `libcxx-abi` (I'm not sure
`libcxx-abi` is mandatory) from the LLVM project releases page, unpack them, and
put them in directory `llvm/projects`.  This is a common issue encountered by
developers on OS X, but it is rarely discussed on available mailing lists or
developer communities.

### Building on Ubuntu Linux

You need at least gcc-4.7 to build the source code. If your Ubuntu source does
not have it, you can add the following PPA to your APT sources:

	deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu YOUR_UBUNTU_VERSION_HERE main 
	deb-src http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu YOUR_UBUNTU_VERSION_HERE main 

To specify your new compiler for `cmake`, you need to change the following
command:

	cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../llvm

into:

	CC=gcc-4.7 CXX=g++-4.7 cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../llvm


### Building static clang/llvm/instcov executables

On OS X, it cannot be done.

On Linux, you need to add `-DLLVM_BUILD_STATIC=ON` and
`-DLIBCLANG_BUILD_STATIC=ON` into the `cmake` command.  Besides, the original
BFD `ld` has a problem (may be a bug for static linking), you can install
`binutils-gold` to fix it. It is an official linker replacement for `ld`.
Additionally, please make sure you have `libz-dev` or `zlib1g-dev` installed
(otherwise an `inflate` undefined error will occur during linking).

On Windows, you need to add `-DLLVM_USE_CRT_RELEASE=MT`. Don't use
`-DLLVM_BUILD_STATIC=ON` and `-DLIBCLANG_BUILD_STATIC=ON`.

### Cross-compiling for i386 machines on a 64-bit Ubuntu

Since 64-bit Ubuntu does not come with a 32-bit version `libxml2` and
`uuid-dev`, PLEASE compile the source on a native 32-bit Ubuntu. I did not found
any solution for the missing 32-bit package.

### Adjustmenting CMake variables

Sometimes you need to change some CMake variables and build. There is no need to
delete everything and run CMake with the new arguments again. You just need to
run `ccmake ../llvm`, and it will opens up an interactive UI for changing CMake
variables and reconfigure. After you made changes to some variables, press `c`
and then `g`. Everything should be ready if your new configurations are correct.

Note that `ccmake` is not available on Windows.

### Using LLVM CommandLine Options

LLVM has already provided a library to write your own command line
options. Please reference [here](http://llvm.org/docs/CommandLine.html).
