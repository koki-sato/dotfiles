# 文字コードをUTF-8に設定
export LANG=ja_JP.UTF-8

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# 同時に起動したzshの間でヒストリを共有
setopt share_history
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY

# lsコマンドのカラー
export LSCOLORS=gxfxcxdxbxegedabagacad

# エイリアス
alias ls='ls -G'
alias la='ls -aG'
alias ll='ls -alhTG'
alias vi='vim'
alias tmux='tmux -u'
alias catpy='pygmentize -O style=monokai -f console256 -g'

# スクリーンロックのショートカットを解除
stty stop undef
stty start undef

# zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

zstyle ':completion:*' list-colors di=34 ln=35 ex=31

# gitコマンドのタブ補完
autoload -Uz compinit && compinit -u
# PROMPTに色を付ける
autoload -U colors; colors
# PROMPT
PROMPT="%{${fg[green]}%}%n: %{${fg[yellow]}%}%c %{${fg[red]}%}%# %{${reset_color}%}"
PROMPT2="%{${fg[yellow]}%} %_ > %{${reset_color}%}"
RPROMPT="${vcs_info_msg_0_}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r ? [n,y,a,e] %{${reset_color}%}"

# Gitのブランチ名をRPROMPTで表示
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats ' (*%F{green}%b%f)'
zstyle ':vcs_info:*' actionformats ' (*%F{green}%b%f(%F{red}%a%f))'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
