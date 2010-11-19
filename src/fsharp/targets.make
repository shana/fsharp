SOURCES := $(patsubst $(srcdir)$(tmpdir)%,$(tmpdir)%,$(patsubst %,$(srcdir)%,$(sources)))

all: do-4-0 do-2-0

install: all install-lib install-bin

clean: clean-4-0 clean-2-0

setup:
	@-mkdir -p $(objdir)
	@-mkdir -p $(outdir)

clean-2-0: TARGET := $(TARGET_2_0)
clean-2-0:
	-rm $(tmpdir)*
	-rm $(objdir)*
	@-rm $(outdir)$(ASSEMBLY)
	@-rm $(outdir)$(ASSEMBLY).mdb
	@-rm $(outdir)$(NAME).xml
	@-rm $(outdir)$(NAME).sigdata
	@-rm $(outdir)$(NAME).optdata

clean-4-0: TARGET := $(TARGET_4_0)
clean-4-0:
	@-rm $(tmpdir)*
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

do-2-0: DEFINES += $(DEFINES_2_0)
do-2-0: REFERENCES += $(REFERENCES_2_0)
do-2-0: FLAGS += $(FLAGS_2_0)
do-2-0: TARGET := $(TARGET_2_0)
do-2-0: VERSION := $(VERSION_2_0)
do-2-0: libdir = $(libdir2)
do-2-0: setup $(ASSEMBLY) copy

do-4-0: DEFINES += $(DEFINES_4_0)
do-4-0: REFERENCES += $(REFERENCES_4_0)
do-4-0: FLAGS += $(FLAGS_4_0)
do-4-0: TARGET := $(TARGET_4_0)
do-4-0: VERSION := $(VERSION_4_0)
do-4-0: libdir = $(libdir4)
do-4-0: setup $(ASSEMBLY) copy

install-lib-2: TARGET := $(TARGET_2_0)
install-lib-2: libdir = $(libdir2)
install-lib-2 install-lib-4: install-lib

install-lib-4: TARGET := $(TARGET_4_0)
install-lib-4: libdir = $(libdir4)

install-lib:
	sn -R $(outdir)$(ASSEMBLY) $(srcdir)../../../mono.snk
	gacutil -i $(outdir)$(ASSEMBLY)
	ln -s -f $(monodir)gac/$(NAME)/$(TARGET).0.0__b03f5f7f11d50a3a/$(ASSEMBLY) $(libdir)

do_subst = sed -e 's,[@]DIR[@],$(libdir2),g' -e 's,[@]TOOL[@],fsc.exe,g'

install-bin-2: TARGET := $(TARGET_2_0)
install-bin-2: VERSION := 2
install-bin-2: libdir = $(libdir2)

install-bin-4: TARGET := $(TARGET_4_0)
install-bin-4: VERSION := 4
install-bin-4: libdir = $(libdir4)

install-bin-2 install-bin-4: install-bin

install-bin:
	$(do_subst) < $(topdir)launcher.in > $(outdir)$(NAME)$(VERSION)
	chmod +x $(outdir)$(NAME)
	$(INSTALL_LIB) $(outdir)$(ASSEMBLY) $(libdir)
	$(INSTALL_BIN) $(outdir)$(NAME)$(VERSION) $(installdir)


.PHONY: $(ASSEMBLY)
$(ASSEMBLY): $(RESOURCES) $(SOURCES)
	MONO_PATH=$(bindir) mono $(MONO_OPTIONS) --debug $(FSC) -o:$(objdir)$@ $(REFERENCES) $(DEFINES) $(FLAGS) $(patsubst %,--resource:%,$(RESOURCES)) $(SOURCES)

