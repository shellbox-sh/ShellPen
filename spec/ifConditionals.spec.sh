shellpen -

@spec.closed_empty_if() {
  - if [ '$#' -eq 0 ]
  - fi

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  :
fi'
}

@spec.unclosed_empty_if() {
  - if [ '$#' -eq 0 ]

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  :
fi'
}

@spec.closed_if() {
  - if [ '$#' -eq 0 ]
    - echo "Zero"
  - fi

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  echo "Zero"
fi'
}

@spec.closed_if_using_then() {
  - if [ '$#' -eq 0 ]
  - then
    - echo "Zero"
  - fi

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  echo "Zero"
fi'
}

@spec.closed_if_with_else() {
  - if [ '$#' -eq 0 ]
    - echo "Zero"
  - else
    - echo "More than zero"
  - fi

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  echo "Zero"
else
  echo "More than zero"
fi'
}

@spec.closed_empty_if_with_else() {
  - if [ '$#' -eq 0 ]
  - else
    - echo "More than zero"
  - fi

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  :
else
  echo "More than zero"
fi'
}

@spec.closed_if_with_elif() {
  - if [ '$#' -eq 0 ]
    - echo "Zero"
  - elif [ '$#' -eq 1 ]
    - echo "One"
  - fi

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  echo "Zero"
elif [ $# -eq 1 ]
then
  echo "One"
fi'
}

@spec.closed_if_with_elif_using_then() {
  - if [ '$#' -eq 0 ]
    - echo "Zero"
  - elif [ '$#' -eq 1 ]
  - then
    - echo "One"
  - fi

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  echo "Zero"
elif [ $# -eq 1 ]
then
  echo "One"
fi'
}

@spec.closed_if_with_else_and_elifs() {
  - if [ '$#' -eq 0 ]
    - echo "Zero"
  - elif [ '$#' -eq 1 ]
    - echo "One"
  - elif [ '$#' -eq 2 ]
    - echo "Two"
  - else
    - echo "More than 2"
  - fi

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  echo "Zero"
elif [ $# -eq 1 ]
then
  echo "One"
elif [ $# -eq 2 ]
then
  echo "Two"
else
  echo "More than 2"
fi'
}

@spec.unclosed_if_with_empty_else_and_elifs() {
  - if [ '$#' -eq 0 ]
  - elif [ '$#' -eq 1 ]
  - elif [ '$#' -eq 2 ]
  - else
  - fi

  expect { - code } toEqual 'if [ $# -eq 0 ]
then
  :
elif [ $# -eq 1 ]
then
  :
elif [ $# -eq 2 ]
then
  :
else
  :
fi'
}