export PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin

if [ -d $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - zsh)"
fi

if type "direnv" > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

export PYTHONDONTWRITEBYTECODE=True
