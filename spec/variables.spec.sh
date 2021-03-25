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

@pending.declare.array() {
  - array x
  expect { - code } toEqual "declare -a x"

  - cleanSlate
  - array x=()
  expect { - code } toEqual "declare -a x=()"

  - cleanSlate
  - array 'x=("$@")'
  expect { - code } toEqual "declare -a x=(\"\$@\")"

  - cleanSlate
  - array x ()
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

@pending.declare.array.global() {
  :
}

@pending.declare.array.associative() {
  :
}

@pending.unset() {
  :
}

@pending.dump() {
  :
}