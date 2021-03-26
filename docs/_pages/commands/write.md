---
title: '🖋️ Command Reference'
permalink: /docs/write
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `write`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private writeDSL --get-indent)$*"
!fn --shellpen-private writeDSL --mark-last-not-empty
{% endhighlight %}

</details>



> Append a string of text to source output including indentation







