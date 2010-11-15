NAME=fsc-proto
ASSEMBLY = $(NAME).exe

bindir=../../../lib/original/4.0/
tooldir=../../../lib/original/2.0/
libdir=`pkg-config --variable=libdir mono`/mono/4.0/
libdir35=`pkg-config --variable=libdir mono`/mono/3.5/
outdir=../../../lib/proto/

FSSRGEN=$(tooldir)fssrgen.exe
FSC=$(bindir)fsc.exe

FLAGS= \
	--doc:$(outdir)$(NAME).xml \
	--versionfile:../../../source-build-version \
	-g \
	--noframework \
	--optimize- \
	--target:exe \
	--nowarn:62,69,65,54,61,75 \
	--warn:3 \
	--warnaserror:76 \
	--vserrors \
	--LCID:1033 \
	--utf8output \
	--fullpaths \
	--flaterrors \
	--stackReserveSize:4096000 \
	--times \
	--no-jit-optimize \
	--jit-tracking

DEFINES= \
	--define:DEBUG \
	--define:NO_STRONG_NAMES \
	--define:TRYING_TO_FIX_4577 \
	--define:BUILDING_PROTO \
	--define:BUILDING_WITH_LKG \
	--define:COMPILER \
	--define:INCLUDE_METADATA_READER \
	--define:INCLUDE_METADATA_WRITER \
	--define:FX_FSLIB_STRUCTURAL_EQUALITY \
	--define:FX_FSLIB_IOBSERVABLE \
	--define:FX_FSLIB_LAZY \
	--define:FX_FSLIB_TUPLE \
	--define:FX_ATLEAST_40 \
	--define:FX_ATLEAST_35

REFERENCES= \
	-r:$(bindir)FSharp.Core.dll \
	-r:$(libdir)Microsoft.Build.Engine.dll \
	-r:$(libdir)Microsoft.Build.Framework.dll \
	-r:$(libdir35)Microsoft.Build.Tasks.v3.5.dll \
	-r:$(libdir35)Microsoft.Build.Utilities.v3.5.dll \
	-r:$(libdir)mscorlib.dll \
	-r:$(libdir)System.Core.dll \
	-r:$(libdir)System.dll \
	-r:$(libdir)System.Runtime.Remoting.dll \
	-r:$(libdir)System.Windows.Forms.dll \
	-r:$(outdir)FSharp.Compiler-proto.dll

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
	MONO_PATH=$(bindir) mono --debug $(FSSRGEN) ../FSCstrings.txt $@ FSCstrings.resx

FSCstrings.resources: FSCstrings.fs
	resgen FSCstrings.resx $@

$(ASSEMBLY): FSCstrings.resources $(sources)
	@-mkdir -p $(outdir)
	MONO_PATH=$(bindir) mono-sgen $(MONO_OPTIONS) --debug $(FSC) -o:$(outdir)$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)

clean:
	rm *.resx
	rm *.resources
	rm FSCstrings.*
