# Bash functions

Declared either by `function` or parantheses(`()`). No need to declare arguments, you can send as many as you like anyway.

If no names are declared, you can use them in order from 1.

Bash functions uses positional arguemnts, not named.

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

## Return values

The `return` keyword will return an exit code of your choice, not any value you want. This makes valid return values 0-255.

To assign a value returned from a function to a variable, echo/print the value in the function and catch it with command substitution.

```bash
# Basic return value/exit code
return 0
return 255

# return by echo
function func { echo "hello"; }
variable="$(func)"
```
