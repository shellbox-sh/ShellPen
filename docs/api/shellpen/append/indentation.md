---
---

{% raw %}





[🔙 Back to shellpen append](/api/shellpen/append)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen append indentation



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










  
{% endraw %}
