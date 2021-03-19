---
title: "shellpen -- blocks functions open"
---

{% raw %}





[🔙 Back to shellpen -- blocks functions](/api/shellpen/--/blocks/functions)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- blocks functions open



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










  
{% endraw %}
