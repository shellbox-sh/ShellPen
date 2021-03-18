if [ -n "$1" ]
then
  printf -v "$1" '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
else
  printf '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
fi