shellpen -

@spec.empty_unclosed() {
  - for x in '"$@"' 
  expect { - code } toEqual 'for x in "$@"
do
  :
done'
}

@spec.empty.closed() {
  - for x in '"$@"'
  - done
  expect { - code } toEqual 'for x in "$@"
do
  :
done'
}

@spec.empty.closed_with_do() {
  - for x in '"$@"'
  - do
  - done
  expect { - code } toEqual 'for x in "$@"
do
  :
done'
}

@spec.not_empty.unclosed() {
  - for x in '"$@"'
    - echo "Hello"
  expect { - code } toEqual 'for x in "$@"
do
  echo "Hello"
done'
}

@spec.only_comment.unclosed() {
  - for x in '"$@"'
    - comment "Hello"
  expect { - code } toEqual 'for x in "$@"
do
  # Hello
  :
done'
}

@spec.not_empty.closed() {
  - for x in '"$@"'
    - echo "Hello"
  - done
  expect { - code } toEqual 'for x in "$@"
do
  echo "Hello"
done'
}

@spec.not_empty.closed_with_do() {
  - for x in '"$@"'
  - do
    - echo "Hello"
  - done
  expect { - code } toEqual 'for x in "$@"
do
  echo "Hello"
done'
}