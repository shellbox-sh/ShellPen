---
title: '🖋️ Command Reference'
permalink: /docs/append
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `append`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*"
!fn --shellpen-private writeDSL --mark-last-not-empty
{% endhighlight %}

</details>



> Append a string of text to source output _without indentation_







