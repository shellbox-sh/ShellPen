## $ DSL code
## > Output the source code for the current pen (_does not modify to current source_)

!fn --shellpen-private contexts closeAndWriteAll
printf '%s' "${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]}"
