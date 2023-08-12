#!/bin/bash

# install homebrew (including Xcode Command Line Tools)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# pull mitamae
arch=$(uname -m)

sudo mkdir /usr/local/bin

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

/usr/local/bin/mitamae local -y nodes/arm64.yml entry.rb