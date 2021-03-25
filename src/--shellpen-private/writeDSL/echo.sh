## $ DSL echo

if [ $# -eq 0 ]
then
  !fn --shellpen-private writeDSL writeln "echo"
else
  !fn --shellpen-private writeDSL writeln "echo \"$*\""
fi
