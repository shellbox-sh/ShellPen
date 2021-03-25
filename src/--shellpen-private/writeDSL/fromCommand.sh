## $ DSL fromCommand
## > Append `< <([command])` to the following command

local commandString="$1"
shift

local command="$1"
shift

!fn --shellpen-private writeDSL $command "$@"

# Chomp the newline and replace it with ' < <(command here)newline'
if [ -z "$BASH_PRE_43" ]
then
  __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ < <\($commandString\)$NEWLINE}"
else
  __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ < <($commandString)$NEWLINE}"
fi
