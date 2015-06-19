# InstCov README

## Introduction

InstCov is a Clang-based instrumentation tool for branch coverage and MCDC
coverage recording.

## Basic Usage

To use the tool, you need to follow these steps:

1. Preprocess your original source code using clang with argument `-E` and
`-include instcov_rt.h` (with proper `-I` option so the compiler can find the
runtime file). The macros in the source code will be expanded.


2. Convert the resulting source code into an intermediate form using
instcov. The code will be injected with profiling code:

	`<path-to-instcov>/instcov [options] <your-source-file> --
	[clang [compilation args]]`

	For the default option, only decision recording is enabled.  If you want to
	enable coverage recording for conditions, please add `-inst-conditions`.

	You need to explicitly specify option `-mf <file_name>`. InstCov will only
	instrument those files matching `<file_name>`. Note that we have
	preprocessed the source file using `-E` option in Step 1. The preprocessed
	file will have `#line` preprocessor directives, indicating the original line
	number and file of the expanded version. InstCov will use these `#line`
	directives to guess the original file name of each program entity. If a
	decision is not in `<file_name>`, InstCov will skip it. You can also specify
	multiple files by specifying multiple `-mf <file_name>` options.

	If you have any questions about the arguments, you can check the help
    messages using `instcov --help`.

	After the running this command, a `.dbginfo` file will generated for each
	source file, containing the debug information for later analysis.

3. Build the instrumented code. Plus you should link your program with
`libinstcov_rt.a`. Then your program should be instrumented.

4. After you run your program, the trace file will be written into
`instcov.dump`. You can change the file name by setting environment variable
`INSTCOV_FILE`.

	The trace file will be written in binary mode by default. Also, the trace
	file could be written in text mode. You need to set environment variable
	`INSTCOV_TEXT_MODE` to `TRUE` or `YES` to enable text mode (this feature is
	to be deprecated).

5. Run the analysis tool `instcov-view` to analyse the trace file:

	`<path-to-instcov-view>/instcov-view -t <instcov.dump> [.dbginfo files ...]`

	The analyzed trace will be written in an output file (the name is
	`parsed_trace.pt` by default). You can also customize the dump format by
	using argument `-f`. Note that only binary dump format is supported for
	analysis.

	If you add `-di-only` option and remove the `-t <instcov.cump>` option for
    `instcov-view`, it will simply dump the `.dbginfo` files in plain text. This
    can be run after Step 2.

6. When you have run one or more test cases, and have obtained one or more `.pt`
files, you can analysis the MC/DC coverage using `mcdc-scan`:

	`<path-to-mcdc-scan>/mcdc-scan <.pt files ...>`

	You can also use `-v` option to make `mcdc-scan` to print more verbosely,
    showing all the MC/DC pairs. Node that the MC/DC pairs are recognized by
    visits, because one test case may visit a decision multiple times. We need
    to tell which visit of which test case pairs with another visit of some test
    case. Each visit is identified by `<test ID, visit ID>`.

## Using the scripts

Alternatively, you can use the wrapper scripts shipped with this package. **You
need to customize the directories in script `instcov_env` before using them.**
The descriptions for the scripts are as follows:

* `prep.sh`: the preprocessor wrapper, it preprocesses the given files,
including the InstCov runtime header, and dumps `<file>.<extension>` to
`<file>.i.<extension>`.

* `instcov.sh`: it's just a redirection of instcov, if you don't want to modify
your PATH environment;

* `ccwraper.sh`: a wrapper for compiling the transformed code. It will
automatically add options to the linker, so as to link with the InstCov runtime
library.

* `instcov-view.sh`: it is just a wrapper for instcov-view.

* `run_single_file.sh`: it is a script for running all needed steps for
experimenting on a single program. You can specify command line arguments for
executing the subject program. Note that this script does not call `mcdc-scan`.
You need to run several different test cases, and call `mcdc-scan` on their
`.pt` files.

* `compile_single_file.sh`: same with `run_single_file.sh`, but will not execute
the program and run `instcov-view`.

## Optional features

### Short-circuit handling in MC/DC analysis

By default, instcov supports short-circuit handling. This means that only the
conditions that are evaluated during execution is dumped. For example, if the
decision is `a||b`, and if `a=true`, `b=true` at this point, the value of `b`
will not dumped, thus labeled as `N` (unevaluated).

