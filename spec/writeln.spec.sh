@spec.can_write_lines_of_code_to_source() {
  shellpen comment "Hello arbitrary code"
  expect { shellpen result } toContain "# Hello arbitrary code"

  shellpen local foo="bar"
  expect { shellpen result } toContain "# Hello arbitrary code" "local foo=\"bar\""
}