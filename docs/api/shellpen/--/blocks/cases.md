---
---

{% raw %}





[🔙 Back to shellpen -- blocks](/api/shellpen/--/blocks)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- blocks cases



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"cases")
      local __shellpen__mainCliCommandDepth="4"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command4="$1"
      shift
      case "$__shellpen__mainCliCommands_command4" in
{% endhighlight %}
{% raw %}

</details>








    
    
    
    
    

## [`shellpen -- blocks cases open`](#shellpen----blocks-cases-open-1)

                  
    
    
    
    
    

## [`shellpen -- blocks cases close`](#shellpen----blocks-cases-close-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen -- blocks cases open`](/api/shellpen/--/blocks/cases/open)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"open")
  _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen -- blocks cases close`](/api/shellpen/--/blocks/cases/close)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"close")
  if [ "${_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
  then
    shellpen esac
  fi
  _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







                    
      
{% endraw %}
