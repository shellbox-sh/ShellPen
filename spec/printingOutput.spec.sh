shellpen -

@spec.can_echo() {
  - echo "Hello"

  expect { - code } toEqual 'echo "Hello"'
}

@spec.can_printf() {
  - printf "Hello"
  expect { - code } toEqual 'printf "Hello"'

  - cleanSlate
  - printf '%s' "Hello"
  expect { - code } toEqual "printf '%s' \"Hello\""

  - cleanSlate
  - printf -v someVariable "Hello"
  expect { - code } toEqual "printf -v \"someVariable\" \"Hello\""

  - cleanSlate
  - printf -v someVariable '%s' "Hello"
  expect { - code } toEqual "printf -v \"someVariable\" '%s' \"Hello\""
}

@spec.can_echo_to_STDERR() {
  - toStderr echo "Hello"
  expect { - code } toEqual 'echo "Hello" >&2'
}

@spec.can_printf_to_STDERR() {
  - toStderr printf "Hello"
  expect { - code } toEqual 'printf "Hello" >&2'

  - cleanSlate
  - toStderr printf '%s' "Hello"
  expect { - code } toEqual "printf '%s' \"Hello\" >&2"
}

@spec.can_echo_to_a_file() {
  - toFile "file/path.txt" echo "Hello"
  expect { - code } toEqual 'echo "Hello" > "file/path.txt"'
}

@spec.can_printf_to_a_file() {
  - toFile "file/path.txt" printf '%s' "Hello"
  expect { - code } toEqual "printf '%s' \"Hello\" > \"file/path.txt\""
}