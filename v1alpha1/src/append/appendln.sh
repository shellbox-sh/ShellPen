local __shellpen__append_appendln_newLine=$'\n'
if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_appendln_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_appendln_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    _SHELLPEN_SOURCECODE[$__shellpen__append_appendln_sourceIndex]+="$*${__shellpen__append_appendln_newLine}"
  fi
else
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$*${__shellpen__append_appendln_newLine}"
fi