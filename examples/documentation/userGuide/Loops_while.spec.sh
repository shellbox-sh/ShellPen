source shellpen.sh

shellpen -

commandGroup1() {
  - while [ '$#' -gt 0 ]
    - echo Argument: '$1'
    - shift
  - done
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
while [ $# -gt 0 ]
do
  echo "Argument:" "$1"
  shift
done

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

