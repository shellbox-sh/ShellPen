if [ "$1" = "-n" ]
then
  echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_INDEX]}" | cat -n
else
  echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_INDEX]}"
fi