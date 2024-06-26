#
# antidote-use-prezto: A Zsh plugin to make using Prezto with antidote easier.
#

# References:
# - https://github.com/sorin-ionescu/prezto/blob/master/init.zsh

0=${(%):-%N}

# Prezto uses pmodload to load its deps, and expects it to be there.
function pmodload {
  # no-op
}

# Source the Prezto configuration file.
if [[ -s "${ZDOTDIR:-$HOME}/.zpreztorc" ]]; then
  source "${ZDOTDIR:-$HOME}/.zpreztorc"
fi

# Disable color and theme in dumb terminals.
if [[ "$TERM" == 'dumb' ]]; then
  zstyle ':prezto:*:*' color 'no'
  zstyle ':prezto:module:prompt' theme 'off'
fi

# Load more specific 'run-help' function from $fpath.
(( $+aliases[run-help] )) && unalias run-help && autoload -Uz run-help

# Autoload Zsh functions.
zstyle -a ':prezto:load' zfunction 'zfunctions'
for zfunction ("$zfunctions[@]") autoload -Uz "$zfunction"
unset zfunction{s,}

# Make sure we know where antidote keeps Prezto.
() {
  [[ -z "$ZPREZTODIR" ]] || return
  if (( $+commands[antidote] || $+functions[antidote] )); then
    export ZPREZTODIR=$(antidote path sorin-ionescu/prezto)
  else
    echo >&2 "antidote-use-prezto: neither antidote found, nor \$ZPREZTODIR set."
    return 1
  fi
}
