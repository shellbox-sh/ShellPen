## $ DSL putAway
## > Delete the current pen (_also deletes source code_)

unset "__SHELLPEN_PENS[$SHELLPEN_PEN_INDEX]"
unset "__SHELLPEN_SOURCES[$SHELLPEN_PEN_INDEX]"
unset "__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]"
unset "__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID"
unset "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID"
