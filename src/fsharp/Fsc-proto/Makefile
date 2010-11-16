NAME=fsc-proto
ASSEMBLY = $(NAME).exe

bindir=../../../lib/original/4.0/r53135/
tooldir=../../../lib/original/2.0/
libdir=`pkg-config --variable=libdir mono`/mono/4.0/
libdir35=`pkg-config --variable=libdir mono`/mono/3.5/
outdir=../../../lib/proto/

FSC=$(bindir)fsc.exe
FSSRGEN=$(tooldir)fssrgen.exe

FLAGS= \
	--doc:$(NAME).xml \
	--versionfile:../../../source-build-version \
	-g \
	--mlcompatibility \
	--noframework \
	--target:exe \
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
	--define:BUILDING_PROTO \
	--define:BUILDING_WITH_LKG \
	--define:COMPILER

REFERENCES= \
	-r:$(bindir)FSharp.Core.dll \
	-r:$(outdir)FSharp.Compiler-proto.dll \
	-r:$(libdir)Microsoft.Build.Engine.dll \
	-r:$(libdir)Microsoft.Build.Framework.dll \
	-r:$(libdir35)Microsoft.Build.Tasks.v3.5.dll \
	-r:$(libdir35)Microsoft.Build.Utilities.v3.5.dll \
	-r:$(libdir)mscorlib.dll \
	-r:$(libdir)System.Core.dll \
	-r:$(libdir)System.dll \
	-r:$(libdir)System.Runtime.Remoting.dll \
	-r:$(libdir)System.Windows.Forms.dll

sources = \
	FSCstrings.fs \
	../../assemblyinfo/assemblyinfo.fsc-proto.exe.fs \
	../../utils/filename.fsi \
	../../utils/filename.fs \
	../fsc.fs \
	../fscmain.fs

RESOURCES = \
	--resource:FSCstrings.resources

all: $(ASSEMBLY)

FSCstrings.fs: ../FSCstrings.txt
	mono --debug $(FSSRGEN) ../FSCstrings.txt $@ FSCstrings.resx

FSCstrings.resources: FSCstrings.fs
	resgen FSCstrings.resx $@

$(ASSEMBLY): FSCstrings.resources $(sources)
	@-mkdir -p $(outdir)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)
	@-cp $@ $(outdir)
	@-cp $(NAME).xml $(outdir)
	@-cp $@.mdb $(outdir)

clean:
	@-rm *.resx
	@-rm *.resources
	@-rm FSCstrings.*
	@-rm $(outdir)$(ASSEMBLY)
	@-rm $(outdir)$(ASSEMBLY).mdb
	@-rm $(outdir)$(NAME).xml
