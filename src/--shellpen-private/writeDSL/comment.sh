## $ DSL comment
## > Append a `#` command line

# Do not use writeln because comments should not mark blocks as not empty
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private writeDSL getIndent)# $*${NEWLINE}"
