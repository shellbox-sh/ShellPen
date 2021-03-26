shellpen -

- if [ something ]

@spec.write() {
  - write "TEXT"
  - write "MORE"

  expect { - code } toEqual 'if [ something ]
then
  TEXT  MOREfi'
}

@spec.writeln() {
  - writeln "TEXT"
  - writeln "MORE"

  expect { - code } toEqual 'if [ something ]
then
  TEXT
  MORE
fi'
}

@spec.append() {
  - append "TEXT"
  - append "MORE"

  expect { - code } toEqual 'if [ something ]
then
TEXTMOREfi'
}

@spec.appendln() {
  - appendln "TEXT"
  - appendln "MORE"

  expect { - code } toEqual 'if [ something ]
then
TEXT
MORE
fi'
}

@spec.prepend() {
  - prepend "TEXT"
  - prepend "MORE"

  expect { - code } toEqual 'MORETEXTif [ something ]
then
fi'
}

@spec.prependln() {
  - prependln "TEXT"
  - prependln "MORE"

  expect { - code } toEqual 'MORE
TEXT
if [ something ]
then
fi'
}

@spec.getIndent() {
  expect { - getIndent } toEqual "  "

  - if [ more ]

  expect { - getIndent } toEqual "    "

  - fi

  expect { - getIndent } toEqual "  "

  - fi

  expect { - getIndent } toEqual ""
}