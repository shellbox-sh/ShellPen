shellpen -

@spec.arbitrary_commands() {
  - echo "Hello"
  - $ someCommand "arg" '"arg"' "I have spaces"

  expect { - code } toEqual 'echo "Hello"
someCommand arg "arg" I have spaces'
}

@spec.arbitrary_commands_with_double_quotes() {
  - echo "Hello"
  - $$ someCommand "arg" '"arg"' "I have spaces"

  expect { - code } toEqual 'echo "Hello"
someCommand "arg" ""arg"" "I have spaces"'
}