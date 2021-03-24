if [ -z "$BASH_PRE_43" ]
then
  !fn --shellpen-private writeDSL ${SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]}
else
  eval "!fn --shellpen-private writeDSL \${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]}"
fi