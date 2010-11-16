NAME=fsc-proto
ASSEMBLY = $(NAME).exe

include ../Makefile.inc

FSC=$(bindir)fsc.exe

FLAGS += --target:exe

DEFINES += \
	--define:BUILDING_PROTO \
	--define:BUILDING_WITH_LKG \
	--define:COMPILER

REFERENCES += \
	-r:$(bindir)FSharp.Core.dll \
	-r:$(outdir)FSharp.Compiler-proto.dll \
	-r:$(libdir)System.Runtime.Remoting.dll \
	-r:$(libdir)System.Windows.Forms.dll

sources = \
	$(objdir)FSCstrings.fs \
	../../utils/filename.fsi \
	../../utils/filename.fs \
	../fsc.fs \
	../fscmain.fs

RESOURCES = \
	--resource:$(objdir)FSCstrings.resources

$(objdir)FSCstrings.fs: ../FSCstrings.txt
	mono --debug $(FSSRGEN) ../FSCstrings.txt $@ $(patsubst %.fs,%.resx,$@)

$(objdir)FSCstrings.resources: $(objdir)FSCstrings.fs
	resgen $(patsubst %.resources,%.resx,$@) $@

$(objdir)$(ASSEMBLY): $(objdir)FSCstrings.resources $(sources)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(REFERENCES) $(DEFINES) $(FLAGS) $(RESOURCES) $(sources)

