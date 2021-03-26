source shellpen.sh

shellpen -

commandGroup1() {
  - array x
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
declare -a x

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

