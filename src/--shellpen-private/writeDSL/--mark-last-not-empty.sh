## $ EXTENSIONS --mark-last-not-empty
## > Mark the last item on current stack as not empty

if [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
then

  if [ -z "$BASH_PRE_43" ]
  then
    SHELLPEN_SOURCE_CONTEXT_EMPTY[$SHELLPEN_CONTEXT_RIGHT_INDEX]="false"
  else
    eval "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]=\"false\""
  fi

fi