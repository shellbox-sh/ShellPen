# Includes unit tests peeking into the __SHELLPEN variables...
@spec.create_list_delete_pens() {
  expect { shellpen pens list } toBeEmpty
  expect "${#__SHELLPEN_SOURCES[@]}" toEqual 0
  expect "$( declare -p | grep SHELLPEN_CONTEXT )" toBeEmpty

  shellpen -

  expect { shellpen pens list } toEqual "-"
  expect "${#__SHELLPEN_SOURCES[@]}" toEqual 1
  expect "$( declare -p | grep SHELLPEN_CONTEXT )" not toBeEmpty

  shellpen :

  expect { shellpen pens list } toEqual "-\n:"
  expect "${#__SHELLPEN_SOURCES[@]}" toEqual 2
  expect "$( declare -p | grep SHELLPEN_CONTEXT )" not toBeEmpty

  : putAway

  expect { shellpen pens list } toEqual "-"
  expect "${#__SHELLPEN_SOURCES[@]}" toEqual 1
  expect "$( declare -p | grep SHELLPEN_CONTEXT )" not toBeEmpty

  - putAway

  expect { shellpen pens list } toBeEmpty
  expect "${#__SHELLPEN_SOURCES[@]}" toEqual 0
  expect "$( declare -p | grep SHELLPEN_CONTEXT )" toBeEmpty
}

@spec.requires_one_argument() {
  expect { shellpen pens new } toFail "shellpen pens new: requires one argument [pen name], none provided"
  expect { shellpen pens new one two } toFail "shellpen pens new: requires only one argument [pen name], 2 provided"
}

@spec.cannot_create_pen_if_one_with_same_name_already_exists() {
  shellpen -

  expect { shellpen - } toFail "exists"

  expect { shellpen pens list } toEqual "-"
  expect "${#__SHELLPEN_SOURCES[@]}" toEqual 1
}