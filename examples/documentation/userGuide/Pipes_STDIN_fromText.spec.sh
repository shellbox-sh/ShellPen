source shellpen.sh

shellpen -

commandGroup1() {
  - while 'IFS=""' read -r line \|\| [ -n '"$line"' ]
    - echo '$line'
  - fromText '$text' done
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
while IFS="" read -r line || [ -n "$line" ]
do
  echo "$line"
done <<< "$text"

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

