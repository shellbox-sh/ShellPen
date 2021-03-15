# Close existing option, if open
if [ "${_SHELLPEN_OPTION_OPEN[_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
then
  FN writeln ";;"
  FN indent--
fi

FN writeln "$1)"
FN indent++

_SHELLPEN_OPTION_OPEN[_SHELLPEN_CURRENT_SOURCE_INDEX]=true