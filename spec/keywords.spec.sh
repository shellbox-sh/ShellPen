# Misc other things

shellpen -

@spec.source_and_dot() {
  - source "foo.sh"
  expect { - code } toEqual "source foo.sh"

  - cleanSlate
  - . "foo.sh"
  expect { - code } toEqual ". foo.sh"
}