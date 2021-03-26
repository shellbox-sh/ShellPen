source shellpen.sh

shellpen -

commandGroup3() {
  - writeln "Hello this is some code text"
  - writeln "More code goes here"
  
  - code
}

@spec.commandGroup3() {
  read -r -d '' expected <<'EXPECTED'
Hello this is some code text
More code goes here
EXPECTED
  expect { commandGroup3 } toContain "$expected"
}

