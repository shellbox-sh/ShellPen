## $ DSL appendln
## > Append a line of text to source output _without indentation_

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*${NEWLINE}"
!fn --shellpen-private writeDSL --mark-last-not-empty
