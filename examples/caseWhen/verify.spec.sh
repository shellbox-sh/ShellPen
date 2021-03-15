EXAMPLE_DIR="${BASH_SOURCE[0]%/*}"

@spec.case_esac_provides_commands_and_subcommands() {
  expect { runExample } toFail "myFunction: expected arguments, received none"
  expect { runExample hello } toEqual "Hello, world!"
  expect { runExample goodnight } toEqual "Goodnight, moon"
}