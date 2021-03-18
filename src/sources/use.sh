if [ $# -eq 1 ]
then
  local __shellpen__sources_use_sourceIndex=''
  if FN sources exists "$1" __shellpen__sources_use_sourceIndex
  then
    _SHELLPEN_CURRENT_SOURCE_INDEX="$__shellpen__sources_use_sourceIndex"
  else
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: ${__FN__originalCliCommands[*]}"
    return 1
  fi
else
  FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__FN__originalCliCommands[*]}"
  return 1
fi