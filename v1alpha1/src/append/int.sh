if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
  then
    FN append writeln "declare -i ${1%%=*}=${1#*=}"
  else
    FN append writeln "declare -i $*"
  fi
elif [ $# -eq 2 ]
then
  FN append writeln "declare -i $1=$2"
fi