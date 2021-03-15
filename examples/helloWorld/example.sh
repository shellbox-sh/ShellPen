#! /usr/bin/env bash

source shellpen.sh

shellpen -- alias :

: function myFunction {
  : if [ '$#' -eq 0 ]
    : echo 'Hello!'
  : else
    : echo 'Hello $*!'
  : fi
: }

# Load the generated code
eval "$( shellpen result )"