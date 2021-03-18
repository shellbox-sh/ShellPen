---
---

{% raw %}





[🔙 Back to shellpen](/api/shellpen)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen esac



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"esac")
  shellpen -- blocks options close
  _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
  # Close existing option, if open
  shellpen indent--
  shellpen writeln "esac"
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
