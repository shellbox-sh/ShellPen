if [ $# -eq 1 ]
then
  local __shellpen__sources_putAway_sourceIndex=''
  if FN -- getSourceIndex "$1" - __shellpen__sources_putAway_sourceIndex
  then

    unset "_SHELLPEN_SOURCES[$__shellpen__sources_putAway_sourceIndex]"
    unset "_SHELLPEN_SOURCECODE[$__shellpen__sources_putAway_sourceIndex]"
    unset "_SHELLPEN_SOURCES_FILE_PATHS[$__shellpen__sources_putAway_sourceIndex]"
    unset "_SHELLPEN_INDENT_LEVELS[$__shellpen__sources_putAway_sourceIndex]"
    unset "_SHELLPEN_FUNCTION_OPEN[$__shellpen__sources_putAway_sourceIndex]"
    unset "_SHELLPEN_CASE_OPEN[$__shellpen__sources_putAway_sourceIndex]"
    unset "_SHELLPEN_MAIN_FUNCTION[$__shellpen__sources_putAway_sourceIndex]"

    _SHELLPEN_SOURCES=("${_SHELLPEN_SOURCES[@]}")
    _SHELLPEN_SOURCECODE=("${_SHELLPEN_SOURCECODE[@]}")
    _SHELLPEN_SOURCES_FILE_PATHS=("${_SHELLPEN_SOURCES_FILE_PATHS[@]}")
    _SHELLPEN_INDENT_LEVELS=("${_SHELLPEN_INDENT_LEVELS[@]}")
    _SHELLPEN_FUNCTION_OPEN=("${_SHELLPEN_FUNCTION_OPEN[@]}")
    _SHELLPEN_CASE_OPEN=("${_SHELLPEN_CASE_OPEN[@]}")
    _SHELLPEN_MAIN_FUNCTION=("${_SHELLPEN_MAIN_FUNCTION[@]}")

    if [ "$_SHELLPEN_CURRENT_SOURCE_INDEX" = "$__shellpen__sources_putAway_sourceIndex" ]
    then
      _SHELLPEN_CURRENT_SOURCE_INDEX=0
      _SHELLPEN_CURRENT_SOURCE_NAME="default"
    fi

  else
    FN -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: FN ${__FN__originalCliCommands[*]}"
    return 1
  fi
else
  FN -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi