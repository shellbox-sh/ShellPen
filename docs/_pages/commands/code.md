---
title: '🖋️ Command Reference'
permalink: /docs/code
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `code`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

!fn --shellpen-private writeDSL --eval-full-stack || return $?
printf '%s' "${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]}"
{% endhighlight %}

</details>



> Output the code for the current pen (_does not modify source_)







