---
title: 'comment • 🖋️ Command Reference'
permalink: /docs/comment
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `comment`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

# Do not use writeln because comments should not mark blocks as not empty
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private writeDSL getIndent)# $*${NEWLINE}"
{% endhighlight %}

</details>



> Append a `#` command line







