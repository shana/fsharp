NAME=FSharp.Build-proto
ASSEMBLY = $(NAME).dll

include ../Makefile.inc

FSC=$(bindir)fsc.exe

FLAGS += --target:library

DEFINES += \
	--define:BUILDING_WITH_LKG

REFERENCES += \
	-r:$(bindir)FSharp.Core.dll 

sources= \
	$(objdir)FSBuild.fs \
	../../utils/CompilerLocationUtils.fs \
	../FSharp.Build/CreateFSharpManifestResourceName.fsi \
	../FSharp.Build/CreateFSharpManifestResourceName.fs \
	../FSharp.Build/Fsc.fsi \
	../FSharp.Build/Fsc.fs

RESOURCES = \
	--resource:$(objdir)FSBuild.resources

$(objdir)FSBuild.fs: ../FSharp.Build/FSBuild.txt
	mono --debug $(FSSRGEN) ../FSharp.Build/FSBuild.txt $@ $(objdir)FSBuild.resx

$(objdir)FSBuild.resources: $(objdir)FSBuild.fs
	resgen $(objdir)FSBuild.resx $@

$(objdir)$(ASSEMBLY): $(objdir)FSBuild.resources $(sources)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(REFERENCES) $(DEFINES) $(FLAGS) $(RESOURCES) $(sources)

