#!/bin/bash

# create directory for init
mkdir -p $HOME/Works/bin
mkdir -p $HOME/Works/src
mkdir -p $HOME/Works/pkg

# install anyenv
echo "install anyenv"
# if [ ! $HOME/.anyenv ]; then
git clone --depth 1 https://github.com/anyenv/anyenv $HOME/.anyenv
# fi

export PATH="$HOME/.anyenv/bin:$PATH"
~/.anyenv/bin/anyenv init
anyenv install --init

# install pyenv goenv nodenv
anyenv install pyenv
anyenv install goenv
anyenv install nodenv
exec $SHELL -l
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
pyenv install 3.9.11
pyenv global 3.9.11
goenv install 1.16.15
goenv global 1.16.15
nodenv install 16.14.2
nodenv global 16.14.2

## NEED to fix to install go
# install ghq
echo "install ghq"
if ! command -v ghq &> /dev/null ; then
    git clone --depth 1 https://github.com/x-motemen/ghq $HOME/ghq
    cd $HOME/ghq
    make install
    cd $HOME
    sudo rm -rf $HOME/ghq
fi
mv go/1.16.15/bin/ghq $HOME/Works/bin/

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
pip install powerline-shell
pip install powerline-status

# create symbolic link
cd $HOME/Works/src/github.com/mzk622/dotfiles
echo "link for git"
ln -sfn $PWD/.gitconfig $HOME/.gitconfig
ln -sfn $PWD/.gitignore $HOME/.gitignore

echo "link for tmux"
ln -sfn $PWD/.tmux.conf $HOME/.tmux.conf

echo "link for vim"
ln -sfn $PWD/.vimrc $HOME/.vimrc

echo "link .alias"
ln -sfn $PWD/.alias $HOME/.alias

echo "link for bash"
ln -sfn $PWD/.bash_profile $HOME/.bash_profile

echo "link for fish"
mkdir -p $HOME/.config/fish/functions
ln -sfn $PWD/.config/fish/config.fish $HOME/.config/fish/config.fish
ln -sfn $PWD/.config/fish/fish_plugins $HOME/.config/fish/fish_plugins

files=(`ls -1 $PWD/.config/fish/self_functions`)
for file_name in ${files[@]}; do
    ln -sfn $PWD/.config/fish/self_functions/${file_name} $HOME/.config/fish/functions/${file_name}
done

echo "link for powerline-shell"
# ln -sfn $PWD/.config/powerline-shell/ $HOME/.config/powerline-shell
POWERLINE_PATH="`pip show powerline-status | grep Location | sed -e 's/Location: //g'`/powerline"
ln -sfn $PWD/powerline/shell.json $POWERLINE_PATH/config_files/themes/shell/shell.json

echo "link for vim"
ln -sfn $PWD/.vim $HOME/.vim

echo "install and update fisher"
if ! command -v fisher &> /dev/null ; then
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && fisher update
fi

echo "download fish completion"
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish
curl https://raw.githubusercontent.com/docker/compose/master/contrib/completion/fish/docker-compose.fish -o ~/.config/fish/completions/docker-compose.fish
