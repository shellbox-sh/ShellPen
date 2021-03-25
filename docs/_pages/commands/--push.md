---
title: '--push'
permalink: /docs/--push
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ -z "$BASH_PRE_43" ]
then
  SHELLPEN_SOURCE_CONTEXT+=("$*")
  SHELLPEN_SOURCE_CONTEXT_EMPTY+=("true")
else
  eval "__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID+=(\"\$*\")"
  eval "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID+=(\"true\")"
fi

(( SHELLPEN_CONTEXT_DEPTH++ ))
(( SHELLPEN_CONTEXT_RIGHT_INDEX++ ))
{% endhighlight %}

</details>



> Push an item onto the current stack







