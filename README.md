# 🖋️ Shell Pen

> Generate Shell Script Source Code

```sh
source shellpen.sh

alias 🖋️=shellpen

🖋️ function greetings() {
   🖋️ if [ '$#' -eq 0 ]
      🖋️ error '$0: no argument provided'
   🖋️ else
      🖋️ echo 'Hello $1!'
   🖋️ fi
🖋️ }

🖋️ result
# => function greetings() {
# =>   if [ $# -eq 0 ]
# =>   then
# =>     echo "$0: no argument provided" >&2
# =>     return 1
# =>   else
# =>     echo "Hello $1"
# =>   fi
# => }

🖋️ save greetings.sh

source greetings.sh

greetings Rebecca
# => Hello Rebecca!
```

## what? why?

I have a few libraries which generate shell script source code.

Extracted this library to have a dedicated tool for BASH codegen.