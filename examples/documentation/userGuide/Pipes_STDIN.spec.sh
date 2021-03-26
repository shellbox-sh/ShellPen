source shellpen.sh

shellpen -

commandGroup1() {
  - echo '$1' \| $ sed "'s/foo/bar/'" \| $ head -1 \| $ xargs -n1 echo
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
echo "$1" | sed 's/foo/bar/' | head -1 | xargs -n1 echo

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

