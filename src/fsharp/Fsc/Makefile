NAME=fsc
ASSEMBLY = $(NAME).exe

include ../Makefile.inc

outdir=../../../lib/debug/

FSC=$(proto)fsc-proto.exe

FLAGS += --target:exe

REFERENCES += \
	-r:$(outdir)FSharp.Core.dll \
	-r:$(outdir)FSharp.Compiler.dll
	-r:$(libdir)System.Runtime.Remoting.dll \
	-r:$(libdir)System.Windows.Forms.dll 

sources = \
	$(objdir)FSCstrings.fs \
	../../assemblyinfo/assemblyinfo.fsc-proto.exe.fs \
	../fsc.fs \
	../fscmain.fs

RESOURCES = \
	--resource:$(objdir)FSCstrings.resources

$(objdir)FSCstrings.fs: ../FSCstrings.txt
	mono --debug $(FSSRGEN) ../FSCstrings.txt $@ $(objdir)FSCstrings.resx

$(objdir)FSCstrings.resources: $(objdir)FSCstrings.fs
	resgen $(objdir)FSCstrings.resx $@

$(objdir)$(ASSEMBLY): setup $(objdir)FSCstrings.resources $(sources)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)

