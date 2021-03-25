---
title: "shellpen append return"
---

{% raw %}





[🔙 Back to shellpen append](/api/shellpen/append)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen append return



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ $# -eq 1 ]
then
  shellpen append writeln "return $1"
else
  shellpen append writeln "return 1"
fi
{% endhighlight %}
{% raw %}

</details>










  
{% endraw %}
