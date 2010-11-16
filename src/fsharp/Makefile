.PHONY: proto library

all: proto library compiler

proto:
	make -C FSharp.Build-proto
	make -C FSharp.Compiler-proto
	make -C Fsc-proto

library: proto
	make -C FSharp.Core

compiler: proto library
	make -C FSharp.Build
	make -C FSharp.Compiler

clean:
	make -C FSharp.Build-proto clean
	make -C FSharp.Compiler-proto clean
	make -C Fsc-proto clean
	make -C FSharp.Core clean

