### prompt
PROMPT="${USER}%# "
RPROMPT="[%~]"

### completion
autoload -U compinit
compinit

### auto-completion
autoload predict-on
#predict-on

zstyle ':completion:*' list-colors ''

### cd
setopt auto_cd    # omit
setopt auto_pushd  # memorize

### command modify
setopt correct

### beep sound off
setopt nolistbeep

### command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

### vi key bind
bindkey -v

### alias
setopt complete_aliases # aliased ls needs if file/dir completions work

# ls
case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -lG"
  alias la="ls -laG"
  ;;
linux*)
  alias ls='ls --color'
  alias ll='ls -l --color'
  alias la='ls -la --color'
  ;;
esac

# bundle exec
alias be='bundle exec'

# gnu-sed
alias sed='gsed'

### .zshrc.mine
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# alias
alias mvim="mvim --remote-tab-silent"

# phpenv
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.phpenv/bin:$PATH
eval "$(phpenv init -)"

# rbenv
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# laravel
export PATH="$HOME/.composer/vendor/bin:$PATH"

#lscolors
export LSCOLORS=gxfxcxdxbxegedabagacad

# for php-config error
alias brew="env PATH=${PATH/\/Users\/ippei\/\.phpenv\/shims:/} brew"
