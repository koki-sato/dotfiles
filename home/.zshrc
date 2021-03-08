# General
export LANG=ja_JP.UTF-8
export LC_TIME=C
export EDITOR=vim

setopt complete_aliases       # Expand aliases before completing
setopt print_eight_bit        # Enable Japanese file name
setopt prompt_subst           # Expand variables in prompt

set bell-style none; setopt nobeep; setopt nolistbeep  # No beep

# History
export HISTFILE=${HOME}/.zsh-history
export HISTSIZE=10000         # Number of saved history on memory
export SAVEHIST=100000        # Number of saved history

setopt hist_ignore_dups       # Ignore duplicated history
setopt hist_ignore_space      # Ignore command starts with white spaces
setopt hist_no_store          # Ignore history command
setopt hist_reduce_blanks     # Strip white spaces
setopt share_history          # Share history across multi processes
setopt extended_history       # Save timestamp

# Alias
alias vi='vim'
alias tmux='tmux -u'
alias catpy='pygmentize -O style=monokai -f console256 -g'

# ls
if [ $(uname) = 'Darwin' ]; then
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -G'
  alias la='ls -a'
  alias ll='ls -alhT'
else
  if [ -e ~/.colorrc ]; then
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

# SSH
if which ssh-host-color &> /dev/null; then
  alias ssh='ssh-host-color'
else
  if [ -e ~/bin/ssh-host-color ]; then
    alias ssh='~/bin/ssh-host-color'
  fi
fi

# Disable C-s and C-q
stty stop undef
stty start undef

# zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Completion
zstyle ':completion:*' list-colors di=34 ln=35 ex=31
zstyle ':completion:*:warnings' format 'No matches'

autoload -Uz compinit && compinit -u  # git completion

setopt auto_menu              # Toggle complement candidates using TAB
setopt auto_param_slash       # Insert / after a complemented directory name
setopt correct                # Do spell check
setopt list_packed            # Use compackt style candidates viewer mode
setopt list_types             # Show kinds of file using marks
setopt magic_equal_subst      # Even option args are complemented

# Prompt color
autoload -U colors; colors

# Prompt
PROMPT="%{${fg[green]}%}%n: %{${fg[yellow]}%}%c %{${fg[red]}%}%# %{${reset_color}%}"
PROMPT2="%{${fg[yellow]}%} %_ > %{${reset_color}%}"
RPROMPT="${vcs_info_msg_0_}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r ? [n,y,a,e] %{${reset_color}%}"

# Git status on prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' (*%F{green}%b%f)'
zstyle ':vcs_info:*' actionformats ' (*%F{green}%b%f(%F{red}%a%f))'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# anyenv
if [ -d $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - --no-rehash)"

  for D in `ls $HOME/.anyenv/envs`; do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

# direnv
if type "direnv" > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# asdf
if [ -e /usr/local/opt/asdf/asdf.sh ]; then
  # Do not use `. $(brew --prefix asdf)/asdf.sh` due to performance issues.
  . /usr/local/opt/asdf/asdf.sh
fi

# History search with peco
if which peco &> /dev/null; then
  function peco-select-history {
    BUFFER=`history -n -r 1 | peco --query "$LBUFFER"`
    CURSOR=$#BUFFER
    zle reset-prompt
  }
  zle -N peco-select-history
  bindkey '^r' peco-select-history
fi

# Local settings
if [ -e ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
