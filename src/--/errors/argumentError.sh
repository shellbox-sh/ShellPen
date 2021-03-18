if [ $# -gt 0 ]
then
  printf '`FN` [Argument Error] ' >&2
  printf "$@" >&2
else
  printf '`FN` [Argument Error]' >&2
fi
FN -- errors printStackTrace