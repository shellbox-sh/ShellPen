if [ $# -eq 1 ]
then
  FN append writeln echo \"$*\" '>&2'
  FN return 1
else
  FN append writeln printf $@ '>&2'
  FN return 1
fi