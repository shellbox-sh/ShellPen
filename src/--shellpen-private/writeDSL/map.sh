## $ DSL map
## > Define an associative array variable

local typeArgument='-A '
local globalArgument=''

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
  !fn --shellpen-private writeDSL append "declare ${globalArgument}${typeArgument}$1"
  shift
  if [ $# -gt 0 ]
  then
    !fn --shellpen-private writeDSL append '=('
    while [ $# -gt 0 ]
    do
      if [[ "$1" =~ ^\[([^\]]+)\]=(.*)$ ]]
      then
        if [ $# -eq 1 ]
        then
          !fn --shellpen-private writeDSL append "[${BASH_REMATCH[1]}]=\"${BASH_REMATCH[2]}\""
        else
          !fn --shellpen-private writeDSL append "[${BASH_REMATCH[1]}]=\"${BASH_REMATCH[2]}\" "
        fi
      else
        echo "!command: invalid map argument '$1', expected [key]=value" >&2
        return 2
      fi
      shift
    done
    !fn --shellpen-private writeDSL append ')'
  fi
  !fn --shellpen-private writeDSL writeln
fi

