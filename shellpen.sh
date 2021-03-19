#! /usr/bin/env bash

_SHELLPEN_SHEBANG=("#! /usr/bin/env bash")

_SHELLPEN_PENS=("default")
_SHELLPEN_PEN_SOURCES=("default")
_SHELLPEN_CURRENT_PEN_NAME="default"
_SHELLPEN_CURRENT_PEN_INDEX=0

_SHELLPEN_CURRENT_SOURCE_INDEX=0
_SHELLPEN_CURRENT_SOURCE_NAME="default"
_SHELLPEN_SOURCES=("default")
_SHELLPEN_SOURCECODE=("")
_SHELLPEN_SOURCES_FILE_PATHS=("")
_SHELLPEN_INDENT_LEVELS=(0)
_SHELLPEN_FUNCTION_OPEN=("")
_SHELLPEN_CASE_OPEN=("")
_SHELLPEN_MAIN_FUNCTION=("")

# Public Variables
[ -z "$SHELLPEN_INDENT" ] && SHELLPEN_INDENT="  "

## @command shellpen
shellpen() {
  declare -a __shellpen__mainCliCommands=("shellpen")
  declare -a __shellpen__originalCliCommands=("$@")

## > 🖋️ Generate Shell Script Source Code using a familiar DSL!

  local __shellpen__mainCliCommandDepth="1"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command1="$1"
  shift
  case "$__shellpen__mainCliCommands_command1" in
    "--")
    ## @command shellpen --
      local __shellpen__mainCliCommandDepth="2"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command2="$1"
      shift
      case "$__shellpen__mainCliCommands_command2" in
        "blocks")
        ## @command shellpen -- blocks
            local __shellpen__mainCliCommandDepth="3"
            __shellpen__mainCliCommands+=("$1")
            local __shellpen__mainCliCommands_command3="$1"
            shift
            case "$__shellpen__mainCliCommands_command3" in
              "cases")
              ## @command shellpen -- blocks cases
                    local __shellpen__mainCliCommandDepth="4"
                    __shellpen__mainCliCommands+=("$1")
                    local __shellpen__mainCliCommands_command4="$1"
                    shift
                    case "$__shellpen__mainCliCommands_command4" in
                      "close")
                      ## @command shellpen -- blocks cases close
                        if [ "${_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
                        then
                          shellpen esac
                        fi
                        _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
                      ## @
            
                          ;;
                      "open")
                      ## @command shellpen -- blocks cases open
                        _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
                      ## @
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks cases' command: $__shellpen__mainCliCommands_command4" >&2
                        return 1
                        ;;
                    esac
              ## @
      
                  ;;
              "closeAll")
              ## @command shellpen -- blocks closeAll
                shellpen -- blocks cases close
                shellpen -- blocks functions close
              ## @
      
                  ;;
              "functions")
              ## @command shellpen -- blocks functions
                    local __shellpen__mainCliCommandDepth="4"
                    __shellpen__mainCliCommands+=("$1")
                    local __shellpen__mainCliCommands_command4="$1"
                    shift
                    case "$__shellpen__mainCliCommands_command4" in
                      "close")
                      ## @command shellpen -- blocks functions close
                        local __shellpen__blocks_functions_close_newLine=$'\n'
                        if [ -n "$SHELLPEN_SOURCE" ]
                        then
                          local __shellpen__blocks_functions_close_sourceIndex=''
                          if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__blocks_functions_close_sourceIndex
                          then
                            shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
                            return 1
                          else
                            if [ "${_SHELLPEN_FUNCTION_OPEN[$__shellpen__blocks_functions_close_sourceIndex]}" = true ];
                            then
                              shellpen append }
                            fi
                            _SHELLPEN_FUNCTION_OPEN[$__shellpen__blocks_functions_close_sourceIndex]=false
                          fi
                        else
                          if [ "${_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
                          then
                            shellpen append }
                          fi
                          _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
                        fi
                      ## @
            
                          ;;
                      "open")
                      ## @command shellpen -- blocks functions open
                        if [ -n "$SHELLPEN_SOURCE" ]
                        then
                          local __shellpen__append_main_sourceIndex=''
                          if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_main_sourceIndex
                          then
                            shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
                            return 1
                          else
                            _SHELLPEN_FUNCTION_OPEN[$__shellpen__append_main_sourceIndex]=true
                          fi
                        else
                          _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
                        fi
                      ## @
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks functions' command: $__shellpen__mainCliCommands_command4" >&2
                        return 1
                        ;;
                    esac
              ## @
      
                  ;;
              *)
                echo "Unknown 'shellpen -- blocks' command: $__shellpen__mainCliCommands_command3" >&2
                return 1
                ;;
            esac
        ## @
  
            ;;
        "dump")
        ## @command shellpen -- dump
          ( set -o posix; set ) | grep SHELLPEN
        ## @
  
            ;;
        "errors")
        ## @command shellpen -- errors
            local __shellpen__mainCliCommandDepth="3"
            __shellpen__mainCliCommands+=("$1")
            local __shellpen__mainCliCommands_command3="$1"
            shift
            case "$__shellpen__mainCliCommands_command3" in
              "argumentError")
              ## @command shellpen -- errors argumentError
                if [ $# -gt 0 ]
                then
                  printf '`shellpen` [Argument Error] ' >&2
                  printf "$@" >&2
                else
                  printf '`shellpen` [Argument Error]' >&2
                fi
                shellpen -- errors printStackTrace
              ## @
      
                  ;;
              "getFileLine")
              ## @command shellpen -- errors getFileLine
                ## $1 Path to the file
                ## $2 Line to print
                ##
                if [ "$2" = "0" ]
                then
                  sed "1q;d" "$1" | sed 's/^ *//g'
                else
                  sed "${2}q;d" "$1" | sed 's/^ *//g'
                fi
              ## @
      
                  ;;
              "printStackTrace")
              ## @command shellpen -- errors printStackTrace
                ## $1 (_Optional_) How many levels to skip (default: `2`)
                ## $2 (_Optional_) How many levels deep to show (default: `100`)
                
                local __shellpen__x_errors_printStackTrace_levelsToSkip="${1-3}"
                local __shellpen__x_errors_printStackTrace_levelsToShow="${2-100}"
                
                if [ "$SHELLPEN_SILENCE" != "true" ]
                then
                  echo >&2
                  echo >&2
                  echo "Stacktrace:" >&2
                  echo >&2
                  local __shellpen__i=1
                  local __shellpen__stackIndex="$__shellpen__x_errors_printStackTrace_levelsToSkip"
                  while [ $__shellpen__stackIndex -lt ${#BASH_SOURCE[@]} ] && [ $__shellpen__i -lt $__shellpen__x_errors_printStackTrace_levelsToShow ]
                  do
                    local __shellpen__errors_printStackTrace_line=''
                    __shellpen__errors_printStackTrace_line="$( echo "$(shellpen -- errors getFileLine "${BASH_SOURCE[$__shellpen__stackIndex]}" "${BASH_LINENO[$(( __shellpen__stackIndex - 1 ))]}")" | sed 's/^/    /' 2>&1 )"
                    # Catches sed errors
                    if [ $? -eq 0 ]
                    then
                      echo "${BASH_SOURCE[$__shellpen__stackIndex]}:${BASH_LINENO[$(( __shellpen__stackIndex - 1 ))]} ${FUNCNAME[$__shellpen__stackIndex]}():" >&2
                      echo "  $__shellpen__errors_printStackTrace_line" >&2
                    else
                      echo "${BASH_SOURCE[$__shellpen__stackIndex]}:${BASH_LINENO[$(( __shellpen__stackIndex - 1 ))]} ${FUNCNAME[$__shellpen__stackIndex]}()" >&2
                    fi
                    echo >&2
                    : "$(( __shellpen__stackIndex++ ))"
                    : "$(( __shellpen__i++ ))"
                  done
                fi
              ## @
      
                  ;;
              *)
                echo "Unknown 'shellpen -- errors' command: $__shellpen__mainCliCommands_command3" >&2
                return 1
                ;;
            esac
        ## @
  
            ;;
        "getPenIndex")
        ## @command shellpen -- getPenIndex
          ## > Get the internal `shellpen` index of the provided pen
          ##
          ## ### Valid signatures:
          ##
          ## || Argument List | Description
          ## -|-
          ## `1` | `[pen]` | Print the index of the provided pen
          ## `3` | `[pen] [-] [varName]` | Get the index of the provided pen
          ##
          ## @return 1 If no pen with the given name exists (fails silently)
          ##
          
          if [ $# -eq 1 ]
          then
            local __shellpen__pens_exists_penIndex=''
            for __shellpen__pens_exists_penIndex in "${!_SHELLPEN_PENS[@]}"
            do
              if [ "$1" = "${_SHELLPEN_PENS[$__shellpen__pens_exists_penIndex]}" ]
              then
                printf '%s' "$__shellpen__pens_exists_penIndex" 
                return 0
              fi
            done
            return 1
          elif [ $# -eq 3 ] && [ "$2" = '-' ]
          then
            local __shellpen__pens_exists_penIndex=''
            for __shellpen__pens_exists_penIndex in "${!_SHELLPEN_PENS[@]}"
            do
              if [ "$1" = "${_SHELLPEN_PENS[$__shellpen__pens_exists_penIndex]}" ]
              then
                printf -v "$3" '%s' "$__shellpen__pens_exists_penIndex" 
                return 0
              fi
            done
            return 1
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
        ## @
  
            ;;
        "getSourceIndex")
        ## @command shellpen -- getSourceIndex
          ## > Get the internal `shellpen` index of the current or provided source
          ##
          ## ### Valid signatures:
          ##
          ## || Argument List | Description
          ## -|-
          ## `0` || Print the index of the current source
          ## `1` | `[source]` | Print the index of the provided source
          ## `2` | `[-] [varName]` | Get the index of the current source
          ## `3` | `[source] [-] [varName]` | Get the index of the provided source
          ##
          ## @return 1 If no source with the given name exists (fails silently)
          ##
          if [ $# -eq 0 ]
          then
            printf '%s' "$_SHELLPEN_CURRENT_SOURCE_INDEX"
          elif [ $# -eq 1 ]
          then
            local __shellpen__sources_exists_sourceIndex=''
            for __shellpen__sources_exists_sourceIndex in "${!_SHELLPEN_SOURCES[@]}"
            do
              if [ "$1" = "${_SHELLPEN_SOURCES[$__shellpen__sources_exists_sourceIndex]}" ]
              then
                printf '%s' "$__shellpen__sources_exists_sourceIndex" 
                return 0
              fi
            done
            return 1
          elif [ $# -eq 2 ] && [ "$1" = '-' ]
          then
            printf -v "$2" '%s' "$_SHELLPEN_CURRENT_SOURCE_INDEX" 
          elif [ $# -eq 3 ] && [ "$2" = '-' ]
          then
            local __shellpen__sources_exists_sourceIndex=''
            for __shellpen__sources_exists_sourceIndex in "${!_SHELLPEN_SOURCES[@]}"
            do
              if [ "$1" = "${_SHELLPEN_SOURCES[$__shellpen__sources_exists_sourceIndex]}" ]
              then
                printf -v "$3" '%s' "$__shellpen__sources_exists_sourceIndex" 
                return 0
              fi
            done
            return 1
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
        ## @
  
            ;;
        "writeMain")
        ## @command shellpen -- writeMain
          if [ -n "${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
          then
            shellpen append writeln
            shellpen append writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\" \"\$@\""
          fi
          _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
        ## @
  
            ;;
        "writeShebang")
        ## @command shellpen -- writeShebang
          
          if [ -n "${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
          then
            _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]="${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\n${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
          fi
          _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
        ## @
  
            ;;
        *)
          echo "Unknown 'shellpen --' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac
    ## @

        ;;
    "append")
    ## @command shellpen append
      local __shellpen__mainCliCommandDepth="2"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command2="$1"
      shift
      case "$__shellpen__mainCliCommands_command2" in
        "appendln")
        ## @command shellpen append appendln
          local __shellpen__append_appendln_newLine=$'\n'
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_appendln_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_appendln_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              _SHELLPEN_SOURCECODE[$__shellpen__append_appendln_sourceIndex]+="$*${__shellpen__append_appendln_newLine}"
            fi
          else
            _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$*${__shellpen__append_appendln_newLine}"
          fi
        ## @
  
            ;;
        "append")
        ## @command shellpen append append
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_append_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_append_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              _SHELLPEN_SOURCECODE[$__shellpen__append_append_sourceIndex]+="$*"
            fi
          else
            _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$*"
          fi
        ## @
  
            ;;
        "array")
        ## @command shellpen append array
          if [ $# -eq 1 ]
          then
            if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
            then
              shellpen append writeln "declare -a ${1%%=*}=(\"${1#*=}\")"
            else
              shellpen append writeln "declare -a $*"
            fi
          elif [ $# -eq 2 ]
          then
            shellpen append writeln "declare -a $1=(\"$2\")"
          fi
        ## @
  
            ;;
        "case")
        ## @command shellpen append case
          shellpen append writeln "case \"$1\" in"
          shellpen append indent++
        ## @
  
            ;;
        "code")
        ## @command shellpen append code
          shellpen append result "$@"
        ## @
  
            ;;
        "comment")
        ## @command shellpen append comment
          ## $1 foo
          ## $@ stuff
          ##
          ## Some stuff about the comment
          ##
          ## Here come some params:
          ##
          ##
          ## Hello
          ##
          
          shellpen append writeln "# $*"
        ## @
  
            ;;
        "echo")
        ## @command shellpen append echo
          shellpen append writeln "echo \"$*\""
        ## @
  
            ;;
        "else")
        ## @command shellpen append else
          shellpen append indent--
          shellpen append writeln "else"
          shellpen append indent++
        ## @
  
            ;;
        "error")
        ## @command shellpen append error
          if [ $# -eq 1 ]
          then
            shellpen append writeln echo \"$*\" '>&2'
            shellpen append return 1
          else
            shellpen append writeln printf $@ '>&2'
            shellpen append return 1
          fi
        ## @
  
            ;;
        "esac")
        ## @command shellpen append esac
          _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
          # Close existing option, if open
          shellpen append indent--
          shellpen append writeln "esac"
        ## @
  
            ;;
        "fi")
        ## @command shellpen append fi
          shellpen append indent--
          shellpen append writeln "fi"
        ## @
  
            ;;
        "fn")
        ## @command shellpen append fn
          shellpen function "$@"
        ## @
  
            ;;
        "function")
        ## @command shellpen append function
          shellpen append writeln
          shellpen append writeln "${1%()}() {"
          shellpen append indent++
          shellpen -- blocks functions open
        ## @
  
            ;;
        "hash")
        ## @command shellpen append hash
          if [ $# -eq 1 ]
          then
            if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
            then
              shellpen append writeln "declare -A ${1%%=*}=(\"${1#*=}\")"
            else
              shellpen append writeln "declare -A $*"
            fi
          elif [ $# -eq 2 ]
          then
            shellpen append writeln "declare -A $1=(\"$2\")"
          fi
        ## @
  
            ;;
        "if")
        ## @command shellpen append if
          shellpen append writeln "if $*"
          shellpen append writeln "then"
          shellpen append indent++
        ## @
  
            ;;
        "indentation")
        ## @command shellpen append indentation
          local __shellpen__indentation=""
          local __shellpen__indentationLevel=0
          
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_indentation_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_indentation_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$__shellpen__append_indentation_sourceIndex]}" ]
              do
                __shellpen__indentation+="$SHELLPEN_INDENT"
                : "$(( __shellpen__indentationLevel++ ))"
              done
            fi
          else
            while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
            do
              __shellpen__indentation+="$SHELLPEN_INDENT"
              : "$(( __shellpen__indentationLevel++ ))"
            done
          fi
          
          printf "$__shellpen__indentation"
        ## @
  
            ;;
        "indent++")
        ## @command shellpen append indent++
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_indentPlus_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_indentPlus_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              _SHELLPEN_INDENT_LEVELS[$__shellpen__append_indentPlus_sourceIndex]="$(( ${_SHELLPEN_INDENT_LEVELS[$__shellpen__append_indentPlus_sourceIndex]} + 1 ))"
            fi
          else
            _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} + 1 ))"
          fi
        ## @
  
            ;;
        "indent--")
        ## @command shellpen append indent--
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_indentMinus_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_indentMinus_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              _SHELLPEN_INDENT_LEVELS[$__shellpen__append_indentMinus_sourceIndex]="$(( ${_SHELLPEN_INDENT_LEVELS[$__shellpen__append_indentMinus_sourceIndex]} - 1 ))"
            fi
          else
            _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"
          fi
        ## @
  
            ;;
        "local")
        ## @command shellpen append local
          if [ $# -eq 1 ]
          then
            if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
            then
              shellpen append writeln "local ${1%%=*}=\"${1#*=}\""
            else
              shellpen append writeln "local $*"
            fi
          elif [ $# -eq 2 ]
          then
            shellpen append writeln "local $1=\"$2\""
          fi
        ## @
  
            ;;
        "main")
        ## @command shellpen append main
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_main_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_main_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              _SHELLPEN_MAIN_FUNCTION[$__shellpen__append_main_sourceIndex]="$1"
            fi
          else
            _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"
          fi
        ## @
  
            ;;
        "map")
        ## @command shellpen append map
          shellpen append hash "$@"
        ## @
  
            ;;
        "option")
        ## @command shellpen append option
          shellpen append writeln "$1)"
          shellpen append indent++
        ## @
  
            ;;
        "preview")
        ## @command shellpen append preview
          shellpen append result "$@"
        ## @
  
            ;;
        "putAway")
        ## @command shellpen append putAway
          # local __shellpen__append_appendln_newLine=$'\n'
          
          if [ -n "$SHELLPEN_PEN" ]
          then
            shellpen pens putAway "$SHELLPEN_PEN" "$@"
          else
            shellpen -- errors argumentError '%s\n%s' "\`append putAway\` can only be called by a Pen, try \`shellpen pens putAway [name]\` instead" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
        ## @
  
            ;;
        "result")
        ## @command shellpen append result
          shellpen -- blocks closeAll
          
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_write_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_write_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              if [ "$1" = "-n" ]
              then
                echo -e "${_SHELLPEN_SOURCECODE[$__shellpen__append_write_sourceIndex]}" | cat -n
              else
                echo -e "${_SHELLPEN_SOURCECODE[$__shellpen__append_write_sourceIndex]}"
              fi
            fi
          else
            if [ "$1" = "-n" ]
            then
              echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" | cat -n
            else
              echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
            fi
          fi
        ## @
  
            ;;
        "return")
        ## @command shellpen append return
          if [ $# -eq 1 ]
          then
            shellpen append writeln "return $1"
          else
            shellpen append writeln "return 1"
          fi
        ## @
  
            ;;
        "save")
        ## @command shellpen append save
          shellpen result > "$1"
          chmod +x "$1"
        ## @
  
            ;;
        ":")
        ## @command shellpen append :
          shellpen append writeln ":"
        ## @
  
            ;;
        "::")
        ## @command shellpen append ::
          shellpen append writeln ";;"
          shellpen append indent--
        ## @
  
            ;;
        "}")
        ## @command shellpen append }
          shellpen append indent--
          shellpen append writeln "}"
          
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_main_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_main_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              _SHELLPEN_FUNCTION_OPEN[$__shellpen__append_main_sourceIndex]=false
            fi
          else
            _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
          fi
        ## @
  
            ;;
        "shebang")
        ## @command shellpen append shebang
          _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$*"
        ## @
  
            ;;
        "shift")
        ## @command shellpen append shift
          shellpen append writeln shift
        ## @
  
            ;;
        "switchTo")
        ## @command shellpen append switchTo
          ## > Switch pen to write to a different source
          ##
          ## $1 Name of the source to switch to
          ##
          ## @return 1 If the provided source does not exist
          ##
          
          if [ $# -eq 1 ]
          then
            if [ -z "$SHELLPEN_PEN" ]
            then
              shellpen -- errors argumentError '%s\n%s' "Please do not call 'append switchTo' directly, call it via a pen function (this function requires setting \$SHELLPEN_PEN=\"[pen name]\" which is done automatically when using a pen function)" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
            if shellpen sources exists "$1"
            then
              local __shellpen__append_switchTo_penIndex=''
              shellpen -- getPenIndex "$SHELLPEN_PEN" - __shellpen__append_switchTo_penIndex
              _SHELLPEN_PEN_SOURCES["$__shellpen__append_switchTo_penIndex"]="$1"
            else
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
        ## @
  
            ;;
        "writeFile")
        ## @command shellpen append writeFile
          if ! [ -f "$1" ]
          then
            shellpen -- errors argumentError '%s\n%s' "File '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
          
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_writeFile_newLine=$'\n'
            local __shellpen__append_writeFile_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_writeFile_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              _SHELLPEN_SOURCECODE[$__shellpen__append_writeFile_sourceIndex]+="$( cat "$1" | sed "s/^/$( shellpen indentation )/" )${__shellpen__append_writeFile_newLine}"
            fi
          else
              _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( cat "$1" | sed "s/^/$( shellpen indentation )/" )${__shellpen__append_writeFile_newLine}"
          fi
        ## @
  
            ;;
        "writeln")
        ## @command shellpen append writeln
          local __shellpen__append_writeln_newLine=$'\n'
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_writeln_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_writeln_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              _SHELLPEN_SOURCECODE[$__shellpen__append_writeln_sourceIndex]+="$( shellpen append indentation )$*${__shellpen__append_writeln_newLine}"
            fi
          else
            _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen append indentation )$*${__shellpen__append_writeln_newLine}"
          fi
        ## @
  
            ;;
        "write")
        ## @command shellpen append write
          if [ -n "$SHELLPEN_SOURCE" ]
          then
            local __shellpen__append_write_sourceIndex=''
            if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_write_sourceIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              _SHELLPEN_SOURCECODE[$__shellpen__append_write_sourceIndex]+="$( shellpen indentation )$*"
            fi
          else
            _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*"
          fi
        ## @
  
            ;;
        *)
          echo "Unknown 'shellpen append' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac
    ## @

        ;;
    "code")
    ## @command shellpen code
      shellpen result "$@"
    ## @

        ;;
    "indentation")
    ## @command shellpen indentation
      local __shellpen__indentation=""
      local __shellpen__indentationLevel=0
      while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
      do
        __shellpen__indentation+="$SHELLPEN_INDENT"
        : "$(( __shellpen__indentationLevel++ ))"
      done
      printf "$__shellpen__indentation"
    ## @

        ;;
    "pens")
    ## @command shellpen pens
      local __shellpen__mainCliCommandDepth="2"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command2="$1"
      shift
      case "$__shellpen__mainCliCommands_command2" in
        "exists")
        ## @command shellpen pens exists
          shellpen -- getPenIndex "$@" >/dev/null
        ## @
  
            ;;
        "getSource")
        ## @command shellpen pens getSource
          ## > Print or get the name of the source associated with the given pen name
          ##
          ## ### Valid signatures:
          ##
          ## || Argument List | Description
          ## -|-
          ## `1` | `[name]` | Print the source name associated with the provided pen name
          ## `3` | `[name] [-] [varName]` | Get the source name associated with the provided pen name
          ##
          ## @return 1 If no pen with the given name exists
          
          if [ $# -gt 0 ] && ! shellpen pens exists "$1"
          then
            shellpen -- errors argumentError '%s\n%s' "Pen not found: '$1'" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
          
          if [ $# -eq 1 ]
          then
            local __shellpen__pens_getSource_penIndex=''
            shellpen -- getPenIndex "$1" - __shellpen__pens_getSource_penIndex
            printf '%s' "${_SHELLPEN_PEN_SOURCES["$__shellpen__pens_getSource_penIndex"]}"
          elif [ $# -eq 3 ] && [ "$2" = '-' ]
          then
            local __shellpen__pens_getSource_penIndex=''
            shellpen -- getPenIndex "$1" - __shellpen__pens_getSource_penIndex
            printf -v "$3" '%s' "${_SHELLPEN_PEN_SOURCES["$__shellpen__pens_getSource_penIndex"]}"
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
        ## @
  
            ;;
        "list")
        ## @command shellpen pens list
          local __shellpen__pens_list_sourceName=''
          [ $# -eq 2 ] && [ "$1" = "-" ] && eval "$2=()"
          for __shellpen__pens_list_sourceName in "${_SHELLPEN_PENS[@]}"
          do
            if [ $# -eq 2 ] && [ "$1" = "-" ]
            then
              eval "$2+=(\"\$__shellpen__pens_list_sourceName\")"
            else
              echo "$__shellpen__pens_list_sourceName"
            fi
          done
        ## @
  
            ;;
        "new")
        ## @command shellpen pens new
          ## > Create a new pen (optionally associated with a new or existing source)
          ##
          ## ### Valid signatures:
          ##
          ## || Argument List | Description
          ## -|-
          ## `1` | `[name]` | Create a new pen for the current source with the provided name
          ## `2` | `[name] [source]` | Create a new pen for the provided source (will be created if it does not already exist)
          ## `2` | `[name] [-]` | Create a new pen for the current source _but do not create a writer alias function_
          ## `3` | `[name] [-] [alias]` | Create a new pen for the current source _and create an alias function with the provided name_
          ## `3` | `[name] [source] [-]` | Create a new pen for the provided source (will be created if it does not already exist) _but do not create a writer alias function_
          ## `4` | `[name] [source] [-] [alias]` | Create a new pen for the provided source (will be created if it does not already exist) _and create an alias function with the provided name_
          ##
          ## @return 1 Pen with the existing name already exists
          ##
          ## #### Aliases
          ##
          ## Regardless of the alias you provide, `shellpen` will create a BASH function with the provided name.
          ##
          ## It is up to you to provide a valid function name! If the function name is invalid, this will fail.
          ##
          ## This also allows you to accidentally create pens with names which override built-in BASH functions
          ## such as 'unset' or 'declare' which will essentially completely blow up the world 💥
          
          local __shellpen__pens_new_penName=''
          local __shellpen__pens_new_sourceName=''
          local __shellpen__pens_new_createAlias=true
          local __shellpen__pens_new_aliasName=''
          
          if [ $# -eq 1 ]
          then
            __shellpen__pens_new_penName="$1"
          elif [ $# -eq 2 ] && [ "$2" = '-' ]
          then
            __shellpen__pens_new_penName="$1"
            __shellpen__pens_new_createalias=false
          elif [ $# -eq 2 ]
          then
            __shellpen__pens_new_penName="$1"
            __shellpen__pens_new_sourceName="$2"
          elif [ $# -eq 3 ] && [ "$2" = '-' ]
          then
            __shellpen__pens_new_penName="$1"
            __shellpen__pens_new_aliasName="$3"
          elif [ $# -eq 3 ] && [ "$3" = '-' ]
          then
            __shellpen__pens_new_penName="$1"
            __shellpen__pens_new_sourceName="$2"
            __shellpen__pens_new_createalias=false
          elif [ $# -eq 4 ] && [ "$3" = '-' ]
          then
            __shellpen__pens_new_penName="$1"
            __shellpen__pens_new_sourceName="$2"
            __shellpen__pens_new_aliasName="$4"
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
          
          if shellpen pens exists "$__shellpen__pens_new_penName"
          then
            shellpen -- errors argumentError '%s\n%s' "Pen '$__shellpen__pens_new_penName' already exists" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
          
          # DO NOT ADD EXTRA DEFAULTS - BAIL
          if [ "$__shellpen__pens_new_penName" = default ]
          then
            shellpen -- errors argumentError '%s\n%s' "Pen 'default' already exists" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
          
          if [ -n "$__shellpen__pens_new_sourceName" ] && ! shellpen sources exists "$__shellpen__pens_new_sourceName"
          then
            shellpen sources new "$__shellpen__pens_new_sourceName"
          fi
          
          [ -z "$__shellpen__pens_new_sourceName" ] && shellpen sources current __shellpen__pens_new_sourceName
          
          if [ "$__shellpen__pens_new_createAlias" = true ]
          then
            [ -z "$__shellpen__pens_new_aliasName" ] && __shellpen__pens_new_aliasName="$__shellpen__pens_new_penName"
            local __shellpen__pens_new_aliasFunctionCode="
          $__shellpen__pens_new_aliasName() {
            # Get the source name for this pen
            local __shellpen__penAlias_sourceName=''
            shellpen pens getSource \"$__shellpen__pens_new_penName\" - __shellpen__penAlias_sourceName
          
            # Call an 'append' shellpen DSL function
            # Sets the SHELLPEN_SOURCE environment variable which 'append' functions respect
            # to the *current* source for this pen (allowing the source to be changed later)
            # Also provides the pen name for debugging.
            SHELLPEN_SOURCE=\"\$__shellpen__penAlias_sourceName\" SHELLPEN_PEN=\"$__shellpen__pens_new_penName\" shellpen append \"\$@\"
          }
          "
            # Try it in a subshell first
            local __shellpen__pens_new_aliasFunctionEvalOutput=''
            __shellpen__pens_new_aliasFunctionEvalOutput="$( eval "$__shellpen__pens_new_aliasFunctionCode" 2>&1 )"
            if [ $? -ne 0 ]
            then
              shellpen -- errors argumentError '%s\n%s\n%s' "Alias name '$__shellpen__pens_new_aliasName' is not valid, please choose something that works as as valid BASH function name. Pen creation failed." "Command: shellpen ${__shellpen__originalCliCommands[*]}" "Function creation error: '$__shellpen__pens_new_aliasFunctionEvalOutput'"
              return 2
            else
              eval "$__shellpen__pens_new_aliasFunctionCode"
            fi
          fi
          
          
          _SHELLPEN_PENS+=("$__shellpen__pens_new_penName")
          _SHELLPEN_PEN_SOURCES+=("$__shellpen__pens_new_sourceName")
        ## @
  
            ;;
        "putAway")
        ## @command shellpen pens putAway
          ## > Put away this pen (delete it) and optionally the source too (if `withSource` provided)
          ##
          ## ### Valid signatures:
          ##
          ## || Argument List | Description
          ## -|-
          ## `1` | `[pen]` | Name of the pen to put away (or default)
          ## `2` | `withSource` | Optional
          ##
          ## @return 1 If the provided pen name does not exist
          ## @return 2 If the provided source name does not exist
          ##
          
          local __shellpen__pens_putAway_penName=default
          local __shellpen__pens_putAway_withSource=false
          if [ "$1" = "withSource" ]
          then
            __shellpen__pens_putAway_withSource=true
            shift
          elif [ "$2" = "withSource" ]
          then
            __shellpen__pens_putAway_penName="$1"
            __shellpen__pens_putAway_withSource=true
          elif [ $# -eq 1 ]
          then
            __shellpen__pens_putAway_penName="$1"
          fi
          
          local __shellpen__pens_putAway_penIndex=''
          if ! shellpen -- getPenIndex "$__shellpen__pens_putAway_penName" - __shellpen__pens_putAway_penIndex
          then
            shellpen -- errors argumentError '%s\n%s' "Pen not found: '$__shellpen__pens_putAway_penName'" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          else
            if [ "$__shellpen__pens_putAway_withSource" = true ]
            then
              local __shellpen__pens_putAway_sourceName=''
              shellpen pens getSource "$__shellpen__pens_putAway_penName" - __shellpen__pens_putAway_sourceName
              shellpen sources putAway "$__shellpen__pens_putAway_sourceName" || return %?
            fi
            unset "_SHELLPEN_PENS[$__shellpen__pens_putAway_penIndex]"
            unset "_SHELLPEN_PEN_SOURCES[$__shellpen__pens_putAway_penIndex]"
            if [ "$_SHELLPEN_CURRENT_PEN_NAME" = "$__shellpen__pens_putAway_penName" ]
            then
              _SHELLPEN_CURRENT_PEN_NAME=default
              _SHELLPEN_CURRENT_PEN_INDEX=0
            fi
            _SHELLPEN_PENS=("${_SHELLPEN_PENS[@]}")
            _SHELLPEN_PEN_SOURCES=("${_SHELLPEN_PEN_SOURECS[@]}")
          fi
        ## @
  
            ;;
        "switchSource")
        ## @command shellpen pens switchSource
          ## > Switch the current or provided pen to use a different, provided source
          ##
          ## ### Valid signatures:
          ##
          ## || Argument List | Description
          ## -|-
          ## `1` | `[source]` | Set the default pen's source to use the provided source
          ## `2` | `[pen] [source]` | Set the provided pen to use the provided source
          ##
          ## @return 1 If the provided pen name does not exist
          ## @return 2 If the provided source name does not exist
          ##
          
          if [ $# -eq 1 ]
          then
            # "default" should be '0' but it could be deleted (once we provide that functionality)
            local __shellpen__pens_switchSource_penIndex=''
            if ! shellpen -- getPenIndex "default" - __shellpen__pens_switchSource_penIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Pen not found: 'default'" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              if shellpen sources exists "$1"
              then
                _SHELLPEN_PEN_SOURCES["$__shellpen__pens_switchSource_penIndex"]="$1"
              else
                shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
                return 2
              fi
            fi
          elif [ $# -eq 2 ]
          then
            local __shellpen__pens_switchSource_penIndex=''
            if ! shellpen -- getPenIndex "$1" - __shellpen__pens_switchSource_penIndex
            then
              shellpen -- errors argumentError '%s\n%s' "Pen not found: '$1'" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            else
              if shellpen sources exists "$2"
              then
                _SHELLPEN_PEN_SOURCES["$__shellpen__pens_switchSource_penIndex"]="$2"
              else
                shellpen -- errors argumentError '%s\n%s' "Source '$2' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
                return 2
              fi
            fi
          fi
        ## @
  
            ;;
        *)
          echo "Unknown 'shellpen pens' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac
    ## @

        ;;
    "pen")
    ## @command shellpen pen
      shellpen pens new "$@"
    ## @

        ;;
    "preview")
    ## @command shellpen preview
      shellpen result "$@"
    ## @

        ;;
    "result")
    ## @command shellpen result
      shellpen -- blocks closeAll
      
      if [ "$1" = "-n" ]
      then
        echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" | cat -n
      else
        echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
      fi
    ## @

        ;;
    "-")
    ## @command shellpen -
      shellpen pen -
    ## @

        ;;
    "_")
    ## @command shellpen _
      shellpen pen _
    ## @

        ;;
    "sources")
    ## @command shellpen sources
    ## > Something about sources
    ##
    ## And more here too
      local __shellpen__mainCliCommandDepth="2"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command2="$1"
      shift
      case "$__shellpen__mainCliCommands_command2" in
        "current")
        ## @command shellpen sources current
          if [ -n "$1" ]
          then
            printf -v "$1" '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
          else
            printf '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
          fi
        ## @
  
            ;;
        "exists")
        ## @command shellpen sources exists
          shellpen -- getSourceIndex "$@" >/dev/null
        ## @
  
            ;;
        "getFilePath")
        ## @command shellpen sources getFilePath
          ## > Print or get the file path of the current or provided source
          ##
          ## ### Valid signatures:
          ##
          ## || Argument List | Description
          ## -|-
          ## `0` || Print the file path of the current source
          ## `1` | `[name]` | Print the file path of the provided source
          ## `2` | `[-] [varName]` | Get the file path of the current source
          ## `3` | `[name] [-] [varName]` | Get the file path of the provided source
          ##
          ## @return 1 If source provided but source does not exist (fails silently)
          ## @return 2 If source does not have a file path configured (fails silently)
          
          local __shellpen__sources_getFilePath_sourceIndex=''
          
          if [ $# -eq 0 ]
          then
            shellpen -- getSourceIndex - __shellpen__sources_getFilePath_sourceIndex
            local __shellpen__sources_getFilePath_sourceFilePath="${_SHELLPEN_SOURCES_FILE_PATHS["$__shellpen__sources_getFilePath_sourceIndex"]}"
            [ -z "$__shellpen__sources_getFilePath_sourceFilePath" ] && return 2
            printf '%s' "$__shellpen__sources_getFilePath_sourceFilePath"
          elif [ $# -eq 1 ]
          then
            shellpen -- getSourceIndex "$1" - __shellpen__sources_getFilePath_sourceIndex || return 1
            local __shellpen__sources_getFilePath_sourceFilePath="${_SHELLPEN_SOURCES_FILE_PATHS["$__shellpen__sources_getFilePath_sourceIndex"]}"
            [ -z "$__shellpen__sources_getFilePath_sourceFilePath" ] && return 2
            printf '%s' "$__shellpen__sources_getFilePath_sourceFilePath"
          elif [ $# -eq 2 ]
          then
            if [ "$1" = '-' ]
            then
              shellpen -- getSourceIndex - __shellpen__sources_getFilePath_sourceIndex
              local __shellpen__sources_getFilePath_sourceFilePath="${_SHELLPEN_SOURCES_FILE_PATHS["$__shellpen__sources_getFilePath_sourceIndex"]}"
              [ -z "$__shellpen__sources_getFilePath_sourceFilePath" ] && return 2
              printf -v "$2" '%s' "$__shellpen__sources_getFilePath_sourceFilePath"
            else
              shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
        ## @
  
            ;;
        "hasFilePath")
        ## @command shellpen sources hasFilePath
          shellpen sources getFilePath "$@" >/dev/null
        ## @
  
            ;;
        "list")
        ## @command shellpen sources list
          local __shellpen__sources_list_sourceName=''
          [ $# -eq 2 ] && [ "$1" = "-" ] && eval "$2=()"
          for __shellpen__sources_list_sourceName in "${_SHELLPEN_SOURCES[@]}"
          do
            if [ $# -eq 2 ] && [ "$1" = "-" ]
            then
              eval "$2+=(\"\$__shellpen__sources_list_sourceName\")"
            else
              echo "$__shellpen__sources_list_sourceName"
            fi
          done
        ## @
  
            ;;
        "new")
        ## @command shellpen sources new
          ## $ sources new
          ##
          ## $1 Optional source name (else randomly generated)
          ## $2 Optional path to file for this source to represent
          ## $@ If `-` provided, following array argument will be cleared and appended with source names.
          ##
          ## ### Valid signatures:
          ##
          ## - [1] name
          ## - [2] name -
          ## - [2] name filePath
          ## - [2] - varName
          ## - [3] name filePath -
          ## - [3] name - varName
          ## - [4] name filePath - varName
          
          local __shellpen__sources_new_newSourceName=''
          local __shellpen__sources_new_sourceFilePath=''
          local __shellpen__sources_new_shouldOutputName=false
          local __shellpen__sources_new_outputVariableName=''
          
          if [ $# -eq 1 ]
          then
            __shellpen__sources_new_newSourceName="$1"
          elif [ $# -eq 2 ]
          then
            if [ "$1" = '-' ]
            then
              __shellpen__sources_new_shouldOutputName=true
              __shellpen__sources_new_outputVariableName="$2"
            elif [ "$2" = '-' ]
            then
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_outputVariableName="$1"
              __shellpen__sources_new_shouldOutputName=true
            else
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_sourceFilePath="$2"
            fi
          elif [ $# -eq 3 ]
          then
            if [ "$2" = '-' ]
            then
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_shouldOutputName=true
              __shellpen__sources_new_outputVariableName="$2"
            elif [ "$3" = '-' ]
            then
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_sourceFilePath="$2"
              __shellpen__sources_new_shouldOutputName=true
              __shellpen__sources_new_outputVariableName="$1"
            else
              shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
          elif [ $# -eq 4 ]
          then
            if [ "$3" = '-' ]
            then
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_sourceFilePath="$2"
              __shellpen__sources_new_shouldOutputName=true
              __shellpen__sources_new_outputVariableName="$4"
            else
              shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
          
          # if output variable, verify that it's a valid looking variable name, yo
          
          if shellpen sources exists "$__shellpen__sources_new_newSourceName"
          then
            shellpen -- errors argumentError '%s\n%s' "Source '$__shellpen__sources_new_newSourceName' already exists" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
          
          [ -z "$__shellpen__sources_new_newSourceName" ] && __shellpen__sources_new_newSourceName="$( cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 )"
          
          if [ "$__shellpen__sources_new_shouldOutputName" = true ]
          then
            printf -v "$__shellpen__sources_new_outputVariableName" '%s' "$__shellpen__sources_new_newSourceName" 
          fi
          
          _SHELLPEN_SOURCES+=("$__shellpen__sources_new_newSourceName")
          _SHELLPEN_SOURCES_FILE_PATHS+=("$__shellpen__sources_new_sourceFilePath")
          _SHELLPEN_SOURCECODE+=("")
          _SHELLPEN_INDENT_LEVELS+=(0)
          _SHELLPEN_OPTION_OPEN+=("")
          _SHELLPEN_FUNCTION_OPEN+=("")
          _SHELLPEN_CASE_OPEN+=("")
          _SHELLPEN_MAIN_FUNCTION+=("")
        ## @
  
            ;;
        "putAway")
        ## @command shellpen sources putAway
          if [ $# -eq 1 ]
          then
            local __shellpen__sources_putAway_sourceIndex=''
            if shellpen -- getSourceIndex "$1" - __shellpen__sources_putAway_sourceIndex
            then
          
              unset "_SHELLPEN_SOURCES[$__shellpen__sources_putAway_sourceIndex]"
              unset "_SHELLPEN_SOURCECODE[$__shellpen__sources_putAway_sourceIndex]"
              unset "_SHELLPEN_SOURCES_FILE_PATHS[$__shellpen__sources_putAway_sourceIndex]"
              unset "_SHELLPEN_INDENT_LEVELS[$__shellpen__sources_putAway_sourceIndex]"
              unset "_SHELLPEN_FUNCTION_OPEN[$__shellpen__sources_putAway_sourceIndex]"
              unset "_SHELLPEN_CASE_OPEN[$__shellpen__sources_putAway_sourceIndex]"
              unset "_SHELLPEN_MAIN_FUNCTION[$__shellpen__sources_putAway_sourceIndex]"
          
              _SHELLPEN_SOURCES=("${_SHELLPEN_SOURCES[@]}")
              _SHELLPEN_SOURCECODE=("${_SHELLPEN_SOURCECODE[@]}")
              _SHELLPEN_SOURCES_FILE_PATHS=("${_SHELLPEN_SOURCES_FILE_PATHS[@]}")
              _SHELLPEN_INDENT_LEVELS=("${_SHELLPEN_INDENT_LEVELS[@]}")
              _SHELLPEN_FUNCTION_OPEN=("${_SHELLPEN_FUNCTION_OPEN[@]}")
              _SHELLPEN_CASE_OPEN=("${_SHELLPEN_CASE_OPEN[@]}")
              _SHELLPEN_MAIN_FUNCTION=("${_SHELLPEN_MAIN_FUNCTION[@]}")
          
              if [ "$_SHELLPEN_CURRENT_SOURCE_INDEX" = "$__shellpen__sources_putAway_sourceIndex" ]
              then
                _SHELLPEN_CURRENT_SOURCE_INDEX=0
                _SHELLPEN_CURRENT_SOURCE_NAME="default"
              fi
          
            else
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
        ## @
  
            ;;
        "use")
        ## @command shellpen sources use
          if [ $# -eq 1 ]
          then
            local __shellpen__sources_use_sourceIndex=''
            if shellpen -- getSourceIndex "$1" - __shellpen__sources_use_sourceIndex
            then
              _SHELLPEN_CURRENT_SOURCE_INDEX="$__shellpen__sources_use_sourceIndex"
            else
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
        ## @
  
            ;;
        *)
          echo "Unknown 'shellpen sources' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac
    ## @

        ;;
    "source")
    ## @command shellpen source
      shellpen sources new "$@"
    ## @

        ;;
    *)
      echo "Unknown 'shellpen' command: $__shellpen__mainCliCommands_command1" >&2
      ;;
  esac

}

[ "${BASH_SOURCE[0]}" = "$0" ] && "shellpen" "$@"

