source shellpen.sh

shellpen -

commandGroup1() {
  - [ '$#' -eq 0 ] AND toStderr echo "At least one argument is required"
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
[ $# -eq 0 ] && echo "At least one argument is required" >&2

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

commandGroup1() {
  - [ '$#' -eq 0 ] AND { toStderr echo "Argument is required" , return 1 , }
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
[ $# -eq 0 ] && { echo "Argument is required" >&2; return 1; }

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

