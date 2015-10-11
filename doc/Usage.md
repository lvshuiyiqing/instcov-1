# InstCov README

## Introduction

InstCov is a generic platform for C/C++ code instrumentation based on Clang.  It
provides an easy interface that allows you to perform customized instrumentation
for specific purposes, such as coverage analysis, dynamic verification, etc.
Currently, we have already implemented instrumentation and analysis for MC/DC
coverage, branch coverage, function coverage and switch statement branch coverage.

If you want to add customed intrumentation to InstCov, please see the
developers' guide.

## Basic Usage

To use the tool, you need to follow these steps (in Windows, you should run
vcvarsall.bat first to set up your building environment, which is located in your
MSVC installation directory):

1.  Preprocess your original source code using clang with argument `-E` and
	`-include instcov_rt.h` (with proper `-I` option so the compiler can find the
	runtime file). The macros in the source code will be expanded.


2.  Instrument the source code with `instcov`:

	`<path-to-instcov>/instcov [options] <your-source-file> --
	[clang compilation args]`

	The behavior of instcov is controlled by *actions*. An action performs a
    certain kind of instrumentation. Currently, instcov supports three actions:

	* `dc`: instrument for branch coverage / MC/DC coverage analysis;
	* `switch`: instrument the switch statements for coverage analysis;
	* `func`: instrument for function coverage.

	For the default option, only decision recording is enabled (i.e. branch
	coverage only). If you want to enable coverage recording for conditions (for
	MC/DC analysis), please add `-inst-conditions`.

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

3.  Build the instrumented code. Plus you should link your program with
	`libinstcov_rt.a`. Then your program should be instrumented.

4.  After you run your program, the trace file will be written into
	`instcov.dump`. You can change the file name by setting environment variable
	`INSTCOV_FILE`.

5.  (Optional) Run the analysis tool `instcov-view` to view the debug
    information file or the trace file in a pretty way:

	`<path-to-instcov-view>/instcov-view [options] <trace file>
    [-di <.dbginfo file> ...]`

	`instcov-view` will print the trace in a pretty way.  If you add `-di-only`
	option, then the trace file will be omitted. It will print the debug
	information in a pretty way.

	If you add `-dc` option, then `instcov-view` will print the
    decisions/conditions in the debug information/trace in a structured format.

6.  When you have run one or more test cases, and have obtained one or more
	trace files, you can analysis the coverage using `cov-scan`:

	`<path-to-cov-scan>/cov-scan [-analyzer <analyzer>] [<-di dbginfo files> ...] <trace files ...> <-o output_file>`

	Here you can choose different analyzers: `dc` for decision coverage or
    condition coverage; `func` for function coverage; `mcdc` for MCDC coverage.

	For the `dc` analyzer, the default behavior is to analyze the decision
    coverage as well as condition coverage. You can disable condition coverage
    analysis using `-dc-with-conditions=false`. In the report file, each
    condition/decision has two symbols enclosed by square brackets `[**]`,
    showing whether the true branch/false branch is covered/uncovered (`+/-`).

	For the `func` analyzer, there will be a `+/-` enclosed by square brackets
    `[]` for each function, showing whether the function is covered or not.

	You can also use `-mcdc-verbose` option to make `mcdc` analyzers to print
    more verbosely, showing all the MC/DC pairs. Node that the MC/DC pairs are
    recognized by visits, because one test case may visit a decision multiple
    times. We need to tell which visit of which test case pairs with another
    visit of some test case. Each visit is identified by `<test ID, visit ID>`.

	Additionally, the `mcdc` analyzer also supports encoding the problem of
	minimizing the number of selected test cases to reach maximum MC/DC coverage
	into a PBO (pseudo-Boolean Optimization) problem.  You can enable this
	feature by adding `-mcdc-emit-pbo`, then the output file will be a PBO
	problem. You should then solve the problem using PBO solvers (e.g. `clasp`) to
    generate the result. The output of PBO solvers is barely easy to understand,
    you can use

	`scripts/parse_pbo_out.py <solver_output_file> <PBO file>`

	to parse the output and generate the result. Note that the generated PBO
    problem file contains meta information which is used by the script.

## Using the scripts

Alternatively, you can use the wrapper scripts shipped with this package. **You
need to customize the directories in script `instcov_env` before using them.**
The descriptions for the scripts (use the `.bat` extensions in Windows) are as
follows:

