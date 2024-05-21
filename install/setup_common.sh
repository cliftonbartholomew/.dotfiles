#!/bin/bash

echo ""
echo ""
echo "###############################################"
echo "####### Setting up common #####################"
echo "###############################################"
echo ""
echo ""
#update apt
yes | sudo apt update
yes | sudo apt-get update
yes | sudo apt-get upgrade

# configure git
git config --global user.email "cliftonbartholomew@gmail.com"
git config --global user.name "cliftonbartholomew"
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
git config --global pull.rebase true

# create symbolic links
mkdir ~/.config
ln -s ~/.dotfiles/nvim ~/.config
rm ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bash_profile

# install apps
source ~/.dotfiles/install/apps/utils.sh # must be first
source ~/.dotfiles/install/apps/neovim.sh
source ~/.dotfiles/install/apps/python.sh
source ~/.dotfiles/install/apps/nodejs.sh

# all distros require venv
mkdir ~/.venv
