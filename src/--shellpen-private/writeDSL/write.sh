## $ DSL write
## > Append a string of text to source output including indentation

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private writeDSL --get-indent)$*"
!fn --shellpen-private writeDSL --mark-last-not-empty
