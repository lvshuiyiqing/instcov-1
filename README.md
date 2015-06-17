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

	Besides, switch statements are not instrumented by default, you can enable
	this feature by using `-inst-switch`. Note that the branches for `switch`
	statements are in reverse order of their appearence. Besides, the branch id
	of `switch` statements start from 2. This is used to distinguish from binary
	decisions.

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
	`INSTCOV_TEXT_MODE` to `TRUE` or `YES` to enable text mode.

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

## Short-circuit handling in MC/DC analysis

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

		ea40348332aa1614639ae272a866ef9a:1 (2:3:toy.cpp)
		-b04aa8164f8db301dc54944630491a82:1 (2:19:toy.cpp)
		29473f3c9114636ed8b2d7af20cf99ab:0 (4:5:toy.cpp)
		-6d4697303c7812648e89c72d8bd718b0:1 (4:9:toy.cpp)
		-9463df6a988bac9cb4458cc4ed5c2a7:0 (4:18:toy.cpp)
		8e4b7b7fbefc729ef35b08a7ecf47e9a:1 (6:5:toy.cpp)
		-f046093806cf91ab4df0fc4df0d1ec83:0 (6:10:toy.cpp)
		-b4112332708ad4f47b7955ab9cab09b:1 (6:21:toy.cpp)
		ea40348332aa1614639ae272a866ef9a:1 (2:3:toy.cpp)
		-b04aa8164f8db301dc54944630491a82:1 (2:19:toy.cpp)
		29473f3c9114636ed8b2d7af20cf99ab:0 (4:5:toy.cpp)
		-6d4697303c7812648e89c72d8bd718b0:1 (4:9:toy.cpp)
		-9463df6a988bac9cb4458cc4ed5c2a7:0 (4:18:toy.cpp)
		8e4b7b7fbefc729ef35b08a7ecf47e9a:1 (6:5:toy.cpp)
		-f046093806cf91ab4df0fc4df0d1ec83:0 (6:10:toy.cpp)
		-b4112332708ad4f47b7955ab9cab09b:1 (6:21:toy.cpp)
		ea40348332aa1614639ae272a866ef9a:0 (2:3:toy.cpp)
		-b04aa8164f8db301dc54944630491a82:0 (2:19:toy.cpp)

* `replace`

		2149762f41ba07bffd5a8d69dffe3198:0 (527:4:replace.c)
		-264159f50adf98f54a8ad15dde52d6bc:0 (527:8:replace.c)
		6d4601d79ff4b5ad6a9c159286a11b83:1 (203:5:replace.c)
		-a74a798721d0c0fb99f714d7a7905caa:0 (203:14:replace.c)
		-604051f482598323148ed320b69c359c:1 (203:24:replace.c)
		-694c8259d1f5bc67499f077b17a03d9c:1 (203:45:replace.c)
		...
		254730c9d5f8b0dde4d48052546780a2:1 (498:6:replace.c)
		-90463eb5302b5afcd01a1968d7d935b5:1 (498:11:replace.c)
		-a4471a8ddee8120618dc38945dcb5dad:0 (498:24:replace.c)
		5e4e8cba5694aad1ebdc39ef6ff5a6a4:0 (491:2:replace.c)
		-2a4832c3e93c98f47eb61a484d37b2b2:0 (491:10:replace.c)
		149b69b4000f027d17da8a49588e991:0 (514:5:replace.c)
		-61404f75b8e489c51c11b61140b1ab9:0 (514:12:replace.c)

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

	Trace of Test #1:

		144fe8151897460c21cc4feb5fe1f587:0 (4:3:test.cpp)
		-834734717b3a18b1bfd6b5d9e7b3e4a6:0 (4:7:test.cpp)
		32482c4245f18c8471985c6aa945628d:1 (11:3:test.cpp)
		-944c6d1b92d71f91df32dd9038a4ba0:1 (11:7:test.cpp)
		-aa4180b7fffe332888fd167cd701c488:1 (11:18:test.cpp)
		3642860f4363bf063871969d5753be8e:1 (13:3:test.cpp)
		-c847b12ee2dd586aef7cc4f249063b96:0 (13:7:test.cpp)
		-e4448f34fd8efd5d12b06becbeccdf9c:1 (13:18:test.cpp)

	Trace of Test #2:

		144fe8151897460c21cc4feb5fe1f587:0 (4:3:test.cpp)
		-834734717b3a18b1bfd6b5d9e7b3e4a6:0 (4:7:test.cpp)
		32482c4245f18c8471985c6aa945628d:1 (11:3:test.cpp)
		-944c6d1b92d71f91df32dd9038a4ba0:1 (11:7:test.cpp)
		-aa4180b7fffe332888fd167cd701c488:1 (11:18:test.cpp)
		3642860f4363bf063871969d5753be8e:1 (13:3:test.cpp)
		-c847b12ee2dd586aef7cc4f249063b96:0 (13:7:test.cpp)
		-e4448f34fd8efd5d12b06becbeccdf9c:1 (13:18:test.cpp)

	`mcdc-scan` report:

		Decision: 144fe8151897460c21cc4feb5fe1f587:
		Condition: 834734717b3a18b1bfd6b5d9e7b3e4a6 > Uncovered
		Decision: 32482c4245f18c8471985c6aa945628d:
		Condition: 944c6d1b92d71f91df32dd9038a4ba0 > Uncovered
		Condition: aa4180b7fffe332888fd167cd701c488 > Covered
		Decision: 3642860f4363bf063871969d5753be8e:
		Condition: c847b12ee2dd586aef7cc4f249063b96 > Uncovered
		Condition: e4448f34fd8efd5d12b06becbeccdf9c > Covered

