NAME=FSharp.Build-proto
ASSEMBLY = $(NAME).dll

include ../config.make

CONFIG=proto

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
	$(objdir)FSBuild.resources

$(objdir)FSBuild.resources: ../FSharp.Build/FSBuild.txt
	mono --debug $(FSSRGEN) $< $(@:.resources=.fs) $(@:.resources=.resx)
	resgen $(@:.resources=.resx) $@

include ../targets.make

