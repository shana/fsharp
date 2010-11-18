.PHONY: proto library compiler

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
	make -C Fsc

install:
	$(MAKE) -C FSharp.Core $@

clean:
	$(MAKE) -C FSharp.Build-proto $@
	$(MAKE) -C FSharp.Compiler-proto $@
	$(MAKE) -C Fsc-proto $@
	$(MAKE) -C FSharp.Core $@
	$(MAKE) -C FSharp.Build $@
	$(MAKE) -C FSharp.Compiler $@
	$(MAKE) -C Fsc $@

