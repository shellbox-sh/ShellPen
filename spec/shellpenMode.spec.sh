@spec.mode_is_executable_when_run_as_executable() {
  expect { ./ShellPen config dump } toContain "executable"
  expect { ./ShellPen config dump } not toContain "library"
}

@spec.mode_is_library_when_sourced_and_function_run() {
  source ShellPen
  expect { ShellPen config dump } not toContain "executable"
  expect { ShellPen config dump } toContain "library"
}

@spec.can_override_library_into_executable_mode() {
  source ShellPen
  SHELLPEN_SILENCE=true
  SHELLPEN_MODE=executable expect { ShellPen config dump } toContain "executable"
  SHELLPEN_MODE=executable expect { ShellPen config dump } not toContain "library"
}

@spec.cannot_override_executable_into_library_mode() {
  SHELLPEN_SILENCE=true
  SHELLPEN_MODE=library expect { ./ShellPen config dump } toFail "library" "executable"
}