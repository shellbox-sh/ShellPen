source shellpen.sh

shellpen -

commandGroup1() {
  - writeln "Hello this is some code text"
  - writeln "More code goes here"
  
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
Hello this is some code text
More code goes here
EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

