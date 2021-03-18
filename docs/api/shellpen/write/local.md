---
---

{% raw %}





[🔙 Back to shellpen write](/api/shellpen/write)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen write local



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"local")
  if [ $# -eq 1 ]
  then
    if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
    then
      shellpen writeln "local ${1%%=*}=\"${1#*=}\""
    else
      shellpen writeln "local $*"
    fi
  elif [ $# -eq 2 ]
  then
    shellpen writeln "local $1=\"$2\""
  fi
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
