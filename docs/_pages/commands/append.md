---
title: 'append • 🖋️ Command Reference'
permalink: /docs/append
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

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







