source shellpen.sh

shellpen -

commandGroup1() {
  - $$ someCommand "Argument1" "Hello, world!"
  
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
someCommand "Argument1" "Hello, world!"
EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

