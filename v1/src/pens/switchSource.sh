## > Switch the current or provided pen to use a different, provided source
##
## ### Valid signatures:
##
## || Argument List | Description
## -|-
## `1` | `[source]` | Set the default pen's source to use the provided source
## `2` | `[pen] [source]` | Set the provided pen to use the provided source
##
## @return 1 If the provided pen name does not exist
## @return 2 If the provided source name does not exist
##

if [ $# -eq 1 ]
then
  # "default" should be '0' but it could be deleted (once we provide that functionality)
  local __shellpen__pens_switchSource_penIndex=''
  if ! FN -- getPenIndex "default" - __shellpen__pens_switchSource_penIndex
  then
    FN -- errors argumentError '%s\n%s' "Pen not found: 'default'" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    if FN sources exists "$1"
    then
      _SHELLPEN_PEN_SOURCES["$__shellpen__pens_switchSource_penIndex"]="$1"
    else
      FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
      return 2
    fi
  fi
elif [ $# -eq 2 ]
then
  local __shellpen__pens_switchSource_penIndex=''
  if ! FN -- getPenIndex "$1" - __shellpen__pens_switchSource_penIndex
  then
    FN -- errors argumentError '%s\n%s' "Pen not found: '$1'" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  else
    if FN sources exists "$2"
    then
      _SHELLPEN_PEN_SOURCES["$__shellpen__pens_switchSource_penIndex"]="$2"
    else
      FN -- errors argumentError '%s\n%s' "Source '$2' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
      return 2
    fi
  fi
fi