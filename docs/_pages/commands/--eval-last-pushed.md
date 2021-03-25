---
title: '--eval-last-pushed'
permalink: /docs/--eval-last-pushed
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ -z "$BASH_PRE_43" ]
then
  !fn --shellpen-private writeDSL ${SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]}
else
  eval "!fn --shellpen-private writeDSL \${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]}"
fi
{% endhighlight %}

</details>



> Evaluate the last item pushed onto the current stack







