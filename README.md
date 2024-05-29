# Dotfiles

Collection of dotfiles done with `stow` for `zsh`, `zoxide`, `alacritty`, `starship`, `nvim` and `tmux`

## Requirements

### MacOS
1. Download and install [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)
2. Install [Alacritty](https://github.com/alacritty/alacritty/releases)
3. Install brew
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
4. Install rest of the requirements

```shell
brew install stow fzf zsh nvim tmux starship zoxide
```
5. Install `packer.nvim`
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Getting started

1. Pull repository to the home directory
```shell
cd ~
git clone git@github.com:grabp/dotfiles.git 
```
2. Run stow
```shell
cd ~/dotfiles
stow .
```

Done!

