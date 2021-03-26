source shellpen.sh

shellpen -

commandGroup1() {
  - toStderr echo "Hello"
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
echo "Hello" >&2

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

