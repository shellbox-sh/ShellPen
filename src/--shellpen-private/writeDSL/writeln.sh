## $ DSL writeln
## > Append a line of text to source output including indentation

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private getCurrentIndent)$*${NEWLINE}"
!fn --shellpen-private contexts markLastNotEmpty
