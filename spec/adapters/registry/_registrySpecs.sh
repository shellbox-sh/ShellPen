myAdapter() {
  echo "hello"
}

@spec.register_and_list_adapters() {
  expect { ShellPen adapters registry list } not toContain "dogs" "myAdapter subCommand"

  assert ShellPen adapters registry register "dogs" "myAdapter subCommand"

  expect { ShellPen adapters registry list } toContain "dogs" "myAdapter subCommand"
}

@pending.error_if_try_to_register_with_command_that_cannot_be_run_successfully() {
  :
}

@pending.works_with_aliases() {
  :
}

@pending.works_with_functions() {
  :
}

@pending.works_with_executables() {
  :
}

@pending.cannot_add_name_which_has_already_been_added() {
  :
}