---
title: '--eval-last-pushed • 🖋️ Extending Syntax'
permalink: /extensions/--eval-last-pushed
layout: 'singleWithoutTitle'
sidebar:
  nav: 'extensions_reference'
---

# 🖋️ Extending Syntax

---

# `--eval-last-pushed`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ -z "$BASH_PRE_43" ]
then
  !fn --shellpen-private writeSingleCommand ${SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]}
else
  eval "!fn --shellpen-private writeShellCommand \${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]}"
fi
{% endhighlight %}

</details>



> Evaluate the last item pushed onto the current stack







