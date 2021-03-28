## $ DSL array
## > Define an array variable

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
else
  !fn --shellpen-private writeDSL write "declare ${globalArgument}${typeArgument}$1"
  shift
  if [ $# -gt 0 ]
  then
    !fn --shellpen-private writeDSL append '=('
    while [ $# -gt 0 ]
    do
      if [ $# -eq 1 ]
      then
        !fn --shellpen-private writeDSL append "\"$1\""
      else
        !fn --shellpen-private writeDSL append "\"$1\" "
      fi
      shift
    done
    !fn --shellpen-private writeDSL append ')'
  fi
  !fn --shellpen-private writeDSL writeln
fi
