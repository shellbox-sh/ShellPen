source shellpen.sh

shellpen -

commandGroup() {
  # Create a pen
  # shellpen - # Skipped recreating - pen
  
  # Write some source code
  - echo "Hello, world!"
  
  # Preview the generated source code
  - code
}

@spec.commandGroup() {
  read -r -d '' expected <<'EXPECTED'
echo "Hello, world!"
EXPECTED
  expect { commandGroup } toContain "$expected"
}

