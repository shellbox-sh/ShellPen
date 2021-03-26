---
title: '🖋️ Command Reference'
permalink: /docs/fn
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `fn`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

local functionName="$1"

# Write the function
!fn --shellpen-private writeDSL writeln "$functionName() {"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private writeDSL --push "}"
{% endhighlight %}

</details>



> Begin a `function` definition block







