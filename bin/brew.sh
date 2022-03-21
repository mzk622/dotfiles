#!/usr/bin/env bash
xcode-select --install

# Install command-line tools using Homebrew.
echo "installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."
brew upgrade

# Install `wget` with IRI support.

# Install more recent versions of some macOS tools.
brew install openssh
brew install git

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install bat
brew install exa
brew install exiv2
brew install fd
brew install fish
brew install git-lfs
brew install hexyl
brew install imagemagick --with-webp
brew install p7zip
brew install pigz
brew install pv
brew install procs
brew install rename
brew install ripgrep
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff

# Remove outdated versions from the cellar.
echo "run brew cleanup..."
brew cleanup

# check brew Error and Warning
echo "ok. finally, run brew doctor..."
brew doctor
