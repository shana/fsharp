NAME=FSharp.Build
ASSEMBLY = $(NAME).dll

include ../Makefile.inc

outdir=../../../lib/debug/

FSC=$(proto)fsc-proto.exe

FLAGS += --target:library

REFERENCES += \
	-r:$(outdir)FSharp.Core.dll

sources= \
	$(objdir)FSBuild.fs \
	../../assemblyinfo/assemblyinfo.FSharp.Build.dll.fs \
	../../utils/CompilerLocationUtils.fs \
	Fsc.fsi \
	Fsc.fs \
	CreateFSharpManifestResourceName.fsi \
	CreateFSharpManifestResourceName.fs

RESOURCES = \
	--resource:$(objdir)FSBuild.resources

$(objdir)FSBuild.fs: FSBuild.txt
	mono --debug $(FSSRGEN) FSBuild.txt $@ $(objdir)FSBuild.resx

$(objdir)FSBuild.resources: $(objdir)FSBuild.fs
	resgen $(objdir)FSBuild.resx $@

$(objdir)$(ASSEMBLY): $(objdir)FSBuild.resources $(sources)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(REFERENCES) $(DEFINES) $(FLAGS) $(RESOURCES) $(sources)

