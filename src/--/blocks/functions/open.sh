if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_main_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_main_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    _SHELLPEN_FUNCTION_OPEN[$__shellpen__append_main_sourceIndex]=true
  fi
else
  _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
fi