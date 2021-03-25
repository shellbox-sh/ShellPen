# For branching on whether declare -g / typeset -n are available
local BASH_PRE_43=''
if [ "${BASH_VERSION:0:1}" -lt 4 ]
then
  BASH_PRE_43=true
elif [ "${BASH_VERSION:0:1}" -eq 4 ] && [ "${BASH_VERSION:2:1}" -lt 3 ]
then
  BASH_PRE_43=true
fi