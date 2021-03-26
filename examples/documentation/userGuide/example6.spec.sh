source shellpen.sh

shellpen -

commandGroup6() {
  - shebang
  
  - code
}

@spec.commandGroup6() {
  read -r -d '' expected <<'EXPECTED'
#! /bin/bash
EXPECTED
  expect { commandGroup6 } toContain "$expected"
}

