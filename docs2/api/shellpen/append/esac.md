---
title: "shellpen append esac"
---

{% raw %}





[🔙 Back to shellpen append](/api/shellpen/append)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen append esac



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen -- blocks options close
_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
# Close existing option, if open
shellpen append indent--
shellpen append writeln "esac"
{% endhighlight %}
{% raw %}

</details>










  
{% endraw %}
