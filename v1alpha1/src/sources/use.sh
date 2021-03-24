if [ $# -eq 1 ]
then
  local __shellpen__sources_use_sourceIndex=''
  if FN -- getSourceIndex "$1" - __shellpen__sources_use_sourceIndex
  then
    _SHELLPEN_CURRENT_SOURCE_INDEX="$__shellpen__sources_use_sourceIndex"
  else
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  fi
else
  FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi