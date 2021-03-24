#! /usr/bin/env bash

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
  [ $# -eq 1 ] && shellpen pen "$1" && return $?
  if [ $# -eq 0 ]
  then
    echo "shellpen: Arguments are required but none were provided" >&2
    return 1
  else
    local __shellpen__1="$1"
    shift
    case "$__shellpen__1" in
      "sources")
        __shellpen__command+=("sources")
        local __shellpen__2="$1"
        shift
        case "$__shellpen__2" in
          "delete")
            __shellpen__command+=("delete")

            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          "new")
            __shellpen__command+=("new")
            local id="$( cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 )"
            
            __SHELLPEN_SOURCES+=("$id")
            __SHELLPEN_SOURCES_TEXTS+=("")
            
            # Create supporting array for tracking the nested context
            if [ -z "$BASH_PRE_43" ]
            then
              declare -g -a "__SHELLPEN_CONTEXT_$id=()"
            else
              eval "__SHELLPEN_CONTEXT_$id=()"
            fi
            
            if [ $# -eq 3 ] && [ "$1" = --out ]
            then
              printf -v "$2" '%s' "$id"
              printf -v "$3" '%s' "$(( ${#__SHELLPEN_SOURCES[@]} - 1 ))"
            else
              printf '%s' "$id"
            fi
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          "writeTo")
            __shellpen__command+=("writeTo")
            [ -z "$SHELLPEN_PEN" ] && { echo "SHELLPEN_PEN name is required to write to source, none provided." >&2; return 1; }
            [ -z "$SHELLPEN_SOURCE_ID" ] && { echo "SHELLPEN_SOURCE_ID identifier is required to write to source, none provided." >&2; return 1; }
            [ -z "$SHELLPEN_SOURCE_INDEX" ] && { echo "SHELLPEN_SOURCE_INDEX is required to write to source, none provided." >&2; return 1; }
            
            if [ -z "$BASH_PRE_43" ]
            then
              local SHELLPEN_SOURCE_CONTEXT
              typeset -n SHELLPEN_SOURCE_CONTEXT="__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID"
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
              INTENT+="$SHELLPEN_INDENT"
              (( i++ ))
            done
            unset i
            
            shellpen -- "$@"
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
      "pen")
        __shellpen__command+=("pen")
        # Check args (needs to be just one arg)
        
        local penName="$1"
        
        local sourceId=''
        local sourceIndex=''
        shellpen sources new --out sourceId sourceIndex
        
        local penFunctionSource="
        $penName() {
          local SHELLPEN_PEN=\"$penName\"
          local SHELLPEN_SOURCE_ID=\"$sourceId\"
          local SHELLPEN_SOURCE_INDEX=\"$sourceId\"
          shellpen sources writeTo \"\$@\"
        }
        "
        
        # Try evaluating in a subshell to make sure the function name works OK!
        local shellOutput=''
        shellOutput="$( eval "$penFunctionSource" 2>&1 )"
        
        if [ $? -eq 0 ]
        then
          eval "$penFunctionSource"
          __SHELLPEN_PENS+=("$penName")
        else
          echo "Error creating pen '$penName', must be valid BASH function name: '$shellOutput'" >&2
          shellpen sources delete $sourceId
          return 1
        fi
        unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
        __shellpen__command=("__shellpen__command[@]")
        ;;
      "--")
        __shellpen__command+=("--")
        local __shellpen__2="$1"
        shift
        case "$__shellpen__2" in
          "code")
            __shellpen__command+=("code")
            printf '%s' "${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_SOURCE_INDEX]}"
            unset __shellpen__command[$(( ${#__shellpen__command[@]} - 1 ))]
            __shellpen__command=("__shellpen__command[@]")
            ;;
          "writeln")
            __shellpen__command+=("writeln")
            __SHELLPEN_SOURCES_TEXTS[$SHELLPEN_SOURCE_INDEX]+="${INDENT}echo \"$*\"${NEWLINE}"
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

