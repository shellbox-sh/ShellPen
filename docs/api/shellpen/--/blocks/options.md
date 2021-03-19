---
title: "shellpen -- blocks options"
---

{% raw %}





[🔙 Back to shellpen -- blocks](/api/shellpen/--/blocks)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- blocks options



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










    
    
    
    
    

## [`shellpen -- blocks options open`](#shellpen----blocks-options-open-1)

                  
    
    
    
    
    

## [`shellpen -- blocks options close`](#shellpen----blocks-options-close-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen -- blocks options open`](/api/shellpen/--/blocks/options/open)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen -- blocks options close`](/api/shellpen/--/blocks/options/close)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
# Close existing option, if open
if [ "${_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
then
  shellpen append writeln ";;"
  shellpen append indent--
fi
_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







                    
      
{% endraw %}