* `prep.py`: the preprocessor wrapper, it preprocesses the given files,
including the InstCov runtime header, and dumps `<file>.<extension>` to
`<file>.i.<extension>`;

* `instcov.py`: it's just a redirection of instcov, if you don't want to modify
your PATH environment;

* `ccwraper.py`: a wrapper for compiling the transformed code. It will
automatically add options to the linker, so as to link with the InstCov runtime
library;

* `instcov_view.py`: it is just a wrapper for instcov-view;

* `run_single_file.py`: it is a script for running all needed steps for
experimenting on a single program. You can specify command line arguments for
executing the subject program. Note that this script does not call `cov-scan`.
You need to run several different test cases, and call `cov-scan` on the
produced trace files;

* `compile_single_file.py`: same with `run_single_file.py`, but will not execute
the program and run `instcov-view`;

* `cov_scan.py`: just a wrapper for cov-scan.

## Optional features

### Short-circuit handling in MC/DC analysis

By default, instcov supports short-circuit handling. This means that only the
conditions that are evaluated during execution is dumped. For example, if the
decision is `a||b`, and if `a=true`, `b=true` at this point, the value of `b`
will not dumped, thus labeled as `X` (unevaluated).

When finding `MC/DC` pairs, if either side of assignment of a condition is `X`,
then the two assignment of the condition is identical. For example, assignments:

	TX=>T
	FF=>F

will be considered an `MC/DC` pair on the first condition.

If you assume there are no short-circuit in the program, and want to dump all
conditions despite of short circuits, you can add `-no-short-circuits` to
`instcov`. In this case, you can also run `mcdc-scan` faster by using
`-analyzer=fast` argument.

