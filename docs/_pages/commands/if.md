---
title: 'if • 🖋️ Command Reference'
permalink: /docs/if
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `if`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

# Write the function
!fn --shellpen-private writeDSL writeln "if $*"
!fn --shellpen-private writeDSL writeln "then"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private writeDSL --push "fi"
{% endhighlight %}

</details>



> Begin an `if` conditional block







