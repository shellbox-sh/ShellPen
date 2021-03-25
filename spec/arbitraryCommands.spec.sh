shellpen -

@spec.arbitrary_commands() {
  - echo "Hello"
  - $ someCommand "arg" '"arg"'

  expect { - code } toEqual 'echo "Hello"
someCommand arg "arg"'
}