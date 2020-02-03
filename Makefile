all: vim zsh

vim:
	stow vim
	curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	vim +PlugInstall +qa
	vim +PlugUpdate +qa

zsh:
	stow zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

.PHONY: vim zsh
