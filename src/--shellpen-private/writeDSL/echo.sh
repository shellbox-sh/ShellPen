## $ DSL echo
## > `echo` the provided arguments (_wrapped in `"..."`_)

if [ $# -eq 0 ]
then
  !fn --shellpen-private writeDSL writeln "echo"
else
  !fn --shellpen-private writeDSL writeln "echo \"$*\""
fi
