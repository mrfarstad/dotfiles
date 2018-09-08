vim:
	stow vim
	curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	vim +PlugInstall +qa
	vim +PlugUpdate +qa

.PHONY: vim
