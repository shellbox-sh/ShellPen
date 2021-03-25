local extensionFunction=''
local extensionReturnCode=''
for extensionFunction in "${__SHELLPEN_EXTENSIONS[@]}"
do
  $extensionFunction "$@"
  PEN="$SHELLPEN_PEN" extensionReturnCode=$?
  if [ $extensionReturnCode -eq 0 ]
  then
    return 0
  elif [ $extensionReturnCode -eq 2 ]
  then
    # Stop, let it print its error message and halt things
    return 2
  fi
done

!fn --shellpen-private writeDSL "$@"