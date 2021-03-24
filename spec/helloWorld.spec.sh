@spec.helloWorld() {
  shellpen -

  - echo "Hello, world!"

  expect { - code } toEqual 'echo "Hello, world!"'
}

@spec.requires_arguments() {
  expect { shellpen } toFail "required"
  expect { shellpen foo bar } toFail "not found"
}