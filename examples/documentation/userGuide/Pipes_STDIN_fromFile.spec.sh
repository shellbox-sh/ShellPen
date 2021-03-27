source shellpen.sh

shellpen -

commandGroup1() {
  - while 'IFS=""' read -r line \|\| [ -n '"$line"' ]
    - echo '$line'
  - fromFile some/file.txt done
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
while IFS="" read -r line || [ -n "$line" ]
do
  echo "$line"
done < "some/file.txt"

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

