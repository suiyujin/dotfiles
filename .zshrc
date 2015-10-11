### prompt
autoload colors
colors

local p_cdir="%B%F{blue}[%~]%f%b"$'\n'
local p_info="%n@%m"
local p_mark="%B%#%b"
PROMPT=" $p_cdir$p_info$p_mark "

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%1v|)"

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

# anyenv
if [ -d ${HOME}/.anyenv ] ; then
   export PATH="$HOME/.anyenv/bin:$PATH"
   eval "$(anyenv init -)"
   for D in `ls $HOME/.anyenv/envs`
   do
     export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
   done
fi

# lscolors
export LSCOLORS=gxfxcxdxbxegedabagacad
