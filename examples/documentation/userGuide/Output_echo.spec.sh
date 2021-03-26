source shellpen.sh

shellpen -

commandGroup1() {
  - echo "Hello, world" foo bar
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
echo "Hello, world" "foo" "bar"

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

