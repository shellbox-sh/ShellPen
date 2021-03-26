## $ DSL prepend
## > Prepend a string of text to source output _without indentation_

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="$*${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]}"
!fn --shellpen-private writeDSL --mark-last-not-empty
