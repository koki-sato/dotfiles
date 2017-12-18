export PATH=/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin

if [ -d $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - zsh)"
fi

export PYTHONDONTWRITEBYTECODE=True
