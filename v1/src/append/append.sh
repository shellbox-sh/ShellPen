FN -- log append "$@"
if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_append_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_append_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    _SHELLPEN_SOURCECODE[$__shellpen__append_append_sourceIndex]+="$*"
  fi
else
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$*"
fi