source vendor/assert.sh
source vendor/refute.sh
source vendor/expect.sh
source vendor/run.sh
source shellpen.sh

# `alias` is not happy in the spec environment,
# using a function here instead.
_() { shellpen "$@"; }

runExample() {
  [ -z "$EXAMPLE_DIR" ] && { echo "Please configure EXAMPLE_DIR to use runExample()" >&2; return 1; }
  [ -f "$EXAMPLE_DIR/example.sh" ] || { echo "Missing $EXAMPLE_DIR/example.sh required for runExample()" >&2; return 1; }
  "$EXAMPLE_DIR/example.sh" "$@"
}