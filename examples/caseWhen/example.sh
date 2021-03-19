#! /usr/bin/env bash

source shellpen.sh

shellpen -

- function myFunction {
  - if [ '$#' -eq 0 ]
    - error 'myFunction: expected arguments, received none'
  - else
    - local command='$1'
    - case '$command'
      - option hello
        - echo "Hello, world!"
      - option goodnight
        - echo "Goodnight, moon"
      - option '*'
        - error 'myFunction: unknown command $command'
    - esac
  - fi
- }

# Load the generated code
eval "$( shellpen result )"