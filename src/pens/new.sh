[ $# -eq 0 ] && { echo "!command: requires one argument [pen name], none provided" >&2; return 1; }
[ $# -gt 1 ] && { echo "!command: requires only one argument [pen name], $# provided" >&2; return 1; }

local penName="$1"

local existingPenName=''
for existingPenName in "${__SHELLPEN_PENS[@]}"
do
  [ "$existingPenName" = "$penName" ] && { echo "!command: pen already exists '$penName'" >&2; return 1; }
done

if [ "$SHELLPEN_URANDOM" = false ] # This is specifically to support GitHub Actions which blocks on /dev/urandom
then
  local sourceId="${RANDOM}${RANDOM}${RANDOM}"
else
  local sourceId="$( cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 )"
fi

local sourceIndex="${#__SHELLPEN_SOURCES[@]}"

local penFunctionSource="
$penName() {
  local SHELLPEN_PEN=\"$penName\"
  local SHELLPEN_SOURCE_ID=\"$sourceId\"
  local SHELLPEN_PEN_INDEX=\"$sourceIndex\"
  !fn --shellpen-private penWriter \"\$@\"
}
"

# Try evaluating in a subshell to make sure the function name works OK!
local shellOutput=''
shellOutput="$( eval "$penFunctionSource" 2>&1 )"

if [ $? -eq 0 ]
then
  # Create the function
  eval "$penFunctionSource"

  # Setup the variables
  __SHELLPEN_PENS+=("$penName")
  __SHELLPEN_SOURCES+=("$sourceId")
  __SHELLPEN_SOURCES_TEXTS+=("")

  # Create supporting arrays for tracking the nested context
  if [ -z "$BASH_PRE_43" ]
  then
    declare -g -a "__SHELLPEN_CONTEXT_$sourceId=()"
    declare -g -a "__SHELLPEN_CONTEXT_EMPTY_$sourceId=()"
  else
    eval "__SHELLPEN_CONTEXT_$sourceId=()"
    eval "__SHELLPEN_CONTEXT_EMPTY_$sourceId=()"
  fi
else
  echo "Error creating pen '$penName', must be valid BASH function name: '$shellOutput'" >&2
  !fn sources delete $sourceId
  return 1
fi