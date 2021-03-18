---
---

{% raw %}





[🔙 Back to shellpen write](/api/shellpen/write)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen write case



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"case")
  shellpen writeln "case \"$1\" in"
  shellpen indent++
  shellpen -- blocks cases open
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
