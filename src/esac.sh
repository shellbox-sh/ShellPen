# Close existing option, if open
if [ "${_SHELLPEN_OPTION_OPEN[_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
then
  FN writeln ";;"
  _SHELLPEN_OPTION_OPEN[_SHELLPEN_CURRENT_SOURCE_INDEX]=false
fi

FN indent--
FN indent--
FN writeln "esac"