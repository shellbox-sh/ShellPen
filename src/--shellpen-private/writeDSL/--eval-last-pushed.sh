## $ EXTENSIONS --eval-last-pushed
## > Evaluate the last item pushed onto the current stack

if [ -z "$BASH_PRE_43" ]
then
  !fn --shellpen-private writeSingleCommand ${SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]}
else
  eval "!fn --shellpen-private writeShellCommand \${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]}"
fi