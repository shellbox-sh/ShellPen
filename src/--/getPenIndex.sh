## > Get the internal `shellpen` index of the provided pen
##
## ### Valid signatures:
##
## || Argument List | Description
## -|-
## `1` | `[pen]` | Print the index of the provided pen
## `3` | `[pen] [-] [varName]` | Get the index of the provided pen
##
## @return 1 If no pen with the given name exists (fails silently)
##

if [ $# -eq 1 ]
then
  local __shellpen__pens_exists_penIndex=''
  for __shellpen__pens_exists_penIndex in "${!_SHELLPEN_PENS[@]}"
  do
    if [ "$1" = "${_SHELLPEN_PENS[$__shellpen__pens_exists_penIndex]}" ]
    then
      printf '%s' "$__shellpen__pens_exists_penIndex" 
      return 0
    fi
  done
  return 1
elif [ $# -eq 3 ] && [ "$2" = '-' ]
then
  local __shellpen__pens_exists_penIndex=''
  for __shellpen__pens_exists_penIndex in "${!_SHELLPEN_PENS[@]}"
  do
    if [ "$1" = "${_SHELLPEN_PENS[$__shellpen__pens_exists_penIndex]}" ]
    then
      printf -v "$3" '%s' "$__shellpen__pens_exists_penIndex" 
      return 0
    fi
  done
  return 1
else
  FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi