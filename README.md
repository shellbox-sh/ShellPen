[![Mac (BASH 3.2)](<https://github.com/shellbox-sh/shellpen/workflows/Mac%20(BASH%203.2)/badge.svg>)](https://github.com/shellbox-sh/shellpen/actions?query=workflow%3A%22Mac+%28BASH+3.2%29%22) [![BASH 4.3](https://github.com/shellbox-sh/shellpen/workflows/BASH%204.3/badge.svg)](https://github.com/shellbox-sh/shellpen/actions?query=workflow%3A%22BASH+4.3%22) [![BASH 4.4](https://github.com/shellbox-sh/shellpen/workflows/BASH%204.4/badge.svg)](https://github.com/shellbox-sh/shellpen/actions?query=workflow%3A%22BASH+4.4%22) [![BASH 5.0](https://github.com/shellbox-sh/shellpen/workflows/BASH%205.0/badge.svg)](https://github.com/shellbox-sh/shellpen/actions?query=workflow%3A%22BASH+5.0%22)

---
# 🖋️ Shell Pen

> 🖋️ Generate Shell Script Source Code using a familiar DSL!

Download the [latest version](https://github.com/shellbox-sh/shellpen/archive/v0.1.0.tar.gz) by clicking one of the download links above or:

```sh
curl -o- https://shellpen.sh/installer.sh | bash
```

## BASH Codegen

🖋️ Import the `shellpen` library:

```sh
source shellpen.sh
```

🖋️ Use the DSL to define variables, functions, conditionals, etc!

```sh
shellpen :

: function sayHello
  : local command="\$1"
  : shift
  : case "\$command"
    : option hello
      : echo "Hello \$*!"
    : option goodbye
      : echo "Goodbye \$*!"

: main sayHello
```

🔍 Preview the current source code content

```sh
shellpen preview
```

```sh
#! /usr/bin/env bash

sayHello() {
  local command=$1
  shift
  case "$command" in
    hello)
      echo "Hello $*!"
      ;;
    goodbye)
      echo "Goodbye $*!"
      ;;
  esac
}

[ "${BASH_SOURCE[0]}" = "$0" ] && "sayHello" "$@"
```

💾 Save and run it!

```sh
shellpen save say-hello.sh
```

```sh
./say-hello.sh hello Rebecca
# => "Hello Rebecca!"
```

# 📝 Sources

`shellpen` can write to one or multiple sources.

- A source represents a snippet of source code to write
- A source can optionally be tied to a local file

Sources allow you to manage multiple pieces of source code.

🗒️ Declare multiple sources

```sh
shellpen :

shellpen sources new cats.sh
shellpen sources new dogs.sh

shellpen sources use cats.sh
: function meow
  : echo "Meow"

shellpen sources use dogs.sh
: function woof
  : echo "Woof"

shellpen preview cats.sh
# => "meow() { echo "Meow" ..."

shellpen preview dogs.sh
# => "woof() { echo "Woof" ..."
```

To make switching between sources easier, you can use pens!

# ✒️ Pens

In `shellpen`, a "pen" is associated with a particular source.

You can have many pens, each associated with a separate source 🖊️ 🖋️ 🖌️

```sh
shellpen pens new :cat
shellpen pens new :dog

:cat writeTo cat.sh
:dog writeTo dog.sh

:cat function meow
  :cat echo "Meow"

:dog function "woof"
  :dog echo "Woof"

:cat preview cats.sh
# => "meow() { echo "Meow" ..."

:dog preview dogs.sh
# => "woof() { echo "Woof" ..."
```

Pens are helpers for easily calling `shellpen` functions for any given source!

```sh
# This is a shortcut to get a pen named `:`
# which writes to the currently selected source:
shellpen :

# If you want to write to a different source:
shellpen : [source]

# This is another shortcut for quickly
# getting a pen for the currently selected source:
shellpen pen [name]

# Or get a pen for a particular source:
shellpen pen [name] [source]
```

---
