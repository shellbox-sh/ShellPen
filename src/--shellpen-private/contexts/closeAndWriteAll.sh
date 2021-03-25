while [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
do
  local currentDepth="$SHELLPEN_CONTEXT_DEPTH"
  local lastCommand="$( !fn --shellpen-private contexts getLast )"
  !fn --shellpen-private contexts writeLastUsingDSL
  local updatedDepth="$SHELLPEN_CONTEXT_DEPTH"
  [ $currentDepth -eq $updatedDepth ] && { echo "!command: Internal DSL Error. Expected '$lastCommand' to pop context stack." >&2; return 1; }
done