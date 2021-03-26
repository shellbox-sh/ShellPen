---
title: '🖋️ Command Reference'
permalink: /docs/else
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `else`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

!fn --shellpen-private writeDSL --write-null-if-last-empty
!fn --shellpen-private writeDSL --pop
!fn --shellpen-private writeDSL writeln "else"
!fn --shellpen-private writeDSL --push "fi"
{% endhighlight %}

</details>



> Add an `else` to an `if` conditional block







