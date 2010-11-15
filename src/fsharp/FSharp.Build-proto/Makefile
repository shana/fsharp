NAME=FSharp.Build-proto
ASSEMBLY = $(NAME).dll

bindir=../../../lib/original/4.0/
tooldir=../../../lib/original/2.0/
libdir=`pkg-config --variable=libdir mono`/mono/4.0/
libdir35=`pkg-config --variable=libdir mono`/mono/3.5/
outdir=../../../lib/proto/

FSSRGEN=$(tooldir)fssrgen.exe
FSC=$(bindir)fsc.exe

FLAGS = \
	--doc:$(outdir)$(NAME).xml \
	--versionfile:../../../source-build-version \
	-g \
	--debug:full \
	--noframework \
	--optimize- \
	--target:library \
	--nowarn:69,65,54,61,75 \
	--warn:3 \
	--warnaserror:76 \
	--LCID:1033 \
	--utf8output \
	--fullpaths \
	--flaterrors \
	--times \
	--no-jit-optimize \
	--jit-tracking

DEFINES = \
	--define:CODE_ANALYSIS \
	--define:DEBUG \
	--define:NO_STRONG_NAMES \
	--define:BUILDING_WITH_LKG \
	--define:DEBUG \
	--define:TRACE \
	--define:FX_ATLEAST_40 \
	--define:FX_ATLEAST_35

REFERENCES = \
	-r:$(bindir)FSharp.Core.dll \
	-r:$(libdir)Microsoft.Build.Engine.dll \
	-r:$(libdir)Microsoft.Build.Framework.dll \
	-r:$(libdir35)Microsoft.Build.Tasks.v3.5.dll \
	-r:$(libdir35)Microsoft.Build.Utilities.v3.5.dll \
	-r:$(libdir)mscorlib.dll \
	-r:$(libdir)System.Core.dll \
	-r:$(libdir)System.dll

sources= \
	FSBuild.fs \
	../../utils/CompilerLocationUtils.fs \
	../FSharp.Build/CreateFSharpManifestResourceName.fsi \
	../FSharp.Build/CreateFSharpManifestResourceName.fs \
	../FSharp.Build/Fsc.fsi \
	../FSharp.Build/Fsc.fs

RESOURCES = \
	--resource:FSBuild.resources

all: $(ASSEMBLY)

FSBuild.fs: ../FSharp.Build/FSBuild.txt
	MONO_PATH=$(bindir) mono --debug $(FSSRGEN) ../FSharp.Build/FSBuild.txt $@ FSBuild.resx

FSBuild.resources: FSBuild.fs
	resgen FSBuild.resx $@

$(ASSEMBLY): FSBuild.resources $(sources)
	@-mkdir -p $(outdir)
	MONO_PATH=$(bindir) mono-sgen $(MONO_OPTIONS) --debug $(FSC) -o:$(outdir)$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)

clean:
	@-rm FSBuild.*
