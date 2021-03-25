#! /usr/bin/env bash

SHELLPEN_VERSION="2.0.0"

# Private ShellPen variables:
__SHELLPEN_SOURCES=()
__SHELLPEN_PENS=()
__SHELLPEN_EXTENSIONS=()

# Public configurable variable
SHELLPEN_INDENT="${SHELLPEN_INDENT:-  }"

shellpen() {
  # For branching on whether declare -g / typeset -n are available
  local BASH_PRE_43=''
  if [ "${BASH_VERSION:0:1}" -lt 4 ]
  then
    BASH_PRE_43=true
  elif [ "${BASH_VERSION:0:1}" -eq 4 ] && [ "${BASH_VERSION:2:1}" -lt 3 ]
  then
    BASH_PRE_43=true
  fi
  declare -a __shellpen__args=("$@") # :shared:
  declare -a __shellpen__command=("shellpen") # :shared:
  # Default single argument to pen creation, e.g. $ shellpen myPen
  [ $# -eq 1 ] && [ "$1" != "--version" ] && shellpen pens new "$1" && return $?
  if [ $# -eq 0 ]
  then
    echo "shellpen: Arguments are required but none were provided" >&2
    return 1
  else
    local __shellpen__1="$1"
    shift
    case "$__shellpen__1" in
      "extend")
        __shellpen__command+=("extend")
        __SHELLPEN_EXTENSIONS+=("$*")
        unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
        __shellpen__command=("__shellpen__command[@]")
        ;;
      "--extensionWrite")
        __shellpen__command+=("--extensionWrite")
        shellpen --shellpen-private writeDSL "$@"
        unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
        __shellpen__command=("__shellpen__command[@]")
        ;;
      "--version")
        __shellpen__command+=("--version")
        echo "ShellPen version $SHELLPEN_VERSION"
        unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
        __shellpen__command=("__shellpen__command[@]")
        ;;
      "sources")
        __shellpen__command+=("sources")
        local __shellpen__2="$1"
        shift
        case "$__shellpen__2" in
          *)
            echo "Command not found: '$__shellpen__2'" >&2
            return 1
            ;;
        esac
        unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
        __shellpen__command=("__shellpen__command[@]")
        ;;
      "--shellpen-private")
        __shellpen__command+=("--shellpen-private")
        local __shellpen__2="$1"
        shift
        case "$__shellpen__2" in
          "writeSingleCommand")
            __shellpen__command+=("writeSingleCommand")
            local extensionFunction=''
            local extensionReturnCode=''
            for extensionFunction in "${__SHELLPEN_EXTENSIONS[@]}"
            do
              $extensionFunction "$@"
              extensionReturnCode=$?
              if [ $extensionReturnCode -eq 0 ]
              then
                return 0
              elif [ $extensionReturnCode -eq 2 ]
              then
                # Stop, let it print its error message and halt things
                return 2
              fi
            done
            
            shellpen --shellpen-private writeDSL "$@"
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          "writeShellCommand")
            __shellpen__command+=("writeShellCommand")
            # Tackle AND, OR, { }, |, etc.
            
            declare -a currentCommand=()
            local bracesOpen=false
            local commandIsFunctionDeclaration=false # fn is allowed to use curlies
            
            # raw skips this processing, you can include 'AND' ',' etc all you want!
            if [ "$1" = raw ]
            then
              shift
              shellpen --shellpen-private writeSingleCommand $*
              return $?
            fi
            
            while [ $# -gt 0 ]
            do
              if [ "$1" = '|' ]
              then
                # Write the current command and chomp off its newline then write this pipe
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeSingleCommand append ' | '
            
              elif [ "$1" = 'AND' ]
              then
                # Write the current command and chomp off its newline then write this &&
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeSingleCommand append ' && '
            
              elif [ "$1" = 'OR' ]
              then
                # Write the current command and chomp off its newline then write this ||
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeSingleCommand append ' || '
            
              elif [ "$1" = '{' ] && [ "$commandIsFunctionDeclaration" != true ]
              then
                # Write the current command and chomp off its newline then write this {
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeSingleCommand append '{ ' 
                bracesOpen=true
            
              elif [ "$bracesOpen" = true ] && [ "$1" = '}' ]
              then
                # Write the current command and chomp off its newline then write this }
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeSingleCommand append '}'
                bracesOpen=false
            
              elif [ "$1" = ',' ]
              then
                # Write the current command and chomp off its newline then write this ;
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                if [ $# -eq 1 ]
                then
                  shellpen --shellpen-private writeSingleCommand append ';'
                else
                  shellpen --shellpen-private writeSingleCommand append '; '
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
              shellpen --shellpen-private writeSingleCommand "${currentCommand[@]}" || return $?
            fi
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          "contexts")
            __shellpen__command+=("contexts")
            local __shellpen__3="$1"
            shift
            case "$__shellpen__3" in
              "writeNullIfEmpty")
                __shellpen__command+=("writeNullIfEmpty")
                if [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
                then
                  if [ -z "$BASH_PRE_43" ]
                  then
                    if [ "${SHELLPEN_SOURCE_CONTEXT_EMPTY[$SHELLPEN_CONTEXT_RIGHT_INDEX]}" = true ]
                    then
                      shellpen --shellpen-private writeDSL : 
                    fi
                  else
                    eval "
                      if [ \"\${__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID[$SHELLPEN_CONTEXT_RIGHT_INDEX]}\" = \"true\" ]
                      then
                        shellpen --shellpen-private writeDSL ':'
                      fi
                    "
                  fi
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "closeAndWriteAll")
                __shellpen__command+=("closeAndWriteAll")
                while [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
                do
                  local currentDepth="$SHELLPEN_CONTEXT_DEPTH"
                  local lastCommand="$( shellpen --shellpen-private contexts getLast )"
                  shellpen --shellpen-private contexts writeLastUsingDSL
                  local updatedDepth="$SHELLPEN_CONTEXT_DEPTH"
                  [ $currentDepth -eq $updatedDepth ] && { echo "shellpen --shellpen-private contexts closeAndWriteAll: Internal DSL Error. Expected '$lastCommand' to pop context stack." >&2; return 1; }
                done
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "pop")
                __shellpen__command+=("pop")
                if [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
                then
                
                  if [ -z "$BASH_PRE_43" ]
                  then
                    unset "SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]"
                    unset "SHELLPEN_SOURCE_CONTEXT_EMPTY[$SHELLPEN_CONTEXT_RIGHT_INDEX]"
                  else
                    eval "unset \"__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]\""
                    eval "unset \"__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]\""
                  fi
                
                  (( SHELLPEN_CONTEXT_DEPTH-- ))
                  (( SHELLPEN_CONTEXT_RIGHT_INDEX-- ))
                
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "writeLastUsingDSL")
                __shellpen__command+=("writeLastUsingDSL")
                if [ -z "$BASH_PRE_43" ]
                then
                  shellpen --shellpen-private writeDSL ${SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]}
                else
                  eval "shellpen --shellpen-private writeDSL \${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]}"
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "getLast")
                __shellpen__command+=("getLast")
                if [ -z "$BASH_PRE_43" ]
                then
                  printf '%s' "${SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]}"
                else
                  eval "printf '%s' \"\${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]}\""
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "push")
                __shellpen__command+=("push")
                if [ -z "$BASH_PRE_43" ]
                then
                  SHELLPEN_SOURCE_CONTEXT+=("$*")
                  SHELLPEN_SOURCE_CONTEXT_EMPTY+=("true")
                else
                  eval "__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID+=(\"\$*\")"
                  eval "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID+=(\"true\")"
                fi
                
                (( SHELLPEN_CONTEXT_DEPTH++ ))
                (( SHELLPEN_CONTEXT_RIGHT_INDEX++ ))
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "markLastNotEmpty")
                __shellpen__command+=("markLastNotEmpty")
                if [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
                then
                
                  if [ -z "$BASH_PRE_43" ]
                  then
                    SHELLPEN_SOURCE_CONTEXT_EMPTY[$SHELLPEN_CONTEXT_RIGHT_INDEX]="false"
                  else
                    eval "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]=\"false\""
                  fi
                
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              *)
                echo "Command not found: '$__shellpen__3'" >&2
                return 1
                ;;
            esac
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          "getCurrentIndent")
            __shellpen__command+=("getCurrentIndent")
            local INDENT=''
            
            if [ -z "$BASH_PRE_43" ]
            then
              declare -i SHELLPEN_CONTEXT_DEPTH="${#SHELLPEN_SOURCE_CONTEXT[@]}"
            else
              eval "declare -i SHELLPEN_CONTEXT_DEPTH=\"\${#__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[@]}\""
            fi
            
            declare -i i=0
            while [ $i -lt $SHELLPEN_CONTEXT_DEPTH ]
            do
              INDENT+="$SHELLPEN_INDENT"
              (( i++ ))
            done
            
            printf '%s' "$INDENT"
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          "penWriter")
            __shellpen__command+=("penWriter")
            [ -z "$SHELLPEN_PEN" ] && { echo "SHELLPEN_PEN name is required to write to source, none provided." >&2; return 1; }
            [ -z "$SHELLPEN_PEN_INDEX" ] && { echo "SHELLPEN_PEN_INDEX is required to write to source, none provided." >&2; return 1; }
            [ -z "$SHELLPEN_SOURCE_ID" ] && { echo "SHELLPEN_SOURCE_ID identifier is required to write to source, none provided." >&2; return 1; }
            
            if [ -z "$BASH_PRE_43" ]
            then
              local SHELLPEN_SOURCE_CONTEXT
              typeset -n SHELLPEN_SOURCE_CONTEXT="__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID"
              local SHELLPEN_SOURCE_CONTEXT_EMPTY
              typeset -n SHELLPEN_SOURCE_CONTEXT_EMPTY="__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID"
            fi
            
            local NEWLINE=$'\n' # FIXME hack for caseEsac
            local INDENT=''
            
            if [ -z "$BASH_PRE_43" ]
            then
              declare -i SHELLPEN_CONTEXT_DEPTH="${#SHELLPEN_SOURCE_CONTEXT[@]}"
            else
              eval "declare -i SHELLPEN_CONTEXT_DEPTH=\"\${#__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[@]}\""
            fi
            declare -i i=0
            while [ $i -lt $SHELLPEN_CONTEXT_DEPTH ]
            do
              INDENT+="$SHELLPEN_INDENT"
              (( i++ ))
            done
            unset i
            
            local SHELLPEN_CONTEXT_RIGHT_INDEX="$(( SHELLPEN_CONTEXT_DEPTH - 1 ))"
            
            shellpen --shellpen-private writeShellCommand "$@" || return $? # TBH this should be implicitly returned, not sure why - but this makes it work.
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          "writeDSL")
            __shellpen__command+=("writeDSL")
            local __shellpen__3="$1"
            shift
            case "$__shellpen__3" in
              "code")
                __shellpen__command+=("code")
                ## $ DSL code
                ## > Output the code for the current pen (_does not modify source_)
                
                shellpen --shellpen-private contexts closeAndWriteAll
                printf '%s' "${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "toFile")
                __shellpen__command+=("toFile")
                ## $ DSL toFile
                ## > Append `> [file path]` to the following command
                
                # Because '%s' and similar formatters are so common, look for a '%' formatter (but only one, and not after the --)
                
                local filePath="$1"
                shift
                
                local command="$1"
                shift
                
                shellpen --shellpen-private writeDSL $command "$@"
                
                # Chomp the newline and replace it with ' > "file path"newline'
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ > \"$filePath\"$NEWLINE}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "elif")
                __shellpen__command+=("elif")
                ## $ DSL elif
                ## > Add an `elif` to an `if` conditional block
                
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "elif $*"
                shellpen --shellpen-private writeDSL writeln "then"
                shellpen --shellpen-private contexts push "fi"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "fromFile")
                __shellpen__command+=("fromFile")
                ## $ DSL fromFile
                ## > Append `< "[file path]"` to the following command
                
                local filePath="$1"
                shift
                
                local command="$1"
                shift
                
                shellpen --shellpen-private writeDSL $command "$@"
                
                # Chomp the newline and replace it with ' < "path"newline'
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ < \"$filePath\"$NEWLINE}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "var")
                __shellpen__command+=("var")
                ## $ DSL var
                ## > Define a variable
                
                if [ $# -eq 1 ]
                then
                  if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]
                  then
                    shellpen --shellpen-private writeDSL writeln "${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
                  else
                    shellpen --shellpen-private writeDSL writeln "$1=''"
                  fi
                elif [ $# -eq 2 ]
                then
                  shellpen --shellpen-private writeDSL writeln "$1=$2"
                elif [ $# -eq 3 ] && [ "$2" = '=' ]
                then
                  shellpen --shellpen-private writeDSL writeln "$1=$3"
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              ":")
                __shellpen__command+=(":")
                ## $ DSL :
                ## > Output a line containing the `:` null character
                
                shellpen --shellpen-private writeDSL writeln ":"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "fromStdin")
                __shellpen__command+=("fromStdin")
                ## $ DSL fromStdin
                ## > Append `< [argument]` to the following command
                
                local stdinSource="$1"
                shift
                
                local command="$1"
                shift
                
                shellpen --shellpen-private writeDSL $command "$@"
                
                # Chomp the newline and replace it with ' < "path"newline'
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ < $stdinSource$NEWLINE}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "fromText")
                __shellpen__command+=("fromText")
                ## $ DSL fromText
                ## > Append `<<< "[text]"` to the following command
                
                local string="$1"
                shift
                
                local command="$1"
                shift
                
                shellpen --shellpen-private writeDSL $command "$@"
                
                # Chomp the newline and replace it with ' <<< "string"newline'
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ <<< \"$string\"$NEWLINE}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "int")
                __shellpen__command+=("int")
                ## $ DSL int
                ## > Define an integer variable
                
                local globalArgument=''
                [ "$1" = '-g' ] && { globalArgument='-g '; shift; }
                
                if [ $# -eq 1 ]
                then
                  if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]
                  then
                    shellpen --shellpen-private writeDSL writeln "declare ${globalArgument}-i ${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
                  else
                    shellpen --shellpen-private writeDSL writeln "declare ${globalArgument}-i $1"
                  fi
                elif [ $# -eq 2 ]
                then
                  shellpen --shellpen-private writeDSL writeln "declare ${globalArgument}-i $1=$2"
                elif [ $# -eq 3 ] && [ "$2" = '=' ]
                then
                  shellpen --shellpen-private writeDSL writeln "declare ${globalArgument}-i $1=$3"
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "do")
                __shellpen__command+=("do")
                ## $ DSL do
                ## > Syntax sugar (_does not modify source code_)
                
                # No-op
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "local")
                __shellpen__command+=("local")
                ## $ DSL local
                ## > Define a local variable
                
                if [ $# -eq 1 ]
                then
                  if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]
                  then
                    shellpen --shellpen-private writeDSL writeln "local ${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
                  else
                    shellpen --shellpen-private writeDSL writeln "local $1"
                  fi
                elif [ $# -eq 2 ]
                then
                  shellpen --shellpen-private writeDSL writeln "local $1=$2"
                elif [ $# -eq 3 ] && [ "$2" = '=' ]
                then
                  shellpen --shellpen-private writeDSL writeln "local $1=$3"
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "unset")
                __shellpen__command+=("unset")
                ## $ DSL unset
                ## > `unset` a variable
                
                shellpen --shellpen-private writeDSL writeln "unset $*"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "echo")
                __shellpen__command+=("echo")
                ## $ DSL echo
                ## > `echo` the provided arguments (_wrapped in `"..."`_)
                
                if [ $# -eq 0 ]
                then
                  shellpen --shellpen-private writeDSL writeln "echo"
                else
                  shellpen --shellpen-private writeDSL writeln "echo \"$*\""
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "dot")
                __shellpen__command+=("dot")
                ## $ DSL .
                ## > Source a shell source file via `.`
                
                shellpen --shellpen-private writeDSL writeln ". $*"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "append")
                __shellpen__command+=("append")
                ## $ DSL append
                ## > Append a string of text to source output _without indentation_
                
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*"
                shellpen --shellpen-private contexts markLastNotEmpty
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "while")
                __shellpen__command+=("while")
                ## $ DSL while
                ## > Begin a `while` loop
                
                shellpen --shellpen-private writeDSL writeln "while $*"
                shellpen --shellpen-private writeDSL writeln "do"
                shellpen --shellpen-private contexts push "done"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "declare")
                __shellpen__command+=("declare")
                ## $ DSL declare
                ## > Declare a variable (shortcuts available: [`int`](/docs/int), [`array`](/docs/array), [`map`](/docs/map))
                
                shellpen --shellpen-private writeDSL writeln "declare $*"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "toStderr")
                __shellpen__command+=("toStderr")
                ## $ DSL toStderr
                ## > Append `>&2` to the following command
                
                # Because '%s' and similar formatters are so common, look for a '%' formatter (but only one, and not after the --)
                
                local command="$1"
                shift
                
                shellpen --shellpen-private writeDSL $command "$@"
                
                # Chomp the newline and replace it with ' >&2newline'
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ >&2$NEWLINE}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "else")
                __shellpen__command+=("else")
                ## $ DSL else
                ## > Add an `else` to an `if` conditional block
                
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "else"
                shellpen --shellpen-private contexts push "fi"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "comment")
                __shellpen__command+=("comment")
                ## $ DSL comment
                ## > Append a `#` command line
                
                # Do not use writeln because comments should not mark blocks as not empty
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(shellpen --shellpen-private getCurrentIndent)# $*${NEWLINE}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "appendln")
                __shellpen__command+=("appendln")
                ## $ DSL appendln
                ## > Append a line of text to source output _without indentation_
                
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*${NEWLINE}"
                shellpen --shellpen-private contexts markLastNotEmpty
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "case")
                __shellpen__command+=("case")
                ## $ DSL case
                ## > Begin a `case` / `esac` statement
                
                shellpen --shellpen-private writeDSL writeln "case \"$1\" in"
                shellpen --shellpen-private contexts push "esac"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "esac")
                __shellpen__command+=("esac")
                ## $ DSL esac
                ## > End a `case` / `esac` statement
                
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "esac"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "printf")
                __shellpen__command+=("printf")
                ## $ DSL printf
                ## > `printf` the provided arguments (_with `'%s'` formatter support_)
                
                # Because '%s' and similar formatters are so common, look for a '%' formatter (but only one, and not after the --)
                
                shellpen --shellpen-private writeDSL write "printf"
                
                local encounteredDashDash=false
                local encounteredFormatter=false
                
                local argument=''
                for argument in "$@"
                do
                  [ "$argument" = -- ] && encounteredDashDash=true
                  if [ "$encounteredDashDash" = false ] && [ "$encounteredFormatter" = false ] && [[ "$argument" = *"%"* ]] && [[ ! "$argument" = "'"* ]]
                  then
                    encounteredFormatter=true
                    shellpen --shellpen-private writeDSL write " '$argument'"
                  elif [[ "$argument" =~ ^\' ]] || [[ "$argument" =~ ^\" ]] || [[ "$argument" =~ ^- ]] # If it starts with a quote of some kind, don't double quote it, also if it starts with a dash, like -v
                  then
                    shellpen --shellpen-private writeDSL write " $argument"
                  else
                    shellpen --shellpen-private writeDSL write " \"$argument\""
                  fi
                done
                
                shellpen --shellpen-private writeDSL writeln
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "return")
                __shellpen__command+=("return")
                ## $ DSL return
                ## > Append a `return [code]` statement
                
                shellpen --shellpen-private writeDSL writeln "return $1"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "option")
                __shellpen__command+=("option")
                ## $ DSL option
                ## > Add an option to a `case` / `esac` statement
                
                shellpen --shellpen-private writeDSL writeln "$1)"
                shellpen --shellpen-private contexts push "::"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "::")
                __shellpen__command+=("::")
                ## $ DSL ::
                ## > Write a `;;` for use in `case`/`esac` `option`s
                
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private writeDSL writeln ";;"
                shellpen --shellpen-private contexts pop
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "[[")
                __shellpen__command+=("[[")
                ## $ DSL [[
                ## > Starts a line with a `[[` statement, e.g. `[[ '"$1"' =~ ^-- ]] AND ...`
                
                shellpen --shellpen-private writeDSL writeln "[[ $*"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "done")
                __shellpen__command+=("done")
                ## $ DSL done
                ## > End a `for` or `while` loop
                
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "done"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "for")
                __shellpen__command+=("for")
                ## $ DSL for
                ## > Begin a `for` loop
                
                # Write the function
                shellpen --shellpen-private writeDSL writeln "for $*"
                shellpen --shellpen-private writeDSL writeln "do"
                
                # Push the DSL command to run to CLOSE this block
                shellpen --shellpen-private contexts push "done"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "fi")
                __shellpen__command+=("fi")
                ## $ DSL fi
                ## > End an `if` conditional block
                
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "fi"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "map")
                __shellpen__command+=("map")
                ## $ DSL map
                ## > Define an associative array variable
                
                shellpen --shellpen-private writeDSL array -A "$@"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "writeln")
                __shellpen__command+=("writeln")
                ## $ DSL writeln
                ## > Append a line of text to source output including indentation
                
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(shellpen --shellpen-private getCurrentIndent)$*${NEWLINE}"
                shellpen --shellpen-private contexts markLastNotEmpty
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "array")
                __shellpen__command+=("array")
                ## $ DSL array
                ## > Define an array variable
                
                local typeArgument='-a '
                local globalArgument=''
                
                [ "$1" = "-g" ] && { globalArgument='-g '; shift; }
                [ "$1" = "-A" ] && { typeArgument='-A '; shift; }
                [ "$1" = "-g" ] && { globalArgument='-g '; shift; }
                
                if [ $# -eq 1 ]
                then
                  if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]
                  then
                    shellpen --shellpen-private writeDSL writeln "declare ${globalArgument}${typeArgument}${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
                  else
                    shellpen --shellpen-private writeDSL writeln "declare ${globalArgument}${typeArgument}$1"
                  fi
                elif [ $# -eq 2 ]
                then
                  shellpen --shellpen-private writeDSL writeln "declare ${globalArgument}${typeArgument}$1=$2"
                elif [ $# -eq 3 ] && [ "$2" = '=' ]
                then
                  shellpen --shellpen-private writeDSL writeln "declare ${globalArgument}${typeArgument}$1=$3"
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "write")
                __shellpen__command+=("write")
                ## $ DSL write
                ## > Append a string of text to source output including indentation
                
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(shellpen --shellpen-private getCurrentIndent)$*"
                shellpen --shellpen-private contexts markLastNotEmpty
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "cleanSlate")
                __shellpen__command+=("cleanSlate")
                ## $ DSL cleanSlate
                ## > Clean the slate of the current pen (_resets source code_)
                
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]=""
                
                unset "__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID"
                unset "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID"
                
                # Recreate supporting arrays for tracking the nested context
                if [ -z "$BASH_PRE_43" ]
                then
                  declare -g -a "__SHELLPEN_CONTEXT_$sourceId=()"
                  declare -g -a "__SHELLPEN_CONTEXT_EMPTY_$sourceId=()"
                else
                  eval "__SHELLPEN_CONTEXT_$sourceId=()"
                  eval "__SHELLPEN_CONTEXT_EMPTY_$sourceId=()"
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "then")
                __shellpen__command+=("then")
                ## $ DSL then
                ## > Syntax sugar (_does not modify source code_)
                
                # No-op
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "if")
                __shellpen__command+=("if")
                ## $ DSL if
                ## > Begin an `if` conditional block
                
                # Write the function
                shellpen --shellpen-private writeDSL writeln "if $*"
                shellpen --shellpen-private writeDSL writeln "then"
                
                # Push the DSL command to run to CLOSE this block
                shellpen --shellpen-private contexts push "fi"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "putAway")
                __shellpen__command+=("putAway")
                ## $ DSL putAway
                ## > Delete the current pen (_also deletes source code_)
                
                unset "__SHELLPEN_PENS[$SHELLPEN_PEN_INDEX]"
                unset "__SHELLPEN_SOURCES[$SHELLPEN_PEN_INDEX]"
                unset "__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]"
                unset "__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID"
                unset "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "fromCommand")
                __shellpen__command+=("fromCommand")
                ## $ DSL fromCommand
                ## > Append `< <([command])` to the following command
                
                local commandString="$1"
                shift
                
                local command="$1"
                shift
                
                shellpen --shellpen-private writeDSL $command "$@"
                
                # Chomp the newline and replace it with ' < <(command here)newline'
                if [ -z "$BASH_PRE_43" ]
                then
                  __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ < <\($commandString\)$NEWLINE}"
                else
                  __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ < <($commandString)$NEWLINE}"
                fi
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "$")
                __shellpen__command+=("$")
                ## $ DSL $
                ## > Run any arbitrary command
                ## $* Command name and arguments
                ## @example
                ##   - echo "Hello" \| $ sed "'s/foo/bar'"
                ## @example output
                ##   echo "Hello" | sed 's/foo/bar'
                ## @example Different
                ##   - echo "Hello FOO BAR" \| $ sed "'s/foo/bar'"
                ## @example Different output
                ##   echo "Hello FOO BAR" | sed 's/foo/bar'
                ##
                ## You must supply your own quotations.
                
                shellpen --shellpen-private writeDSL writeln "$@"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "fn")
                __shellpen__command+=("fn")
                ## $ DSL fn
                ## > Begin a `function` definition block
                
                local functionName="$1"
                
                # Write the function
                shellpen --shellpen-private writeDSL writeln "$functionName() {"
                
                # Push the DSL command to run to CLOSE this block
                shellpen --shellpen-private contexts push "}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "source")
                __shellpen__command+=("source")
                ## $ DSL source
                ## > Source a shell source file
                
                shellpen --shellpen-private writeDSL writeln "source $*"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "{{")
                __shellpen__command+=("{{")
                ## $ DSL {{
                ## > Write a `((` arithmetic statement (_replaces `}}` with `))`_)
                
                shellpen --shellpen-private writeDSL writeln "(( ${*/\}\}/\)\)}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "[")
                __shellpen__command+=("[")
                ## $ DSL [
                ## > Starts a line with a `[` statement, e.g. `[ '$#' -eq 0 ] AND ...`
                
                shellpen --shellpen-private writeDSL writeln "[ $*"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "}")
                __shellpen__command+=("}")
                ## $ DSL }
                ## > Closes a function or an open `{` block
                
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "shift")
                __shellpen__command+=("shift")
                ## $ DSL shift
                ## > `shift` a command-line argument
                
                shellpen --shellpen-private writeDSL writeln "shift"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              *)
                echo "Command not found: '$__shellpen__3'" >&2
                return 1
                ;;
            esac
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          *)
            echo "Command not found: '$__shellpen__2'" >&2
            return 1
            ;;
        esac
        unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
        __shellpen__command=("__shellpen__command[@]")
        ;;
      "pens")
        __shellpen__command+=("pens")
        local __shellpen__2="$1"
        shift
        case "$__shellpen__2" in
          "new")
            __shellpen__command+=("new")
            [ $# -eq 0 ] && { echo "shellpen pens new: requires one argument [pen name], none provided" >&2; return 1; }
            [ $# -gt 1 ] && { echo "shellpen pens new: requires only one argument [pen name], $# provided" >&2; return 1; }
            
            local penName="$1"
            
            local existingPenName=''
            for existingPenName in "${__SHELLPEN_PENS[@]}"
            do
              [ "$existingPenName" = "$penName" ] && { echo "shellpen pens new: pen already exists '$penName'" >&2; return 1; }
            done
            
            local sourceId="$( cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 )"
            local sourceIndex="${#__SHELLPEN_SOURCES[@]}"
            
            local penFunctionSource="
            $penName() {
              local SHELLPEN_PEN=\"$penName\"
              local SHELLPEN_SOURCE_ID=\"$sourceId\"
              local SHELLPEN_PEN_INDEX=\"$sourceIndex\"
              shellpen --shellpen-private penWriter \"\$@\"
            }
            "
            
            # Try evaluating in a subshell to make sure the function name works OK!
            local shellOutput=''
            shellOutput="$( eval "$penFunctionSource" 2>&1 )"
            
            if [ $? -eq 0 ]
            then
              # Create the function
              eval "$penFunctionSource"
            
              # Setup the variables
              __SHELLPEN_PENS+=("$penName")
              __SHELLPEN_SOURCES+=("$sourceId")
              __SHELLPEN_SOURCES_TEXTS+=("")
            
              # Create supporting arrays for tracking the nested context
              if [ -z "$BASH_PRE_43" ]
              then
                declare -g -a "__SHELLPEN_CONTEXT_$sourceId=()"
                declare -g -a "__SHELLPEN_CONTEXT_EMPTY_$sourceId=()"
              else
                eval "__SHELLPEN_CONTEXT_$sourceId=()"
                eval "__SHELLPEN_CONTEXT_EMPTY_$sourceId=()"
              fi
            else
              echo "Error creating pen '$penName', must be valid BASH function name: '$shellOutput'" >&2
              shellpen sources delete $sourceId
              return 1
            fi
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          "list")
            __shellpen__command+=("list")
            local pen=''
            for pen in "${__SHELLPEN_PENS[@]}"
            do
              echo "$pen"
            done
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          *)
            echo "Command not found: '$__shellpen__2'" >&2
            return 1
            ;;
        esac
        unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
        __shellpen__command=("__shellpen__command[@]")
        ;;
      *)
        echo "Command not found: '$__shellpen__1'" >&2
        return 1
        ;;
    esac
  fi
}

[ "${BASH_SOURCE[0]}" = "$0" ] && "shellpen" "$@"

