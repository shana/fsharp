NAME=FSharp.Core
ASSEMBLY = $(NAME).dll

libdir=`pkg-config --variable=libdir mono`/mono/4.0/
proto=../../../lib/proto/
outdir=../../../lib/debug/

FSC=$(proto)fsc-proto.exe

FLAGS= \
	--doc:$(NAME).xml \
	--versionfile:../../../source-build-version \
	-g \
	--mlcompatibility \
	--noframework \
	--target:library \
	--fullpaths \
	--times \
	--compiling-fslib

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
	--define:RUNTIME \
	--define:USE_FX_40_LAZY_ON_FX_20

REFERENCES= \
	-r:$(libdir)mscorlib.dll \
	-r:$(libdir)System.Core.dll \
	-r:$(libdir)System.dll \
	-r:$(libdir)System.Numerics.dll

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
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)
	@-cp $@ $(outdir)
	@-cp $(NAME).xml $(outdir)
	@-cp $@.mdb $(outdir)
	@-cp $(NAME).sigdata $(outdir)
	@-cp $(NAME).optdata $(outdir)

clean:
	@-rm FSCore.resources
	@-rm $(outdir)$(ASSEMBLY)
	@-rm $(outdir)$(NAME).sigdata
	@-rm $(outdir)$(NAME).optdata
	@-rm $(outdir)$(ASSEMBLY).mdb
	@-rm $(outdir)$(NAME).xml
