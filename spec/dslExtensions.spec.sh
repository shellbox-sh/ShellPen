shellpen -

extensionOne() {
  if [ "$1" = hello ]
  then
    shellpen --extensionWrite comment "Hello, world!"
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
    shellpen --extensionWrite echo "foo called with $# arguments: $*"
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