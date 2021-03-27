source shellpen.sh

shellpen -

commandGroup1() {
  - printf -v varname '%s' -- "Hello"
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
printf -v "varname" '%s' -- "Hello"

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

