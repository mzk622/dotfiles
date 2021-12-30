#!/bin/bash

# create directory for init
mkdir -p ~/Works/bin
mkdir -p ~/Works/src
mkdir -p ~/Works/pkg

# create symbolic link
echo "link .alias"
ln -sfn $PWD/.alias ~/.alias

echo "link for bash"
ln -sfn $PWD/.bash_profile ~/.bash_profile

echo "link for fish"
mkdir -p ~/.config/fish/functions
ln -sfn $PWD/.config/fish/config.fish ~/.config/fish/config.fish
ln -sfn $PWD/.config/fish/fish_plugins ~/.config/fish/fish_plugins
ln -sfn $PWD/.config/fish/self_functions/fzf_gcloud_config.fish ~/.config/fish/functions/fzf_gcloud_config.fish

echo "link for git"
ln -sfn $PWD/.gitconfig ~/.gitconfig
ln -sfn $PWD/.gitignore ~/.gitignore

echo "link for tmux"
ln -sfn $PWD/.tmux.conf ~/.tmux.conf

echo "link for vim"
ln -sfn $PWD/.vimrc ~/.vimrc

# install anyenv
if [ $HOME/.anyenv ]; then
    git clone --depth 1 https://github.com/anyenv/anyenv ~/.anyenv
fi

# install ghq
if ! command -v ghq &> /dev/null ; then
    git clone --depth 1 https://github.com/x-motemen/ghq ~/ghq
    cd ~/ghq
    make install
    sudo rm -rf ghq
fi
