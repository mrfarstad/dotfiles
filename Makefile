all: vim zsh

neovim:
	stow -d ~/dotfiles -t ~/.config/nvim nvim

zsh:
	stow zsh

.PHONY: vim zsh neovim
