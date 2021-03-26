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

  expect { - foo blowUp boom } toFail "KABOOM from extension with blowUp boom args"

  # Nothing was written by foo
  expect { - code } toEqual 'x=5
# Hello, world!'
}

extensionUsingTheStack() {
  case "$1" in
    openBlock)
      shift
      $PEN comment Opened Block $*
      $PEN --push "closeBlock"
      return 0
      ;;
    closeBlock)
      $PEN --write-null-if-last-empty
      $PEN --pop
      $PEN comment Closed Block
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

@spec.can_push_and_pop_onto_and_off_of_stack() {
  shellpen extend extensionUsingTheStack

  - openBlock foo
  
  expect { - code } toEqual '# Opened Block foo
  :
# Closed Block'

  - cleanSlate
  - openBlock foo
    - echo "Hello"
  
  expect { - code } toEqual '# Opened Block foo
  echo "Hello"
# Closed Block'

  - cleanSlate
  - openBlock foo
    - echo "Hello"
    - echo "World"
  - closeBlock
  
  expect { - code } toEqual '# Opened Block foo
  echo "Hello"
  echo "World"
# Closed Block'
}

brokenExtensionUsingTheStack() {
  case "$1" in
    openBlock)
      shift
      $PEN comment Opened Block $*
      $PEN --push "closeBlock"
      return 0
      ;;
    closeBlock)
      $PEN --write-null-if-last-empty
      # $PEN --pop # <--- example where this was forgotten, will result in an error.
      $PEN comment Closed Block
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

@spec.provides_an_error_if_your_pushed_command_does_not_pop() {
  shellpen extend brokenExtensionUsingTheStack

  - openBlock foo
  
  expect { - code } toFail "shellpen [Extension Error] Expected 'closeBlock' to --pop stack"
}