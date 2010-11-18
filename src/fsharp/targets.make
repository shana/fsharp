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

install:
	sn -R $(outdir)$(ASSEMBLY) ../../../mono.snk
	gacutil -i $(outdir)$(ASSEMBLY)

$(objdir)$(ASSEMBLY): $(RESOURCES) $(sources)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(REFERENCES) $(DEFINES) $(FLAGS) $(patsubst %.resources,--resource:%.resources,$(RESOURCES)) $(sources)
