---
---

{% raw %}





[🔙 Back to shellpen -- blocks functions](/api/shellpen/--/blocks/functions)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- blocks functions close



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"close")
  if [ "${_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
  then
    shellpen }
  fi
  _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
