#!/usr/bin/env bash

# TODO
# 1. Create backups before overriding files.
# 2. Ask if override existing backups or create another one
# 3. Create similar file for powershell

# 0. Check if git installed. If not, abort
if [[ -z "$(command -v git)" ]]; then
	echo "Git and neovim are mandatory. Install the one which is missing and run this script again"
	exit 1
fi
# 1. 
if [[ ! $(ls -A ~/.bash_it) ]]; then
	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    printf y y y | ~/.bash_it/install.sh 
fi
# 2.
if [[ ! $(ls -A "$HOME/.local/share/nvim/site/autoload/plug.vim") ]]; then
	sh -c 'curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
# 3.
if [[ -z "$(command -v fzf)" ]]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

echo "Overriding existing config files."
cp .bashrc ~/.bashrc
cp .inputrc ~/.inputrc
cp .bash_aliases ~/.bash_aliases
[[ -z "$(ls ~/.bash_git)" ]] && {
	curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git
    echo "source ~/.bash_git" >> ~/.bashrc    
}
cp -r dawid ~/.bash_it/themes/
cp init.vim ~/.config/nvim/init.vim
cp coc-settings.json ~/.config/nvim/coc-settings.json
