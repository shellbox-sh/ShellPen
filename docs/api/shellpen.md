---
title: "shellpen - 🖋️ Shell Pen API"
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

> 🖋️ Generate Shell Script Source Code using a familiar DSL!

  local __shellpen__mainCliCommandDepth="1"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command1="$1"
  shift
  case "$__shellpen__mainCliCommands_command1" in
    "--")
{% endhighlight %}
{% raw %}

</details>










    
    
    
    
    

## [`shellpen preview`](#shellpen-preview-1)

                  
    
    
    
    
    

## [`shellpen pen`](#shellpen-pen-1)

                  
    
    
    
    
    

## [`shellpen source`](#shellpen-source-1)

                  
    
    
    
    
    

## [`shellpen sources`](#shellpen-sources-1)

                      
        
        
        
        

- [`shellpen sources use`](#shellpen-sources-use)
          
        
        
        
        

- [`shellpen sources getFilePath`](#shellpen-sources-getfilepath)
          
        
        
        
        

- [`shellpen sources current`](#shellpen-sources-current)
          
        
        
        
        

- [`shellpen sources new`](#shellpen-sources-new)
          
        
        
        
        

- [`shellpen sources list`](#shellpen-sources-list)
          
        
        
        
        

- [`shellpen sources exists`](#shellpen-sources-exists)
          
        
        
        
        

- [`shellpen sources hasFilePath`](#shellpen-sources-hasfilepath)
      
    
    
    
    
    

## [`shellpen indentation`](#shellpen-indentation-1)

                  
    
    
    
    
    

## [`shellpen :`](#shellpen--1)

                  
    
    
    
    
    

## [`shellpen -`](#shellpen---1)

                  
    
    
    
    
    

## [`shellpen result`](#shellpen-result-1)

                  
    
    
    
    
    

## [`shellpen append`](#shellpen-append-1)

                      
        
        
        
        

- [`shellpen append write`](#shellpen-append-write)
          
        
        
        
        

- [`shellpen append writeln`](#shellpen-append-writeln)
          
        
        
        
        

- [`shellpen append main`](#shellpen-append-main)
          
        
        
        
        

- [`shellpen append comment`](#shellpen-append-comment)
          
        
        
        
        

- [`shellpen append }`](#shellpen-append-}--2)
          
        
        
        
        

- [`shellpen append function`](#shellpen-append-function)
          
        
        
        
        

- [`shellpen append indent--`](#shellpen-append-indent--)
          
        
        
        
        

- [`shellpen append shebang`](#shellpen-append-shebang)
          
        
        
        
        

- [`shellpen append return`](#shellpen-append-return)
          
        
        
        
        

- [`shellpen append fi`](#shellpen-append-fi)
          
        
        
        
        

- [`shellpen append option`](#shellpen-append-option)
          
        
        
        
        

- [`shellpen append if`](#shellpen-append-if)
          
        
        
        
        

- [`shellpen append shift`](#shellpen-append-shift)
          
        
        
        
        

- [`shellpen append fn`](#shellpen-append-fn)
          
        
        
        
        

- [`shellpen append local`](#shellpen-append-local)
          
        
        
        
        

- [`shellpen append case`](#shellpen-append-case)
          
        
        
        
        

- [`shellpen append save`](#shellpen-append-save)
          
        
        
        
        

- [`shellpen append indent++`](#shellpen-append-indent++)
          
        
        
        
        

- [`shellpen append code`](#shellpen-append-code)
          
        
        
        
        

- [`shellpen append esac`](#shellpen-append-esac)
          
        
        
        
        

- [`shellpen append echo`](#shellpen-append-echo)
          
        
        
        
        

- [`shellpen append switchTo`](#shellpen-append-switchto)
          
        
        
        
        

- [`shellpen append else`](#shellpen-append-else)
          
        
        
        
        

- [`shellpen append error`](#shellpen-append-error)
      
    
    
    
    
    

## [`shellpen --`](#shellpen----1)

                      
        
        
        
        

- [`shellpen -- dump`](#shellpen----dump)
          
        
        
        
        

- [`shellpen -- errors`](#shellpen----errors)
          
        
        
        
        

- [`shellpen -- writeMain`](#shellpen----writemain)
          
        
        
        
        

- [`shellpen -- getSourceIndex`](#shellpen----getsourceindex)
          
        
        
        
        

- [`shellpen -- getPenIndex`](#shellpen----getpenindex)
          
        
        
        
        

- [`shellpen -- blocks`](#shellpen----blocks)
          
        
        
        
        

- [`shellpen -- writeShebang`](#shellpen----writeshebang)
      
    
    
    
    
    

## [`shellpen pens`](#shellpen-pens-1)

                      
        
        
        
        

- [`shellpen pens new`](#shellpen-pens-new)
          
        
        
        
        

- [`shellpen pens list`](#shellpen-pens-list)
          
        
        
        
        

- [`shellpen pens exists`](#shellpen-pens-exists)
          
        
        
        
        

- [`shellpen pens getSource`](#shellpen-pens-getsource)
          
        
        
        
        

- [`shellpen pens switchSource`](#shellpen-pens-switchsource)
      
    
    
    
    
    

## [`shellpen _`](#shellpen-_-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen preview`](/api/shellpen/preview)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen result "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen pen`](/api/shellpen/pen)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen pens new "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen source`](/api/shellpen/source)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen sources new "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen sources`](/api/shellpen/sources)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="2"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command2="$1"
shift
case "$__shellpen__mainCliCommands_command2" in
  "current")
{% endhighlight %}
{% raw %}

</details>





> Something about sources

And more here too


                      
        
        
        

## [`shellpen sources use`](/api/shellpen/sources/use)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources getFilePath`](/api/shellpen/sources/getFilePath)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

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
{% endhighlight %}
{% raw %}

</details>





> Print or get the file path of the current or provided source

### Valid signatures:

|| Argument List | Description
-|-
`0` || Print the file path of the current source
`1` | `[name]` | Print the file path of the provided source
`2` | `[-] [varName]` | Get the file path of the current source
`3` | `[name] [-] [varName]` | Get the file path of the provided source


    
    

        
                
        
        
        

## [`shellpen sources current`](/api/shellpen/sources/current)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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








    
    

        
                
        
        
        

## [`shellpen sources list`](/api/shellpen/sources/list)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
shellpen -- getSourceIndex "$@" >/dev/null
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources hasFilePath`](/api/shellpen/sources/hasFilePath)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen sources getFilePath "$@" >/dev/null
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
  
    

    
    

# [`shellpen indentation`](/api/shellpen/indentation)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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







                    
  
    

    
    

# [`shellpen :`](/api/shellpen/colon)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen pen :
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen -`](/api/shellpen/-)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen pen -
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen result`](/api/shellpen/result)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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







                    
  
    

    
    

# [`shellpen append`](/api/shellpen/append)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="2"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command2="$1"
shift
case "$__shellpen__mainCliCommands_command2" in
  "case")
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen append write`](/api/shellpen/append/write)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append writeln`](/api/shellpen/append/writeln)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__append_writeln_newLine=$'\n'
if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_writeln_sourceIndex=''
  if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_writeln_sourceIndex
  then
    shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
    return 1
  else
    _SHELLPEN_SOURCECODE[$__shellpen__append_writeln_sourceIndex]+="$( shellpen indentation )$*${__shellpen__append_writeln_newLine}"
  fi
else
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*${__shellpen__append_writeln_newLine}"
fi
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append main`](/api/shellpen/append/main)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append comment`](/api/shellpen/append/comment)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

shellpen append writeln "# $*"
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


    
    

        
                
        
        
        

## [`shellpen append }`](/api/shellpen/append/})



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen indent--
shellpen append writeln "}"
_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append function`](/api/shellpen/append/function)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln
shellpen append writeln "${1%()}() {"
shellpen indent++
shellpen -- blocks functions open
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append indent--`](/api/shellpen/append/indent--)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append shebang`](/api/shellpen/append/shebang)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$*"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append return`](/api/shellpen/append/return)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ $# -eq 1 ]
then
  shellpen append writeln "return $1"
else
  shellpen append writeln "return 1"
fi
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append fi`](/api/shellpen/append/fi)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen indent--
shellpen append writeln "fi"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append option`](/api/shellpen/append/option)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen -- blocks options close
shellpen append writeln "$1)"
shellpen -- blocks options open
shellpen indent++
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append if`](/api/shellpen/append/if)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln "if $*"
shellpen append writeln "then"
shellpen indent++
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append shift`](/api/shellpen/append/shift)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln shift
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append fn`](/api/shellpen/append/fn)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen function "$@"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append local`](/api/shellpen/append/local)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append case`](/api/shellpen/append/case)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln "case \"$1\" in"
shellpen indent++
shellpen -- blocks cases open
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append save`](/api/shellpen/append/save)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen result > "$1"
chmod +x "$1"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append indent++`](/api/shellpen/append/indent++)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} + 1 ))"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append code`](/api/shellpen/append/code)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen result "$@"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append esac`](/api/shellpen/append/esac)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen -- blocks options close
_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
# Close existing option, if open
shellpen indent--
shellpen append writeln "esac"
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append echo`](/api/shellpen/append/echo)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln "echo \"$*\""
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append switchTo`](/api/shellpen/append/switchTo)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

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
{% endhighlight %}
{% raw %}

</details>





> Switch pen to write to a different source

$1 Name of the source to switch to


    
    

        
                
        
        
        

## [`shellpen append else`](/api/shellpen/append/else)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen indent--
shellpen append writeln "else"
shellpen indent++
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen append error`](/api/shellpen/append/error)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ $# -eq 1 ]
then
  shellpen append writeln echo \"$*\" '>&2'
  shellpen return 1
else
  shellpen append writeln printf $@ '>&2'
  shellpen return 1
fi
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
  
    

    
    

# [`shellpen --`](/api/shellpen/--)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="2"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command2="$1"
shift
case "$__shellpen__mainCliCommands_command2" in
  "blocks")
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen -- dump`](/api/shellpen/--/dump)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
( set -o posix; set ) | grep SHELLPEN
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- errors`](/api/shellpen/--/errors)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="3"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command3="$1"
shift
case "$__shellpen__mainCliCommands_command3" in
  "argumentError")
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
if [ -n "${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
then
  shellpen append writeln
  shellpen append writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\" \"\$@\""
fi
_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- getSourceIndex`](/api/shellpen/--/getSourceIndex)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>





> Get the internal `shellpen` index of the current or provided source

### Valid signatures:

|| Argument List | Description
-|-
`0` || Print the index of the current source
`1` | `[source]` | Print the index of the provided source
`2` | `[-] [varName]` | Get the index of the current source
`3` | `[source] [-] [varName]` | Get the index of the provided source


    
    

        
                
        
        
        

## [`shellpen -- getPenIndex`](/api/shellpen/--/getPenIndex)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

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
{% endhighlight %}
{% raw %}

</details>





> Get the internal `shellpen` index of the provided pen

### Valid signatures:

|| Argument List | Description
-|-
`1` | `[pen]` | Print the index of the provided pen
`3` | `[pen] [-] [varName]` | Get the index of the provided pen


    
    

        
                
        
        
        

## [`shellpen -- blocks`](/api/shellpen/--/blocks)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="3"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command3="$1"
shift
case "$__shellpen__mainCliCommands_command3" in
  "cases")
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
local __shellpen__mainCliCommandDepth="2"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command2="$1"
shift
case "$__shellpen__mainCliCommands_command2" in
  "exists")
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen pens new`](/api/shellpen/pens/new)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

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
    shellpen result
  fi
fi

_SHELLPEN_PENS+=("$__shellpen__pens_new_penName")
_SHELLPEN_PEN_SOURCES+=("$__shellpen__pens_new_sourceName")
{% endhighlight %}
{% raw %}

</details>





> Create a new pen (optionally associated with a new or existing source)

### Valid signatures:

|| Argument List | Description
-|-
`1` | `[name]` | Create a new pen for the current source with the provided name
`2` | `[name] [source]` | Create a new pen for the provided source (will be created if it does not already exist)
`2` | `[name] [-]` | Create a new pen for the current source _but do not create a writer alias function_
`3` | `[name] [-] [alias]` | Create a new pen for the current source _and create an alias function with the provided name_
`3` | `[name] [source] [-]` | Create a new pen for the provided source (will be created if it does not already exist) _but do not create a writer alias function_
`4` | `[name] [source] [-] [alias]` | Create a new pen for the provided source (will be created if it does not already exist) _and create an alias function with the provided name_


#### Aliases

Regardless of the alias you provide, `shellpen` will create a BASH function with the provided name.

It is up to you to provide a valid function name! If the function name is invalid, this will fail.

This also allows you to accidentally create pens with names which override built-in BASH functions
such as 'unset' or 'declare' which will essentially completely blow up the world 💥


    
    

        
                
        
        
        

## [`shellpen pens list`](/api/shellpen/pens/list)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen pens exists`](/api/shellpen/pens/exists)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen -- getPenIndex "$@" >/dev/null
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen pens getSource`](/api/shellpen/pens/getSource)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

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
{% endhighlight %}
{% raw %}

</details>





> Print or get the source associated with the given pen name

### Valid signatures:

|| Argument List | Description
-|-
`1` | `[name]` | Print the source name associated with the provided pen name
`3` | `[name] [-] [varName]` | Get the source name associated with the provided pen name


    
    

        
                
        
        
        

## [`shellpen pens switchSource`](/api/shellpen/pens/switchSource)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

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
{% endhighlight %}
{% raw %}

</details>





> Switch the current or provided pen to use a different, provided source

### Valid signatures:

|| Argument List | Description
-|-
`1` | `[source]` | Set the default pen's source to use the provided source
`2` | `[pen] [source]` | Set the provided pen to use the provided source


    
    

        
              
  
    

    
    

# [`shellpen _`](/api/shellpen/_)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen pen _
{% endhighlight %}
{% raw %}

</details>







                    
      
{% endraw %}
