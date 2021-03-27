source shellpen.sh

shellpen -

commandGroup1() {
  - shebang
  
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
#! /bin/bash
EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

