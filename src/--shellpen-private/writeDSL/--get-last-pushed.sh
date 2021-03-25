## $ EXTENSIONS --get-last-pushed
## > Get last item pushed onto the current stack

if [ -z "$BASH_PRE_43" ]
then
  printf '%s' "${SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]}"
else
  eval "printf '%s' \"\${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]}\""
fi