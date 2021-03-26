source shellpen.sh

shellpen -

commandGroup1() {
  - for arg in '"$@"'
    - echo Argument: '$@'
  - done
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
for arg in "$@"
do
  echo "Argument:" "$@"
done

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

