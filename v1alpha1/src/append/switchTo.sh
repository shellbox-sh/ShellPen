## > Switch pen to write to a different source
##
## $1 Name of the source to switch to
##
## @return 1 If the provided source does not exist
##

if [ $# -eq 1 ]
then
  if [ -z "$SHELLPEN_PEN" ]
  then
    FN -- errors argumentError '%s\n%s' "Please do not call 'append switchTo' directly, call it via a pen function (this function requires setting \$SHELLPEN_PEN=\"[pen name]\" which is done automatically when using a pen function)" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  fi
  if FN sources exists "$1"
  then
    local __shellpen__append_switchTo_penIndex=''
    FN -- getPenIndex "$SHELLPEN_PEN" - __shellpen__append_switchTo_penIndex
    _SHELLPEN_PEN_SOURCES["$__shellpen__append_switchTo_penIndex"]="$1"
  else
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  fi
else
  FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi