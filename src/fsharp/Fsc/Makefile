NAME=fsc
ASSEMBLY = $(NAME).exe

include ../config.make

FSC=$(protodir)fsc-proto.exe

FLAGS += \
	$(FINAL_FLAGS) \
	--target:exe

REFERENCES += \
	-r:$(outdir)FSharp.Core.dll \
	-r:$(outdir)FSharp.Compiler.dll \
	-r:$(libdir)System.Runtime.Remoting.dll \
	-r:$(libdir)System.Windows.Forms.dll 

sources = \
	$(objdir)FSCstrings.fs \
	../../assemblyinfo/assemblyinfo.fsc.exe.fs \
	../fsc.fs \
	../fscmain.fs

RESOURCES = \
	$(objdir)FSCstrings.resources

$(objdir)FSCstrings.resources: ../FSCstrings.txt
	mono --debug $(FSSRGEN) $< $(@:.resources=.fs) $(@:.resources=.resx)
	resgen $(@:.resources=.resx) $@

include ../targets.make
