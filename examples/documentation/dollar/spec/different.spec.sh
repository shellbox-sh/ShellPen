source "examples/documentation/dollar/different.sh"

@spec.different.spec() {
  read -r -d '' expected <<'EXPECTED'
echo "Hello FOO BAR" | sed 's/foo/bar'
EXPECTED
  expect { - code } toContain "$expected"
}

