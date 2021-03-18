## $1 (_Optional_) How many levels to skip (default: `2`)
## $2 (_Optional_) How many levels deep to show (default: `100`)

local __shellpen__x_errors_printStackTrace_levelsToSkip="${1-3}"
local __shellpen__x_errors_printStackTrace_levelsToShow="${2-100}"

if [ "$SHELLPEN_SILENCE" != "true" ]
then
  echo >&2
  echo >&2
  echo "Stacktrace:" >&2
  echo >&2
  local __shellpen__i=1
  local __shellpen__stackIndex="$__shellpen__x_errors_printStackTrace_levelsToSkip"
  while [ $__shellpen__stackIndex -lt ${#BASH_SOURCE[@]} ] && [ $__shellpen__i -lt $__shellpen__x_errors_printStackTrace_levelsToShow ]
  do
    local __shellpen__errors_printStackTrace_line=''
    __shellpen__errors_printStackTrace_line="$( echo "$(FN -- errors getFileLine "${BASH_SOURCE[$__shellpen__stackIndex]}" "${BASH_LINENO[$(( __shellpen__stackIndex - 1 ))]}")" | sed 's/^/    /' 2>&1 )"
    # Catches sed errors
    if [ $? -eq 0 ]
    then
      echo "${BASH_SOURCE[$__shellpen__stackIndex]}:${BASH_LINENO[$__shellpen__stackIndex]} ${FUNCNAME[$__shellpen__stackIndex]}():" >&2
      echo "  $__shellpen__errors_printStackTrace_line" >&2
    else
      echo "${BASH_SOURCE[$__shellpen__stackIndex]}:${BASH_LINENO[$__shellpen__stackIndex]} ${FUNCNAME[$__shellpen__stackIndex]}()" >&2
    fi
    echo >&2
    : "$(( __shellpen__stackIndex++ ))"
    : "$(( __shellpen__i++ ))"
  done
fi