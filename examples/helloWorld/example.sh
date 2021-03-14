source shellpen.sh

alias _=shellpen

shellpen function myFunction {
  shellpen if [ '$#' -eq 0 ]
    shellpen echo 'Hello!'
  shellpen else
    shellpen echo 'Hello $*!'
  shellpen fi
shellpen }

# Load the generated code
eval "$( shellpen result )"

# Run the function!
myFunction "$@"