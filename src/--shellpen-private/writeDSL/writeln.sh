## $ DSL writeln
## > Append a line of text to source output including indentation

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private writeDSL getIndent)$*${NEWLINE}"
!fn --shellpen-private writeDSL --mark-last-not-empty
