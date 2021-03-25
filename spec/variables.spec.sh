shellpen -

@spec.global() {
  - var x=5
  expect { - code } toEqual "x=5"

  - cleanSlate
  - var x 5
  expect { - code } toEqual "x=5"

  - cleanSlate
  - var x = 5
  expect { - code } toEqual "x=5"

  - cleanSlate
  - var x
  expect { - code } toEqual "x=''"

  - cleanSlate
  - var x '"hi"'
  expect { - code } toEqual 'x="hi"'
}

@spec.local() {
  - local x=5
  expect { - code } toEqual "local x=5"

  - cleanSlate
  - local x 5
  expect { - code } toEqual "local x=5"

  - cleanSlate
  - local x = 5
  expect { - code } toEqual "local x=5"

  - cleanSlate
  - local x
  expect { - code } toEqual "local x"

  - cleanSlate
  - local x '"hi"'
  expect { - code } toEqual 'local x="hi"'
}

@spec.declare.int() {
  - int x=5
  expect { - code } toEqual "declare -i x=5"

  - cleanSlate
  - int x 5
  expect { - code } toEqual "declare -i x=5"

  - cleanSlate
  - int x = 5
  expect { - code } toEqual "declare -i x=5"

  - cleanSlate
  - int x
  expect { - code } toEqual "declare -i x"
}

@spec.declare.int.global() {
  - int -g x=5
  expect { - code } toEqual "declare -g -i x=5"

  - cleanSlate
  - int -g x 5
  expect { - code } toEqual "declare -g -i x=5"

  - cleanSlate
  - int -g x = 5
  expect { - code } toEqual "declare -g -i x=5"

  - cleanSlate
  - int -g x
  expect { - code } toEqual "declare -g -i x"
}

@spec.declare.array() {
  - array x
  expect { - code } toEqual "declare -a x"

  - cleanSlate
  - array 'x=()'
  expect { - code } toEqual "declare -a x=()"

  - cleanSlate
  - array 'x=("$@")'
  expect { - code } toEqual "declare -a x=(\"\$@\")"

  - cleanSlate
  - array x '()'
  expect { - code } toEqual "declare -a x=()"

  - cleanSlate
  - array x '("$@")'
  expect { - code } toEqual "declare -a x=(\"\$@\")"

  - cleanSlate
  - array x = 5
  expect { - code } toEqual "declare -a x=5"

  - cleanSlate
  - array x
  expect { - code } toEqual "declare -a x"
}

@spec.declare.array.global() {
  - array -g x
  expect { - code } toEqual "declare -g -a x"

  - cleanSlate
  - array -g 'x=()'
  expect { - code } toEqual "declare -g -a x=()"

  - cleanSlate
  - array -g 'x=("$@")'
  expect { - code } toEqual "declare -g -a x=(\"\$@\")"

  - cleanSlate
  - array -g x '()'
  expect { - code } toEqual "declare -g -a x=()"

  - cleanSlate
  - array -g x '("$@")'
  expect { - code } toEqual "declare -g -a x=(\"\$@\")"

  - cleanSlate
  - array -g x = 5
  expect { - code } toEqual "declare -g -a x=5"

  - cleanSlate
  - array -g x
  expect { - code } toEqual "declare -g -a x"
}

@spec.declare.array.associative() {
  - hash x
  expect { - code } toEqual "declare -A x"

  - cleanSlate
  - hash 'x=()'
  expect { - code } toEqual "declare -A x=()"

  - cleanSlate
  - hash 'x=("$@")'
  expect { - code } toEqual "declare -A x=(\"\$@\")"

  - cleanSlate
  - hash x '()'
  expect { - code } toEqual "declare -A x=()"

  - cleanSlate
  - hash x '("$@")'
  expect { - code } toEqual "declare -A x=(\"\$@\")"

  - cleanSlate
  - hash x = 5
  expect { - code } toEqual "declare -A x=5"

  - cleanSlate
  - hash x
  expect { - code } toEqual "declare -A x"

  - cleanSlate
  - array -A x
  expect { - code } toEqual "declare -A x"

  - cleanSlate
  - array -A 'x=()'
  expect { - code } toEqual "declare -A x=()"

  - cleanSlate
  - array -A 'x=("$@")'
  expect { - code } toEqual "declare -A x=(\"\$@\")"

  - cleanSlate
  - array -A x '()'
  expect { - code } toEqual "declare -A x=()"

  - cleanSlate
  - array -A x '("$@")'
  expect { - code } toEqual "declare -A x=(\"\$@\")"

  - cleanSlate
  - array -A x = 5
  expect { - code } toEqual "declare -A x=5"

  - cleanSlate
  - array -A x
  expect { - code } toEqual "declare -A x"
}

@spec.declare.array.associative.global() {
  - hash -g x
  expect { - code } toEqual "declare -g -A x"

  - cleanSlate
  - hash -g 'x=()'
  expect { - code } toEqual "declare -g -A x=()"

  - cleanSlate
  - hash -g 'x=("$@")'
  expect { - code } toEqual "declare -g -A x=(\"\$@\")"

  - cleanSlate
  - hash -g x '()'
  expect { - code } toEqual "declare -g -A x=()"

  - cleanSlate
  - hash -g x '("$@")'
  expect { - code } toEqual "declare -g -A x=(\"\$@\")"

  - cleanSlate
  - hash -g x = 5
  expect { - code } toEqual "declare -g -A x=5"

  - cleanSlate
  - hash -g x
  expect { - code } toEqual "declare -g -A x"

  - cleanSlate
  - array -g -A x
  expect { - code } toEqual "declare -g -A x"

  - cleanSlate
  - array -g -A 'x=()'
  expect { - code } toEqual "declare -g -A x=()"

  - cleanSlate
  - array -g -A 'x=("$@")'
  expect { - code } toEqual "declare -g -A x=(\"\$@\")"

  - cleanSlate
  - array -g -A x '()'
  expect { - code } toEqual "declare -g -A x=()"

  - cleanSlate
  - array -g -A x '("$@")'
  expect { - code } toEqual "declare -g -A x=(\"\$@\")"

  - cleanSlate
  - array -g -A x = 5
  expect { - code } toEqual "declare -g -A x=5"

  - cleanSlate
  - array -g -A x
  expect { - code } toEqual "declare -g -A x"
}

@spec.unset() {
  - unset variableName
  expect { - code } toEqual "unset variableName"

  - cleanSlate
  - unset '"variableName"'
  expect { - code } toEqual 'unset "variableName"'
}

@spec.declare() {
  - declare '"foo=bar"'
  - declare -p foo
  - declare -g -i x=5
  - declare -g -A 'items=([hi]="there")'
  expect { - code } toEqual 'declare "foo=bar"
declare -p foo
declare -g -i x=5
declare -g -A items=([hi]="there")'
}