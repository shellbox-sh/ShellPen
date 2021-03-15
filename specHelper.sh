source vendor/assert.sh
source vendor/refute.sh
source vendor/expect.sh
source vendor/run.sh
source shellpen.sh

# shellpen :

loadExample() {
  [ -z "$EXAMPLE_DIR" ] && { echo "Please configure EXAMPLE_DIR to use loadExample()" >&2; return 1; }
  [ -f "$EXAMPLE_DIR/example.sh" ] || { echo "Missing $EXAMPLE_DIR/example.sh required for loadExample()" >&2; return 1; }
  source "$EXAMPLE_DIR/example.sh"
}

runExample() {
  [ -z "$EXAMPLE_DIR" ] && { echo "Please configure EXAMPLE_DIR to use runExample()" >&2; return 1; }
  [ -f "$EXAMPLE_DIR/run.sh" ] || { echo "Missing $EXAMPLE_DIR/run.sh required for runExample()" >&2; return 1; }
  "$EXAMPLE_DIR/run.sh" "$@"
}

printSource() {
  echo "$( loadExample; shellpen result )"
}