shellpen -

@spec.unclosed_empty_case() {
  - case foo
  expect { - code } toEqual 'case "foo" in
esac'
}

@spec.unclosed_empty_option() {
  - case foo
    - option bar
  expect { - code } toEqual 'case "foo" in
  bar)
    :
    ;;
esac'
}

@spec.multiple_options_first_empty() {
  - case '$1'
    - option foo
      - ::
    - option bar
      - echo "Hello from bar"
      - ::
  - esac
  expect { - code } toEqual 'case "$1" in
  foo)
    :
    ;;
  bar)
    echo "Hello from bar"
    ;;
esac'
}

@spec.case_with_inner_case() {
  - case '$1'
    - option foo
      - case '$2'
        - option A
          - echo A
          - ::
        - option B
          - echo B
          - ::
      - esac
    - ::
    - option bar
      - echo "Hi from bar"
      - ::
  - esac
  expect { - code } toEqual 'case "$1" in
  foo)
    case "$2" in
      A)
        echo "A"
        ;;
      B)
        echo "B"
        ;;
    esac
    ;;
  bar)
    echo "Hi from bar"
    ;;
esac'
}