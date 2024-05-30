# ==========================================================================================================================================
# zinit installer
# ==========================================================================================================================================

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ==========================================================================================================================================
# paths 
# ==========================================================================================================================================

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH="$HOME/.local/bin:$PATH"
eval "$(/usr/local/bin/brew shellenv)"

# ==========================================================================================================================================
# zshconfig
# ==========================================================================================================================================

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

# Silence pyenv error
ZSH_PYENV_QUIET=true
ZSH_PYENV_VIRTUALENV=false

export FZF_DEFAULT_OPTS='--preview "bat --color=always --style=numbers --line-range=:500 {}" --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Erase duplicates
HISTDUP=erase

setopt completealiases

# Add commands to history
setopt appendhistory

# Share between sessions
setopt sharehistory

# Don't add to history if command has a space as first char
setopt hist_ignore_space

# Ignore duplicates
setopt hist_ignore_all_dups

# Don't save duplicates
setopt hist_save_no_dups

setopt hist_ignore_dups

# Don't show duplicates in history search
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':complation:*' menu no

# Docker stacking
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Load nvm lazy
# zstyle ':omz:plugins:nvm' lazy yes

# fzf https://github.com/Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' switch-group '<' '>'

# | ftb-tmux-popup
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# ==========================================================================================================================================
# keybindings
# ==========================================================================================================================================

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ==========================================================================================================================================
# aliases
# ==========================================================================================================================================

alias ls='exa --icons'
alias ll='exa -lah --icons'
alias tree='exa -lah --tree --icons --level=3 --ignore-glob="node_modules|.git|.DS_Store|.nvm|.turbo"'
alias cat='bat'
alias less="bat --pager='less -R'"
alias cd='z'
alias vim='nvim'
alias v='nvim'

# ==========================================================================================================================================
# functions
# ==========================================================================================================================================

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --pager='less -R' --diff
}

# ==========================================================================================================================================
# plugins
# ==========================================================================================================================================

zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-completions

zinit light zsh-users/zsh-autosuggestions

zinit light Aloxaf/fzf-tab

# ==========================================================================================================================================
# inits
# ==========================================================================================================================================

eval "$(pyenv virtualenv-init -)"

# pnpm
export PNPM_HOME="/Users/patrykgrabowski/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# ==========================================================================================================================================
# snippets
# ==========================================================================================================================================

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::npm
zinit snippet OMZP::nvm
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::extract
zinit snippet OMZP::brew
zinit snippet OMZP::pyenv
zinit snippet OMZP::command-not-found
zinit snippet OMZP::dotenv


# ==========================================================================================================================================
# Utils
# ==========================================================================================================================================

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}


# ==========================================================================================================================================
# End inits 
# ==========================================================================================================================================

# Load completions
autoload -U compinit && compinit

# Replay all cached completions
zinit cdreplay -q

# Install zoxide
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
