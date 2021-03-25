---
title: "shellpen -- writeMain"
---

{% raw %}





[🔙 Back to shellpen --](/api/shellpen/--)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- writeMain



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ -n "${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
then
  shellpen append writeln
  shellpen append writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\" \"\$@\""
fi
_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
{% endhighlight %}
{% raw %}

</details>










  
{% endraw %}
