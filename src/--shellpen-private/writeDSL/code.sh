## $ DSL code
## > Output the code for the current pen (_does not modify source_)

!fn --shellpen-private contexts closeAndWriteAll
printf '%s' "${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]}"
