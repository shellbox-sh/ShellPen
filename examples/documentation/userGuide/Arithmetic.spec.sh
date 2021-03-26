source shellpen.sh

shellpen -

commandGroup1() {
  - int i=42
  - {{ i++ }}
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
declare -i i=42
(( i++ ))

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

