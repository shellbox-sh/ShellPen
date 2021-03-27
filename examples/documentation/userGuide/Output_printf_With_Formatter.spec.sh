source shellpen.sh

shellpen -

commandGroup1() {
  - printf '%s' "Hello"
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
printf '%s' "Hello"

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

