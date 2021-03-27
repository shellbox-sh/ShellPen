---
title: 'write • 🖋️ Command Reference'
permalink: /docs/write
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `write`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private writeDSL getIndent)$*"
!fn --shellpen-private writeDSL --mark-last-not-empty
{% endhighlight %}

</details>



> Append a string of text to source output including indentation







