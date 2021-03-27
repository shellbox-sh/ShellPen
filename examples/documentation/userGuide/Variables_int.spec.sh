source shellpen.sh

shellpen -

commandGroup1() {
  - int x = 10
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
declare -i x=10

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

