NAME=FSharp.Build-proto
ASSEMBLY = $(NAME).dll

bindir=../../../lib/original/4.0/r53135/
tooldir=../../../lib/original/2.0/
libdir=`pkg-config --variable=libdir mono`/mono/4.0/
libdir35=`pkg-config --variable=libdir mono`/mono/3.5/
outdir=../../../lib/proto/

FSC=$(bindir)fsc.exe
FSSRGEN=$(tooldir)fssrgen.exe

FLAGS = \
	--doc:$(NAME).xml \
	--versionfile:../../../source-build-version \
	-g \
	--mlcompatibility \
	--noframework \
	--target:library \
	--fullpaths \
	--times

DEFINES_GENERAL = \
	--define:NO_STRONG_NAMES \
	--define:TRACE \
	--define:FX_ATLEAST_35
	
DEFINES_DEBUG = \
	--define:CODE_ANALYSIS \
	--define:DEBUG

DEFINES_2_0 = \
	--define:FX_FSLIB_STRUCTURAL_EQUALITY \
	--define:FX_FSLIB_IOBSERVABLE \
	--define:FX_FSLIB_TUPLE \
	--define:FX_FSLIB_LAZY

DEFINES = \
	$(DEFINES_GENERAL) \
	$(DEFINES_DEBUG) \
	$(DEFINES_2_0) \
	--define:BUILDING_WITH_LKG

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
	mono --debug $(FSSRGEN) ../FSharp.Build/FSBuild.txt $@ FSBuild.resx

FSBuild.resources: FSBuild.fs
	resgen FSBuild.resx $@

$(ASSEMBLY): FSBuild.resources $(sources)
	@-mkdir -p $(outdir)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(REFERENCES) $(DEFINES) $(FLAGS) $(RESOURCES) $(sources)
	@-cp $@ $(outdir)
	@-cp $(NAME).xml $(outdir)
	@-cp $@.mdb $(outdir)

clean:
	@-rm FSBuild.*
	@-rm $(outdir)$(ASSEMBLY)
	@-rm $(outdir)$(ASSEMBLY).mdb
	@-rm $(outdir)$(NAME).xml
