# InstCov README

## Introduction

InstCov is a Clang-based instrumentation tool for branch coverage and MCDC
coverage recording.

## Prerequisites

Since InstCov uses uuid_generate in Linux, please make sure you have
`libuuid.so` installed, which is included in debian package `uuid-dev`.

## Basic Usage

To use the tool, you need to follow these steps:

1. Preprocess your original source code using `-E` option in the compiler.
Plus, please also use `-include instcov_rt.h` and proper `-I` option to make the
compiler include the InstCov runtime header first.

2. Convert your original source code into an intermediate form using
instcov. The code will be injected with profiling code:

	`<path-to-instcov>/instcov [args] <your-source-file> --
	[clang [compilation args]]`

	For the default option, only branch coverage recording is enabled.  If you
	want to enable MCDC coverage recording, please add `-inst-conditions`. (You
	can check the help messages using `instcov --help`.)

	After the running this command, a `.dbginfo` file will generated for each
	file, containing the debug information for later analysis.

3. Build the instrumented code by explicitly linking your program with
`libinstcov_rt.a`. Then your program should be instrumented.

4. After you run your program, the trace file will be written into
`instcov.dump`. You can change the file name by setting environment variable
`INSTCOV_FILE`.

	The trace file will be written in binary mode by default. Also, the trace
	file could be written in text mode. You need to set environment variable
	`INSTCOV_TEXT_MODE` to `TRUE` or `YES` to enable text mode.

5. Run the analysis tool `instcov-view` to analyse the trace file:

	`<path-to-instcov-view>/instcov-view <instcov.dump> [.dbginfo files ...]`

	The analyzed trace will be written in an output file (the name is
	`parsed_trace.pt` by default). Note that only binary dump format is
	supported for analysis.



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
executing the subject program.

## An example output

We have successfully run InstCov on some small programs, as well as some larger
programs such as `tcas` and `replace`. Here are several examples.

* A toy example:

	The source code:

		int main(void) {
		  int a = 1, b = 2;
		  if (a < b && a > b) {
		  }
		  if ((a > b) || (a < b)) {
		  }
		  return 0;
		}

	The analyzed trace:

		4340997be091f218ce446c96bab07da9:3:3:0
		--94446679359f33d08d2770a4b7821ead:3:7:1
		--5f46ffc34430252a8ac2dee11d1a50a4:3:16:0
		7140d9249e85caa6af4071196abc3ea9:5:3:1
		--624130644025a1adc30c0009d4b9698e:5:7:0
		--1e40c08338d32b158e014954889f96b3:5:18:1

* `tcas`

		31405db48646e45eeb241f107d419581:148:5:0
		--c4bdf99d81daedd80f40c8f8d7ac695:148:8:0
		5c46ac23096e4eeaae5b5277d997e2b1:124:5:1
		--4f4ade35217e90c755b7b028cc80a0be:124:9:1
		--d0447db96977f7938dfccbb3e49900bf:124:20:1
		8146be6853caca431c5cc61365d0a683:73:5:1
		--e54f431dd6c7f13b7d5217a69b6e4697:73:9:1
		1a4ca17e78c3d947a855edde774a5bb8:91:5:1
		--2c4766a97b8bd590975e123a7d864c83:91:9:1
		c341bdcd5a4ecec23825ec14c2e071b1:128:2:0
		--914ae7458703ab6dcb06f0e9ce9e95a4:128:6:0
		--3941f6013031631b4238384763cd839c:128:24:0
		4a47524627f7f88ae94ad109a70d93bc:133:7:0
		--8743e01bafa86bae6360d535dd0efba4:133:11:0
		f641416ae41aeedad566449fd3b0cb3:135:7:0
		--4c4abb2d425ad7f570fc66525ddf94bc:135:11:0

* `replace`

		e4455d5441ab0f2d4dd34e67beed0292:527:4:0
		--514add8fc098d210ee4940f0f4abaaba:527:8:0
		2947b97658a4b027c8a038f1a6618a99:203:5:1
		--36473d7edca3de2fc460541867d563bf:203:12:1
		--b443b3f398cf7d96537fd5ecac2a86ac:203:23:1
		--bb4f1ba311f89797ac43ce2ed5de1d86:203:44:1
		284e8f8af16eb03a36543ab7a2467790:205:2:0
		--54af096921315be41b95369159af9e:205:6:0
		97487eba8552f5a145a078742bb39193:207:7:0
		--8b4fdf6a1f96b06b8b139cabe80e289:207:11:0
		--924db171396cad7c6223a28c047c9eb6:207:30:1
		b84040f910320e38ce9a7c948205f4b5:209:7:0
		--9b4ced53d60ceaefff37b591ddb4f58e:209:11:0
		...
		554282c831f2023ec8ab48091fef7ba9:494:6:0
		--d047473ac8e8e06a615974ea1c0abc83:494:10:0
		--104dfe8b71fc4bb15fa480dbd6eb45b8:494:22:1
		78476b05ee67a2152fc6daae3248f0ad:498:6:1
		--af47922824e84b8e1dbdb477bf1fb7ae:498:10:1
		--7c469fc3c822ad48ad920f9a17c4c1ac:498:23:0
		824c705ab48c2a62100d978720794b8:491:2:0
		--ff4410e450299e649d198a692d039787:491:9:0
		894db0e14b32ba2c70d49c4cc9e1d2b0:514:5:0
		--264c5bb2bbc690bde781755813e998:514:12:0

