source shellpen.sh

shellpen -

commandGroup5() {
  - $$ someCommand "Argument1" "Hello, world!"
  
  - code
}

@spec.commandGroup5() {
  read -r -d '' expected <<'EXPECTED'
someCommand "Argument1" "Hello, world!"
EXPECTED
  expect { commandGroup5 } toContain "$expected"
}

