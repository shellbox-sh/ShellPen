---
---

{% raw %}










<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen() {
  declare -a __shellpen__mainCliCommands=("shellpen")
  declare -a __shellpen__originalCliCommands=("$@")

  local __shellpen__mainCliCommandDepth="1"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command1="$1"
  shift
  case "$__shellpen__mainCliCommands_command1" in
{% endhighlight %}
{% raw %}

</details>








    
    
    
    
    

## [`shellpen write`](#shellpen-write-1)

                      
        
        
        
        

- [`shellpen write write`](#shellpen-write-write)
          
        
        
        
        

- [`shellpen write writeln`](#shellpen-write-writeln)
          
        
        
        
        

- [`shellpen write main`](#shellpen-write-main)
          
        
        
        
        

- [`shellpen write comment`](#shellpen-write-comment)
          
        
        
        
        

- [`shellpen write }`](#shellpen-write-}--1)
          
        
        
        
        

- [`shellpen write function`](#shellpen-write-function)
          
        
        
        
        

- [`shellpen write indent--`](#shellpen-write-indent--)
          
        
        
        
        

- [`shellpen write shebang`](#shellpen-write-shebang)
          
        
        
        
        

- [`shellpen write return`](#shellpen-write-return)
          
        
        
        
        

- [`shellpen write fi`](#shellpen-write-fi)
          
        
        
        
        

- [`shellpen write option`](#shellpen-write-option)
          
        
        
        
        

- [`shellpen write if`](#shellpen-write-if)
          
        
        
        
        

- [`shellpen write shift`](#shellpen-write-shift)
          
        
        
        
        

- [`shellpen write indentation`](#shellpen-write-indentation)
          
        
        
        
        

- [`shellpen write fn`](#shellpen-write-fn)
          
        
        
        
        

- [`shellpen write local`](#shellpen-write-local)
          
        
        
        
        

- [`shellpen write case`](#shellpen-write-case)
          
        
        
        
        

- [`shellpen write save`](#shellpen-write-save)
          
        
        
        
        

- [`shellpen write indent++`](#shellpen-write-indent++)
          
        
        
        
        

- [`shellpen write code`](#shellpen-write-code)
          
        
        
        
        

- [`shellpen write esac`](#shellpen-write-esac)
          
        
        
        
        

- [`shellpen write echo`](#shellpen-write-echo)
          
        
        
        
        

- [`shellpen write else`](#shellpen-write-else)
          
        
        
        
        

- [`shellpen write error`](#shellpen-write-error)
      
    
    
    
    
    

## [`shellpen preview`](#shellpen-preview-1)

                  
    
    
    
    
    

## [`shellpen sources`](#shellpen-sources-1)

                      
        
        
        
        

- [`shellpen sources use`](#shellpen-sources-use)
          
        
        
        
        

- [`shellpen sources getFilePath`](#shellpen-sources-getfilepath)
          
        
        
        
        

- [`shellpen sources current`](#shellpen-sources-current)
          
        
        
        
        

- [`shellpen sources new`](#shellpen-sources-new)
          
        
        
        
        

- [`shellpen sources list`](#shellpen-sources-list)
          
        
        
        
        

- [`shellpen sources exists`](#shellpen-sources-exists)
          
        
        
        
        

- [`shellpen sources getSource`](#shellpen-sources-getsource)
          
        
        
        
        

- [`shellpen sources hasFilePath`](#shellpen-sources-hasfilepath)
      
    
    
    
    
    

## [`shellpen :`](#shellpen--2)

                  
    
    
    
    
    

## [`shellpen -`](#shellpen---1)

                  
    
    
    
    
    

## [`shellpen result`](#shellpen-result-1)

                  
    
    
    
    
    

## [`shellpen --`](#shellpen----1)

                      
        
        
        
        

- [`shellpen -- dump`](#shellpen----dump)
          
        
        
        
        

- [`shellpen -- alias`](#shellpen----alias)
          
        
        
        
        

- [`shellpen -- errors`](#shellpen----errors)
          
        
        
        
        

- [`shellpen -- writeMain`](#shellpen----writemain)
          
        
        
        
        

- [`shellpen -- blocks`](#shellpen----blocks)
          
        
        
        
        

- [`shellpen -- writeShebang`](#shellpen----writeshebang)
      
    
    
    
    
    

## [`shellpen pens`](#shellpen-pens-1)

                  
    
    
    
    
    

## [`shellpen _`](#shellpen-_-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen write`](/api/shellpen/write)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"write")
  local __shellpen__mainCliCommandDepth="2"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command2="$1"
  shift
  case "$__shellpen__mainCliCommands_command2" in
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen write write`](/api/shellpen/write/write)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"write")
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write writeln`](/api/shellpen/write/writeln)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"writeln")
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*\n"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write main`](/api/shellpen/write/main)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"main")
  _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write comment`](/api/shellpen/write/comment)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"comment")

shellpen writeln "# $*"
{% endhighlight %}
{% raw %}

</details>



| | Description |
|-|-------------|
| `$1` | foo |
| `$@` | stuff |




Some stuff about the comment

Here come some params:


Hello


    
    

        
                
        
        
        

## [`shellpen write }`](/api/shellpen/write/})



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"}")
  shellpen indent--
  shellpen writeln "}"
  _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write function`](/api/shellpen/write/function)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"function")
  shellpen writeln
  shellpen writeln "${1%()}() {"
  shellpen indent++
  shellpen -- blocks functions open
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write indent--`](/api/shellpen/write/indent--)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"indent--")
  _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write shebang`](/api/shellpen/write/shebang)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"shebang")
  _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$*"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write return`](/api/shellpen/write/return)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"return")
  if [ $# -eq 1 ]
  then
    shellpen writeln "return $1"
  else
    shellpen writeln "return 1"
  fi
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write fi`](/api/shellpen/write/fi)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"fi")
  shellpen indent--
  shellpen writeln "fi"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write option`](/api/shellpen/write/option)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"option")
  shellpen -- blocks options close
  shellpen writeln "$1)"
  shellpen -- blocks options open
  shellpen indent++
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write if`](/api/shellpen/write/if)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"if")
  shellpen writeln "if $*"
  shellpen writeln "then"
  shellpen indent++
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write shift`](/api/shellpen/write/shift)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"shift")
  shellpen writeln shift
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write indentation`](/api/shellpen/write/indentation)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"indentation")
  local __shellpen__indentation=""
  local __shellpen__indentationLevel=0
  while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
  do
    __shellpen__indentation+="$SHELLPEN_INDENT"
    : "$(( __shellpen__indentationLevel++ ))"
  done
  printf "$__shellpen__indentation"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write fn`](/api/shellpen/write/fn)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"fn")
  shellpen function "$@"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write local`](/api/shellpen/write/local)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"local")
  if [ $# -eq 1 ]
  then
    if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
    then
      shellpen writeln "local ${1%%=*}=\"${1#*=}\""
    else
      shellpen writeln "local $*"
    fi
  elif [ $# -eq 2 ]
  then
    shellpen writeln "local $1=\"$2\""
  fi
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write case`](/api/shellpen/write/case)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"case")
  shellpen writeln "case \"$1\" in"
  shellpen indent++
  shellpen -- blocks cases open
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write save`](/api/shellpen/write/save)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"save")
  shellpen result > "$1"
  chmod +x "$1"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write indent++`](/api/shellpen/write/indent++)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"indent++")
  _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} + 1 ))"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write code`](/api/shellpen/write/code)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"code")
  shellpen result "$@"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write esac`](/api/shellpen/write/esac)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"esac")
  shellpen -- blocks options close
  _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
  # Close existing option, if open
  shellpen indent--
  shellpen writeln "esac"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write echo`](/api/shellpen/write/echo)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"echo")
  shellpen writeln "echo \"$*\""
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write else`](/api/shellpen/write/else)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"else")
  shellpen indent--
  shellpen writeln "else"
  shellpen indent++
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen write error`](/api/shellpen/write/error)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"error")
  if [ $# -eq 1 ]
  then
    shellpen writeln echo \"$*\" '>&2'
    shellpen return 1
  else
    shellpen writeln printf $@ '>&2'
    shellpen return 1
  fi
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
  
    

    
    

# [`shellpen preview`](/api/shellpen/preview)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"preview")
  shellpen result "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen sources`](/api/shellpen/sources)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"sources")
  local __shellpen__mainCliCommandDepth="2"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command2="$1"
  shift
  case "$__shellpen__mainCliCommands_command2" in
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen sources use`](/api/shellpen/sources/use)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"use")
  if [ $# -eq 1 ]
  then
    local __shellpen__sources_use_sourceIndex=''
    if shellpen sources exists "$1" __shellpen__sources_use_sourceIndex
    then
      _SHELLPEN_CURRENT_SOURCE_INDEX="$__shellpen__sources_use_sourceIndex"
    else
      shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: ${__shellpen__originalCliCommands[*]}"
      return 1
    fi
  else
    shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__shellpen__originalCliCommands[*]}"
    return 1
  fi
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources getFilePath`](/api/shellpen/sources/getFilePath)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"getFilePath")
  
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources current`](/api/shellpen/sources/current)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"current")
  if [ -n "$1" ]
  then
    printf -v "$1" '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  else
    printf '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  fi
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources new`](/api/shellpen/sources/new)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"new")
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources list`](/api/shellpen/sources/list)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"list")
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
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources exists`](/api/shellpen/sources/exists)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"exists")
  local __shellpen__sources_exists_sourceIndex=''
  for __shellpen__sources_exists_sourceIndex in "${!_SHELLPEN_SOURCES[@]}"
  do
    if [ "$1" = "${_SHELLPEN_SOURCES[$__shellpen__sources_exists_sourceIndex]}" ]
    then
      if [ $# -eq 2 ]
      then
        printf -v "$2" "$__shellpen__sources_exists_sourceIndex" 
      fi
      return 0
    fi
  done
  return 1
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources getSource`](/api/shellpen/sources/getSource)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"getSource")
  
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources hasFilePath`](/api/shellpen/sources/hasFilePath)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"hasFilePath")
  
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
  
    

    
    

# [`shellpen :`](/api/shellpen/colon)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
":")
  shellpen -- alias :
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen -`](/api/shellpen/-)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"-")
  shellpen -- alias -
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen result`](/api/shellpen/result)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"result")
  shellpen -- blocks closeAll
  shellpen -- writeMain
  shellpen -- writeShebang
  
  if [ "$1" = "-n" ]
  then
    echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" | cat -n
  else
    echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  fi
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen --`](/api/shellpen/--)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"--")
  local __shellpen__mainCliCommandDepth="2"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command2="$1"
  shift
  case "$__shellpen__mainCliCommands_command2" in
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen -- dump`](/api/shellpen/--/dump)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"dump")
  ( set -o posix; set ) | grep SHELLPEN
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- alias`](/api/shellpen/--/alias)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"alias")
  shopt -s expand_aliases
  alias "$1"=shellpen
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- errors`](/api/shellpen/--/errors)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"errors")
    local __shellpen__mainCliCommandDepth="3"
    __shellpen__mainCliCommands+=("$1")
    local __shellpen__mainCliCommands_command3="$1"
    shift
    case "$__shellpen__mainCliCommands_command3" in
{% endhighlight %}
{% raw %}

</details>







    
    

                              
        

- [`shellpen -- errors argumentError`](/api/shellpen/--/errors/argumentError)
                          
        

- [`shellpen -- errors printStackTrace`](/api/shellpen/--/errors/printStackTrace)
                          
        

- [`shellpen -- errors getFileLine`](/api/shellpen/--/errors/getFileLine)
    
                
        
        
        

## [`shellpen -- writeMain`](/api/shellpen/--/writeMain)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"writeMain")
  if [ -n "${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
  then
    shellpen writeln
    shellpen writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\" \"\$@\""
  fi
  _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- blocks`](/api/shellpen/--/blocks)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"blocks")
    local __shellpen__mainCliCommandDepth="3"
    __shellpen__mainCliCommands+=("$1")
    local __shellpen__mainCliCommands_command3="$1"
    shift
    case "$__shellpen__mainCliCommands_command3" in
{% endhighlight %}
{% raw %}

</details>







    
    

                              
        

- [`shellpen -- blocks functions`](/api/shellpen/--/blocks/functions)
                          
        

- [`shellpen -- blocks closeAll`](/api/shellpen/--/blocks/closeAll)
                          
        

- [`shellpen -- blocks options`](/api/shellpen/--/blocks/options)
                          
        

- [`shellpen -- blocks cases`](/api/shellpen/--/blocks/cases)
    
                
        
        
        

## [`shellpen -- writeShebang`](/api/shellpen/--/writeShebang)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"writeShebang")
  
  if [ -n "${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
  then
    _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]="${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\n${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  fi
  _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
  
    

    
    

# [`shellpen pens`](/api/shellpen/pens)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"pens")
  local __shellpen__mainCliCommandDepth="2"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command2="$1"
  shift
  case "$__shellpen__mainCliCommands_command2" in
    *)
      echo "Unknown 'shellpen pens' command: $__shellpen__mainCliCommands_command2" >&2
      return 1
      ;;
  esac
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen _`](/api/shellpen/_)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"_")
  shellpen -- alias _
{% endhighlight %}
{% raw %}

</details>







                    
      
{% endraw %}
