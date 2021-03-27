---
title: 'fromStdin • 🖋️ Command Reference'
permalink: /docs/fromStdin
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `fromStdin`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

local stdinSource="$1"
shift

local command="$1"
shift

!fn --shellpen-private writeDSL $command "$@"

# Chomp the newline and replace it with ' < "path"newline'
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ < $stdinSource$NEWLINE}"
{% endhighlight %}

</details>



> Append `< [argument]` to the following command







