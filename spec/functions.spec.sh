shellpen -

@spec.functions.emptyFunction.notClosed() {
  - fn Hello

  expect { - code } toEqual 'Hello() {
  :
}'
}

@spec.functions.emptyFunction.close() {
  - fn Hello {
    # ...
  - }

  expect { - code } toEqual 'Hello() {
  :
}'
}

@spec.functions.withNull.notClosed() {
  - fn Hello
    - :

  expect { - code } toEqual 'Hello() {
  :
}'
}

@spec.functions.withNull.closed() {
  - fn Hello
    - :
  - }

  expect { - code } toEqual 'Hello() {
  :
}'
}

@spec.function.notEmpty.notClosed() {
  - fn Hello
    - comment Hello
    - echo Hi

  expect { - code } toEqual 'Hello() {
  # Hello
  echo "Hi"
}'
}

@spec.function.notEmpty.closed() {
  - fn Hello {
    - comment Hello
    - echo Hi
  - }

  expect { - code } toEqual 'Hello() {
  # Hello
  echo "Hi"
}'
}