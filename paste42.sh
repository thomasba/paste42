#!/bin/bash
# Aufrufsyntax:
# tree [-s] [-t "filetype"] [-l] [-h] file

# Variablen initialisieren & defaults setzen
VERSION="20110429-1"
ATTR=''
OPTS=""
TYPE="text"
TYPES="4cs abap actionscript3 actionscript ada apache applescript apt_sources asm asp autoconf autohotkey autoit avisynth awk bash basic4gl bf bibtex blitzbasic bnf boo caddcl cadlisp cfdg cfm chaiscript cil clojure c_mac cmake cobol c cpp cpp-qt csharp css cuesheet dcs delphi diff div dos dot d ecmascript eiffel email erlang fo fortran freebasic fsharp gambas gdb genero genie gettext glsl gml gnuplot groovy gwbasic haskell hicest hq9plus html4strict icon idl ini inno intercal io java5 java javascript j jquery kixtart klonec klonecpp latex lisp locobasic logtalk lolcode lotusformulas lotusscript lscript lsl2 lua m68k magiksf make mapbasic matlab mirc mmix modula2 modula3 mpasm mxml mysql newlisp nsis oberon2 objc ocaml-brief ocaml oobas oracle11 oracle8 oxygene oz pascal pcre perl6 perl per pf php-brief php pic16 pike pixelbender plsql postgresql povray powerbuilder powershell progress prolog properties providex purebasic python qbasic q rails rebol reg robots rpmspec rsplus ruby sas scala scheme scilab sdlbasic smalltalk smarty sql systemverilog tcl teraterm text thinbasic tsql typoscript unicon vala vbnet vb verilog vhdl vim visualfoxpro visualprolog whitespace whois winbatch xbasic xml xorg_conf xpp 80"


usage() {
	echo "Usage:"
	echo "  $0 [-s] [-t \"type\"] [-l] file"
	echo "  -s           not \"public\""
	echo "  -t <type>    file type"
	echo "  -l           filetypes"
	echo "  -h           this help"
	echo "  -u           check for update"
}

filetypes() {
	echo "Filetypes:"
	for i in $TYPES ; do
		echo "  $i"
	done
}

checkUpdate() {
	SERV_VER=$(curl -s -S http://paste42.de/version.txt | sed -e 's/[^0-9\-]//g')
	if [ "$SERV_VER" != "$VERSION" ] ; then
		echo "Update available!"
		echo "Your version:   $VERSION"
		echo "Remote Version: $SERV_VER"
	else
		echo "No Updates."
	fi
}

# wenn keine argumente, usage ausgeben
if [ $# -eq 0 ] ; then usage ; exit ; fi

# argumente auswerten
while getopts st:lhu opt ; do
	case "$opt" in
		\-)    break;;
		s)    ATTR="$ATTR -d \"sec=true\"";;
		t)    TYPE=$OPTARG;;
		[hH]) usage;exit;;
		l)    filetypes;exit;;
		u)    checkUpdate;exit;;
	esac
done
shift $(expr $OPTIND - 1)

# wenn dateiname leer ist, beenden
if [ -z "$1" ] ; then
	usage
	exit
fi

# wenn datei nicht existiert oder nicht lesbar ist, suizid
if [ ! -f "$1" -o ! -r "$1" ] ; then
	echo "File \"$1\" not readable!" >&2
	exit 1
fi
if [ ! -s "$1" ] ; then
	echo "File is empty!" >&2
	exit 1
fi
if [ -b "$1" -o -c "$1" -o -S "$1" -o -d "$1" ] ; then
	echo "\"$1\" is no ordinary file!"
	exit 1
fi


# meckern, wenn mehr als eine datei angegeben wurde...
if [ $# -gt 1 ] ; then
	echo "only the first file will be used ;)" >&2
fi


# und die daten absenden.
curl -s -S -d "title=curl paste of $1" $ATTR -d "type=$TYPE" --data-urlencode "text@$1" 'http://paste42.de/save'
