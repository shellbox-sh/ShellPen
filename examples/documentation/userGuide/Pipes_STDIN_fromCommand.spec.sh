source shellpen.sh

shellpen -

commandGroup1() {
  - var text = '"$(<"$filePath")"'
  - while 'IFS=""' read -r line \|\| [ -n '"$line"' ]
    - echo '$line'
  - fromCommand "printf '%s' \"\$text\"" done
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
text="$(<"$filePath")"
while IFS="" read -r line || [ -n "$line" ]
do
  echo "$line"
done < <(printf '%s' "$text")

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

