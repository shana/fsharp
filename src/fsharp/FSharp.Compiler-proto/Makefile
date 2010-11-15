NAME=FSharp.Compiler-proto
ASSEMBLY = $(NAME).dll


bindir=../../../lib/original/4.0/
tooldir=../../../lib/original/2.0/
libdir=`pkg-config --variable=libdir mono`/mono/4.0/
libdir35=`pkg-config --variable=libdir mono`/mono/3.5/
outdir=../../../lib/proto/

FSSRGEN=$(tooldir)fssrgen.exe
FSC=$(bindir)fsc.exe
FSLEX=$(tooldir)fslex.exe
FSYACC=$(tooldir)fsyacc.exe

FLAGS= \
	--doc:$(outdir)$(NAME).xml \
	--versionfile:../../../source-build-version \
	-g \
	--noframework \
	--target:library \
	--nowarn:35,44,62,9,60,86,47,1203,69,65,54,61,75 \
	--warn:3 \
	--warnaserror:76 \
	--fullpaths \
	--flaterrors \
	--warnon:1182 \
	--times \
	--simpleresolution

DEFINES= \
	--define:DEBUG \
	--define:NO_STRONG_NAMES \
	--define:TRYING_TO_FIX_4577 \
	--define:BUILDING_PROTO \
	--define:BUILDING_WITH_LKG \
	--define:COMPILER \
	--define:INCLUDE_METADATA_READER \
	--define:INCLUDE_METADATA_WRITER \
	--define:FX_FSLIB_STRUCTURAL_EQUALITY \
	--define:FX_FSLIB_IOBSERVABLE \
	--define:FX_FSLIB_LAZY \
	--define:FX_FSLIB_TUPLE \
	--define:FX_ATLEAST_40 \
	--define:FX_ATLEAST_35

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
	MONO_PATH=$(bindir) mono --debug $(FSSRGEN) ../FSComp.txt $@ FSComp.resx

FSStrings.resources: ../FSStrings.resx
	resgen ../FSStrings.resx $@

FSComp.resources: FSComp.fs
	resgen FSComp.resx $@

lex.fs: ../lex.fsl
	mono --debug $(FSLEX) ../lex.fsl -o $@ --lexlib Internal.Utilities.Text.Lexing --unicode

illex.fs: ../../absil/illex.fsl
	mono --debug $(FSLEX) ../../absil/illex.fsl -o $@ --lexlib Internal.Utilities.Text.Lexing --unicode

pars.fs: ../pars.fsy
	MONO_PATH=$(tooldir) mono --debug $(FSYACC) ../pars.fsy -o $@ --internal --open Microsoft.FSharp.Compiler --module Microsoft.FSharp.Compiler.Parser --lexlib Internal.Utilities.Text.Lexing --parslib Internal.Utilities.Text.Parsing

ilpars.fs: ../../absil/ilpars.fsy
	MONO_PATH=$(tooldir) mono --debug $(FSYACC) ../../absil/ilpars.fsy -o $@ --internal --module Microsoft.FSharp.Compiler.AbstractIL.Internal.AsciiParser --lexlib Internal.Utilities.Text.Lexing --parslib Internal.Utilities.Text.Parsing

$(ASSEMBLY): FSStrings.resources FSComp.resources $(sources)
	@-mkdir -p $(outdir)
	MONO_PATH=$(bindir) mono-sgen $(MONO_OPTIONS) --debug $(FSC) -o:$(outdir)$@ $(DEFINES) $(FLAGS) $(REFERENCES) $(RESOURCES) $(sources)

clean:
	-rm *.resources
	-rm *.resx
	-rm *.fs*
