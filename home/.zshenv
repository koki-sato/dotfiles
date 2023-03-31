# avoid loading /etc/zprofile (not to execute /usr/libexec/path_helper)
setopt no_global_rcs

# system-wide environment settings for zsh(1) (copy from /etc/zprofile)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# PATH
export PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin

# Go
if [ -d $HOME/go ]; then
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  export PATH=$GOBIN:$PATH
fi

# Rust
if [ -d $HOME/.cargo ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

export PYTHONDONTWRITEBYTECODE=1

# Local settings
if [ -e ~/.zshenv.local ]; then
  source ~/.zshenv.local
fi
