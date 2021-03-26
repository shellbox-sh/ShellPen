source shellpen.sh

shellpen -

commandGroup1() {
  - function hello
    - echo Hello
  - }
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
hello() {
  echo "Hello"
}

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

