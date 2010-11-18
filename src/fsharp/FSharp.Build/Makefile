NAME=FSharp.Build
ASSEMBLY = $(NAME).dll

include ../config.make

FSC=$(protodir)fsc-proto.exe

FLAGS += \
	$(FINAL_FLAGS) \
	--target:library

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
	$(objdir)FSBuild.resources

$(objdir)FSBuild.resources: FSBuild.txt
	mono --debug $(FSSRGEN) $< $(@:.resources=.fs) $(@:.resources=.resx)
	resgen $(@:.resources=.resx) $@

include ../targets.make
