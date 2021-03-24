# Default single argument to pen creation, e.g. $ shellpen myPen
[ $# -eq 1 ] && [ "$1" != "--version" ] && !fn pens new "$1" && return $?