if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
  then
    FN append writeln "local ${1%%=*}=\"${1#*=}\""
  else
    FN append writeln "local $*"
  fi
elif [ $# -eq 2 ]
then
  FN append writeln "local $1=\"$2\""
fi