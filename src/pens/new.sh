## > Create a new pen (optionally associated with a new or existing source)
##
## ### Valid signatures:
##
## || Argument List | Description
## -|-
## `1` | `[name]` | Create a new pen for the current source with the provided name
## `2` | `[name] [source]` | Create a new pen for the provided source (will be created if it does not already exist)
## `2` | `[name] [-]` | Create a new pen for the current source _but do not create a writer alias function_
## `3` | `[name] [-] [alias]` | Create a new pen for the current source _and create an alias function with the provided name_
## `3` | `[name] [source] [-]` | Create a new pen for the provided source (will be created if it does not already exist) _but do not create a writer alias function_
## `4` | `[name] [source] [-] [alias]` | Create a new pen for the provided source (will be created if it does not already exist) _and create an alias function with the provided name_
##
## @return 1 Pen with the existing name already exists
##
## #### Aliases
##
## Regardless of the alias you provide, `shellpen` will create a BASH function with the provided name.
##
## It is up to you to provide a valid function name! If the function name is invalid, this will fail.
##
## This also allows you to accidentally create pens with names which override built-in BASH functions
## such as 'unset' or 'declare' which will essentially completely blow up the world 💥

local __shellpen__pens_new_penName=''
local __shellpen__pens_new_sourceName=''
local __shellpen__pens_new_createAlias=true
local __shellpen__pens_new_aliasName=''

if [ $# -eq 1 ]
then
  __shellpen__pens_new_penName="$1"
elif [ $# -eq 2 ] && [ "$2" = '-' ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_createalias=false
elif [ $# -eq 2 ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_sourceName="$2"
elif [ $# -eq 3 ] && [ "$2" = '-' ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_aliasName="$3"
elif [ $# -eq 3 ] && [ "$3" = '-' ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_sourceName="$2"
  __shellpen__pens_new_createalias=false
elif [ $# -eq 4 ] && [ "$3" = '-' ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_sourceName="$2"
  __shellpen__pens_new_aliasName="$4"
else
  FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi

if FN pens exists "$__shellpen__pens_new_penName"
then
  FN -- errors argumentError '%s\n%s' "Pen '$__shellpen__pens_new_penName' already exists" "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi

if [ -n "$__shellpen__pens_new_sourceName" ] && ! FN sources exists "$__shellpen__pens_new_sourceName"
then
  FN sources new "$__shellpen__pens_new_sourceName"
fi

[ -z "$__shellpen__pens_new_sourceName" ] && FN sources current __shellpen__pens_new_sourceName

if [ "$__shellpen__pens_new_createAlias" = true ]
then
  [ -z "$__shellpen__pens_new_aliasName" ] && __shellpen__pens_new_aliasName="$__shellpen__pens_new_penName"
  local __shellpen__pens_new_aliasFunctionCode="
$__shellpen__pens_new_aliasName() {
  # Get the source name for this pen
  local __shellpen__penAlias_sourceName=''
  FN pens getSource \"$__shellpen__pens_new_penName\" - __shellpen__penAlias_sourceName

  # Call an 'append' shellpen DSL function
  # Sets the SHELLPEN_SOURCE environment variable which 'append' functions respect
  # to the *current* source for this pen (allowing the source to be changed later)
  # Also provides the pen name for debugging.
  SHELLPEN_SOURCE=\"\$__shellpen__penAlias_sourceName\" SHELLPEN_PEN=\"$__shellpen__pens_new_penName\" FN append \"\$@\"
}
"
  # Try it in a subshell first
  local __shellpen__pens_new_aliasFunctionEvalOutput=''
  __shellpen__pens_new_aliasFunctionEvalOutput="$( eval "$__shellpen__pens_new_aliasFunctionCode" 2>&1 )"
  if [ $? -ne 0 ]
  then
    FN -- errors argumentError '%s\n%s\n%s' "Alias name '$__shellpen__pens_new_aliasName' is not valid, please choose something that works as as valid BASH function name. Pen creation failed." "Command: FN ${__FN__originalCliCommands[*]}" "Function creation error: '$__shellpen__pens_new_aliasFunctionEvalOutput'"
    return 2
  else
    eval "$__shellpen__pens_new_aliasFunctionCode"
    shellpen result
  fi
fi

_SHELLPEN_PENS+=("$__shellpen__pens_new_penName")
_SHELLPEN_PEN_SOURCES+=("$__shellpen__pens_new_sourceName")