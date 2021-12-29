#!/usr/bin/env bash
echo "link .alias"
ln -sfn $PWD/.alias ~/.alias

echo "link for bash"
ln -sfn $PWD/.bash_profile ~/.bash_profile

echo "link for fish"
mkdir -p ~/.config/fish/functions
ln -sfn $PWD/.config/fish/config.fish ~/.config/fish/config.fish
ln -sfn $PWD/.config/fish/fish_plugins ~/.config/fish/fish_plugins
ln -sfn $PWD/.config/fish/self_functions/fzf_gcloud.fish ~/.config/fish/functions/__fzf_gcloud.fish

echo "link for git"
ln -sfn $PWD/.gitconfig ~/.gitconfig
ln -sfn $PWD/.gitignore ~/.gitignore

echo "link for tmux"
ln -sfn $PWD/.tmux.conf ~/.tmux.conf

echo "link for vim"
ln -sfn $PWD/.vimrc ~/.vimrc

