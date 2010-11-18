monodir:=`pkg-config --variable=libdir mono`
bindir2:=../../../lib/original/2.0/
bindir4:=../../../lib/original/4.0/
libdir2:=$(monodir)/mono/2.0/
libdir35:=$(monodir)/mono/3.5/
libdir4:=$(monodir)/mono/4.0/
tooldir:=../../../lib/original/2.0/
objdir:=.libs/

protodir=../../../lib/proto/$(TARGET)/
outdir=../../../lib/$(CONFIG)/$(TARGET)/

FSSRGEN=$(tooldir)fssrgen.exe
FSLEX=$(tooldir)fslex.exe
FSYACC=$(tooldir)fsyacc.exe

CONFIG=debug

FLAGS = \
	--doc:$(objdir)$(NAME).xml \
	--version:$(VERSION) \
	-g \
	--mlcompatibility \
	--noframework \
	--fullpaths \
	--times

FINAL_FLAGS = \
	--delaysign+ \
	--keyfile:../../../msfinal.pub

DEFINES_GENERAL = \
	--define:NO_STRONG_NAMES \
	--define:TRACE \
	--define:FX_ATLEAST_35 \
	--define:MONO
	
DEFINES_DEBUG = \
	--define:CODE_ANALYSIS \
	--define:DEBUG

DEFINES_2_0 = \
	$(DEFINES_GENERAL) \
	$(DEFINES_DEBUG) \
	--define:FX_FSLIB_STRUCTURAL_EQUALITY \
	--define:FX_FSLIB_IOBSERVABLE \
	--define:FX_FSLIB_TUPLE \
	--define:FX_FSLIB_LAZY

DEFINES_4_0 = \
	$(DEFINES_GENERAL) \
	$(DEFINES_DEBUG) \
	--define:FX_ATLEAST_40

REFERENCES_2_0 = \
	-r:$(libdir)Microsoft.Build.Engine.dll \
	-r:$(libdir)Microsoft.Build.Framework.dll \
	-r:$(libdir35)Microsoft.Build.Tasks.v3.5.dll \
	-r:$(libdir35)Microsoft.Build.Utilities.v3.5.dll \
	-r:$(libdir)mscorlib.dll \
	-r:$(libdir)System.Core.dll \
	-r:$(libdir)System.dll

all: net_2_0

net_2_0: DEFINES += $(DEFINES_2_0)
net_2_0: REFERENCES += $(REFERENCES_2_0)
net_2_0: FLAGS += $(FLAGS_2_0)
net_2_0: TARGET := 2.0
net_2_0: VERSION := 2.0.0.0
net_2_0: bindir += $(bindir2)
net_2_0: libdir += $(libdir2)
net_2_0: setup $(objdir)$(ASSEMBLY) copy


net_4_0: DEFINES += $(DEFINES_4_0)
net_4_0: REFERENCES += $(REFERENCES_4_0)
net_4_0: FLAGS += $(FLAGS_4_0)
net_4_0: TARGET := 4.0
net_4_0: VERSION := 4.0.0.0
net_4_0: bindir += $(bindir4)
net_4_0: libdir += $(libdir4)
net_4_0: setup $(objdir)$(ASSEMBLY) copy

