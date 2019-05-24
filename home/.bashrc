# General
export LANG=ja_JP.UTF-8
export LC_TIME=C
export EDITOR=vim

# History
export HISTFILE=${HOME}/.bash-history
export HISTSIZE=10000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth

# ls
if [ "$(uname)" = 'Darwin' ]; then
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -G'
  alias la='ls -a'
  alias ll='ls -alhT'
else
  if [[ -e '~/.colorrc' ]]; then
    eval `dircolors ~/.colorrc`
  fi
  alias ls='ls --color=auto'
  alias la='ls -a'
  alias ll='ls -alh'
fi

# Alias
alias vi='vim'
alias tmux='tmux -u'
alias catpy='pygmentize -O style=monokai -f console256 -g'

# Disable C-s and C-q
stty stop undef
stty start undef

# Prompt
export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \W \$ \[\033[00m\]'
