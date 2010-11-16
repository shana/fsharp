#bindir=../../../lib/original/4.0/r53135/
bindir=../../../lib/original/2.0/
tooldir=../../../lib/original/2.0/
libdir=`pkg-config --variable=libdir mono`/mono/2.0/
libdir35=`pkg-config --variable=libdir mono`/mono/3.5/
objdir=.libs/
outdir=../../../lib/proto/
proto=../../../lib/proto/

FSSRGEN=$(tooldir)fssrgen.exe
FSLEX=$(tooldir)fslex.exe
FSYACC=$(tooldir)fsyacc.exe

FLAGS = \
	--doc:$(objdir)$(NAME).xml \
	--versionfile:../../../source-build-version \
	-g \
	--mlcompatibility \
	--noframework \
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
	$(DEFINES_2_0)

REFERENCES = \
	-r:$(libdir)Microsoft.Build.Engine.dll \
	-r:$(libdir)Microsoft.Build.Framework.dll \
	-r:$(libdir35)Microsoft.Build.Tasks.v3.5.dll \
	-r:$(libdir35)Microsoft.Build.Utilities.v3.5.dll \
	-r:$(libdir)mscorlib.dll \
	-r:$(libdir)System.Core.dll \
	-r:$(libdir)System.dll

all: setup $(objdir)$(ASSEMBLY) copy

setup:
	@-mkdir -p $(objdir)
	@-mkdir -p $(outdir)

clean:
	@-rm $(objdir)/*
	@-rm $(outdir)$(ASSEMBLY)
	@-rm $(outdir)$(ASSEMBLY).mdb
	@-rm $(outdir)$(NAME).xml
	@-rm $(outdir)$(NAME).sigdata
	@-rm $(outdir)$(NAME).optdata

copy:
	@-cp $(objdir)$(ASSEMBLY) $(outdir)
	@-cp $(objdir)$(NAME).xml $(outdir)
	@-cp $(objdir)$(ASSEMBLY).mdb $(outdir)
	@-cp $(objdir)$(NAME).sigdata $(outdir)
	@-cp $(objdir)$(NAME).optdata $(outdir)

