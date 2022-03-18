# dotfiles
dotfiles


## How to setup VM


-- move to dotfiles to Works/src/github.com/mzk622
``` bash
mkdir ~/Downloads ~/Works ~/Documents
mkdir ~/Works/src/github.com/mzk622
cd ~/Works/src/github.com/mzk622
sudo sh ./bin/apt.sh
sudo sh ./bin/install.sh
```

then please mv .ssh and change permission
``` bash
chmod 0600 ~/.ssh/*
```