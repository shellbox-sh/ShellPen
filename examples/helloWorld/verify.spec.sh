EXAMPLE_DIR="${BASH_SOURCE[0]%/*}"

@spec.function_says_hello_world_with_argument() {
  expect { runExample } toEqual "Hello!"
  expect { runExample Rebecca } toEqual "Hello Rebecca!"
}