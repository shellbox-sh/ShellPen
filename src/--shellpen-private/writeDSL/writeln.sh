## $ DSL writeln
## > Append a line of text to source output including indentation

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private writeDSL --get-indent)$*${NEWLINE}"
!fn --shellpen-private writeDSL --mark-last-not-empty
