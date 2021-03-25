#! /usr/bin/env bash

SHELLPEN_VERSION="2.0.0"

# Private ShellPen variables:
__SHELLPEN_SOURCES=()
__SHELLPEN_PENS=()

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
          "writeShellCommand")
            __shellpen__command+=("writeShellCommand")
            # Tackle AND, OR, { }, |, etc.
            
            declare -a currentCommand=()
            local bracesOpen=false
            local commandIsFunctionDeclaration=false # fn is allowed to use curlies
            
            while [ $# -gt 0 ]
            do
              if [ "$1" = '|' ]
              then
                # Write the current command and chomp off its newline then write this pipe
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeDSL "${currentCommand[@]}"; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeDSL append ' | '
            
              elif [ "$1" = 'AND' ]
              then
                # Write the current command and chomp off its newline then write this &&
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeDSL "${currentCommand[@]}"; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeDSL append ' && '
            
              elif [ "$1" = 'OR' ]
              then
                # Write the current command and chomp off its newline then write this ||
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeDSL "${currentCommand[@]}"; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeDSL append ' || '
            
              elif [ "$1" = '{' ] && [ "$commandIsFunctionDeclaration" != true ]
              then
                # Write the current command and chomp off its newline then write this {
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeDSL "${currentCommand[@]}"; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeDSL append '{ ' 
                bracesOpen=true
            
              elif [ "$bracesOpen" = true ] && [ "$1" = '}' ]
              then
                # Write the current command and chomp off its newline then write this }
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeDSL "${currentCommand[@]}"; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeDSL append '}'
                bracesOpen=false
            
              elif [ "$bracesOpen" = true ] && [ "$1" = ',' ]
              then
                # Write the current command and chomp off its newline then write this ;
                [ "${#currentCommand[@]}" -gt 0 ] && { shellpen --shellpen-private writeDSL "${currentCommand[@]}"; currentCommand=(); commandIsFunctionDeclaration=false; __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]%$NEWLINE}"; }
                shellpen --shellpen-private writeDSL append '; '
            
              else
                [ "${#currentCommand[@]}" -eq 0 ] && [ "$1" = fn ] && commandIsFunctionDeclaration=true
                # Ain't nothin' special, just add it to the command :)
                currentCommand+=("$1")
              fi
            
              shift
            done
            
            if [ "${#currentCommand[@]}" -gt 0 ]
            then
              shellpen --shellpen-private writeDSL "${currentCommand[@]}"
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
            
            shellpen --shellpen-private writeShellCommand "$@"
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
                shellpen --shellpen-private contexts closeAndWriteAll
                printf '%s' "${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "toFile")
                __shellpen__command+=("toFile")
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
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "elif $*"
                shellpen --shellpen-private writeDSL writeln "then"
                shellpen --shellpen-private contexts push "fi"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              ":")
                __shellpen__command+=(":")
                shellpen --shellpen-private writeDSL writeln ":"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "echo")
                __shellpen__command+=("echo")
                shellpen --shellpen-private writeDSL writeln "echo \"$*\""
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "append")
                __shellpen__command+=("append")
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*"
                shellpen --shellpen-private contexts markLastNotEmpty
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "else")
                __shellpen__command+=("else")
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "else"
                shellpen --shellpen-private contexts push "fi"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "comment")
                __shellpen__command+=("comment")
                shellpen --shellpen-private writeDSL writeln "# $*"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "appendln")
                __shellpen__command+=("appendln")
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*${NEWLINE}"
                shellpen --shellpen-private contexts markLastNotEmpty
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "case")
                __shellpen__command+=("case")
                shellpen --shellpen-private writeDSL writeln "case \"$1\" in"
                shellpen --shellpen-private contexts push "esac"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "esac")
                __shellpen__command+=("esac")
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "esac"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "stderr")
                __shellpen__command+=("stderr")
                # Because '%s' and similar formatters are so common, look for a '%' formatter (but only one, and not after the --)
                
                local command="$1"
                shift
                
                shellpen --shellpen-private writeDSL $command "$@"
                
                # Chomp the newline and replace it with ' >&2newline'
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ >&2$NEWLINE}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "printf")
                __shellpen__command+=("printf")
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
                shellpen --shellpen-private writeDSL writeln "return $1"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "option")
                __shellpen__command+=("option")
                shellpen --shellpen-private writeDSL writeln "$1)"
                shellpen --shellpen-private contexts push "::"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "::")
                __shellpen__command+=("::")
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private writeDSL writeln ";;"
                shellpen --shellpen-private contexts pop
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "[[")
                __shellpen__command+=("[[")
                shellpen --shellpen-private writeDSL writeln "[[ $*"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "fi")
                __shellpen__command+=("fi")
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "fi"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "writeln")
                __shellpen__command+=("writeln")
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(shellpen --shellpen-private getCurrentIndent)$*${NEWLINE}"
                shellpen --shellpen-private contexts markLastNotEmpty
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "write")
                __shellpen__command+=("write")
                __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(shellpen --shellpen-private getCurrentIndent)$*"
                shellpen --shellpen-private contexts markLastNotEmpty
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "cleanSlate")
                __shellpen__command+=("cleanSlate")
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
                # No-op
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "if")
                __shellpen__command+=("if")
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
                unset "__SHELLPEN_PENS[$SHELLPEN_PEN_INDEX]"
                unset "__SHELLPEN_SOURCES[$SHELLPEN_PEN_INDEX]"
                unset "__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]"
                unset "__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID"
                unset "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "$")
                __shellpen__command+=("$")
                shellpen --shellpen-private writeDSL writeln "$@"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "fn")
                __shellpen__command+=("fn")
                local functionName="$1"
                
                # Write the function
                shellpen --shellpen-private writeDSL writeln "$functionName() {"
                
                # Push the DSL command to run to CLOSE this block
                shellpen --shellpen-private contexts push "}"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "[")
                __shellpen__command+=("[")
                shellpen --shellpen-private writeDSL writeln "[ $*"
                unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
                __shellpen__command=("__shellpen__command[@]")
                ;;
              "}")
                __shellpen__command+=("}")
                shellpen --shellpen-private contexts writeNullIfEmpty
                shellpen --shellpen-private contexts pop
                shellpen --shellpen-private writeDSL writeln "}"
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

