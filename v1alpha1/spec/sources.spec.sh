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
  shellpen sources new dog dog.sh

  assert shellpen sources getFilePath dog
  refute shellpen sources getFilePath
  expect { shellpen sources getFilePath dog } toEqual dog.sh
  refute shellpen sources getFilePath
  refute shellpen sources getFilePath foo
  
  shellpen sources use dog

  dumpShellPenVariables

  assert shellpen sources getFilePath
  expect { shellpen sources getFilePath } toEqual dog.sh
}

# shellpen sources new -

# shellpen sources [name]

# shellpen sources [name] -

# shellpen sources [name] [filepath]

# shellpen sources [name] [filepath] -

# shellpen sources @ [filepath]

# shellpen sources @ [filepath] -

# shellpen sources use [name]