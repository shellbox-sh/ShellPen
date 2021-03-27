source shellpen.sh

shellpen -

commandGroup1() {
  - fn hello
    - local x = 10
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
hello() {
  local x=10
}

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

