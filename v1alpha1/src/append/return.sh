if [ $# -eq 1 ]
then
  FN append writeln "return $1"
else
  FN append writeln "return 1"
fi