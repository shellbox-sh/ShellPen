shellpen -

@spec.math.increment() {
  - {{ i++ }}
  expect { - code } toEqual "(( i++ ))"
}

@spec.multiple_statements() {
  - {{ i++ }}
  - {{ j-- }}
  expect { - code } toEqual "(( i++ ))
(( j-- ))"
}

@spec.multiple_statements_on_a_single_line() {
  - {{ i++ }} , {{ j-- }}
  expect { - code } toEqual "(( i++ )); (( j-- ))"
}

@spec.math.inner_parens() {
  - {{ i = '(' x + 1 ')' }}
  expect { - code } toEqual "(( i = ( x + 1 ) ))"
}