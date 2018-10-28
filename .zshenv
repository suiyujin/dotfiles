# path
## /etc/z** will not be run
setopt no_global_rcs
## run path_helper instead of /etc/zprofile
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

## export
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

### old mysql
if [ -d /usr/local/opt/mysql@5.6 ] ; then
  export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
fi

### go
if [ -d ${HOME}/go ] ; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

### anyenv
if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# lscolors
export LSCOLORS=gxfxcxdxbxegedabagacad
