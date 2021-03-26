## $ DSL echo
## > `echo` the provided arguments (_wrapped in `"..."`_)

!fn --shellpen-private writeDSL write "echo"

[ $# -gt 0 ] && !fn --shellpen-private writeDSL append " "

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

!fn --shellpen-private writeDSL appendln
