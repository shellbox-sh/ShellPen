@spec.helloWorld() {
  shellpen -

  - writeln "Hello, world!"

  expect { - code } toEqual 'echo "Hello, world!"'
}