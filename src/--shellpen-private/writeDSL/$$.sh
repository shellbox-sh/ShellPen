## $ DSL $$
## > Run any arbitrary command double quoting all provided arguments

local command="$1"
shift
!fn --shellpen-private writeDSL write "$command"

local arg=''
for arg in "$@"
do
  !fn --shellpen-private writeDSL append " \"$arg\""
done

!fn --shellpen-private writeDSL appendln