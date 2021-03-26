source shellpen.sh

shellpen -

commandGroup7() {
  - function hello
    - echo Hello
  - }
  - code
}

@spec.commandGroup7() {
  read -r -d '' expected <<'EXPECTED'
hello() {
  echo "Hello"
}

EXPECTED
  expect { commandGroup7 } toContain "$expected"
}

