@spec.can_get_version() {
  expect { shellpen --version } toContain "ShellPen version"
}