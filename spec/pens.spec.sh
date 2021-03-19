@spec.create_pen_for_default_source() {
  expect { shellpen pens list } toEqual "default"

  assert shellpen pen :foo

  expect { shellpen pens list } toEqual "default\n:foo"

  expect { shellpen pens getSource :foo } toEqual "default"
}

@spec.create_pen_for_existing_source() {
  shellpen sources new foo
  expect { shellpen sources list } toEqual "default\nfoo"
  expect { shellpen pens list } toEqual "default"

  assert shellpen pen :foo foo

  expect { shellpen pens list } toEqual "default\n:foo"
  expect { shellpen pens getSource :foo } toEqual "foo"
  expect { shellpen sources list } toEqual "default\nfoo"
}

@spec.create_pen_for_new_source() {
  expect { shellpen sources list } toEqual "default"
  expect { shellpen pens list } toEqual "default"

  assert shellpen pen :foo foo

  expect { shellpen pens list } toEqual "default\n:foo"
  expect { shellpen pens getSource :foo } toEqual "foo"
  expect { shellpen sources list } toEqual "default\nfoo"
}

@spec.invalid_alias_name() {
  SHELLPEN_SILENCE=true
  expect { shellpen pen :foo - ^this:@wont\$Wo=rk } toFail "Alias name '^this:@wont\$Wo=rk' is not valid"
}

@spec.writes_to_the_correct_source() {
  shellpen pen :foo foo.sh
  shellpen pen :bar bar.sh

  :foo comment "Hello from foo"
  :foo write "# FOO"

  :bar comment "Hello from bar"
  :bar write "# BAR"

  shellpen sources use foo.sh
  expect { shellpen preview } toContain "Hello from foo" "FOO"
  expect { shellpen preview } not toContain "bar" "BAR"

  shellpen sources use bar.sh
  expect { shellpen preview } toContain "Hello from bar" "BAR"
  expect { shellpen preview } not toContain "foo" "FOO"

}

@spec.can_change_which_source_a_pen_writes_to() {
  shellpen pen :pen

  expect { shellpen sources list } toEqual "default"
  expect { shellpen pens list } toEqual "default\n:pen"

  :pen comment "Hello"

  shellpen sources new differentSource

  expect { shellpen sources list } toEqual "default\ndifferentSource"
  expect { shellpen pens list } toEqual "default\n:pen"
  expect { shellpen preview } toContain "Hello"

  :pen switchTo differentSource

  :pen comment "Different Source"

  expect { shellpen preview } toContain "Hello"
  expect { shellpen preview } not toContain "Different Source"

  shellpen sources use differentSource

  expect { shellpen preview } not toContain "Hello"
  expect { shellpen preview } toContain "Different Source"

  # Or, without using the pen function:
  shellpen pens switchSource :pen default

  :pen comment "Back to default"

  shellpen sources use default
  expect { shellpen preview } toContain "Back to default"

  shellpen sources use differentSource
  expect { shellpen preview } not toContain "Back to default"
}

@pending.can_provide_a_file_path_as_well_when_making_new_sources() {
  :
}

@pending.can_delete_a_pen() {
  : # putAway
}