local __shellpen__sources_exists_sourceIndex=''
for __shellpen__sources_exists_sourceIndex in "${!_SHELLPEN_SOURCES[@]}"
do
  if [ "$1" = "${_SHELLPEN_SOURCES[$__shellpen__sources_exists_sourceIndex]}" ]
  then
    if [ $# -eq 2 ]
    then
      printf -v "$2" "$__shellpen__sources_exists_sourceIndex" 
    fi
    return 0
  fi
done
return 1