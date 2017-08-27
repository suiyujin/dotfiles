### path
# anyenv
if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# lscolors
export LSCOLORS=gxfxcxdxbxegedabagacad

# old mysql
if [ -d /usr/local/opt/mysql@5.6 ] ; then
  export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
fi

# go
if [ -d ${HOME}/go ] ; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

export PATH="$HOME/bin:$PATH"