* `tcas`:

	The trace of the first test case:

		97425c937013d8a27fe98c654fb151ae:0 (148:5:tcas.c)
		-98405f1e323cefcca65c75c5cdbe07a7:0 (148:8:tcas.c)
		ce425623f8032f64df0003cf433e7b9:1 (124:5:tcas.c)
		-2e4d0e2821937797d66fdc5087c564ab:1 (124:9:tcas.c)
		-b34cddc8cc6b2d87ebfcc9a30688ebb:0 (124:22:tcas.c)
		-ee450d35fe827d679b7789734c5e75b1:1 (124:39:tcas.c)
		-a74389e1151bf33cd12aa7d8946fb86:0 (124:61:tcas.c)
		8c4abb58a368bf0c9e8cafeabd3b028a:1 (73:5:tcas.c)
		-a4460c0e92ac3c6c86acaa9bfc088e80:1 (73:9:tcas.c)
		7a41dce3921f7d9f7459816374198680:1 (91:5:tcas.c)
		-ed4f84e2b91d2bc8276a49139c528bbd:1 (91:9:tcas.c)
		a449894374e6182bbcec626d4a3e3983:0 (128:2:tcas.c)
		-c347bb820831ed794b145dcc90af6fbe:0 (128:6:tcas.c)
		-a74a6fac400f80fa495b61f90ffa2ca5:0 (128:24:tcas.c)
		f74848953be8f81bd365633f66e32ab1:0 (133:7:tcas.c)
		-62423496ea275de842e81114d38c1a87:0 (133:11:tcas.c)
		9e455b82080bdf38264b32566a729ea1:0 (135:7:tcas.c)
		-6c4f913d259d52beec06e63223c52da2:0 (135:11:tcas.c)

	`mcdc-scan` report:

		Decision: ce425623f8032f64df0003cf433e7b9:
		Condition: a74389e1151bf33cd12aa7d8946fb86 > Uncovered
		Condition: b34cddc8cc6b2d87ebfcc9a30688ebb > Uncovered
		Condition: 2e4d0e2821937797d66fdc5087c564ab > Covered
		Condition: ee450d35fe827d679b7789734c5e75b1 > Covered
		Decision: 7a41dce3921f7d9f7459816374198680:
		Condition: ed4f84e2b91d2bc8276a49139c528bbd > Covered
		Decision: 8c4abb58a368bf0c9e8cafeabd3b028a:
		Condition: a4460c0e92ac3c6c86acaa9bfc088e80 > Covered
		Decision: 97425c937013d8a27fe98c654fb151ae:
		Condition: 98405f1e323cefcca65c75c5cdbe07a7 > Covered
		Decision: 9e455b82080bdf38264b32566a729ea1:
		Condition: 6c4f913d259d52beec06e63223c52da2 > Covered
		Decision: a449894374e6182bbcec626d4a3e3983:
		Condition: a74a6fac400f80fa495b61f90ffa2ca5 > Uncovered
		Condition: c347bb820831ed794b145dcc90af6fbe > Uncovered
		Decision: f74848953be8f81bd365633f66e32ab1:
		Condition: 62423496ea275de842e81114d38c1a87 > Covered
