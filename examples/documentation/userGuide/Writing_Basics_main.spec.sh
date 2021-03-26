source shellpen.sh

shellpen -

commandGroup1() {
  - function hello
    - :
  - }
  
  - main hello
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
hello() {
  :
}
[ "${BASH_SOURCE[0]}" = "$0" ] && "hello" "$@"

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

