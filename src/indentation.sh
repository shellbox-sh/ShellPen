local __shellpen__indentation=""
local __shellpen__indentationLevel=0
while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_INDEX]}" ]
do
  __shellpen__indentation+="$SHELLPEN_INDENT"
  : "$(( __shellpen__indentationLevel++ ))"
done
printf "$__shellpen__indentation"