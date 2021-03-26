source shellpen.sh

shellpen -

commandGroup4() {
  - $ someCommand "Argument1" "Hello, world!"
  
  - code
}

@spec.commandGroup4() {
  read -r -d '' expected <<'EXPECTED'
someCommand Argument1 Hello, world!
EXPECTED
  expect { commandGroup4 } toContain "$expected"
}

