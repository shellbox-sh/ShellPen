shellpen -

@spec.can_write_main_given_a_function() {
  - main myFunction

  expect { - code } toEqual '[ "${BASH_SOURCE[0]}" = "$0" ] && "myFunction" "$@"'
}

@spec.can_prepend_a_shebang() {
  - comment Hello
  - shebang
  expect { - code } toEqual "#! /bin/bash\n# Hello"

  - cleanSlate
  - comment Hello
  - shebang some custom thingy

  expect { - code } toEqual "#! some custom thingy\n# Hello"
}