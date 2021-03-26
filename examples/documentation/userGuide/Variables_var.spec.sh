source shellpen.sh

shellpen -

commandGroup1() {
  - var x = 10
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
x=10

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

