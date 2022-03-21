#!/bin/bash

# create directory for init
mkdir -p $HOME/Works/bin
mkdir -p $HOME/Works/src
mkdir -p $HOME/Works/pkg

# install asdf
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
mkdir -p $HOME/.config/fish/completions
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
. $HOME/.asdf/asdf.sh

cat .tool-versions | while read line
do
  ARR=(${line/// })
  asdf plugin add ${ARR[0]}
  asdf install ${ARR[0]}
  asdf global ${ARR[0]} ${ARR[1]}
done
asdf reshim python

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
pip install powerline-status

echo "insatll source-han-code-jp"
curl -L https://github.com/adobe-fonts/source-han-code-jp/archive/refs/tags/2.012R.zip --output source-han-code-jp.zip
unzip -j source-han-code-jp.zip -d source-han-code-jp
mv source-han-code-jp/*.otf $FONT_DIR/

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

echo "link for powerline-status"
# ln -sfn $PWD/.config/powerline-shell/ $HOME/.config/powerline-shell
POWERLINE_PATH="`pip show powerline-status | grep Location | sed -e 's/Location: //g'`/powerline"
ln -sfn $PWD/powerline/shell.json $POWERLINE_PATH/config_files/themes/shell/shell.json
ln -sfn $PWD/powerline/config.json $POWERLINE_PATH/config_files/config.json

echo "link for vim"
ln -sfn $PWD/.vim $HOME/.vim

echo "install and update fisher"
if ! command -v fisher &> /dev/null ; then
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && fisher update
fi

echo "download fish completion"
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish
curl https://raw.githubusercontent.com/docker/compose/master/contrib/completion/fish/docker-compose.fish -o ~/.config/fish/completions/docker-compose.fish
