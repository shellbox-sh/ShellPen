local __shellpen__sources_list_sourceName=''
[ $# -eq 2 ] && [ "$1" = "-" ] && eval "$2=()"
for __shellpen__sources_list_sourceName in "${_SHELLPEN_SOURCES[@]}"
do
  if [ $# -eq 2 ] && [ "$1" = "-" ]
  then
    eval "$2+=(\"\$__shellpen__sources_list_sourceName\")"
  else
    echo "$__shellpen__sources_list_sourceName"
  fi
done