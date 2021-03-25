---
title: 'for'
permalink: /docs/for
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

# Write the function
!fn --shellpen-private writeDSL writeln "for $*"
!fn --shellpen-private writeDSL writeln "do"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private contexts push "done"
{% endhighlight %}

</details>



> Begin a `for` loop







