FN -- blocks closeAll
FN -- writeMain

if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_write_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_write_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    if [ "$1" = "-n" ]
    then
      echo -e "${_SHELLPEN_SOURCECODE[$__shellpen__append_write_sourceIndex]}" | cat -n
    else
      echo -e "${_SHELLPEN_SOURCECODE[$__shellpen__append_write_sourceIndex]}"
    fi
  fi
else
  if [ "$1" = "-n" ]
  then
    echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" | cat -n
  else
    echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  fi
fi