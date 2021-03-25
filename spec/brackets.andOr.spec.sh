shellpen -

@spec.one_liner_single_conditional.AND.single_brackets() {
  - [ '$#' -eq 0 ] AND echo "Hello"
  expect { - code } toEqual '[ $# -eq 0 ] && echo "Hello"'
}

@spec.one_liner_double_conditional.AND.single_brackets() {
  - [ '$#' -eq 0 ] OR [ '$#' -gt 1 ] AND echo "Hello"
  expect { - code } toEqual '[ $# -eq 0 ] || [ $# -gt 1 ] && echo "Hello"'
}

@spec.one_liner_single_conditional.AND.double_brackets() {
  - [[ '"$1"' =~ ^-- ]] AND echo "Flag"
  expect { - code } toEqual '[[ "$1" =~ ^-- ]] && echo "Flag"'
}

@spec.one_liner_double_conditional.AND.double_brackets() {
  - [[ '"$1"' =~ ^-- ]] OR [ '$#' -gt 4 ] AND echo "Flag or more"
  expect { - code } toEqual '[[ "$1" =~ ^-- ]] || [ $# -gt 4 ] && echo "Flag or more"'
}

@spec.one_liner_with_echo_and_return.single_brackets() {
  - [ '$#' -eq 0 ] AND { echo "No arguments" , return 1 , }
  expect { - code } toEqual '[ $# -eq 0 ] && { echo "No arguments"; return 1; }'
}

@spec.one_liner_with_echo_and_return.double_brackets() {
  - [[ '"$1"' =~ ^-- ]] AND { echo "No arguments" , return 1 , }
  expect { - code } toEqual '[[ "$1" =~ ^-- ]] && { echo "No arguments"; return 1; }'
}

@spec.supports_the_classic_return_error_conditional() {
  - [ '$#' -eq 0 ] AND { toStderr echo "No arguments" , return 1 , }
  expect { - code } toEqual '[ $# -eq 0 ] && { echo "No arguments" >&2; return 1; }'
}