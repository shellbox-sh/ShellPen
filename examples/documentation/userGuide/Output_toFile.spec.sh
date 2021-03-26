source shellpen.sh

shellpen -

commandGroup1() {
  - toFile log.log echo "Hello"
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
echo "Hello" > "log.log"

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

