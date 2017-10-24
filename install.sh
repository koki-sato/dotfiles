#!/bin/bash

set -eu

export DOTFILES_ROOT="$HOME/dotfiles"

#===========================================================================#
# common functions
#===========================================================================#

print() {
  printf "\e[4mdotfiles\e[0m: "
  echo "$@"
}

cmd_exec() {
  print "$@"
  "$@"
}

command_exist() {
  which "$1" >/dev/null 2>&1
  return $?
}

#===========================================================================#

if [[ -d "$DOTFILES_ROOT" ]]; then
  print "Dotfiles is already installed. Override it."
  cmd_exec rm -fr $DOTFILES_ROOT
  print
fi

if ! command_exist git; then
  print "Error: Dotfiles need git."
  exit 1
fi

cmd_exec git clone --recursive https://github.com/koki-sato/dotfiles.git "$DOTFILES_ROOT"
cmd_exec cd $DOTFILES_ROOT
print

case $OSTYPE in
  darwin*)
    cmd_exec $DOTFILES_ROOT/bin/dotfiles setup-osx
    ;;
  linux*)
    cmd_exec $DOTFILES_ROOT/bin/dotfiles setup-linux
    ;;
esac

cmd_exec $DOTFILES_ROOT/bin/dotfiles link
