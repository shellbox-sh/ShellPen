source shellpen.sh

shellpen -

commandGroup1() {
  - case '$1' in
    - option "foo"
      - echo "Hello from foo"
      - ::
    - option "bar"
      - ::
    - option '*'
      - echo "Other option!"
      - ::
  - esac
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
case "$1" in
  foo)
    echo "Hello from foo"
    ;;
  bar)
    :
    ;;
  *)
    echo "Other option!"
    ;;
esac

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

