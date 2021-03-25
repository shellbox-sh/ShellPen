---
title: '🖋️ Command Reference'
permalink: /docs
layout: single
sidebar:
  nav: 'command_reference'
---

| [`.`](/docs/dot) | Source a shell source file via `.` |
| [`,`](/docs/,) | Output a `;` semicolon |
| [`$`](/docs/$) | Run any arbitrary command |
| [`:`](/docs/colon) | Output a line containing the `:` null character |
| [`::`](/docs/colon-colon) | Write a `;;` for use in `case`/`esac` `option`s |
| [`[`](/docs/[) | Starts a line with a `[` statement, e.g. `[ '$#' -eq 0 ] AND ...` |
| [`[[`](/docs/[[) | Starts a line with a `[[` statement, e.g. `[[ '"$1"' =~ ^-- ]] AND ...` |
| [`{`](/docs/{) | Start a `{` block |
| [`{{ '{{' }}`](/docs/{{ '{{' }}) | Write a `((` arithmetic statement (_replaces `}}` with `))`_) |
| [`}`](/docs/}) | Closes a function or an open `{` block |
| [`appendln`](/docs/appendln) | Append a line of text to source output _without indentation_ |
| [`append`](/docs/append) | Append a string of text to source output _without indentation_ |
| [`AND`](/docs/AND) | Used for generating `&&` |
| [`array`](/docs/array) | Define an array variable |
| [`case`](/docs/case) | Begin a `case` / `esac` statement |
| [`cleanSlate`](/docs/cleanSlate) | Clean the slate of the current pen (_does not output source code_) |
| [`code`](/docs/code) | Output the source code for the current pen (_does not modify to current source_) |
| [`comment`](/docs/comment) | Append a `#` command line |
| [`declare`](/docs/declare) | Declare a variable (shortcuts available: [`int`](/docs/int), [`array`](/docs/array), [`map`](/docs/map)) |
| [`done`](/docs/done) | End a `for` or `while` loop |
| [`do`](/docs/do) | Syntax sugar. Does not write source code. (_Loops automatically add `do`_) |
| [`echo`](/docs/echo) | `echo` the provided arguments (_wrapped in `"..."`_) |
| [`elif`](/docs/elif) | Add an `elif` to an `if` conditional block |
| [`else`](/docs/else) | Add an `else` to an `if` conditional block |
| [`esac`](/docs/esac) | End a `case` / `esac` statement |
| [`fi`](/docs/fi) | End an `if` conditional block |
| [`fn`](/docs/fn) | Begin a function definition block |
| [`for`](/docs/for) | Begin a `for` loop |
| [`fromCommand`](/docs/fromCommand) | Append `< <([command])` to the following command |
| [`fromFile`](/docs/fromFile) | Append `< "[file path]"` to the following command |
| [`fromStdin`](/docs/fromStdin) | Append `< [argument]` to the following command |
| [`fromText`](/docs/fromText) | Append `<<< "[text]"` to the following command |
| [`if`](/docs/if) | Begin an `if` conditional block |
| [`int`](/docs/int) | Define an integer variable |
| [`local`](/docs/local) | Define a local variable |
| [`map`](/docs/map) | Define an associative array variable |
| [`option`](/docs/option) | Add an option to a `case` / `esac` statement |
| [`OR`](/docs/OR) | Used for generating `||` |
| [`printf`](/docs/printf) | `printf` the provided arguments (_with `'%s'` formatter support_) |
| [`putAway`](/docs/putAway) | Delete the current pen (_does not output source code_) |
| [`raw`](/docs/raw) | Perform the following command _without_ `ShellPen` processing of `,`, `AND`, `OR`, `\|`, etc |
| [`return`](/docs/return) | Append a `return [code]` statement |
| [`shift`](/docs/shift) | `shift` a command-line argument |
| [`source`](/docs/source) | Source a shell source file |
| [`then`](/docs/then) | Syntax sugar. Does not write source code. (_`if` conditionals automatically add `then`_) |
| [`toFile`](/docs/toFile) | Append `> [file path]` to the following command |
| [`toStderr`](/docs/toStderr) | Append `>&2` to the following command |
| [`unset`](/docs/unset) | `unset` a variable |
| [`var`](/docs/var) | Define a variable |
| [`while`](/docs/while) | Begin a `while` loop |
| [`writeln`](/docs/writeln) | Append a line of text to source output including indentation |
| [`write`](/docs/write) | Append a string of text to source output including indentation |
