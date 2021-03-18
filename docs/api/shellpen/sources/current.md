---
---

{% raw %}





[🔙 Back to shellpen sources](/api/shellpen/sources)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen sources current



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








  
{% endraw %}
