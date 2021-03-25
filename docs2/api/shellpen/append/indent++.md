---
title: "shellpen append indent++"
---

{% raw %}





[🔙 Back to shellpen append](/api/shellpen/append)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen append indent++



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>










  
{% endraw %}
