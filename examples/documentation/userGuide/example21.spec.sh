source shellpen.sh

shellpen -

commandGroup1() {
  - toStderr $ myCommand arg1 arg2
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
myCommand arg1 arg2 >&2

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

