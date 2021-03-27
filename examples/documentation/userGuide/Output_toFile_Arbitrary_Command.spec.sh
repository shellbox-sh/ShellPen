source shellpen.sh

shellpen -

commandGroup1() {
  - toFile log.log $ myCommand arg1 arg2
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
myCommand arg1 arg2 > "log.log"

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

