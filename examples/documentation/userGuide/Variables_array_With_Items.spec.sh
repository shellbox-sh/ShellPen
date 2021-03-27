source shellpen.sh

shellpen -

commandGroup1() {
  - array x Hello World '$@'
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
declare -a x=("Hello" "World" "$@")

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

