if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_main_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_main_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    _SHELLPEN_MAIN_FUNCTION[$__shellpen__append_main_sourceIndex]="$1"
  fi
else
  _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"
fi