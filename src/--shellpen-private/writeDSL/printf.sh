# Because '%s' and similar formatters are so common, look for a '%' formatter (but only one, and not after the --)

!fn --shellpen-private writeDSL write "printf"

local encounteredDashDash=false
local encounteredFormatter=false

local argument=''
for argument in "$@"
do
  [ "$argument" = -- ] && encounteredDashDash=true
  if [ "$encounteredDashDash" = false ] && [ "$encounteredFormatter" = false ] && [[ "$argument" = *"%"* ]] && [[ ! "$argument" = "'"* ]]
  then
    encounteredFormatter=true
    !fn --shellpen-private writeDSL write " '$argument'"
  elif [[ "$argument" =~ ^\' ]] || [[ "$argument" =~ ^\" ]] || [[ "$argument" =~ ^- ]] # If it starts with a quote of some kind, don't double quote it, also if it starts with a dash, like -v
  then
    !fn --shellpen-private writeDSL write " $argument"
  else
    !fn --shellpen-private writeDSL write " \"$argument\""
  fi
done

!fn --shellpen-private writeDSL writeln