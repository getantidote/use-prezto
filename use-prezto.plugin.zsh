#
# use-prezto: A Zsh plugin to make using Prezto with antidote easier.
#

# References:
# - https://github.com/sorin-ionescu/prezto/blob/master/init.zsh

0=${(%):-%N}

# Prezto uses pmodload to load its dependencies, and expects it to exist.
# We want to use antidote to load modules, so if the user hasn't loaded
# a pre-req module in their .zsh_plugins.txt, notify them.
function pmodload {
  (( $# )) || return
  local missing=0
  case "$1" in
    (editor)   (( $+functions[_prezto-zle-noop] )) || missing=1 ;;
    (helper)   (( $+functions[coalesce] ))         || missing=1 ;;
    (spectrum) [[ -v BG ]] && [[ -v FX ]]          || missing=1 ;;
    (ruby)     [[ -v local_rbenv_paths ]]          || missing=1 ;;
  esac
  if [[ $missing -ne 0 ]]; then
    echo >&2 "pmodload: required module $1 not loaded: add it to .zsh_plugins.txt."
    return 1
  fi
}

# https://github.com/sorin-ionescu/prezto/blob/9195b66161b196238cbd52a8a4abd027bdaf5f73/init.zsh#L168-L192
# Make sure we know where antidote keeps Prezto.
() {
  [[ -z "$ZPREZTODIR" ]] || return
  if (( $+commands[antidote] || $+functions[antidote] )); then
    export ZPREZTODIR=$(antidote path sorin-ionescu/prezto)
  else
    echo >&2 "use-prezto: neither antidote found, nor \$ZPREZTODIR set."
    return 1
  fi
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
