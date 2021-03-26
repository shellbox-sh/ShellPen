---
title: '🖋️ Command Reference'
permalink: /docs/toStderr
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `toStderr`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

# Because '%s' and similar formatters are so common, look for a '%' formatter (but only one, and not after the --)

local command="$1"
shift

!fn --shellpen-private writeDSL $command "$@"

# Chomp the newline and replace it with ' >&2newline'
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ >&2$NEWLINE}"
{% endhighlight %}

</details>



> Append `>&2` to the following command







