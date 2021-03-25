# Tackle AND, OR, { }, |, etc.

declare -a currentCommand=()
local bracesOpen=false
local commandIsFunctionDeclaration=false # fn is allowed to use curlies

# raw skips this processing, you can include 'AND' ',' etc all you want!
if [ "$1" = raw ]
then
  shift
  !fn --shellpen-private writeSingleCommand $*
  return $?
fi

while [ $# -gt 0 ]
do
  if [ "$1" = '|' ]
  then
    # Write the current command and chomp off its newline then write this pipe
    [ "${#currentCommand[@]}" -gt 0 ] && { !fn --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
    !fn --shellpen-private writeSingleCommand append ' | '

  elif [ "$1" = 'AND' ]
  then
    # Write the current command and chomp off its newline then write this &&
    [ "${#currentCommand[@]}" -gt 0 ] && { !fn --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
    !fn --shellpen-private writeSingleCommand append ' && '

  elif [ "$1" = 'OR' ]
  then
    # Write the current command and chomp off its newline then write this ||
    [ "${#currentCommand[@]}" -gt 0 ] && { !fn --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
    !fn --shellpen-private writeSingleCommand append ' || '

  elif [ "$1" = '{' ] && [ "$commandIsFunctionDeclaration" != true ]
  then
    # Write the current command and chomp off its newline then write this {
    [ "${#currentCommand[@]}" -gt 0 ] && { !fn --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
    !fn --shellpen-private writeSingleCommand append '{ ' 
    bracesOpen=true

  elif [ "$bracesOpen" = true ] && [ "$1" = '}' ]
  then
    # Write the current command and chomp off its newline then write this }
    [ "${#currentCommand[@]}" -gt 0 ] && { !fn --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
    !fn --shellpen-private writeSingleCommand append '}'
    bracesOpen=false

  elif [ "$1" = ',' ]
  then
    # Write the current command and chomp off its newline then write this ;
    [ "${#currentCommand[@]}" -gt 0 ] && { !fn --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
    if [ $# -eq 1 ]
    then
      !fn --shellpen-private writeSingleCommand append ';'
    else
      !fn --shellpen-private writeSingleCommand append '; '
    fi

  else
    [ "${#currentCommand[@]}" -eq 0 ] && [ "$1" = fn ] && commandIsFunctionDeclaration=true
    # HACK for caseEsac which does not, at this time, allow for commands to be started with '.'
    if [ "${#currentCommand[@]}" -eq 0 ] && [ "$1" = '.' ]
    then
      currentCommand+=("dot")
    else
      # Ain't nothin' special, just add it to the command :)
      currentCommand+=("$1")
    fi
  fi

  shift
done

if [ "${#currentCommand[@]}" -gt 0 ]
then
  !fn --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?
fi