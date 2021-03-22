# TODO get return code if provided!

if [ $# -eq 0 ]
then
  FN append writeln echo '>&2'
  FN append return 1
elif [ $# -eq 1 ]
then
  FN append writeln echo \"$*\" '>&2'
  FN append return 1
else
  FN append writeln printf $@ '>&2'
  FN append return 1
fi