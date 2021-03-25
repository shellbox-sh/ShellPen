shellpen -

@spec.normally_this_echo_command_would_be_interpreted_as_a_semicolon() {
  - echo ,
  expect { - code } toEqual 'echo;' # whoops! jeepers!
}

@spec.echo_will_accept_strings_and_AND_OR_etc_are_ignored_if_quoted() {
  - raw echo ,
  expect { - code } toEqual 'echo ","' # phew! ok
}

@spec.echo_with_all_the_things() {
  - raw echo , AND OR \| , cool
  expect { - code } toEqual 'echo ", AND OR | , cool"'
}