[ -z "$SHELLPEN_PEN" ] && { echo "SHELLPEN_PEN name is required to write to source, none provided." >&2; return 1; }
[ -z "$SHELLPEN_SOURCE_ID" ] && { echo "SHELLPEN_SOURCE_ID identifier is required to write to source, none provided." >&2; return 1; }
[ -z "$SHELLPEN_SOURCE_INDEX" ] && { echo "SHELLPEN_SOURCE_INDEX is required to write to source, none provided." >&2; return 1; }

if [ -z "$BASH_PRE_43" ]
then
  local SHELLPEN_SOURCE_CONTEXT
  typeset -n SHELLPEN_SOURCE_CONTEXT="__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID"
fi

local NEWLINE=$'\\n' # FIXME hack for caseEsac
local INDENT=''

if [ -z "$BASH_PRE_43" ]
then
  declare -i SHELLPEN_CONTEXT_DEPTH="${#SHELLPEN_SOURCE_CONTEXT[@]}"
else
  eval "declare -i SHELLPEN_CONTEXT_DEPTH=\"\${#__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[@]}\""
fi
declare -i i=0
while [ $i -lt $SHELLPEN_CONTEXT_DEPTH ]
do
  INTENT+="$SHELLPEN_INDENT"
  (( i++ ))
done
unset i

!fn -- "$@"