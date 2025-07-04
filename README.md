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
brew install stow fzf zsh ffmpegthumbnailer poppler nvim chafai imagemagick tmux starship zoxide pyenv ripgrep bat
```

5. Install docker completions

```shell
cd ~
mkdir -p /Users/patrykgrabowski/.cache/zinit/completions
curl https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > \
    /Users/patrykgrabowski/.cache/zinit/completions/_docker
```

6. Install `nvm`

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

7. Install `catppuccin` theme for alacritty

```shell
curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
```

8. Install `eza`

```shell
cargo install eza
```

9. Install `bat` theme

```shell
mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build
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

3. Open tmux and install dependencies

```shell
tmux
# Press `prefix` + `I`
```

4. Install `nvim` plugins

```shell
nvim
```

Done!
