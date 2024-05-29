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

# Erase duplicates
HISTDUP=erase

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

alias ls='ls --color'

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

init-nvm() {
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
}

init-pyenv() {
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
}

init-pyenv()

# ==========================================================================================================================================
# snippets
# ==========================================================================================================================================

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::npm
zinit snippet OMZP::node
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::extract
zinit snippet OMZP::brew
zinit snippet OMZP::pyenv
# zinit snippet OMZP::python
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
