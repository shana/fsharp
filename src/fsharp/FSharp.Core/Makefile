NAME=FSharp.Core
ASSEMBLY = $(NAME).dll

bindir=../../../lib/original/4.0/
tooldir=../../../lib/original/2.0/
libdir=`pkg-config --variable=libdir mono`/mono/4.0/
libdir35=`pkg-config --variable=libdir mono`/mono/3.5/
proto=../../../lib/proto/
outdir=../../../lib/debug/

FSC=$(proto)fsc-proto.exe

FLAGS= \
	--doc:$(outdir)$(NAME).xml \
	--versionfile:../../../source-build-version \
	--target:library \
	-g \
	--debug:full \
	--noframework \
	--baseaddress:0x05000000 \
	--optimize- \
	--nowarn:9,35,40,44,51,57,58,60,62,65,76,77,56,1204,69,65,54,61,75 \
	--warn:3 \
	--warnaserror:76 \
	--vserrors \
	--LCID:1033 \
	--utf8output \
	--fullpaths \
	--flaterrors \
	--warnon:1182 \
	--compiling-fslib \
	--optimize \
	--maxerrors:20 \
	--extraoptimizationloops:1 \
	--times \
	--no-jit-optimize \
	--jit-tracking \
	--nooptimizationdata

DEFINES= \
	--define:CODE_ANALYSIS \
	--define:NO_STRONG_NAMES \
	--define:RUNTIME \
	--define:DEBUG \
	--define:TRACE \
	--define:FX_ATLEAST_40 \
	--define:FX_ATLEAST_35

REFERENCES= \
	-r:$(libdir)mscorlib.dll \
	-r:$(libdir)System.Core.dll \
	-r:$(libdir)System.dll \
	-r:$(libdir)System.Numerics.dll \
	-r:$(proto)FSharp.Compiler-proto.dll

sources = \
	prim-types-prelude.fsi \
	prim-types-prelude.fs \
	SR.fs \
	prim-types.fsi \
	prim-types.fs \
	local.fsi \
	local.fs \
	array2.fsi \
	array2.fs \
	option.fsi \
	option.fs \
	collections.fsi \
	collections.fs \
	seq.fsi \
	seq.fs \
	string.fsi \
	string.fs \
	list.fsi \
	list.fs \
	array.fsi \
	array.fs \
	array3.fsi \
	array3.fs \
	map.fsi \
	map.fs \
	set.fsi \
	set.fs \
	reflect.fsi \
	reflect.fs \
	event.fsi \
	event.fs \
	math/n.fsi \
	math/n.fs \
	math/z.fsi \
	math/z.fs \
	../../utils/sformat.fsi \
	../../utils/sformat.fs \
	printf.fsi \
	printf.fs \
	quotations.fsi \
	quotations.fs \
	nativeptr.fsi \
	nativeptr.fs \
	control.fsi \
	control.fs \
	fslib-extra-pervasives.fsi \
	fslib-extra-pervasives.fs \
	../../assemblyinfo/assemblyinfo.FSharp.Core.dll.fs

RESOURCES = \
	--resource:FSCore.resources

all: $(ASSEMBLY)

FSCore.resources: FSCore.resx
	resgen FSCore.resx $@

$(ASSEMBLY): FSCore.resources $(sources)
	@-mkdir -p $(outdir)
	MONO_PATH=$(bindir) mono-sgen $(MONO_OPTIONS) --debug $(FSC) -o:$(outdir)$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)

clean:
	-rm FSCore.resources
	-rm $(outdir)$(ASSEMBLY)
