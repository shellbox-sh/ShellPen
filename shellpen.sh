#! /usr/bin/env bash

_SHELLPEN_SHEBANG=("#! /usr/bin/env bash")

_SHELLPEN_PENS=("default")
_SHELLPEN_CURRENT_PEN_NAME="default"
_SHELLPEN_CURRENT_PEN_INDEX=0

_SHELLPEN_CURRENT_SOURCE_INDEX=0
_SHELLPEN_CURRENT_SOURCE_NAME="default"
_SHELLPEN_SOURCES=("default")
_SHELLPEN_SOURCECODE=("")
_SHELLPEN_SOURCES_FILE_PATHS=("")
_SHELLPEN_INDENT_LEVELS=(0)
_SHELLPEN_OPTION_OPEN=("")
_SHELLPEN_FUNCTION_OPEN=("")
_SHELLPEN_CASE_OPEN=("")
_SHELLPEN_MAIN_FUNCTION=("")

# Public Variables
[ -z "$SHELLPEN_INDENT" ] && SHELLPEN_INDENT="  "

## @command shellpen
shellpen() {
  declare -a __shellpen__mainCliCommands=("shellpen")
  declare -a __shellpen__originalCliCommands=("$@")

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
                shellpen -- blocks options close
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
                        if [ "${_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
                        then
                          shellpen }
                        fi
                        _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
                      ## @
            
                          ;;
                      "open")
                      ## @command shellpen -- blocks functions open
                        _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
                      ## @
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks functions' command: $__shellpen__mainCliCommands_command4" >&2
                        return 1
                        ;;
                    esac
              ## @
      
                  ;;
              "options")
              ## @command shellpen -- blocks options
                    local __shellpen__mainCliCommandDepth="4"
                    __shellpen__mainCliCommands+=("$1")
                    local __shellpen__mainCliCommands_command4="$1"
                    shift
                    case "$__shellpen__mainCliCommands_command4" in
                      "close")
                      ## @command shellpen -- blocks options close
                        # Close existing option, if open
                        if [ "${_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
                        then
                          shellpen append writeln ";;"
                          shellpen indent--
                        fi
                        _SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
                      ## @
            
                          ;;
                      "open")
                      ## @command shellpen -- blocks options open
                        _SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
                      ## @
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks options' command: $__shellpen__mainCliCommands_command4" >&2
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
                if [ $# -eq 2 ]
                then
                  printf '%s' "$__shellpen__sources_exists_sourceIndex" 
                fi
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
        "case")
        ## @command shellpen append case
          shellpen append writeln "case \"$1\" in"
          shellpen indent++
          shellpen -- blocks cases open
        ## @
  
            ;;
        "code")
        ## @command shellpen append code
          shellpen result "$@"
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
          shellpen indent--
          shellpen append writeln "else"
          shellpen indent++
        ## @
  
            ;;
        "error")
        ## @command shellpen append error
          if [ $# -eq 1 ]
          then
            shellpen append writeln echo \"$*\" '>&2'
            shellpen return 1
          else
            shellpen append writeln printf $@ '>&2'
            shellpen return 1
          fi
        ## @
  
            ;;
        "esac")
        ## @command shellpen append esac
          shellpen -- blocks options close
          _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
          # Close existing option, if open
          shellpen indent--
          shellpen append writeln "esac"
        ## @
  
            ;;
        "fi")
        ## @command shellpen append fi
          shellpen indent--
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
          shellpen indent++
          shellpen -- blocks functions open
        ## @
  
            ;;
        "if")
        ## @command shellpen append if
          shellpen append writeln "if $*"
          shellpen append writeln "then"
          shellpen indent++
        ## @
  
            ;;
        "indentation")
        ## @command shellpen append indentation
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
        "indent++")
        ## @command shellpen append indent++
          _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} + 1 ))"
        ## @
  
            ;;
        "indent--")
        ## @command shellpen append indent--
          _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"
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
          _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"
        ## @
  
            ;;
        "option")
        ## @command shellpen append option
          shellpen -- blocks options close
          shellpen append writeln "$1)"
          shellpen -- blocks options open
          shellpen indent++
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
        "}")
        ## @command shellpen append }
          shellpen indent--
          shellpen append writeln "}"
          _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
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
        "writeln")
        ## @command shellpen append writeln
          _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*\n"
        ## @
  
            ;;
        "write")
        ## @command shellpen append write
          _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*"
        ## @
  
            ;;
        *)
          echo "Unknown 'shellpen append' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac
    ## @

        ;;
    "pens")
    ## @command shellpen pens
      local __shellpen__mainCliCommandDepth="2"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command2="$1"
      shift
      case "$__shellpen__mainCliCommands_command2" in
        "new")
        ## @command shellpen pens new
          
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
      shellpen -- writeMain
      shellpen -- writeShebang
      
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
    ":")
    ## @command shellpen :
      shellpen pen :
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

