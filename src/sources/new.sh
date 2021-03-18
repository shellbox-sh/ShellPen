## $ sources new
##
## $1 Optional source name (else randomly generated)
## $2 Optional path to file for this source to represent
## $@ If `-` provided, following array argument will be cleared and appended with source names.
##
## ### Valid signatures:
##
## - [1] name
## - [2] name -
## - [2] name filePath
## - [2] - varName
## - [3] name filePath -
## - [3] name - varName
## - [4] name filePath - varName

local __shellpen__sources_new_newSourceName=''
local __shellpen__sources_new_sourceFilePath=''
local __shellpen__sources_new_shouldOutputName=false
local __shellpen__sources_new_outputVariableName=''

if [ $# -eq 1 ]
then
  __shellpen__sources_new_newSourceName="$1"
elif [ $# -eq 2 ]
then
  if [ "$1" = '-' ]
  then
    __shellpen__sources_new_shouldOutputName=true
    __shellpen__sources_new_outputVariableName="$2"
  elif [ "$2" = '-' ]
  then
    __shellpen__sources_new_newSourceName="$1"
    __shellpen__sources_new_outputVariableName="$1"
    __shellpen__sources_new_shouldOutputName=true
  else
    __shellpen__sources_new_newSourceName="$1"
    __shellpen__sources_new_sourceFilePath="$2"
  fi
elif [ $# -eq 3 ]
then
  if [ "$2" = '-' ]
  then
    __shellpen__sources_new_newSourceName="$1"
    __shellpen__sources_new_shouldOutputName=true
    __shellpen__sources_new_outputVariableName="$2"
  elif [ "$3" = '-' ]
  then
    __shellpen__sources_new_newSourceName="$1"
    __shellpen__sources_new_sourceFilePath="$2"
    __shellpen__sources_new_shouldOutputName=true
    __shellpen__sources_new_outputVariableName="$1"
  else
    FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__FN__originalCliCommands[*]}"
    return 1
  fi
elif [ $# -eq 4 ]
then
  if [ "$3" = '-' ]
  then
    __shellpen__sources_new_newSourceName="$1"
    __shellpen__sources_new_sourceFilePath="$2"
    __shellpen__sources_new_shouldOutputName=true
    __shellpen__sources_new_outputVariableName="$4"
  else
    FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__FN__originalCliCommands[*]}"
    return 1
  fi
else
  FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__FN__originalCliCommands[*]}"
  return 1
fi

# if output variable, verify that it's a valid looking variable name, yo

if FN sources exists "$__shellpen__sources_new_newSourceName"
then
  FN -- errors argumentError '%s\n%s' "Source '$__shellpen__sources_new_newSourceName' already exists" "Command: ${__FN__originalCliCommands[*]}"
  return 1
fi

[ -z "$__shellpen__sources_new_newSourceName" ] && __shellpen__sources_new_newSourceName="$( cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 )"

if [ "$__shellpen__sources_new_shouldOutputName" = true ]
then
  printf -v "$__shellpen__sources_new_outputVariableName" '%s' "$__shellpen__sources_new_newSourceName" 
fi

if [ -z "$__shellpen__sources_new_sourceFilePath" ]
then
  _SHELLPEN_SOURCES_FILE_PATHS+=("$__shellpen__sources_new_sourceFilePath")
fi

_SHELLPEN_SOURCES+=("$__shellpen__sources_new_newSourceName")
_SHELLPEN_SOURCECODE+=("")
_SHELLPEN_INDENT_LEVELS+=(0)
_SHELLPEN_OPTION_OPEN+=("")
_SHELLPEN_FUNCTION_OPEN+=("")
_SHELLPEN_CASE_OPEN+=("")
_SHELLPEN_MAIN_FUNCTION+=("")