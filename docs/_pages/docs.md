---
title: '🖋️ Command Reference'
permalink: /docs
layout: single
sidebar:
  nav: 'command_reference'
---

| [`.`](/docs/dot) | [Source a shell source file via `.`](/docs/dot) |
| [`,`](/docs/,) | [Output a `;` semicolon](/docs/,) |
| [`$`](/docs/$) | [Run any arbitrary command](/docs/$) |
| [`:`](/docs/colon) | [Output a line containing the `:` null character](/docs/colon) |
| [`::`](/docs/colon-colon) | [Write a `;;` for use in `case`/`esac` `option`s](/docs/colon-colon) |
| [`[`](/docs/[) | [Starts a line with a `[` statement, e.g. `[ '$#' -eq 0 ] AND ...`](/docs/[) |
| [`[[`](/docs/[[) | [Starts a line with a `[[` statement, e.g. `[[ '"$1"' =~ ^-- ]] AND ...`](/docs/[[) |
| [`{`](/docs/{) | [Start a `{` block](/docs/{) |
| [`{{ '{{' }}`](/docs/{{ '{{' }}) | [Write a `((` arithmetic statement (_replaces `}}` with `))`_)](/docs/{{ '{{' }}) |
| [`}`](/docs/}) | [Closes a function or an open `{` block](/docs/}) |
| [`appendln`](/docs/appendln) | [Append a line of text to source output _without indentation_](/docs/appendln) |
| [`append`](/docs/append) | [Append a string of text to source output _without indentation_](/docs/append) |
| [`AND`](/docs/AND) | [Used for generating `&&`](/docs/AND) |
| [`array`](/docs/array) | [Define an array variable](/docs/array) |
| [`case`](/docs/case) | [Begin a `case` / `esac` statement](/docs/case) |
| [`cleanSlate`](/docs/cleanSlate) | [Clean the slate of the current pen (_resets source code_)](/docs/cleanSlate) |
| [`code`](/docs/code) | [Output the code for the current pen (_does not modify source_)](/docs/code) |
| [`comment`](/docs/comment) | [Append a `#` command line](/docs/comment) |
| [`declare`](/docs/declare) | [Declare a variable (shortcuts available: [`int`](/docs/int), [`array`](/docs/array), [`map`](/docs/map))](/docs/declare) |
| [`done`](/docs/done) | [End a `for` or `while` loop](/docs/done) |
| [`do`](/docs/do) | [Syntax sugar (_does not modify source code_)](/docs/do) |
| [`echo`](/docs/echo) | [`echo` the provided arguments (_wrapped in `"..."`_)](/docs/echo) |
| [`elif`](/docs/elif) | [Add an `elif` to an `if` conditional block](/docs/elif) |
| [`else`](/docs/else) | [Add an `else` to an `if` conditional block](/docs/else) |
| [`esac`](/docs/esac) | [End a `case` / `esac` statement](/docs/esac) |
| [`fi`](/docs/fi) | [End an `if` conditional block](/docs/fi) |
| [`fn`](/docs/fn) | [Begin a `function` definition block](/docs/fn) |
| [`for`](/docs/for) | [Begin a `for` loop](/docs/for) |
| [`fromCommand`](/docs/fromCommand) | [Append `< <([command])` to the following command](/docs/fromCommand) |
| [`fromFile`](/docs/fromFile) | [Append `< "[file path]"` to the following command](/docs/fromFile) |
| [`fromStdin`](/docs/fromStdin) | [Append `< [argument]` to the following command](/docs/fromStdin) |
| [`fromText`](/docs/fromText) | [Append `<<< "[text]"` to the following command](/docs/fromText) |
| [`if`](/docs/if) | [Begin an `if` conditional block](/docs/if) |
| [`int`](/docs/int) | [Define an integer variable](/docs/int) |
| [`local`](/docs/local) | [Define a local variable](/docs/local) |
| [`map`](/docs/map) | [Define an associative array variable](/docs/map) |
| [`option`](/docs/option) | [Add an option to a `case` / `esac` statement](/docs/option) |
| [`OR`](/docs/OR) | [Used for generating `||`](/docs/OR) |
| [`printf`](/docs/printf) | [`printf` the provided arguments (_with `'%s'` formatter support_)](/docs/printf) |
| [`putAway`](/docs/putAway) | [Delete the current pen (_also deletes source code_)](/docs/putAway) |
| [`raw`](/docs/raw) | [Perform command _without_ processing `,` `AND` `OR` `\|`](/docs/raw) |
| [`return`](/docs/return) | [Append a `return [code]` statement](/docs/return) |
| [`shift`](/docs/shift) | [`shift` a command-line argument](/docs/shift) |
| [`source`](/docs/source) | [Source a shell source file](/docs/source) |
| [`then`](/docs/then) | [Syntax sugar (_does not modify source code_)](/docs/then) |
| [`toFile`](/docs/toFile) | [Append `> [file path]` to the following command](/docs/toFile) |
| [`toStderr`](/docs/toStderr) | [Append `>&2` to the following command](/docs/toStderr) |
| [`unset`](/docs/unset) | [`unset` a variable](/docs/unset) |
| [`var`](/docs/var) | [Define a variable](/docs/var) |
| [`while`](/docs/while) | [Begin a `while` loop](/docs/while) |
| [`writeln`](/docs/writeln) | [Append a line of text to source output including indentation](/docs/writeln) |
| [`write`](/docs/write) | [Append a string of text to source output including indentation](/docs/write) |