When finding `MC/DC` pairs, if either side of assignment of a condition is `N`,
then the two assignment of the condition is identical. For example, assignments:

	TN=>T
	FF=>F

will be considered an `MC/DC` pair on the first condition.

If you assume there are no short-circuit in the program, and want to dump all
conditions despite of short circuits, you can add `-no-short-circuits` to
`instcov`. In this case, you can also run `mcdc-scan` faster by using
`-analyzer=fast` argument.

If you are using the script files, modify the corresponding line in
`instcov_env` to enable short-circuit handling.

### Switch statements

Switch statements are not instrumented by default, you can enable this
feature by using `-inst-switch`. Note that the branches for `switch` statements
are in reverse order of their appearence. Besides, the branch id of `switch`
statements start from 2. This is used to distinguish from binary decisions.
Besides, switch statements are not analyzed for MC/DC coverage.

### Assignment operators and variable declarations

The right hand side (RHS) of assignment operators, return statements and
variable declarations may also contain logical evaluations. By default,
`instcov` does not instrument these RHS expressions. You can enable this feature
by adding `-inst-RHS` to `instcov` arguments.

To determine whether an RHS expression should be instrumented, `instcov` skips
the top-level implicit casts of the RHS expression, and check whether they are
logical operators (`&&`, `||` or `!`). If yes, it will instrument the RHS
expression as normal conditional expressions.

## An example output

We have successfully run InstCov on some small programs, as well as some larger
programs such as `tcas` and `replace`. Here are several examples.

* A toy example (`toy.cpp`):

	The source code:

		int main(void) {
			for (int i = 0; i < 2; ++i) {
				int a = 1, b = 2;
				if (a < b && a > b) {
				}
				if ((a > b) || (a < b)) {
				}
			}
			return 0;
		}
			
	The analyzed trace (the format is `<condition/decision id>:<branch id>
    (<line>:<col>:<file>)`)

		4f48a0500d234dbe67ece66145e0a5a5:1 (2:3:toy.cpp)
		-f14f15d92dbb26bded2c9c07c40d139c:1 (2:19:toy.cpp)
		4242610f8415fcb5154369de65391696:0 (4:5:toy.cpp)
		-bd4119098e99a84943446ff8dc5e3b3:1 (4:9:toy.cpp)
		-a14cf24b92dc89344aea47a5b80b3ac:0 (4:18:toy.cpp)
		ab43e5669a9b0fc415efb4bd5040db87:1 (6:5:toy.cpp)
		-cf4224c21dd104b826549c570ada61b9:0 (6:10:toy.cpp)
		-354a7a6e75894fddf6eb1a35ad3bc6ad:1 (6:21:toy.cpp)
		4f48a0500d234dbe67ece66145e0a5a5:1 (2:3:toy.cpp)
		-f14f15d92dbb26bded2c9c07c40d139c:1 (2:19:toy.cpp)
		4242610f8415fcb5154369de65391696:0 (4:5:toy.cpp)
		-bd4119098e99a84943446ff8dc5e3b3:1 (4:9:toy.cpp)
		-a14cf24b92dc89344aea47a5b80b3ac:0 (4:18:toy.cpp)
		ab43e5669a9b0fc415efb4bd5040db87:1 (6:5:toy.cpp)
		-cf4224c21dd104b826549c570ada61b9:0 (6:10:toy.cpp)
		-354a7a6e75894fddf6eb1a35ad3bc6ad:1 (6:21:toy.cpp)
		4f48a0500d234dbe67ece66145e0a5a5:0 (2:3:toy.cpp)
		-f14f15d92dbb26bded2c9c07c40d139c:0 (2:19:toy.cpp)

* `replace`

		6b4182a3082a996da89c6a1a43ce06b4:0 (527:4:replace.c)
		-9a49c4bf2e4dd8f53f6864e1d4a0dfa5:0 (527:8:replace.c)
		444a9d84a5cba66e71bb270bac38caab:1 (203:5:replace.c)
		-9944304342e995f821ba6cf6474ed6aa:0 (203:14:replace.c)
		-bc43b3b1d627e5d98af8569ab79d3e97:1 (203:24:replace.c)
		-6e48449aa3ae968b50d0f2555d100e81:1 (203:45:replace.c)
		...
		794e8302520bcc7187d76936e808589f:1 (498:6:replace.c)
		-e94be46a84b4f7d96ae803c1b61d04ab:1 (498:11:replace.c)
		-504af80e8327d17c9a6ac59fc55487a1:NA (498:24:replace.c)
		694621b9e3559da22464647d64e6358e:0 (491:2:replace.c)
		-f14970167dc3c5e7203c8158adb9719b:0 (491:10:replace.c)
		494d11c9ef431b854f7eb4616e368684:0 (514:5:replace.c)
		-7a4e5778b8d8f8d1d2b87306cb494cb9:0 (514:12:replace.c)

