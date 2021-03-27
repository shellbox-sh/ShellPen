shellpen -

@spec.can_pipe_commands.echo() {
  - echo "Hello" \| $ sed "'s/foo/bar/g'"
  expect { - code } toEqual "echo \"Hello\" | sed 's/foo/bar/g'"
}

@spec.can_pipe_commands.printf() {
  - printf "Hello" \| $ sed "'s/foo/bar/g'"
  expect { - code } toEqual "printf \"Hello\" | sed 's/foo/bar/g'"
}

@spec.can_pipe_commands.echo_phrase() {
  - echo "Hello how are you?" \| $ sed "'s/foo/bar/g'"
  expect { - code } toEqual "echo \"Hello how are you?\" | sed 's/foo/bar/g'"

  - cleanSlate
  - echo Hello how are you? \| $ sed "'s/foo/bar/g'"
  expect { - code } toEqual "echo \"Hello\" \"how\" \"are\" \"you?\" | sed 's/foo/bar/g'"
}

@spec.can_pipe_commands.printf_phrase() {
  - printf '%s' "Hello how are you?" \| $ sed "'s/foo/bar/g'"
  expect { - code } toEqual "printf '%s' \"Hello how are you?\" | sed 's/foo/bar/g'"
}

@spec.can_pipe_commands.arbitrary() {
  - $ hello "world" \| $ sed "'s/foo/bar/g'"
  expect { - code } toEqual "hello world | sed 's/foo/bar/g'"
}

@spec.can_pipe_and_then_AND() {
  - $ hello "world" \| $ sed "'s/foo/bar/g'" AND printf '%s' "Hello" AND return 1
  expect { - code } toEqual "hello world | sed 's/foo/bar/g' && printf '%s' \"Hello\" && return 1"
}

@pending.can_pipe_and_then_AND_with_curly_statement() {
  :
}