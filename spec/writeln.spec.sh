@spec.shellpen_default_source_code_is_empty_by_default() {
  expect { _ result } toBeEmpty
}

@spec.can_write_lines_of_code_to_source() {
  _ writeln "# Hello arbitrary code"
  expect { _ result } toEqual "# Hello arbitrary code"

  _ writeln 'local foo="bar"'
  expect { _ result } toEqual "# Hello arbitrary code\nlocal foo=\"bar\""
}