* `test-mcdc-scan` (with MC/DC analysis)

	Source code:

		#include <cstdlib>

		int main(int argc, char *argv[]) {
		  if (argc < 5) {
		    return 1;
		  }
		  int v1 = atoi(argv[1]);
		  int v2 = atoi(argv[2]);
		  int v3 = atoi(argv[3]);
		  int v4 = atoi(argv[4]);
		  if (v1 == 1 && v2 == 1) {
		  }
		  if (v3 == 1 || v4 == 1) {
		  }
		  return 0;
		}

	Test cases:

		1 1 0 1
		1 0 0 0
		0 0 0 0

	Trace of Test #1:

		eb49b93bf843fe80b9a870949759e8a3:0 (4:3:test.cpp)
		-3f4973546d43dba06f05e9ce8ee86:0 (4:7:test.cpp)
		30487f17a4ce25f63338753ae64631ad:1 (11:3:test.cpp)
		-f44b183a0e57ce2718fb1f44cc29f8c:1 (11:7:test.cpp)
		-764c730c4d8e8940154fabd0810c0ca3:1 (11:18:test.cpp)
		ef4363374b31010cfa4357956d939f87:1 (13:3:test.cpp)
		-c74135f61db2f02ac7d034dabe1527ab:0 (13:7:test.cpp)
		-7a441cd51fc6d442879e1a2750c18faf:1 (13:18:test.cpp)

	Trace of Test #2:

		eb49b93bf843fe80b9a870949759e8a3:0 (4:3:test.cpp)
		-3f4973546d43dba06f05e9ce8ee86:0 (4:7:test.cpp)
		30487f17a4ce25f63338753ae64631ad:0 (11:3:test.cpp)
		-f44b183a0e57ce2718fb1f44cc29f8c:1 (11:7:test.cpp)
		-764c730c4d8e8940154fabd0810c0ca3:0 (11:18:test.cpp)
		ef4363374b31010cfa4357956d939f87:0 (13:3:test.cpp)
		-c74135f61db2f02ac7d034dabe1527ab:0 (13:7:test.cpp)
		-7a441cd51fc6d442879e1a2750c18faf:0 (13:18:test.cpp)

	Trace of Test #3:

		eb49b93bf843fe80b9a870949759e8a3:0 (4:3:test.cpp)
		-3f4973546d43dba06f05e9ce8ee86:0 (4:7:test.cpp)
		30487f17a4ce25f63338753ae64631ad:0 (11:3:test.cpp)
		-f44b183a0e57ce2718fb1f44cc29f8c:0 (11:7:test.cpp)
		-764c730c4d8e8940154fabd0810c0ca3:NA (11:18:test.cpp)
		ef4363374b31010cfa4357956d939f87:0 (13:3:test.cpp)
		-c74135f61db2f02ac7d034dabe1527ab:0 (13:7:test.cpp)
		-7a441cd51fc6d442879e1a2750c18faf:0 (13:18:test.cpp)

	`mcdc-scan` report:

		Decision: eb49b93bf843fe80b9a870949759e8a3 (4:3:test.cpp):
		Condition: 3f4973546d43dba06f05e9ce8ee86 (4:7:test.cpp) > Uncovered
		Decision: 30487f17a4ce25f63338753ae64631ad (11:3:test.cpp):
		Condition: f44b183a0e57ce2718fb1f44cc29f8c (11:7:test.cpp) > Covered
		Condition: 764c730c4d8e8940154fabd0810c0ca3 (11:18:test.cpp) > Covered
		Decision: ef4363374b31010cfa4357956d939f87 (13:3:test.cpp):
		Condition: c74135f61db2f02ac7d034dabe1527ab (13:7:test.cpp) > Uncovered
		Condition: 7a441cd51fc6d442879e1a2750c18faf (13:18:test.cpp) > Covered

