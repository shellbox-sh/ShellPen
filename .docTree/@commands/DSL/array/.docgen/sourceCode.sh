
local typeArgument='-a '
local globalArgument=''

[ "$1" = "-g" ] && { globalArgument='-g '; shift; }
[ "$1" = "-A" ] && { typeArgument='-A '; shift; }
[ "$1" = "-g" ] && { globalArgument='-g '; shift; }

if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]
  then
    !fn --shellpen-private writeDSL writeln "declare ${globalArgument}${typeArgument}${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
  else
    !fn --shellpen-private writeDSL writeln "declare ${globalArgument}${typeArgument}$1"
  fi
elif [ $# -eq 2 ]
then
  !fn --shellpen-private writeDSL writeln "declare ${globalArgument}${typeArgument}$1=$2"
elif [ $# -eq 3 ] && [ "$2" = '=' ]
then
  !fn --shellpen-private writeDSL writeln "declare ${globalArgument}${typeArgument}$1=$3"
fi
