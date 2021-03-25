---
title: "shellpen sources"
---

{% raw %}





[🔙 Back to shellpen](/api/shellpen)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen sources



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








    
    
    
    
    

## [`shellpen sources use`](#shellpen-sources-use-1)

                  
    
    
    
    
    

## [`shellpen sources getFilePath`](#shellpen-sources-getfilepath-1)

                  
    
    
    
    
    

## [`shellpen sources current`](#shellpen-sources-current-1)

                  
    
    
    
    
    

## [`shellpen sources new`](#shellpen-sources-new-1)

                  
    
    
    
    
    

## [`shellpen sources list`](#shellpen-sources-list-1)

                  
    
    
    
    
    

## [`shellpen sources exists`](#shellpen-sources-exists-1)

                  
    
    
    
    
    

## [`shellpen sources hasFilePath`](#shellpen-sources-hasfilepath-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen sources use`](/api/shellpen/sources/use)



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







                    
  
    

    
    

# [`shellpen sources getFilePath`](/api/shellpen/sources/getFilePath)



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


                    
  
    

    
    

# [`shellpen sources current`](/api/shellpen/sources/current)



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







                    
  
    

    
    

# [`shellpen sources new`](/api/shellpen/sources/new)








                    
  
    

    
    

# [`shellpen sources list`](/api/shellpen/sources/list)



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







                    
  
    

    
    

# [`shellpen sources exists`](/api/shellpen/sources/exists)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen -- getSourceIndex "$@" >/dev/null
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen sources hasFilePath`](/api/shellpen/sources/hasFilePath)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen sources getFilePath "$@" >/dev/null
{% endhighlight %}
{% raw %}

</details>







                    
      
{% endraw %}
