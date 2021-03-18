## $1 Path to the file
## $2 Line to print
##
if [ "$2" = "0" ]
then
  sed "1q;d" "$1" | sed 's/^ *//g'
else
  sed "${2}q;d" "$1" | sed 's/^ *//g'
fi