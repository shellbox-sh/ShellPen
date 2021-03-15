if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
  then
    FN writeln "local $1"
  else
    FN writeln "local $*"
  fi
elif [ $# -eq 2 ]
then
  FN writeln "local $1=$2"
fi