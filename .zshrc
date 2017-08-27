### prompt
autoload -U colors
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
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}

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

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

### setup ssh-agent
if [ -f ~/.ssh-agent ]; then
    . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
    ssh-agent > ~/.ssh-agent
    . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add

### alias
setopt complete_aliases # aliased ls needs if file/dir completions work

# remove anyenv in brew
if [ -d ${HOME}/.anyenv ] ; then
  alias brew="env PATH=${PATH/$HOME\/.anyenv\/envs\/*env\/shims:/} brew"
fi

# thefuck
if builtin command -v thefuck > /dev/null; then
  eval "$(thefuck --alias)"
fi

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

alias be='bundle exec'
alias vi='vim'
alias brewbundle='brew bundle --global -v'

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/gcloud/google-cloud-sdk/path.zsh.inc ]; then
  source "$HOME/gcloud/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f $HOME/gcloud/google-cloud-sdk/completion.zsh.inc ]; then
  source "$HOME/gcloud/google-cloud-sdk/completion.zsh.inc"
fi

# remove duplicate path
typeset -U path