* `tcas`:

	The trace of the first test case:

		bc4baf42567f86ea259990974295d0a9:0 (148:5:tcas.c)
		-5a440310f0906ccf54edda4d62a29b8:0 (148:8:tcas.c)
		f848c0c3c271e93ec1e01e4e74ace892:0 (118:15:tcas.c)
		-d34850ea46c0f0c1eabcfd77b9d59b92:1 (118:15:tcas.c)
		-fc4bfa555e8dce254419b7ce118d9383:1 (118:35:tcas.c)
		-54bdadea1a93502e74fd12f1f8940b0:1 (118:68:tcas.c)
		de4c79f98d883cdb471f627cb28e5cb4:0 (120:24:tcas.c)
		-ec4fa6470799489148e77c207b45d0b4:1 (120:24:tcas.c)
		-8647782fb8b7d786902ec1cf28764589:NA (120:54:tcas.c)
		b14e94617bab43d899f17ec56fcd52b2:1 (124:5:tcas.c)
		-8a43aae1cc90fa4b3e2551be2048ead:1 (124:9:tcas.c)
		-6049817192bbb3cd35af271c00ff27a2:0 (124:22:tcas.c)
		-f446e76bcda1d1a76eb6e29ac0f154b6:NA (124:39:tcas.c)
		-be44d77bf39acf989106721829ce788c:0 (124:61:tcas.c)
		904709a0eed68f5677a38e9a83f3759d:1 (73:5:tcas.c)
		-ff4c78150b639b80a5f26b69b92eadb1:1 (73:9:tcas.c)
		eb4e6475a3aa3db3df78fbf1ad2ece8d:1 (75:11:tcas.c)
		-bf4f29dbd501537ae6a9a6e8e193b0b1:1 (75:13:tcas.c)
		-77413eb2484eff0438a346c50021178c:1 (75:38:tcas.c)
		-7f4485b45c726e007ec517c040e1369e:1 (75:64:tcas.c)
		e240aa002384250cafe41b277109ea84:1 (91:5:tcas.c)
		-6b4209f64df6529b992259799f1e048a:1 (91:9:tcas.c)
		e04d72cd8bac34249d7599b5e4a1b3bf:0 (93:11:tcas.c)
		-3a46b9216debf45d900d08eea4df7b8b:1 (93:11:tcas.c)
		-7a4cc11f76540e647b07d22d43441680:1 (93:34:tcas.c)
		-924d7273d65e88938321221e365fb8a1:1 (93:63:tcas.c)
		4f48d4eca13348801c1d316626ca6487:1 (127:21:tcas.c)
		-1745cc57ea8b837db98f93f2d45d3b83:1 (127:21:tcas.c)
		-7a40a340d1e2a934a41009c885234689:NA (127:54:tcas.c)
		9c4cefd1b019359ab9842d3d02c5ad93:0 (128:2:tcas.c)
		-624aba746a0ab04ad0f12750c6787ab4:0 (128:6:tcas.c)
		-ed42de7f417968ae92b0fbb13221a8a3:NA (128:24:tcas.c)
		4a445045f2d62e38c835f1ad2c01ba9d:0 (133:7:tcas.c)
		-18445642ff69d39748e3026430ce85b3:0 (133:11:tcas.c)
		484f0f75d82547a310f8ecbbc8d8d6a6:0 (135:7:tcas.c)
		-bb40a41bb925677abb032b2095785ab6:0 (135:11:tcas.c)

	`mcdc-scan` report:

		Decision: 904709a0eed68f5677a38e9a83f3759d (73:5:tcas.c):
		Condition: ff4c78150b639b80a5f26b69b92eadb1 (73:9:tcas.c) > Covered
		Decision: eb4e6475a3aa3db3df78fbf1ad2ece8d (75:11:tcas.c):
		Condition: bf4f29dbd501537ae6a9a6e8e193b0b1 (75:13:tcas.c) > Covered
		Condition: 77413eb2484eff0438a346c50021178c (75:38:tcas.c) > Uncovered
		Condition: 7f4485b45c726e007ec517c040e1369e (75:64:tcas.c) > Covered
		Decision: 7941ecd75c206533dd8a7797fc8e8c (79:11:tcas.c):
		Condition: eb42137565bbd3ab31a166cbb50bc587 (79:11:tcas.c) > Covered
		Condition: 104d4fb15dc0d6e5e176a443ce4a7897 (79:34:tcas.c) > Uncovered
		Condition: 604f9bc1e2c2e328ca32854d9b3fbebf (79:63:tcas.c) > Covered
		Decision: e240aa002384250cafe41b277109ea84 (91:5:tcas.c):
		Condition: 6b4209f64df6529b992259799f1e048a (91:9:tcas.c) > Covered
		Decision: e04d72cd8bac34249d7599b5e4a1b3bf (93:11:tcas.c):
		Condition: 3a46b9216debf45d900d08eea4df7b8b (93:11:tcas.c) > Covered
		Condition: 7a4cc11f76540e647b07d22d43441680 (93:34:tcas.c) > Uncovered
		Condition: 924d7273d65e88938321221e365fb8a1 (93:63:tcas.c) > Covered
		Decision: 87451e70188cd079c685cad648c728b0 (97:11:tcas.c):
		Condition: 34628e9efe94d7b11400f48cc2b6cb9 (97:13:tcas.c) > Covered
		Condition: 2843cdee52af282b1b4cd6d043d5aab7 (97:38:tcas.c) > Uncovered
		Condition: ee48918e81f44ff27c1313782990cbb1 (97:62:tcas.c) > Covered
		Decision: f848c0c3c271e93ec1e01e4e74ace892 (118:15:tcas.c):
		Condition: d34850ea46c0f0c1eabcfd77b9d59b92 (118:15:tcas.c) > Covered
		Condition: fc4bfa555e8dce254419b7ce118d9383 (118:35:tcas.c) > Covered
		Condition: 54bdadea1a93502e74fd12f1f8940b0 (118:68:tcas.c) > Covered
		Decision: de4c79f98d883cdb471f627cb28e5cb4 (120:24:tcas.c):
		Condition: ec4fa6470799489148e77c207b45d0b4 (120:24:tcas.c) > Uncovered
		Condition: 8647782fb8b7d786902ec1cf28764589 (120:54:tcas.c) > Uncovered
		Decision: b14e94617bab43d899f17ec56fcd52b2 (124:5:tcas.c):
		Condition: 8a43aae1cc90fa4b3e2551be2048ead (124:9:tcas.c) > Covered
		Condition: 6049817192bbb3cd35af271c00ff27a2 (124:22:tcas.c) > Uncovered
		Condition: f446e76bcda1d1a76eb6e29ac0f154b6 (124:39:tcas.c) > Covered
		Condition: be44d77bf39acf989106721829ce788c (124:61:tcas.c) > Uncovered
		Decision: 445a749630bc7cbdc99dde184a620aa (126:19:tcas.c):
		Condition: 81407789ff3e7bb65578c662288fe595 (126:19:tcas.c) > Uncovered
		Condition: b94cd8c61a2d81a4aae3b95bd27a8eab (126:50:tcas.c) > Uncovered
		Decision: 4f48d4eca13348801c1d316626ca6487 (127:21:tcas.c):
		Condition: 1745cc57ea8b837db98f93f2d45d3b83 (127:21:tcas.c) > Uncovered
		Condition: 7a40a340d1e2a934a41009c885234689 (127:54:tcas.c) > Uncovered
		Decision: 9c4cefd1b019359ab9842d3d02c5ad93 (128:2:tcas.c):
		Condition: 624aba746a0ab04ad0f12750c6787ab4 (128:6:tcas.c) > Uncovered
		Condition: ed42de7f417968ae92b0fbb13221a8a3 (128:24:tcas.c) > Uncovered
		Decision: 4a445045f2d62e38c835f1ad2c01ba9d (133:7:tcas.c):
		Condition: 18445642ff69d39748e3026430ce85b3 (133:11:tcas.c) > Covered
		Decision: 484f0f75d82547a310f8ecbbc8d8d6a6 (135:7:tcas.c):
		Condition: bb40a41bb925677abb032b2095785ab6 (135:11:tcas.c) > Covered
		Decision: bc4baf42567f86ea259990974295d0a9 (148:5:tcas.c):
		Condition: 5a440310f0906ccf54edda4d62a29b8 (148:8:tcas.c) > Covered
