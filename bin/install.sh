#!/bin/bash

# create directory for init
mkdir -p $HOME/Works/bin
mkdir -p $HOME/Works/src
mkdir -p $HOME/Works/pkg

# create symbolic link
echo "link .alias"
ln -sfn $PWD/.alias $HOME/.alias

echo "link for bash"
ln -sfn $PWD/.bash_profile $HOME/.bash_profile

echo "link for fish"
mkdir -p $HOME/.config/fish/functions
ln -sfn $PWD/.config/fish/config.fish $HOME/.config/fish/config.fish
ln -sfn $PWD/.config/fish/fish_plugins $HOME/.config/fish/fish_plugins
ln -sfn $PWD/.config/fish/self_functions/fzf_gcloud_config.fish $HOME/.config/fish/functions/fzf_gcloud_config.fish

echo "link for git"
ln -sfn $PWD/.gitconfig $HOME/.gitconfig
ln -sfn $PWD/.gitignore $HOME/.gitignore

echo "link for tmux"
ln -sfn $PWD/.tmux.conf $HOME/.tmux.conf

echo "link for vim"
ln -sfn $PWD/.vim $HOME/.vim
ln -sfn $PWD/.vimrc $HOME/.vimrc

# install anyenv
echo "install anyenv"
if [ ! $HOME/.anyenv ]; then
    git clone --depth 1 https://github.com/anyenv/anyenv $HOME/.anyenv
fi

# install ghq
echo "install ghq"
if ! command -v ghq &> /dev/null ; then
    git clone --depth 1 https://github.com/x-motemen/ghq $HOME/ghq
    cd $HOME/ghq
    make install
    cd $HOME
    sudo rm -rf $HOME/ghq
fi

# install powerline fonts
echo "install powerline fonts"
if test "$(uname)" = "Darwin" ; then
  # MacOS
  FONT_DIR="$HOME/Library/Fonts"
else
  # Linux
  FONT_DIR="$HOME/.local/share/fonts"
fi
if [ ! $FONT_DIR/Source\ Code\ Pro\ Medium\ for\ Powerline.otf ]; then
    git clone --depth=1 https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
fi

echo "install and update fisher"
if ! command -v fisher &> /dev/null ; then
    curl -sL https://git.io/fisher | fish && fisher install jorgebucaran/fisher && fisher update
fi
