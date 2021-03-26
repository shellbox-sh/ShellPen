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
| [`fn`](/docs/fn) | [Alias for `function`](/docs/fn) |
| [`for`](/docs/for) | [Begin a `for` loop](/docs/for) |
| [`fromCommand`](/docs/fromCommand) | [Append `< <([command])` to the following command](/docs/fromCommand) |
| [`fromFile`](/docs/fromFile) | [Append `< "[file path]"` to the following command](/docs/fromFile) |
| [`fromStdin`](/docs/fromStdin) | [Append `< [argument]` to the following command](/docs/fromStdin) |
| [`fromText`](/docs/fromText) | [Append `<<< "[text]"` to the following command](/docs/fromText) |
| [`function`](/docs/function) | [Begin a `function` definition block](/docs/function) |
| [`getIndent`](/docs/getIndent) | [Begin a `function` definition block](/docs/getIndent) |
| [`if`](/docs/if) | [Begin an `if` conditional block](/docs/if) |
| [`int`](/docs/int) | [Define an integer variable](/docs/int) |
| [`local`](/docs/local) | [Define a local variable](/docs/local) |
| [`main`](/docs/main) | [Write a 'main' execution statement for provided function](/docs/main) |
| [`map`](/docs/map) | [Define an associative array variable](/docs/map) |
| [`option`](/docs/option) | [Add an option to a `case` / `esac` statement](/docs/option) |
| [`OR`](/docs/OR) | [Used for generating `||`](/docs/OR) |
| [`prepend`](/docs/prepend) | [Prepend a string of text to source output _without indentation_](/docs/prepend) |
| [`prependln`](/docs/prependln) | [Prepend a line of text to source output _without indentation_](/docs/prependln) |
| [`printf`](/docs/printf) | [`printf` the provided arguments (_with `'%s'` formatter support_)](/docs/printf) |
| [`putAway`](/docs/putAway) | [Delete the current pen (_also deletes source code_)](/docs/putAway) |
| [`raw`](/docs/raw) | [Perform command _without_ processing `,` `AND` `OR` `\|`](/docs/raw) |
| [`return`](/docs/return) | [Append a `return [code]` statement](/docs/return) |
| [`shift`](/docs/shift) | [`shift` a command-line argument](/docs/shift) |
| [`shebang`](/docs/shebang) | [Write '#!' hashbang with provided command path (default: `/bin/bash`)](/docs/shebang) |
| [`source`](/docs/source) | [Source a shell source file](/docs/source) |
| [`then`](/docs/then) | [Syntax sugar (_does not modify source code_)](/docs/then) |
| [`toFile`](/docs/toFile) | [Append `> [file path]` to the following command](/docs/toFile) |
| [`toStderr`](/docs/toStderr) | [Append `>&2` to the following command](/docs/toStderr) |
| [`unset`](/docs/unset) | [`unset` a variable](/docs/unset) |
| [`var`](/docs/var) | [Define a variable](/docs/var) |
| [`while`](/docs/while) | [Begin a `while` loop](/docs/while) |
| [`writeln`](/docs/writeln) | [Append a line of text to source output including indentation](/docs/writeln) |
| [`write`](/docs/write) | [Append a string of text to source output including indentation](/docs/write) |


## Extending Syntax

| [`extend`](/docs/extend) | [Extend `shellpen` with custom syntax](/docs/extend) |
| [`$PEN`](/docs/PEN) | [Write using the current pen](/docs/PEN) |
| [`--push`](/docs/--push) | [Push an item onto the current stack](/docs/--push) |
| [`--pop`](/docs/--pop) | [Pop the last item off the current stack (_rightmost_)](/docs/--pop) |
| [`--get-stack`](/docs/--get-stack) | [Populate a provided array with the full current stack](/docs/--get-stack) |
| [`--get-last-pushed`](/docs/--get-last-pushed) | [Get last item pushed onto the current stack](/docs/--get-last-pushed) |
| [`--eval-last-pushed`](/docs/--eval-last-pushed) | [Evaluate the last item pushed onto the current stack](/docs/--eval-last-pushed) |
| [`--eval-full-stack`](/docs/--eval-full-stack) | [Close every item on current stack (_from right to left_)](/docs/--eval-full-stack) |
| [`--mark-last-not-empty`](/docs/--mark-last-not-empty) | [Mark the last item on current stack as not empty](/docs/--mark-last-not-empty) |
| [`--write-null-if-last-empty`](/docs/--write-null-if-last-empty) | [Append a `:` if the last item in the current stack is empty](/docs/--write-null-if-last-empty) |
