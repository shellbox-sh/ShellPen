if [ $# -eq 1 ]
then
  FN writeln echo \"$*\" '>&2'
  FN return 1
else
  FN writeln printf $@ '>&2'
  FN return 1
fi