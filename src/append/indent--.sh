if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_indentMinus_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_indentMinus_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    _SHELLPEN_INDENT_LEVELS[$__shellpen__append_indentMinus_sourceIndex]="$(( ${_SHELLPEN_INDENT_LEVELS[$__shellpen__append_indentMinus_sourceIndex]} - 1 ))"
  fi
else
  _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"
fi