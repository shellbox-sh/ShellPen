EXAMPLE_DIR="${BASH_SOURCE[0]%/*}"

@spec.some_syntax_checking() {
  expect { printSource } toContain "local command=\"\$1\""
}