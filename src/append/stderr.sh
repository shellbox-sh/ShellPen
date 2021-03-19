if [ $# -eq 0 ]
then
  FN append writeln echo '>&2'
elif [ $# -eq 1 ]
then
  FN append writeln echo \"$*\" '>&2'
else
  FN append writeln printf $@ '>&2'
fi