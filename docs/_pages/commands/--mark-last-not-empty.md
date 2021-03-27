---
title: '--mark-last-not-empty • 🖋️ Extending Syntax'
permalink: /extensions/--mark-last-not-empty
layout: 'singleWithoutTitle'
sidebar:
  nav: 'extensions_reference'
---

# 🖋️ Extending Syntax

---

# `--mark-last-not-empty`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
then

  if [ -z "$BASH_PRE_43" ]
  then
    SHELLPEN_SOURCE_CONTEXT_EMPTY[$SHELLPEN_CONTEXT_RIGHT_INDEX]="false"
  else
    eval "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]=\"false\""
  fi

fi
{% endhighlight %}

</details>



> Mark the last item on current stack as not empty







