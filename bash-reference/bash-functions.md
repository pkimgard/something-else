# Bash functions

Declared either by `function` or parantheses(`()`). No need to declare arguments, you can send as many as you like anyway.

If no names are declared, you can use them in order from 1. Return value with `return.`

```bash
function my_function { echo hello; echo bye; }

my_2nd_function () {
  echo hello
  echo bye
}

function args_function {
  echo $0
  echo $1
  echo $2
  return "done"
}

args_function arg1 arg2 arg3
```
