---
title: 'elif • 🖋️ Command Reference'
permalink: /docs/elif
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `elif`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

!fn --shellpen-private writeDSL --write-null-if-last-empty
!fn --shellpen-private writeDSL --pop
!fn --shellpen-private writeDSL writeln "elif $*"
!fn --shellpen-private writeDSL writeln "then"
!fn --shellpen-private writeDSL --push "fi"
{% endhighlight %}

</details>



> Add an `elif` to an `if` conditional block







