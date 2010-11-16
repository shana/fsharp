NAME=FSharp.Compiler-proto
ASSEMBLY = $(NAME).dll

bindir=../../../lib/original/4.0/r53135/
tooldir=../../../lib/original/2.0/
libdir=`pkg-config --variable=libdir mono`/mono/4.0/
libdir35=`pkg-config --variable=libdir mono`/mono/3.5/
outdir=../../../lib/proto/

FSC=$(bindir)fsc.exe
FSSRGEN=$(tooldir)fssrgen.exe
FSLEX=$(tooldir)fslex.exe
FSYACC=$(tooldir)fsyacc.exe

FLAGS= \
	--doc:$(NAME).xml \
	--versionfile:../../../source-build-version \
	-g \
	--mlcompatibility \
	--noframework \
	--target:library \
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
	$(DEFINES_2_0) \
	--define:BUILDING_WITH_LKG \
	--define:BUILDING_PROTO \
	--define:COMPILER \
	--define:INCLUDE_METADATA_READER \
	--define:INCLUDE_METADATA_WRITER \
	--define:TRYING_TO_FIX_4577

REFERENCES= \
	-r:$(bindir)FSharp.Core.dll \
	-r:$(libdir)Microsoft.Build.Engine.dll \
	-r:$(libdir)Microsoft.Build.Framework.dll \
	-r:$(libdir35)Microsoft.Build.Tasks.v3.5.dll \
	-r:$(libdir35)Microsoft.Build.Utilities.v3.5.dll \
	-r:$(libdir)mscorlib.dll \
	-r:$(libdir)System.Core.dll \
	-r:$(libdir)System.dll

sources = \
	FSComp.fs \
	../../assemblyinfo/assemblyinfo.FSharp.Compiler.dll.fs \
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
	ilpars.fs \
	illex.fs \
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
	../../ilx/cu_erase.fs \
	../InternalFileSystemUtils.fsi \
	../InternalFileSystemUtils.fs \
	../unilex.fsi \
	../unilex.fs \
	../layout.fsi \
	../layout.fs \
	../ast.fs \
	pars.fs \
	../lexhelp.fsi \
	../lexhelp.fs \
	lex.fs \
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
	../typrelns.fs \
	../patcompile.fsi \
	../patcompile.fs \
	../outcome.fsi \
	../outcome.fs \
	../csolve.fsi \
	../csolve.fs \
	../formats.fsi \
	../formats.fs \
	../nameres.fsi \
	../nameres.fs \
	../unsolved.fs \
	../creflect.fsi \
	../creflect.fs \
	../check.fsi \
	../check.fs \
	../tc.fsi \
	../tc.fs \
	../opt.fsi \
	../opt.fs \
	../detuple.fsi \
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
	../vs/IncrementalBuild.fs

RESOURCES= \
	--resource:FSStrings.resources \
	--resource:FSComp.resources

all: $(ASSEMBLY)

FSComp.fs: ../FSComp.txt
	mono --debug $(FSSRGEN) ../FSComp.txt $@ FSComp.resx

FSComp.resources: FSComp.fs
	resgen FSComp.resx $@

FSStrings.resources: ../FSStrings.resx
	resgen ../FSStrings.resx $@

lex.fs: ../lex.fsl
	mono --debug $(FSLEX) ../lex.fsl -o $@ --lexlib Internal.Utilities.Text.Lexing --unicode

illex.fs: ../../absil/illex.fsl
	mono --debug $(FSLEX) ../../absil/illex.fsl -o $@ --lexlib Internal.Utilities.Text.Lexing --unicode

pars.fs: ../pars.fsy
	mono --debug $(FSYACC) ../pars.fsy -o $@ --internal --open Microsoft.FSharp.Compiler --module Microsoft.FSharp.Compiler.Parser --lexlib Internal.Utilities.Text.Lexing --parslib Internal.Utilities.Text.Parsing

ilpars.fs: ../../absil/ilpars.fsy
	mono --debug $(FSYACC) ../../absil/ilpars.fsy -o $@ --internal --module Microsoft.FSharp.Compiler.AbstractIL.Internal.AsciiParser --lexlib Internal.Utilities.Text.Lexing --parslib Internal.Utilities.Text.Parsing

$(ASSEMBLY): FSStrings.resources FSComp.resources $(sources)
	@-mkdir -p $(outdir)
	mono $(MONO_OPTIONS) --debug $(FSC) -o:$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)
	@-cp $@ $(outdir)
	@-cp $(NAME).xml $(outdir)
	@-cp $@.mdb $(outdir)

clean:
	@-rm *.resources
	@-rm *.resx
	@-rm *.fs*
	@-rm $(outdir)$(ASSEMBLY)
	@-rm $(outdir)$(ASSEMBLY).mdb
	@-rm $(outdir)$(NAME).xml
