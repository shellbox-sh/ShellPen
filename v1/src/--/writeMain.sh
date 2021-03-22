if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_append_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_append_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    if [ -n "${_SHELLPEN_MAIN_FUNCTION[$__shellpen__append_append_sourceIndex]}" ]
    then
      FN append writeln
      FN append writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"${_SHELLPEN_MAIN_FUNCTION[$__shellpen__append_append_sourceIndex]}\" \"\$@\""
    fi
    _SHELLPEN_MAIN_FUNCTION[$__shellpen__append_append_sourceIndex]=""
    _SHELLPEN_SOURCECODE[$__shellpen__append_append_sourceIndex]+="$*"
  fi
else
  if [ -n "${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
  then
    FN append writeln
    FN append writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\" \"\$@\""
  fi
  _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$*"
fi