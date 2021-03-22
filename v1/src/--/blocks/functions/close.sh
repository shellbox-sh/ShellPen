local __shellpen__blocks_functions_close_newLine=$'\n'
if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__blocks_functions_close_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__blocks_functions_close_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    if [ "${_SHELLPEN_FUNCTION_OPEN[$__shellpen__blocks_functions_close_sourceIndex]}" = true ];
    then
      FN append }
    fi
    _SHELLPEN_FUNCTION_OPEN[$__shellpen__blocks_functions_close_sourceIndex]=false
  fi
else
  if [ "${_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
  then
    FN append }
  fi
  _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
fi