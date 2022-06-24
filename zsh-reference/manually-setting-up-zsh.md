# Manually configuring a nice zsh

## Start zsh withouth a rc file or with one of your choice

Two options here:

1. Start zsh with no rc files and load one with `source`.

2. Change the global variable ZDOTDIR to your specified directory(not home). Directory must contain a '.zshrc' file.

```zsh
# Starts zsh with no RCs
zsh -d -f

# Load custom RC
source PATH_TO_RC
```

## Autoload to access functions

Importing functions in zsh, U is to not use fpath/alias expansion and z is to load zsh-style.

```zsh
autoload -Uz FUNCTION_NAME
```

## Adding something to fpath

Both $fpath and $FPATH exists, the latter is the same but is separated by colons instead of spaces.

```zsh
$fpath=(YOUR_DIR $fpath)
```

## The Prompt

```
print -P "%F{green}(%F{blue}%n%F{green}@%F{blue}%m%F{green})$"
```

- https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
