#! /usr/bin/env bash
#! /usr/bin/env bash

sayHello() {
  local command=$1
  shift
  case "$command" in
    hello)
      echo "Hello $*!"
      ;;
    goodbye)
      echo "Goodbye $*!"
      ;;
  esac
}

[ "${BASH_SOURCE[0]}" = "$0" ] && "sayHello" "$@"

