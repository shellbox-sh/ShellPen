shellpen -

extensionOne() {
  if [ "$1" = hello ]
  then
    $PEN comment "Hello, world!"
    return 0
  fi
  return 1
}

extensionTwo() {
  if [ "$1" = someArg ] && [ "$2" = foo ]
  then
    shift
    shift
    [ "$1" = blowUp ] && { echo "KABOOM from extension with $* args" >&2; return 2; }
    $PEN echo "foo called with $# arguments: $*"
    return 0
  fi
  return 1
}

@spec.can_extend_dsl() {
  shellpen extend extensionOne

  - var x 5
  - hello
  - echo '$x'

  expect { - code } toEqual 'x=5
# Hello, world!
echo "$x"'
}

@spec.two_extensions() {
  shellpen extend extensionOne
  shellpen extend "extensionTwo someArg"

  - var x 5
  - hello
  - foo --and --some --arguments
  - echo '$x'

  expect { - code } toEqual 'x=5
# Hello, world!
echo "foo called with 3 arguments: --and --some --arguments"
echo "$x"'
}

@spec.extension_can_error() {
  shellpen extend extensionOne
  shellpen extend "extensionTwo someArg"

  - var x 5
  - hello

  run - foo blowUp boom
  echo "DID IT BLOW UP? RETURN CODE [$EXITCODE]"

  expect { - foo blowUp boom } toFail "KABOOM from extension with blowUp boom args"

  # Nothing was written by foo
  expect { - code } toEqual 'x=5
# Hello, world!'
}

@pending.can_push_and_pop_onto_and_off_of_stack() {
  :
}

@pending.can_read_stack() {
  :
}

@pending.can_use_write_null_if_not_empty() {
  :
}