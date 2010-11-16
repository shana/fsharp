NAME=FSharp.Compiler
ASSEMBLY = $(NAME).dll

include ../Makefile.inc

outdir=../../../lib/debug/

FSC=$(proto)fsc-proto.exe

FLAGS += --target:library

DEFINES += \
	--define:TRYING_TO_FIX_4577 \
	--define:COMPILER \
	--define:INCLUDE_METADATA_READER \
	--define:INCLUDE_METADATA_WRITER \
	--define:EXTENSIBLE_DUMPER 

REFERENCES += \
	-r:$(outdir)FSharp.Core.dll

sources = \
	$(objdir)FSComp.fs \
	../../assemblyinfo/assemblyinfo.FSharp.Compiler.dll.fs \
	../ExtensibleDumper.fsi \
	../ExtensibleDumper.fs \
	../../utils/sformat.fsi \
	../../utils/sformat.fs \
	../sr.fsi \
	../sr.fs \
	../../utils/prim-lexing.fsi \
	../../utils/prim-lexing.fs \
	../../utils/prim-parsing.fsi \
	../../utils/prim-parsing.fs \
	../../utils/resizearray.fsi \
	../../utils/resizearray.fs \
	../../utils/HashMultiMap.fsi \
	../../utils/HashMultiMap.fs \
	../../utils/TaggedCollections.fsi \
	../../utils/TaggedCollections.fs \
	../../utils/filename.fsi \
	../../utils/filename.fs \
	../FlatList.fs \
	../../absil/illib.fs \
	../../absil/zmap.fsi \
	../../absil/zmap.fs \
	../../absil/zset.fsi \
	../../absil/zset.fs \
	../../absil/bytes.fsi \
	../../absil/bytes.fs \
	../../absil/ildiag.fsi \
	../../absil/ildiag.fs \
	../ReferenceResolution.fs \
	../../absil/il.fsi \
	../../absil/il.fs \
	../../absil/ilx.fsi \
	../../absil/ilx.fs \
	../../absil/ilascii.fsi \
	../../absil/ilascii.fs \
	../../absil/ilprint.fsi \
	../../absil/ilprint.fs \
	../../absil/ilmorph.fsi \
	../../absil/ilmorph.fs \
	../../absil/ilsupp.fsi \
	../../absil/ilsupp.fs \
	$(objdir)ilpars.fs \
	$(objdir)illex.fs \
	../../absil/ilbinary.fsi \
	../../absil/ilbinary.fs \
	../lib.fs \
	../range.fsi \
	../range.fs \
	../ErrorLogger.fs \
	../InternalCollections.fsi \
	../InternalCollections.fs \
	../../absil/ilread.fsi \
	../../absil/ilread.fs \
	../../absil/ilwrite.fsi \
	../../absil/ilwrite.fs \
	../../absil/ilreflect.fs \
	../../utils/CompilerLocationUtils.fs \
	../PrettyNaming.fs \
	../../ilx/ilxsettings.fs \
	../../ilx/pubclo.fsi \
	../../ilx/pubclo.fs \
	../../ilx/cu_erase.fsi \
	../../ilx/cu_erase.fs \
	../InternalFileSystemUtils.fsi \
	../InternalFileSystemUtils.fs \
	../unilex.fsi \
	../unilex.fs \
	../layout.fsi \
	../layout.fs \
	../ast.fs \
	$(objdir)pars.fs \
	../lexhelp.fsi \
	../lexhelp.fs \
	$(objdir)lex.fs \
	../sreflect.fsi \
	../sreflect.fs \
	../QueueList.fs \
	../tast.fs \
	../env.fs \
	../tastops.fsi \
	../tastops.fs \
	../pickle.fsi \
	../pickle.fs \
	../lexfilter.fs \
	../import.fsi \
	../import.fs \
	../infos.fs \
	../augment.fsi \
	../augment.fs \
	../outcome.fsi \
	../outcome.fs \
	../nameres.fsi \
	../nameres.fs \
	../typrelns.fs \
	../patcompile.fsi \
	../patcompile.fs \
	../csolve.fsi \
	../csolve.fs \
	../formats.fsi \
	../formats.fs \
	../unsolved.fs \
	../creflect.fsi \
	../creflect.fs \
	../check.fsi \
	../check.fs \
	../tc.fsi \
	../tc.fs \
	../opt.fsi \
	../detuple.fsi \
	../opt.fs \
	../detuple.fs \
	../tlr.fsi \
	../tlr.fs \
	../lowertop.fs \
	../ilxgen.fsi \
	../ilxgen.fs \
	../TraceCall.fs \
	../build.fsi \
	../build.fs \
	../fscopts.fsi \
	../fscopts.fs \
	../vs/IncrementalBuild.fsi \
	../vs/IncrementalBuild.fs \
	../vs/Reactor.fsi \
	../vs/Reactor.fs \
	../vs/service.fsi \
	../vs/service.fs

RESOURCES= \
	--resource:$(objdir)FSStrings.resources \
	--resource:$(objdir)FSComp.resources

$(objdir)FSComp.fs: ../FSComp.txt
	mono --debug $(FSSRGEN) ../FSComp.txt $@ $(objdir)FSComp.resx

$(objdir)FSComp.resources: $(objdir)FSComp.fs
	resgen $(objdir)FSComp.resx $@

$(objdir)FSStrings.resources: ../FSStrings.resx
	resgen ../FSStrings.resx $@

$(objdir)lex.fs: ../lex.fsl
	mono --debug $(FSLEX) ../lex.fsl -o $@ --lexlib Internal.Utilities.Text.Lexing --unicode

$(objdir)illex.fs: ../../absil/illex.fsl
	mono --debug $(FSLEX) ../../absil/illex.fsl -o $@ --lexlib Internal.Utilities.Text.Lexing --unicode

$(objdir)pars.fs: ../pars.fsy
	mono --debug $(FSYACC) ../pars.fsy -o $@ --internal --open Microsoft.FSharp.Compiler --module Microsoft.FSharp.Compiler.Parser --lexlib Internal.Utilities.Text.Lexing --parslib Internal.Utilities.Text.Parsing

$(objdir)ilpars.fs: ../../absil/ilpars.fsy
	mono --debug $(FSYACC) ../../absil/ilpars.fsy -o $@ --internal --module Microsoft.FSharp.Compiler.AbstractIL.Internal.AsciiParser --lexlib Internal.Utilities.Text.Lexing --parslib Internal.Utilities.Text.Parsing

$(objdir)$(ASSEMBLY): $(objdir)FSStrings.resources $(objdir)FSComp.resources $(sources)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)

