# shellpen sources list
# shellpen sources new [name]
@spec.basics() {
  expect { shellpen sources list } toEqual "default"
  expect { shellpen sources current } toEqual "default"

  shellpen sources new foo

  expect { shellpen sources list } toEqual "default\nfoo"

  declare -a sources=()
  shellpen sources list - sources
  expect "${#sources[@]}" toEqual 2
  expect "${sources[0]}" toEqual "default"
  expect "${sources[1]}" toEqual "foo"

  # Can't create it again
  expect { shellpen sources new foo } toFail "already"
  expect { shellpen sources list } toEqual "default\nfoo"

  # Doesn't switch to it
  expect { shellpen sources current } toEqual "default"

  # Can switch to it
  expect { shellpen sources use } toFail "Argument"
  expect { shellpen sources use iDontExist } toFail "Argument"
  assert shellpen sources use foo

  expect { shellpen sources current } toEqual "foo"

  # Can add one with an associated filepath
  shellpen sources new dog dogs.sh

  # Yeah yeah, I'll get to this
  expect { shellpen sources getFilePath dog } toEqual dogs.sh
  expect { shellpen sources getFilePath foo } toFail "foo"
  expect { shellpen sources getFilePath } toFail "foo"
  refute shellpen sources hasFilePath
  refute shellpen sources hasFilePath foo
  assert shellpen sources hasFilePath dog
  shellpen sources use dog
  assert shellpen sources hasFilePath
  expect { shellpen sources getFilePath } toEqual dog.sh
  expect { shellpen sources files current } toEqual dog.sh

}

# shellpen sources new -

# shellpen sources [name]

# shellpen sources [name] -

# shellpen sources [name] [filepath]

# shellpen sources [name] [filepath] -

# shellpen sources @ [filepath]

# shellpen sources @ [filepath] -

# shellpen sources use [name]