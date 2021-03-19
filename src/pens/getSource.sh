## > Print or get the source associated with the given pen name
##
## ### Valid signatures:
##
## || Argument List | Description
## -|-
## `1` | `[name]` | Print the source name associated with the provided pen name
## `3` | `[name] [-] [varName]` | Get the source name associated with the provided pen name
##
## @return 1 If no pen with the given name exists

if [ $# -gt 0 ] && ! FN pens exists "$1"
then
  FN -- errors argumentError '%s\n%s' "Pen not found: '$1'" "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi

if [ $# -eq 1 ]
then
  local __shellpen__pens_getSource_penIndex=''
  FN -- getPenIndex "$1" - __shellpen__pens_getSource_penIndex
  printf '%s' "${_SHELLPEN_PEN_SOURCES["$__shellpen__pens_getSource_penIndex"]}"
elif [ $# -eq 3 ] && [ "$2" = '-' ]
then
  local __shellpen__pens_getSource_penIndex=''
  FN -- getPenIndex "$1" - __shellpen__pens_getSource_penIndex
  printf -v "$3" '%s' "${_SHELLPEN_PEN_SOURCES["$__shellpen__pens_getSource_penIndex"]}"
else
  FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi