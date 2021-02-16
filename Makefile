all: nvim zsh tmux

.PHONY: nvim zsh tmux

neovim:
	stow -d ~/dotfiles -t ~/.config/nvim nvim

zsh:
	stow zsh

tmux:
	stow tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source ~/.tmux.conf
	~/.tmux/plugins/tpm/scripts/install_plugins.sh
