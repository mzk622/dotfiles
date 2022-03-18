# dotfiles
dotfiles


## How to setup VM


-- move to dotfiles to Works/src/github.com/mzk622
``` bash
mkdir $HOME/Downloads $HOME/Works $HOME/Documents
mkdir -p $HOME/Works/src/github.com/mzk622
# please move to dotfiles
cd $HOME/Works/src/github.com/mzk622/dotfiles
sudo sh ./bin/apt.sh
sudo sh ./bin/install.sh
```

then please mv .ssh and change permission
``` bash
chmod 0600 $HOME/.ssh/*
```