shellpen -

@spec.while.unclosed() {
  - while [ '$#' -gt 0 ]
  expect { - code } toEqual 'while [ $# -gt 0 ]
do
  :
done'
}

@spec.while.closed() {
  - while [ '$#' -gt 0 ]
  - done
  expect { - code } toEqual 'while [ $# -gt 0 ]
do
  :
done'
}

@spec.while.with_do() {
  - while [ '$#' -gt 0 ]
  - do
    - echo "Hi"
  - done
  expect { - code } toEqual 'while [ $# -gt 0 ]
do
  echo "Hi"
done'
}

@spec.while_from_STDIN_string() {
  - while [ '$#' -gt 0 ]
  - do
    - echo "Hi"
  - fromText "This is a string" done
  expect { - code } toEqual 'while [ $# -gt 0 ]
do
  echo "Hi"
done <<< "This is a string"'
}

@spec.while_from_command() {
  - while [ '$#' -gt 0 ]
  - do
    - echo "Hi"
  - fromCommand "printf '%s' \"\$something\"" done
  expect { - code } toEqual "while [ \$# -gt 0 ]
do
  echo \"Hi\"
done < <(printf '%s' \"\$something\")"
}

@spec.while_from_file() {
  - while [ '$#' -gt 0 ]
  - do
    - echo "Hi"
  - fromFile some/file/path done
  expect { - code } toEqual 'while [ $# -gt 0 ]
do
  echo "Hi"
done < "some/file/path"'
}

@spec.while_from_STDIN_arbitrary() {
  - while [ '$#' -gt 0 ]
  - do
    - echo "Hi"
  - fromStdin some/file/path done
  expect { - code } toEqual 'while [ $# -gt 0 ]
do
  echo "Hi"
done < some/file/path'
}

@spec.while_read_with_IFS_and_an_OR() {
  - while 'IFS=""' read -r varName \|\| [ -n '"$varName"' ]
    - echo '$varName'
  - fromCommand 'find "$dir" -print0' done
  expect { - code } toEqual "while IFS=\"\" read -r varName || [ -n \"\$varName\" ]
do
  echo \"\$varName\"
done < <(find \"\$dir\" -print0)"
}