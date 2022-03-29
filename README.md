# dotfiles
dotfiles


## How to setup VM


-- move to dotfiles to Works/src/github.com/mzk622
``` bash
mkdir $HOME/Downloads $HOME/Works $HOME/Documents
mkdir -p $HOME/Works/src/github.com/mzk622
```
# please move to dotfiles
```
scp -r $HOME/Works/src/github.com/mzk622/dotfiles/ mzk-instance:/home/mizuki_jarvisml_com/Works/src/github.com/mzk622/dotfiles
```
cd $HOME/Works/src/github.com/mzk622/dotfiles
sudo sh ./bin/apt.sh

# install asdf (avoid for Bad substitution)
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
mkdir -p $HOME/.config/fish/completions
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
. $HOME/.asdf/asdf.sh

sh ./bin/install.sh
```

then please mv .ssh and change permission
``` bash
chmod 0600 $HOME/.ssh/*
```