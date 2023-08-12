#!/bin/bash

set -eu

# install homebrew (including Xcode Command Line Tools)
if [ -e /opt/homebrew/bin ] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zprofile
fi

# pull mitamae
arch=$(uname -m)

sudo mkdir -p /usr/local/bin

if [ $arch = "arm64" ] ; then
    sudo curl -fsSLo /usr/local/bin/mitamae https://github.com/itamae-kitchen/mitamae/releases/latest/download/mitamae-aarch64-darwin
else 
    sudo curl -fsSLo /usr/local/bin/mitamae https://github.com/itamae-kitchen/mitamae/releases/latest/download/mitamae-x86_64-darwin
fi

sudo chmod +x /usr/local/bin/mitamae

# install Rosetta2 when Apple Silicon Mac machine
if [ $arch = "arm64" ] ; then
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi

# execute mitamae
mitame_root_dir=/tmp/dotfiles
rm -rf $mitame_root_dir
git clone git@github.com:five510/dotfiles.git $mitame_root_dir
/usr/local/bin/mitamae local "$mitame_root_dir/roles/arm64.rb"