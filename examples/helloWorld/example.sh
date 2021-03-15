#! /usr/bin/env bash
shopt -s expand_aliases

source shellpen.sh

alias :=shellpen

: function myFunction {
  : if [ '$#' -eq 0 ]
    : echo 'Hello!'
  : else
    : echo 'Hello $*!'
  : fi
: }

# Load the generated code
eval "$( shellpen result )"