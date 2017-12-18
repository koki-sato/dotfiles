#!/bin/bash

set -eu

readonly DOTFILES_ROOT="$HOME/dotfiles"
readonly DOTFILES="dotfiles"

#===========================================================================#
# common functions
#===========================================================================#

print() {
  printf "\e[4m$DOTFILES\e[0m: "
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

if ! command_exist git; then
  print "Error: Dotfiles need git."
  exit 1
fi

if [[ -d "$DOTFILES_ROOT" ]]; then
  print "Dotfiles is already installed."

  while true; do
    print -n "Do you want to overwrite it? [Y/n] "
    read answer
    case "$answer" in
      [yY])
        cmd_exec rm -fr $DOTFILES_ROOT
        print
        break
        ;;
      [nN])
        exit 1
        ;;
    esac
  done
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
