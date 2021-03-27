---
title: 'fromText • 🖋️ Command Reference'
permalink: /docs/fromText
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `fromText`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

local string="$1"
shift

local command="$1"
shift

!fn --shellpen-private writeDSL $command "$@"

# Chomp the newline and replace it with ' <<< "string"newline'
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ <<< \"$string\"$NEWLINE}"
{% endhighlight %}

</details>



> Append `<<< "[text]"` to the following command







