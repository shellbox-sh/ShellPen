local __shellpen__indentation=""
local __shellpen__indentationLevel=0

if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_indentation_sourceIndex=''
  if ! FN -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_indentation_sourceIndex
  then
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$__shellpen__append_indentation_sourceIndex]}" ]
    do
      __shellpen__indentation+="$SHELLPEN_INDENT"
      : "$(( __shellpen__indentationLevel++ ))"
    done
  fi
else
  while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
  do
    __shellpen__indentation+="$SHELLPEN_INDENT"
    : "$(( __shellpen__indentationLevel++ ))"
  done
fi

printf "$__shellpen__indentation"