## > Put away this pen (delete it) and optionally the source too (if `withSource` provided)
##
## ### Valid signatures:
##
## || Argument List | Description
## -|-
## `1` | `[pen]` | Name of the pen to put away (or default)
## `2` | `withSource` | Optional
##
## @return 1 If the provided pen name does not exist
## @return 2 If the provided source name does not exist
##

local __shellpen__pens_putAway_penName=default
local __shellpen__pens_putAway_withSource=false
if [ "$1" = "withSource" ]
then
  __shellpen__pens_putAway_withSource=true
  shift
elif [ "$2" = "withSource" ]
then
  __shellpen__pens_putAway_penName="$1"
  __shellpen__pens_putAway_withSource=true
elif [ $# -eq 1 ]
then
  __shellpen__pens_putAway_penName="$1"
fi

local __shellpen__pens_putAway_penIndex=''
if ! FN -- getPenIndex "$__shellpen__pens_putAway_penName" - __shellpen__pens_putAway_penIndex
then
  FN -- errors argumentError '%s\n%s' "Pen not found: '$__shellpen__pens_putAway_penName'" "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
else
  if [ "$__shellpen__pens_putAway_withSource" = true ]
  then
    local __shellpen__pens_putAway_sourceName=''
    FN pens getSource "$__shellpen__pens_putAway_penName" - __shellpen__pens_putAway_sourceName
    FN sources putAway "$__shellpen__pens_putAway_sourceName" || return %?
  fi
  unset "_SHELLPEN_PENS[$__shellpen__pens_putAway_penIndex]"
  unset "_SHELLPEN_PEN_SOURCES[$__shellpen__pens_putAway_penIndex]"
  if [ "$_SHELLPEN_CURRENT_PEN_NAME" = "$__shellpen__pens_putAway_penName" ]
  then
    _SHELLPEN_CURRENT_PEN_NAME=default
    _SHELLPEN_CURRENT_PEN_INDEX=0
  fi
  _SHELLPEN_PENS=("${_SHELLPEN_PENS[@]}")
  _SHELLPEN_PEN_SOURCES=("${_SHELLPEN_PEN_SOURECS[@]}")
fi