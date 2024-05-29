
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(
        evalcache
	python
	npm
	node
	git
	git-prompt
	docker
	docker-compose
	extract
)

source $ZSH/oh-my-zsh.sh

# User configuration


export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

init-nvm() {
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
}

export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}


export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

init-brew() {
	eval "$(/usr/local/bin/brew shellenv)"
}

init-pyenv() {
	export PYENV_ROOT="$HOME/.pyenv"
	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"

	eval "$(pyenv virtualenv-init -)"
}

#init-pyenv

#eval "$(starship init zsh)"