If you are using the script files, modify the corresponding line in
`instcov_env` to enable short-circuit handling.

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
    (<line>:<col>:<file>)`):

		BID=1 [DCDC]Loc=2:3:toy.cpp, UUID=7547325c1dc4676c161ebe510a7ce79f, Parent=00000000000000000000000000000000
		-BID=1 [DCDC]Loc=2:19:toy.cpp, UUID=e6475329f0c60e28134f124f6be32fa8, Parent=7547325c1dc4676c161ebe510a7ce79f
		BID=0 [DCDC]Loc=4:5:toy.cpp, UUID=594df176f35f4d7c4b2727fd9a6c8a8c, Parent=00000000000000000000000000000000
		-BID=1 [DCDC]Loc=4:9:toy.cpp, UUID=8240d73efa45cb06356f775a62cf71be, Parent=594df176f35f4d7c4b2727fd9a6c8a8c
		-BID=0 [DCDC]Loc=4:18:toy.cpp, UUID=8441c4233275c99ff9b24f2feb9db3aa, Parent=594df176f35f4d7c4b2727fd9a6c8a8c
		BID=1 [DCDC]Loc=6:5:toy.cpp, UUID=37419fa9d827136190707cfbdb472a9e, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=6:10:toy.cpp, UUID=a84f654f991a40e869745faf72e6e7a1, Parent=37419fa9d827136190707cfbdb472a9e
		-BID=1 [DCDC]Loc=6:21:toy.cpp, UUID=f04cc2ca20f8a46aaea2c1135246a297, Parent=37419fa9d827136190707cfbdb472a9e
		BID=1 [DCDC]Loc=2:3:toy.cpp, UUID=7547325c1dc4676c161ebe510a7ce79f, Parent=00000000000000000000000000000000
		-BID=1 [DCDC]Loc=2:19:toy.cpp, UUID=e6475329f0c60e28134f124f6be32fa8, Parent=7547325c1dc4676c161ebe510a7ce79f
		BID=0 [DCDC]Loc=4:5:toy.cpp, UUID=594df176f35f4d7c4b2727fd9a6c8a8c, Parent=00000000000000000000000000000000
		-BID=1 [DCDC]Loc=4:9:toy.cpp, UUID=8240d73efa45cb06356f775a62cf71be, Parent=594df176f35f4d7c4b2727fd9a6c8a8c
		-BID=0 [DCDC]Loc=4:18:toy.cpp, UUID=8441c4233275c99ff9b24f2feb9db3aa, Parent=594df176f35f4d7c4b2727fd9a6c8a8c
		BID=1 [DCDC]Loc=6:5:toy.cpp, UUID=37419fa9d827136190707cfbdb472a9e, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=6:10:toy.cpp, UUID=a84f654f991a40e869745faf72e6e7a1, Parent=37419fa9d827136190707cfbdb472a9e
		-BID=1 [DCDC]Loc=6:21:toy.cpp, UUID=f04cc2ca20f8a46aaea2c1135246a297, Parent=37419fa9d827136190707cfbdb472a9e
		BID=0 [DCDC]Loc=2:3:toy.cpp, UUID=7547325c1dc4676c161ebe510a7ce79f, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=2:19:toy.cpp, UUID=e6475329f0c60e28134f124f6be32fa8, Parent=7547325c1dc4676c161ebe510a7ce79f

* `replace`

		BID=0 [DCDC]Loc=527:4:replace.c, UUID=b7432d60ad0affac2cdaa3d1bbd37bb3, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=527:8:replace.c, UUID=ef461afced24d9b472d08174036e2299, Parent=b7432d60ad0affac2cdaa3d1bbd37bb3
		BID=1 [DCDC]Loc=203:5:replace.c, UUID=1e49a32c7a0a1dfabc2ef60b5452acb9, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=203:14:replace.c, UUID=6d47fadb9cd2f92684548b42a3f3c48a, Parent=1e49a32c7a0a1dfabc2ef60b5452acb9
		-BID=1 [DCDC]Loc=203:24:replace.c, UUID=0441ee8c5d0a8fbaa4cee5aa7f67a5a4, Parent=1e49a32c7a0a1dfabc2ef60b5452acb9
		-BID=1 [DCDC]Loc=203:45:replace.c, UUID=af426374983239bf48c2d07b84b2ba95, Parent=1e49a32c7a0a1dfabc2ef60b5452acb9
		...
		BID=1 [DCDC]Loc=498:6:replace.c, UUID=d44b11e53c0f81b655da909be1d48295, Parent=00000000000000000000000000000000
		-BID=1 [DCDC]Loc=498:11:replace.c, UUID=a34c20a4560636d0460bd99d6d608f8f, Parent=d44b11e53c0f81b655da909be1d48295
		-BID=NA [DCDC]Loc=498:24:replace.c, UUID=9e4d44f0424b61ae9f61be656b1e1ea3, Parent=d44b11e53c0f81b655da909be1d48295
		BID=0 [DCDC]Loc=491:2:replace.c, UUID=8044f2b784357e9c9c3937ce81944383, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=491:10:replace.c, UUID=2d46f4d607316ee73008437d8a374a91, Parent=8044f2b784357e9c9c3937ce81944383
		BID=0 [DCDC]Loc=514:5:replace.c, UUID=f24f539de5a5a5a2c413757f65bd99a4, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=514:12:replace.c, UUID=62488d1f9dfbcd7436b55c6c49bab286, Parent=f24f539de5a5a5a2c413757f65bd99a4

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

	Raw trace of Test #1:

		[FUNC] UUID=e9454becfe8897abcc709c1c86a064be
		[DCDC] UUID=794ab5cbba81e7e600a97285e3d42bb7, BID=0
		[DCDC] UUID=f043ed4bfef405279969e79a16f274bf, BID=0
		[DCDC] UUID=4a40e96bd89b2d0c2d1e058cb8481c90, BID=1
		[DCDC] UUID=6e44137f497b83a474b55cd61dcb5bba, BID=1
		[DCDC] UUID=ed44a76c5202a9777ae0f766e26194b0, BID=1
		[DCDC] UUID=2e429b21499220b21006f32f00f52caf, BID=0
		[DCDC] UUID=8e45e88c0b797f13928fbb46bbb27b98, BID=1
		[DCDC] UUID=1848c08f74d54dfee7ce6650d3f0ec8f, BID=1

	Trace of Test #1:

		BID=0 [DCDC]Loc=4:3:test.cpp, UUID=f043ed4bfef405279969e79a16f274bf, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=4:7:test.cpp, UUID=794ab5cbba81e7e600a97285e3d42bb7, Parent=f043ed4bfef405279969e79a16f274bf
		BID=1 [DCDC]Loc=11:3:test.cpp, UUID=ed44a76c5202a9777ae0f766e26194b0, Parent=00000000000000000000000000000000
		-BID=1 [DCDC]Loc=11:7:test.cpp, UUID=4a40e96bd89b2d0c2d1e058cb8481c90, Parent=ed44a76c5202a9777ae0f766e26194b0
		-BID=1 [DCDC]Loc=11:18:test.cpp, UUID=6e44137f497b83a474b55cd61dcb5bba, Parent=ed44a76c5202a9777ae0f766e26194b0
		BID=1 [DCDC]Loc=13:3:test.cpp, UUID=1848c08f74d54dfee7ce6650d3f0ec8f, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=13:7:test.cpp, UUID=2e429b21499220b21006f32f00f52caf, Parent=1848c08f74d54dfee7ce6650d3f0ec8f
		-BID=1 [DCDC]Loc=13:18:test.cpp, UUID=8e45e88c0b797f13928fbb46bbb27b98, Parent=1848c08f74d54dfee7ce6650d3f0ec8f

	Trace of Test #2:

		BID=0 [DCDC]Loc=4:3:test.cpp, UUID=f043ed4bfef405279969e79a16f274bf, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=4:7:test.cpp, UUID=794ab5cbba81e7e600a97285e3d42bb7, Parent=f043ed4bfef405279969e79a16f274bf
		BID=0 [DCDC]Loc=11:3:test.cpp, UUID=ed44a76c5202a9777ae0f766e26194b0, Parent=00000000000000000000000000000000
		-BID=1 [DCDC]Loc=11:7:test.cpp, UUID=4a40e96bd89b2d0c2d1e058cb8481c90, Parent=ed44a76c5202a9777ae0f766e26194b0
		-BID=0 [DCDC]Loc=11:18:test.cpp, UUID=6e44137f497b83a474b55cd61dcb5bba, Parent=ed44a76c5202a9777ae0f766e26194b0
		BID=0 [DCDC]Loc=13:3:test.cpp, UUID=1848c08f74d54dfee7ce6650d3f0ec8f, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=13:7:test.cpp, UUID=2e429b21499220b21006f32f00f52caf, Parent=1848c08f74d54dfee7ce6650d3f0ec8f
		-BID=0 [DCDC]Loc=13:18:test.cpp, UUID=8e45e88c0b797f13928fbb46bbb27b98, Parent=1848c08f74d54dfee7ce6650d3f0ec8f

	Trace of Test #3:

		BID=0 [DCDC]Loc=4:3:test.cpp, UUID=f043ed4bfef405279969e79a16f274bf, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=4:7:test.cpp, UUID=794ab5cbba81e7e600a97285e3d42bb7, Parent=f043ed4bfef405279969e79a16f274bf
		BID=0 [DCDC]Loc=11:3:test.cpp, UUID=ed44a76c5202a9777ae0f766e26194b0, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=11:7:test.cpp, UUID=4a40e96bd89b2d0c2d1e058cb8481c90, Parent=ed44a76c5202a9777ae0f766e26194b0
		-BID=NA [DCDC]Loc=11:18:test.cpp, UUID=6e44137f497b83a474b55cd61dcb5bba, Parent=ed44a76c5202a9777ae0f766e26194b0
		BID=0 [DCDC]Loc=13:3:test.cpp, UUID=1848c08f74d54dfee7ce6650d3f0ec8f, Parent=00000000000000000000000000000000
		-BID=0 [DCDC]Loc=13:7:test.cpp, UUID=2e429b21499220b21006f32f00f52caf, Parent=1848c08f74d54dfee7ce6650d3f0ec8f
		-BID=0 [DCDC]Loc=13:18:test.cpp, UUID=8e45e88c0b797f13928fbb46bbb27b98, Parent=1848c08f74d54dfee7ce6650d3f0ec8f

	`mcdc-scan` report:

		f043ed4bfef405279969e79a16f274bf (4:3:test.cpp):
		-794ab5cbba81e7e600a97285e3d42bb7 (4:7:test.cpp) > Uncovered
		ed44a76c5202a9777ae0f766e26194b0 (11:3:test.cpp):
		-4a40e96bd89b2d0c2d1e058cb8481c90 (11:7:test.cpp) > Covered
		-6e44137f497b83a474b55cd61dcb5bba (11:18:test.cpp) > Covered
		1848c08f74d54dfee7ce6650d3f0ec8f (13:3:test.cpp):
		-2e429b21499220b21006f32f00f52caf (13:7:test.cpp) > Covered
		-8e45e88c0b797f13928fbb46bbb27b98 (13:18:test.cpp) > Covered
		SUMMARY: 4/5 covered

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

		60466cbf8505373f473496cfb1cf2d9c (63:13:tcas.c):
		-204c37ef0808bae1dc90113a89fec1bc (63:13:tcas.c) > Covered
		b54dbfc5a7eb00d8b721ea1dd233b689 (73:5:tcas.c):
		-f3473fcb165b75704313be30221ab7af (73:9:tcas.c) > Covered
		1f4b633135a3fb3c9e555cf3ecbc43ba (75:11:tcas.c):
		-644c866047313f35b205625f55485592 (75:13:tcas.c) > Covered
		-cc463201e417e93f061f424cebf9bdbf (75:38:tcas.c) > Uncovered
		-6149c4f9b9cbed3ae0aedd4866c814b0 (75:64:tcas.c) > Covered
		83487d718c2b38ded4e18cb2f516bba4 (79:11:tcas.c):
		-a145e6a79bbc6ddb4b4ec21959cb6c9d (79:11:tcas.c) > Covered
		-954fd7fef75f5abe51a4f6b1aeb1a386 (79:34:tcas.c) > Uncovered
		-644c7848547b9332839689b23d9662a7 (79:63:tcas.c) > Covered
		8f4fc233eef1dd5fba491bb8f2cdb080 (91:5:tcas.c):
		-404a5c6c53e18cc5698bd151008b3688 (91:9:tcas.c) > Covered
		2a44e52c25c76eec55fa7c744ae43ead (93:11:tcas.c):
		-ed401c0b632302e5f4a4b96690a5488d (93:11:tcas.c) > Covered
		-ff431a0b2c287d76d397fec8d7622594 (93:34:tcas.c) > Uncovered
		-d046cddbed4a3989631b58d821530fbd (93:63:tcas.c) > Covered
		244dbf8d4a10e709c2f93af782c5cb97 (97:11:tcas.c):
		-574ba357b0873cfc305215d1c0824190 (97:13:tcas.c) > Covered
		-e44cc6660c72764cf42b41ecec718b87 (97:38:tcas.c) > Uncovered
		-e3484635aff6398f950040c73b601e9a (97:62:tcas.c) > Covered
		d94282cebcc759d5dc3cc59448fbb6a5 (118:15:tcas.c):
		-1e44ec41b929130ff36b1b724e9737ae (118:15:tcas.c) > Covered
		-424dc73353964014cd839120f4e77b89 (118:35:tcas.c) > Covered
		-af4eb2ac050e2c0b7dcf792bfa569897 (118:68:tcas.c) > Covered
		734a4c5a92e62b424dec4a13896c01ae (120:24:tcas.c):
		-0046e6e465740e7d5fc00b3116644db3 (120:24:tcas.c) > Uncovered
		-924384fd12dee07456e7403515318fa9 (120:54:tcas.c) > Uncovered
		cb481c9fb787756de531cc220b899cae (124:5:tcas.c):
		-164f7bf8091aef30847e02596fa8f59b (124:9:tcas.c) > Covered
		-784753607ff5fe6f4a3616b0a9cf3ea6 (124:22:tcas.c) > Uncovered
		-ad474f88c21639e70b3638223582d8a8 (124:39:tcas.c) > Covered
		-b14bca0931b401106734a11708ff3caa (124:61:tcas.c) > Uncovered
		2d45ed048a49fc5555e1749486a382b9 (126:19:tcas.c):
		-d845123262efad0d381ac78a6805dfb4 (126:19:tcas.c) > Uncovered
		-f34b8a8ed02d91305973a99c9a220287 (126:50:tcas.c) > Uncovered
		094b8430d09dd46c819bfb8d0b2f5294 (127:21:tcas.c):
		-2045a16e7d15d9f4375ec83058065c9f (127:21:tcas.c) > Uncovered
		-724d212bdce427536192a111d8364ca3 (127:54:tcas.c) > Uncovered
		e8410835865a579b69b8145abea3ca96 (128:2:tcas.c):
		-4740b1d9c57c0113b2ab0a3458954983 (128:6:tcas.c) > Uncovered
		-5b4cbdd45c250bb391f6ba2812433689 (128:24:tcas.c) > Uncovered
		44408af15a2135621c18e059dc9612b2 (133:7:tcas.c):
		-b0404c962cc46ed972b2eeff9baed48d (133:11:tcas.c) > Covered
		034be88a0ce4270a97db25fe6ff0c08d (135:7:tcas.c):
		-7a46666d9b702187225e414e293358a8 (135:11:tcas.c) > Covered
		7a453756dcd6492618177ae96a7ad5b6 (148:5:tcas.c):
		-b74a83bc5182772f7a6aeb3d874556b2 (148:8:tcas.c) > Covered
		SUMMARY: 19/33 covered
