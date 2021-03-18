---
---

{% raw %}





[🔙 Back to shellpen --](/api/shellpen/--)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- writeShebang



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"writeShebang")
  
  if [ -n "${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
  then
    _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]="${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\n${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  fi
  _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
