#! /usr/bin/env bash

source shellpen.sh

shellpen :

: function sayHello
  : local command="\$1"
  : shift
  : case "\$command"
    : option hello
      : echo "Hello \$*!"
    : option goodbye
      : echo "Goodbye \$*!"

: main sayHello

# Load the generated code
eval "$( shellpen result )"