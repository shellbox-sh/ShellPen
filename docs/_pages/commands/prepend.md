---
title: '🖋️ Command Reference'
permalink: /docs/prepend
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `prepend`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="$*${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]}"
!fn --shellpen-private writeDSL --mark-last-not-empty
{% endhighlight %}

</details>



> Prepend a string of text to source output _without indentation_







