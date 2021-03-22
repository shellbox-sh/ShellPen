if ! [ -f "$1" ]
then
  FN -- errors argumentError '%s\n%s' "File '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi

if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_writeFile_newLine=$'\n'
  local __shellpen__append_writeFile_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_writeFile_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    _SHELLPEN_SOURCECODE[$__shellpen__append_writeFile_sourceIndex]+="$( cat "$1" | sed "s/^/$( FN indentation )/" )${__shellpen__append_writeFile_newLine}"
  fi
else
    _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( cat "$1" | sed "s/^/$( FN indentation )/" )${__shellpen__append_writeFile_newLine}"
fi