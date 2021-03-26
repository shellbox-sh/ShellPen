source shellpen.sh

shellpen -

commandGroup1() {
  - map x
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
declare -A x

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

