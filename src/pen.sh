# Check args (needs to be just one arg)

local penName="$1"

local sourceId=''
local sourceIndex=''
!fn sources new --out sourceId sourceIndex

local penFunctionSource="
$penName() {
  local SHELLPEN_PEN=\"$penName\"
  local SHELLPEN_SOURCE_ID=\"$sourceId\"
  local SHELLPEN_SOURCE_INDEX=\"$sourceId\"
  !fn sources writeTo \"\$@\"
}
"

# Try evaluating in a subshell to make sure the function name works OK!
local shellOutput=''
shellOutput="$( eval "$penFunctionSource" 2>&1 )"

if [ $? -eq 0 ]
then
  eval "$penFunctionSource"
  __SHELLPEN_PENS+=("$penName")
else
  echo "Error creating pen '$penName', must be valid BASH function name: '$shellOutput'" >&2
  !fn sources delete $sourceId
  return 1
fi