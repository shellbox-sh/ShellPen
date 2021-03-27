---
title: 'prepend • 🖋️ Command Reference'
permalink: /docs/prepend
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

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







