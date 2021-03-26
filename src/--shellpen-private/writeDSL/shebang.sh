## $ DSL shebang
## > Write '#!' hashbang with provided command path (default: `/bin/bash`)

local commandPath=/bin/bash
[ $# -gt 0 ] && commandPath="$*"

!fn --shellpen-private writeDSL prependln "#! $commandPath"
