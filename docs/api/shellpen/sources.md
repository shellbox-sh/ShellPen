---
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
"sources")
  local __shellpen__mainCliCommandDepth="2"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command2="$1"
  shift
  case "$__shellpen__mainCliCommands_command2" in
{% endhighlight %}
{% raw %}

</details>








    
    
    
    
    

## [`shellpen sources use`](#shellpen-sources-use-1)

                  
    
    
    
    
    

## [`shellpen sources getFilePath`](#shellpen-sources-getfilepath-1)

                  
    
    
    
    
    

## [`shellpen sources current`](#shellpen-sources-current-1)

                  
    
    
    
    
    

## [`shellpen sources new`](#shellpen-sources-new-1)

                  
    
    
    
    
    

## [`shellpen sources list`](#shellpen-sources-list-1)

                  
    
    
    
    
    

## [`shellpen sources exists`](#shellpen-sources-exists-1)

                  
    
    
    
    
    

## [`shellpen sources getSource`](#shellpen-sources-getsource-1)

                  
    
    
    
    
    

## [`shellpen sources hasFilePath`](#shellpen-sources-hasfilepath-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen sources use`](/api/shellpen/sources/use)



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







                    
  
    

    
    

# [`shellpen sources getFilePath`](/api/shellpen/sources/getFilePath)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"getFilePath")
  
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen sources current`](/api/shellpen/sources/current)



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







                    
  
    

    
    

# [`shellpen sources new`](/api/shellpen/sources/new)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"new")
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen sources list`](/api/shellpen/sources/list)



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







                    
  
    

    
    

# [`shellpen sources exists`](/api/shellpen/sources/exists)



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







                    
  
    

    
    

# [`shellpen sources getSource`](/api/shellpen/sources/getSource)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"getSource")
  
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen sources hasFilePath`](/api/shellpen/sources/hasFilePath)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"hasFilePath")
  
{% endhighlight %}
{% raw %}

</details>







                    
      
{% endraw %}
