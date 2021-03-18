---
---

{% raw %}





[🔙 Back to shellpen -- blocks options](/api/shellpen/--/blocks/options)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- blocks options close



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"close")
  # Close existing option, if open
  if [ "${_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
  then
    shellpen writeln ";;"
    shellpen indent--
  fi
  _SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
