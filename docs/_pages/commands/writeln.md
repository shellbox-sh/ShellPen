---
title: '🖋️ Command Reference'
permalink: /docs/writeln
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `writeln`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private writeDSL --get-indent)$*${NEWLINE}"
!fn --shellpen-private writeDSL --mark-last-not-empty
{% endhighlight %}

</details>



> Append a line of text to source output including indentation







