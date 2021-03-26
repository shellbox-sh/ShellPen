source shellpen.sh

shellpen -

commandGroup1() {
  - if [ '$#' -eq 0 ]
    - comment Hello
  - elif [ '$#' -eq 1 ]
  - else
    - echo "Hello, world"
  - fi
  - code
}

@spec.commandGroup1() {
  read -r -d '' expected <<'EXPECTED'
if [ $# -eq 0 ]
then
  # Hello
  :
elif [ $# -eq 1 ]
then
  :
else
  echo "Hello, world"
fi

EXPECTED
  expect { commandGroup1 } toContain "$expected"
}

