source "examples/documentation/dollar/example.sh"

@spec.example.spec() {
  read -r -d '' expected <<'EXPECTED'
echo "Hello" | sed 's/foo/bar'
EXPECTED
  expect { - code } toContain "$expected"
}

