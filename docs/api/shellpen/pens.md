---
---

{% raw %}





[🔙 Back to shellpen](/api/shellpen)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen pens



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"pens")
  local __shellpen__mainCliCommandDepth="2"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command2="$1"
  shift
  case "$__shellpen__mainCliCommands_command2" in
    *)
      echo "Unknown 'shellpen pens' command: $__shellpen__mainCliCommands_command2" >&2
      return 1
      ;;
  esac
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
