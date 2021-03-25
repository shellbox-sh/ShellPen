---
title: 'if'
permalink: /docs/if
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

# Write the function
!fn --shellpen-private writeDSL writeln "if $*"
!fn --shellpen-private writeDSL writeln "then"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private contexts push "fi"
{% endhighlight %}

</details>



> Begin an `if` conditional block







