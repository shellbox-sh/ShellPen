---
title: "shellpen -- blocks functions"
---

{% raw %}





[🔙 Back to shellpen -- blocks](/api/shellpen/--/blocks)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- blocks functions



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="4"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command4="$1"
shift
case "$__shellpen__mainCliCommands_command4" in
  "close")
{% endhighlight %}
{% raw %}

</details>










    
    
    
    
    

## [`shellpen -- blocks functions open`](#shellpen----blocks-functions-open-1)

                  
    
    
    
    
    

## [`shellpen -- blocks functions close`](#shellpen----blocks-functions-close-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen -- blocks functions open`](/api/shellpen/--/blocks/functions/open)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen -- blocks functions close`](/api/shellpen/--/blocks/functions/close)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ "${_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
then
  shellpen }
fi
_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







                    
      
{% endraw %}
