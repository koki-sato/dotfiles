# avoid loading /etc/zprofile (not to execute /usr/libexec/path_helper)
setopt no_global_rcs

# system-wide environment settings for zsh(1) (copy from /etc/zprofile)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# PATH
export PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin

# anyenv
if [ -d $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - zsh)"

  for D in `ls $HOME/.anyenv/envs`; do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

# Rust
if [ -d $HOME/.cargo ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

# direnv
if type "direnv" > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

export PYTHONDONTWRITEBYTECODE=True

# Local settings
if [ -e ~/.zshenv.local ]; then
  source ~/.zshenv.local
fi
