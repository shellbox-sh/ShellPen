# Tackle AND, OR, { }, |, etc.

declare -a currentCommand=()
local bracesOpen=false
local commandIsFunctionDeclaration=false # fn is allowed to use curlies

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

  elif [ "$bracesOpen" = true ] && [ "$1" = ',' ]
  then
    # Write the current command and chomp off its newline then write this ;
    [ "${#currentCommand[@]}" -gt 0 ] && { !fn --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
    !fn --shellpen-private writeSingleCommand append '; '

  else
    [ "${#currentCommand[@]}" -eq 0 ] && [ "$1" = fn ] && commandIsFunctionDeclaration=true
    # Ain't nothin' special, just add it to the command :)
    currentCommand+=("$1")
  fi

  shift
done

if [ "${#currentCommand[@]}" -gt 0 ]
then
  !fn --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?
fi