FN -- blocks closeAll
FN -- writeMain
FN -- writeShebang

if [ "$1" = "-n" ]
then
  echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" | cat -n
else
  echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
fi