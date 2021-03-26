---
title: '🖋️ Command Reference'
permalink: /docs/appendln
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `appendln`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*${NEWLINE}"
!fn --shellpen-private writeDSL --mark-last-not-empty
{% endhighlight %}

</details>



> Append a line of text to source output _without indentation_







