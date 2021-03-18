---
---

{% raw %}





[🔙 Back to shellpen -- errors](/api/shellpen/--/errors)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- errors getFileLine



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"getFileLine")
if [ "$2" = "0" ]
then
  sed "1q;d" "$1" | sed 's/^ *//g'
else
  sed "${2}q;d" "$1" | sed 's/^ *//g'
fi
{% endhighlight %}
{% raw %}

</details>






| | Description |
|-|-------------|
| `$1` | Path to the file |
| `$2` | Line to print |





  
{% endraw %}
