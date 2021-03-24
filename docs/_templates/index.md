# 🖋️ Shell Pen

> 🖋️ Generate Shell Script Source Code using a familiar DSL!

Download the [latest version](https://github.com/shellbox-sh/shellpen/archive/v0.1.0.tar.gz) by clicking one of the download links above or:

```sh
curl -o- https://shellpen.sh/installer.sh | bash
```

➡️ Import the `shellpen` library:

```sh
source shellpen.sh
```

🖋️ Use the DSL to define variables, functions, conditionals, etc!

```sh
shellpen -

- shebang

- function sayHello
  - local command="\$1"
  - shift
  - case "\$command"
    - option hello
      - echo "Hello \$*!"
    - option goodbye
      - echo "Goodbye \$*!"

- main sayHello
```

🔍 Preview the current source code content

```sh
- code
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
- code > say-hello.sh
```

```sh
./say-hello.sh hello Rebecca
# => "Hello Rebecca!"
```

# ✒️ Pens

In `shellpen`, every "pen" writes to a unique source.

You can have many pens, each associated with a separate source 🖊️ 🖋️ 🖌️

```sh
shellpen pen :cat
shellpen pen :dog

:cat function meow
  :cat echo "Meow"

:dog function "woof"
  :dog echo "Woof"

:cat code cats.sh
# => "meow() { echo "Meow" ..."

:dog code dogs.sh
# => "woof() { echo "Woof" ..."
```

Once you are finished with the source, you may "put away" the pen.

```sh
shellpen -

- comment "Hello, world!"

- code
# => "# Hello, world!"

- putAway

- code
# => "-: command not found"
```

This clears out the source.

Of course, you may always pickup the same pen again with a fresh source.

Alternatively, you may "clean the slate" to get a fresh source with the same pen.

```sh
shellpen -

- comment Hello

- code
# => "# Hello"

- cleanSlate

- code
# => ""
```

---
