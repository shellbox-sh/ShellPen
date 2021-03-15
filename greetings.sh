
greetings() {
  if [ $# -eq 0 ]
  then
    echo "$0: no argument provided" >&2
    return 1
  else
    echo "Hello $1!"
  fi
}

