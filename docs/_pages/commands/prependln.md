---
title: '🖋️ Command Reference'
permalink: /docs/prependln
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `prependln`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="$*${NEWLINE}${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]}"
!fn --shellpen-private writeDSL --mark-last-not-empty
{% endhighlight %}

</details>



> Prepend a line of text to source output _without indentation_







