source shellpen.sh

shellpen -

commandGroup1() {
  - printf "Hello"
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
printf "Hello"

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

