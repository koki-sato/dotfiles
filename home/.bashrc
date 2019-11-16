# General
export LANG=ja_JP.UTF-8
export LC_TIME=C
export EDITOR=vim

# History
export HISTFILE=${HOME}/.bash-history
export HISTSIZE=10000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth

# Alias
alias vi='vim'
alias tmux='tmux -u'
alias catpy='pygmentize -O style=monokai -f console256 -g'

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

# diff
if which colordiff &> /dev/null; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# grc
if which grc &> /dev/null; then
  alias ifconfig='grc ifconfig'
  alias dig='grc dig'
  alias ping='grc ping'
  alias ping6='grc ping6'
  alias traceroute='grc traceroute'
  alias traceroute6='grc traceroute6'
fi

# less
export LESS='-iMR'

# Disable C-s and C-q
stty stop undef
stty start undef

# Prompt
export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \W \$ \[\033[00m\]'

# anyenv
if [ -d $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"

  for D in `ls $HOME/.anyenv/envs`; do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

# direnv
if type "direnv" > /dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi
