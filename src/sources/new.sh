local id="$( cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 )"

__SHELLPEN_SOURCES+=("$id")
__SHELLPEN_SOURCES_TEXTS+=("")

# Create supporting array for tracking the nested context
if [ -z "$BASH_PRE_43" ]
then
  declare -g -a "__SHELLPEN_CONTEXT_$id=()"
else
  eval "__SHELLPEN_CONTEXT_$id=()"
fi

if [ $# -eq 3 ] && [ "$1" = --out ]
then
  printf -v "$2" '%s' "$id"
  printf -v "$3" '%s' "$(( ${#__SHELLPEN_SOURCES[@]} - 1 ))"
else
  printf '%s' "$id"
fi