SOURCES := $(subst $(srcdir)$(objdir),$(objdir),$(patsubst %,$(srcdir)%,$(sources)))

all: net_2_0

net_2_0: DEFINES += $(DEFINES_2_0)
net_2_0: REFERENCES += $(REFERENCES_2_0)
net_2_0: FLAGS += $(FLAGS_2_0)
net_2_0: TARGET := 2.0
net_2_0: VERSION := 2.0.0.0
net_2_0: bindir := $(bindir2)
net_2_0: libdir := $(libdir2)
net_2_0: setup $(objdir)$(ASSEMBLY) copy


net_4_0: DEFINES += $(DEFINES_4_0)
net_4_0: REFERENCES += $(REFERENCES_4_0)
net_4_0: FLAGS += $(FLAGS_4_0)
net_4_0: TARGET := 4.0
net_4_0: VERSION := 4.0.0.0
net_4_0: bindir += $(bindir4)
net_4_0: libdir += $(libdir4)
net_4_0: setup $(objdir)$(ASSEMBLY) copy

setup:
	@-mkdir -p $(objdir)
	@-mkdir -p $(outdir)

clean:
	@-rm $(objdir)*
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

install-lib-2: TARGET := 2.0
install-lib-2:
	sn -R $(outdir)$(ASSEMBLY) $(srcdir)../../../mono.snk
	gacutil -i $(outdir)$(ASSEMBLY)
	ln -s -f $(monodir)gac/$(NAME)/2.0.0.0__b03f5f7f11d50a3a/$(ASSEMBLY) $(libdir2)

do_subst = sed -e 's,[@]DIR[@],$(libdir2),g' -e 's,[@]TOOL[@],fsc.exe,g'

install-bin-2: TARGET := 2.0
install-bin-2: libdir := $(libdir2)
install-bin-2: install-bin
install-bin:
	$(do_subst) < $(topdir)launcher.in > $(outdir)$(NAME)
	chmod +x $(outdir)$(NAME)
	$(INSTALL_LIB) $(outdir)$(ASSEMBLY) $(libdir)
	$(INSTALL_BIN) $(outdir)$(NAME) $(installdir)

$(objdir)$(ASSEMBLY): $(RESOURCES) $(SOURCES)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(REFERENCES) $(DEFINES) $(FLAGS) $(patsubst %.resources,--resource:%.resources,$(RESOURCES)) $(SOURCES)

