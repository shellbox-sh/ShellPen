## $ EXTENSIONS --get-stack
## > Populate a provided array with the full current stack

[ $# -eq 0 ] && { echo "!command [Extension Error]: requires name of an array variable to populate with the stack items" >&2; return 1; }

if [ -z "$BASH_PRE_43" ]
then
  local array
  typeset -n array="$1"
  local stackItem=''
  for stackItem in "${SHELLPEN_SOURCE_CONTEXT[@]}"
  do
    array+=("$stackItem")
  done
else
  eval "
    local stackItem=''
    for stackItem in \"\${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[@]}\"
    do
      $1+=(\"\$stackItem\")
    done
  "
fi