declare -a commands=('writeln [')
local index=0

while [ $# -gt 0 ]
do
  if [ "$1" = AND ]
  then
    commands+=('&&')
    commands+=('')
    (( index += 2 ))
  elif [ "$1" = OR ]
  then
    commands+=('||')
    commands+=('')
    (( index += 2 ))
  elif [ "$1" = '{' ]
  then
    commands+=('{')
    commands+=('')
    (( index += 2 ))
  elif [ "$1" = '}' ]
  then
    commands+=('}')
    commands+=('')
    (( index += 2 ))
  elif [ "$1" = ',' ]
  then
    commands+=(',')
    commands+=('')
    (( index += 2 ))
  else
    commands[$index]+=" $1"
  fi
  shift
done

local command=''
for command in "${commands[@]}"
do
  if [ "$command" = '&&' ]
  then
    # Chomp the most recent \n and make it ' && ' instead
  __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ && }"
  elif [ "$command" = '||' ]
  then
    # Chomp the most recent \n and make it ' || ' instead
  __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ || }"
  elif [ "$command" = '{' ]
  then
    # Add {
    !fn --shellpen-private writeDSL write '{ '
  elif [ "$command" = '}' ]
  then
    # Add }
    !fn --shellpen-private writeDSL write '}'
  elif [ "$command" = ',' ]
  then
    # Chomp the most recent \n and make it '; ' instead
  __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/; }"
  else
    !fn --shellpen-private writeDSL $command
  fi
done