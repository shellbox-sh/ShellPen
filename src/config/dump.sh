local variableName=''
for variableName in SHELLPEN_VERSION SHELLPEN_MODE SHELLPEN_ROOT
do
  echo "$variableName:\t$( eval \"printf '%s' \$$variableName\" )"
done