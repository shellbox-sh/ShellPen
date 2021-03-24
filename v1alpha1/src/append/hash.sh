if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
  then
    FN append writeln "declare -A ${1%%=*}=(\"${1#*=}\")"
  else
    FN append writeln "declare -A $*"
  fi
elif [ $# -eq 2 ]
then
  FN append writeln "declare -A $1=(\"$2\")"
fi