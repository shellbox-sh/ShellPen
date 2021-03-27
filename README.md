
# 🖋️ Shell Pen

_Generate BASH from BASH_

---

Download the [latest version](https://github.com/shellbox-sh/ShellPen/archive/v2.0.0.tar.gz) by clicking one of the download links above or:

```sh
curl -o- https://shellpen.sh/installer.sh | bash
```

---

# Getting Started

Once you have [downloaded](https://github.com/shellbox-sh/ShellPen/archive/v2.0.0.tar.gz) the latest version of ShellPen, source the library:

```sh
source shellpen.sh
```

You're now ready to start generating shell script source code!

# Documentation

ShellPen offers three sources of documentation:

 - [ShellPen User Guide](https://shellpen.sh/) (_this page_)
 - [ShellPen Command Reference](https://shellpen.sh/) (_details for individual commands_)
 - [ShellPen Extension Guide](https://shellpen.sh/extensions) (_for extending the built-in syntax_)


# Using Pens

**"Pens"** are BASH functions used to author snippets of BASH source code.

Every pen is associated with a separate snippet of source code:
 - _If you want to author 3 source code files, consider creating 3 separate pens_

To create a pen:

```sh
shellpen pens new [pen name]
```

Or use the preferred shorthand:

```sh
shellpen [pen name]
```

A pen can have any name (_which is a valid BASH function name_):

 - No spaces are allowed
 - It is recommended to not name your pen `:`
 - None of the following characters: `<` `>` `|` `(` `)` `!`

## `shellpen -`

When writing to only one source, the conventional pen name is: `-`

#### Create Pen

```sh
shellpen -
```

## `$pen code`

You will occassionally want to see the code written by your pen!

To do that, run `[pen] code`

#### Preview Generated Source

```sh
# Create a pen
shellpen -

# Write some source code
- echo "Hello, world!"

# Preview the generated source code
- code
# => 'echo "Hello, world!"'
```

## `$pen cleanSlate`

If at any time you wish to clear a pen's source code, run `[pen] cleanSlate`

```sh
# Create a pen
shellpen -

# Write some source code
- echo "Hello, world!"

# Preview the generated source code
- code
# => 'echo "Hello, world!"'

# Clear the pen's source code
- cleanSlate

# Preview the generated source code (now empty)
- code
# => ""
```

## `$pen putAway`

Once you are finished with your pen, put it away via `[pen] putAway`

This will delete the pen and any source code associated with it.

```sh
# Create pen
shellpen -

# ...

# Put pen away
- putAway

# Trying to use the - pen again will now result in an error
- code
# => -: command not found
```

## `shellpen extend`

This page describes the basic features of ShellPen.

To extend the syntax, view the [⚙️ Extending Syntax Reference](https://shellpen.sh/extensions).

# Writing Basics

The most basic pen function is `writeln` which appends one line of source code.

## `writeln`

```sh
- writeln "Hello this is some code text"
- writeln "More code goes here"

- code
# => "Hello this is some code text\nMore code goes here"
```

| [`write`](https://shellpen.sh/docs/write) | [Appends text _without newlines_ but _with indentation_](https://shellpen.sh/docs/write) |
| [`writeln`](https://shellpen.sh/docs/writeln) | [Appends a line of text _with indentation_](https://shellpen.sh/docs/writeln)  |
| [`append`](https://shellpen.sh/docs/append) | [Appends text _without newlines or indentation_](https://shellpen.sh/docs/append)  |
| [`appendln`](https://shellpen.sh/docs/appendln) | [Appends a line of text _without indentation_](https://shellpen.sh/docs/appendln)  |
| [`prepend`](https://shellpen.sh/docs/prepend) | [Prepends text _without newlines or indentation_](https://shellpen.sh/docs/prepend) |
| [`prependln`](https://shellpen.sh/docs/prependln) | [Prepends a line of text _without indentation_](https://shellpen.sh/docs/prependln) |


## `$ command`

`$ [command] [arguments]` is an alias for `writeln` for "syntax sugar"

```sh
- $ someCommand "Argument1" "Hello, world!"

- code
# => 'someCommand Argument1 Hello, world!'
```

When you want to generate code that calls a command, use `$`

- _Exceptions are_ `echo` _and_ `printf` _which have useful generation helpers_

#### `$$ command`

If you want the provided arguments wrapped in `"` quotes, use `$$` instead:

```sh
- $$ someCommand "Argument1" "Hello, world!"

- code
# => 'someCommand "Argument1" "Hello, world!"'
```

## `shebang`

If you would like to add a "shebang" or "hashbang" to your source:

```sh
- shebang

- code
# => '#! /bin/bash'
```

- You can also provide your own path, e.g. `- shebang /usr/bin/env bash`

## `function`

Use `function` to start the definition of a function and `}` to finish:

```sh
- function hello
  - echo Hello
- }
```

<!-- OUTPUT -->
```sh
hello() {
  echo "Hello"
}
```

ℹ️ Levels of indentation are automatically added in functions et al.

## `main`

Use `main` to add conventional code to run a function when the script is run:

```sh
- function hello
  - :
- }

- main hello
```

<!-- OUTPUT -->
```sh
hello() {
  :
}
[ "${BASH_SOURCE[0]}" = "$0" ] && "hello" "$@"
```

# Variables

Helper functions are provided for declaring different types of BASH variables:

## [`var`](https://shellpen.sh/docs/var)

- `var` Defines a generic BASH variable

```sh
- var x = 10
```

<!-- OUTPUT -->

```sh
x=10
```

## [`local`](https://shellpen.sh/docs/local)

- `local` Defines a `local` variable for use in a BASH function

```sh
- fn hello
  - local x = 10
```

<!-- OUTPUT -->

```sh
hello() {
  local x=10
}
```
## [`int`](https://shellpen.sh/docs/int)

- `int` declares a BASH integer value variable

```sh
- int x = 10
```

<!-- OUTPUT -->

```sh
declare -i x=10
```

## [`array`](https://shellpen.sh/docs/array)

- `array` declares a single-dimensional BASH array

```sh
- array x
```

<!-- OUTPUT -->

```sh
declare -a x
```

##### With Items

```sh
- array x Hello World '$@'
```

<!-- OUTPUT -->

```sh
declare -a x=("Hello" "World" "$@")
```

## [`map`](https://shellpen.sh/docs/map)

- "Map" is shorthand for defining an associative-array:

```sh
- map x
```

<!-- OUTPUT -->

```sh
declare -A x
```

##### With Items

```sh
- map x [Hello]=World [Foo]="Foo Bar"
```

<!-- OUTPUT -->

```sh
declare -A x=([Hello]="World" [Foo]="Foo Bar")
```

# Output

ShellPen provides helpers for generating `echo` and `printf` commands.

## `echo`

- Any commands provided to `echo` will be wrapped in `"` quotes

```sh
- echo "Hello, world" foo bar
```

<!-- OUTPUT -->

```sh
echo "Hello, world" "foo" "bar"
```

## `printf`

- `printf` specifically supports providing a `'` single quoted formatter string

```sh
- printf "Hello"
```

<!-- OUTPUT -->

```sh
printf "Hello"
```

##### With Formatter

```sh
- printf '%s' "Hello"
```

<!-- OUTPUT -->

```sh
printf '%s' "Hello"
```

##### With Flags

```sh
- printf -v varname '%s' -- "Hello"
```

<!-- OUTPUT -->

```sh
printf -v "varname" '%s' -- "Hello"
```

## `toStderr`

- Any command can have output sent to STDERR by prepending the command with `toStderr`

```sh
- toStderr echo "Hello"
```

<!-- OUTPUT -->

```sh
echo "Hello" >&2
```

##### Arbitrary Command

```sh
- toStderr $ myCommand arg1 arg2
```

<!-- OUTPUT -->

```sh
myCommand arg1 arg2 >&2
```

## `toFile`

- Any command can have output sent to a file by prepending the command with `toFile [path]`

```sh
- toFile log.log echo "Hello"
```

<!-- OUTPUT -->

```sh
echo "Hello" > "log.log"
```

##### Arbitrary Command

```sh
- toFile log.log $ myCommand arg1 arg2
```

<!-- OUTPUT -->

```sh
myCommand arg1 arg2 > "log.log"
```

# Conditionals

## `if / fi`

- `if` conditionals are supported (`then` _is an optional keyword_)

```sh
- if [ '$#' -eq 0 ]
  - comment Hello
- elif [ '$#' -eq 1 ]
- else
  - echo "Hello, world"
- fi
```

<!-- OUTPUT -->

```sh
if [ $# -eq 0 ]
then
  # Hello
  :
elif [ $# -eq 1 ]
then
  :
else
  echo "Hello, world"
fi
```

ℹ️ Empty blocks (_or those with only comments_) automatically have a `:` added

## `case / option / esac`

- `case` / `esac` conditionals are supported
  - `option` is used for options
  - `::` is used in place of `;;` for closing each option

```sh
- case '$1' in
  - option "foo"
    - echo "Hello from foo"
    - ::
  - option "bar"
    - ::
  - option '*'
    - echo "Other option!"
    - ::
- esac
```

<!-- OUTPUT -->

```sh
case "$1" in
  foo)
    echo "Hello from foo"
    ;;
  bar)
    :
    ;;
  *)
    echo "Other option!"
    ;;
esac
```

## `[ ... ] AND / OR`

- One-liner conditionals are supported with the use of `AND` and/or `OR`

```sh
- [ '$#' -eq 0 ] AND toStderr echo "At least one argument is required"
```

<!-- OUTPUT -->

```sh
[ $# -eq 0 ] && echo "At least one argument is required" >&2
```

##### `{` ... `;` ... `}`

- One liner statements with `{ ... }` are supported using `,` in place of `;`


```sh
- [ '$#' -eq 0 ] AND { toStderr echo "Argument is required" , return 1 , }
```

<!-- OUTPUT -->

```sh
[ $# -eq 0 ] && { echo "Argument is required" >&2; return 1; }
```

# Loops

## `for`

- `for` loops are supported (`do` _is an optional keyword_)

```sh
- for arg in '"$@"'
  - echo Argument: '$@'
- done
```

<!-- OUTPUT -->

```sh
for arg in "$@"
do
  echo "Argument:" "$@"
done
```

## `while`

- `while` loops are supported (`do` _is an optional keyword_)

```sh
- while [ '$#' -gt 0 ]
  - echo Argument: '$1'
  - shift
- done
```

<!-- OUTPUT -->

```sh
while [ $# -gt 0 ]
do
  echo "Argument:" "$1"
  shift
done
```

# Arithmetic

## `{{ ... }}`

- `(( ... ))` arithmetic is supported using `{{ ... }}` in place of parenthesis

```sh
- int i=42
- {{ i++ }}
```

<!-- OUTPUT -->

```sh
declare -i i=42
(( i++ ))
```

# Pipes | STDIN

It's common to need to use `|` pipes in generated BASH source code.

## `\|`

- Pipes are supported by providing an escaped `\|` in place of a `|` pipe character

```sh
- echo '$1' \| $ sed "'s/foo/bar/'" \| $ head -1 \| $ xargs -n1 echo
```

<!-- OUTPUT -->

```sh
echo "$1" | sed 's/foo/bar/' | head -1 | xargs -n1 echo
```

## `fromStdin`

- Any command can accept input from STDIN by prepending the command with `fromStdin [source of stdin]`

```sh
- while 'IFS=""' read -r line \|\| [ -n '"$line"' ]
  - echo '$line'
- fromStdin some/file.txt done
```

<!-- OUTPUT -->

```sh
while IFS="" read -r line || [ -n "$line" ]
do
  echo "$line"
done < some/file.txt
```

ℹ️ The previous example uses an escaped OR (`\|\|`) instead of `OR`

 - Because `OR` adds an `||` after the previous command's output, this would result
   in the `||` being added after the while's `do` is automatically added.

## `fromFile`

- Any command can accept STDIN from a file path by prepending the command with `fromFile [file path]`
  - _This is the same as `fromStdin` but wraps provided arguments in_ `"`

```sh
- while 'IFS=""' read -r line \|\| [ -n '"$line"' ]
  - echo '$line'
- fromFile some/file.txt done
```

<!-- OUTPUT -->

```sh
while IFS="" read -r line || [ -n "$line" ]
do
  echo "$line"
done < "some/file.txt"
```
## `fromCommand`

- Any command can accept input from a command by prepending the command with `fromCommand "[command with args]"`

```sh
- var text = '"$(<"$filePath")"'
- while 'IFS=""' read -r line \|\| [ -n '"$line"' ]
  - echo '$line'
- fromCommand "printf '%s' \"\$text\"" done
```

<!-- OUTPUT -->

```sh
text="$(<"$filePath")"
while IFS="" read -r line || [ -n "$line" ]
do
  echo "$line"
done < <(printf '%s' "$text")
```

## `fromText`

- Any command can accept input from a string with `fromText "string"`

```sh
- while 'IFS=""' read -r line \|\| [ -n '"$line"' ]
  - echo '$line'
- fromText '$text' done
```

<!-- OUTPUT -->

```sh
while IFS="" read -r line || [ -n "$line" ]
do
  echo "$line"
done <<< "$text"
```
