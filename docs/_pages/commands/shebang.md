---
title: '🖋️ Command Reference'
permalink: /docs/shebang
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `shebang`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

local commandPath=/bin/bash
[ $# -gt 0 ] && commandPath="$*"

!fn --shellpen-private writeDSL prependln "#! $commandPath"
{% endhighlight %}

</details>



> Write '#!' hashbang with provided command path (default: `/bin/bash`)







