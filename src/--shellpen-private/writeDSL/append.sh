## $ DSL append
## > Append a string of text to source output _without indentation_

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*"
!fn --shellpen-private contexts markLastNotEmpty
