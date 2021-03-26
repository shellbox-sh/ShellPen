source shellpen.sh

shellpen -

commandGroup1() {
  - map x [Hello]=World [Foo]="Foo Bar"
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
declare -A x=([Hello]="World" [Foo]="Foo Bar")

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

