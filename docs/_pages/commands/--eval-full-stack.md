---
title: '--eval-full-stack'
permalink: /docs/--eval-full-stack
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

while [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
do
  local currentDepth="$SHELLPEN_CONTEXT_DEPTH"
  local lastCommand="$( !fn --shellpen-private writeDSL --get-last-pushed )"
  !fn --shellpen-private writeDSL --eval-last-pushed
  local updatedDepth="$SHELLPEN_CONTEXT_DEPTH"
  [ $currentDepth -eq $updatedDepth ] && { echo "!command: Internal DSL Error. Expected '$lastCommand' to pop context stack." >&2; return 1; }
done
{% endhighlight %}

</details>



> Close every item on current stack (_from right to left_)







