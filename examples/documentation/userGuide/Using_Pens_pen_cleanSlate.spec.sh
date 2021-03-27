source shellpen.sh

shellpen -

commandGroup1() {
  # Create a pen
  # shellpen - # Skipped recreating - pen
  
  # Write some source code
  - echo "Hello, world!"
  
  # Preview the generated source code
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
echo "Hello, world!"
EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

commandGroup2() {
  # Create a pen
  # shellpen - # Skipped recreating - pen
  
  # Write some source code
  - echo "Hello, world!"
  
  # Preview the generated source code
  - code
  
  # Clear the pen's source code
  - cleanSlate
  
  # Preview the generated source code (now empty)
  - code
}

@spec.commandGroup2() {
  read -r -d '' expected <<'EXPECTED'

EXPECTED
  expect { commandGroup2 } toContain "$expected"
}

