if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]
  then
    !fn --shellpen-private writeDSL writeln "declare -a ${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
  else
    !fn --shellpen-private writeDSL writeln "declare -a $1"
  fi
elif [ $# -eq 2 ]
then
  !fn --shellpen-private writeDSL writeln "declare -a $1=$2"
elif [ $# -eq 3 ] && [ "$2" = '=' ]
then
  !fn --shellpen-private writeDSL writeln "declare -a $1=$3"
fi