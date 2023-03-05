#!/usr/bin/env bash

# TODO
# 1. DONE -- Create backups before overriding files.
# 2. Ask if override existing backups or create another one
# 3. Create similar file for powershell
# 4. Add option to restore backup

# 0. Check if git installed. If not, abort
printf "Software required to make it work correctly:\n"
printf "\t* Git\n"
printf "\t* Neovim\n"
printf "\t* ag (the_silver_searcher)\n"
printf "\t* bash-it (Will be installed automatically)\n"
printf "\t* fzf (Will be installed automatically)\n"

function setup_dotfiles() {
    if [[ -z "$(command -v git)" || -z "$(command -v nvim)" ]]; then
    	echo "Git and neovim are mandatory. Install the one which is missing and run this script again"
	    exit 1
    fi
    # 1. 
    if [[ ! $(ls -A ~/.bash_it) ]]; then
    	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
        printf "y y y" | ~/.bash_it/install.sh 
    fi
    # 2.
    if [[ ! $(ls -A "$HOME/.local/share/nvim/site/autoload/plug.vim") ]]; then
	    sh -c 'curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs' \
           'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi
    # 3.
    if [[ -z "$(command -v fzf)" ]]; then
    	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    fi

    echo "Overriding existing config files."
    cp ~/.bashrc ~/.bashrc.bak && cp .bashrc ~/.bashrc
    cp ~/.inputrc ~/.inputrc.bak && cp .inputrc ~/.inputrc
    cp ~/.bash_aliases ~/.bash_aliases.bak && cp .bash_aliases ~/.bash_aliases
    [[ ! $(ls -A ~/.bash_git) ]] && {
	    curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git
        echo "source ~/.bash_git" >> ~/.bashrc    
    }
    mkdir -p ~/.bash_it/themes/dawid && cp dawid.theme.bash ~/.bash_it/themes/dawid/dawid.theme.bash
    cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak && cp init.vim ~/.config/nvim/init.vim
    cp ~/.config/nvim/coc-settings.json ~/.config/nvim/init.vim.bak && cp coc-settings.json ~/.config/nvim/coc-settings.json
}

function main() {
    while true; do
        read -rp "Are you sure that all dependencies are installed and you want to proceed with configs setup? " yn
        case $yn in
            [Yy]* ) setup_dotfiles; break;;
            [Nn]* ) printf "\nAfter installation of all dependencies run this script again\n"; exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

main
