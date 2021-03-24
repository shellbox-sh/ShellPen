# Default single argument to pen creation, e.g. $ shellpen myPen
[ $# -eq 1 ] && !fn pen "$1" && return $?