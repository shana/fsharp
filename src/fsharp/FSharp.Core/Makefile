NAME=FSharp.Core
ASSEMBLY = $(NAME).dll

include ../Makefile.inc

FSC=$(proto)fsc-proto.exe

FLAGS += \
	--target:library \
	--compiling-fslib

DEFINES += \
	--define:RUNTIME \
	--define:USE_FX_40_LAZY_ON_FX_20

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
	--resource:$(objdir)FSCore.resources

$(objdir)FSCore.resources: FSCore.resx
	resgen FSCore.resx $@

$(objdir)$(ASSEMBLY): setup $(objdir)FSCore.resources $(sources)
	MONO_PATH=$(bindir) mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)

