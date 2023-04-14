#update apt
sudo apt update
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install software-properties-common #gets add-apt-repository and other utils

#install some utils
sudo apt install git
sudo apt install curl
sudo apt install ripgrep
sudo apt install zip
sudo apt install luarocks # lua package manager
sudo apt install cmake # dependency for luaformatter

#setup git user
git config --global user.email "cliftonbartholomew@gmail.com"
git config --global user.name "cliftonbartholomew"
git config --global --add url."git@github.com:".insteadOf "https://github.com/"

#install neovim
curl -L -O  https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
sudo tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo mv nvim-linux64/ /bin/

#symlink all the dotfiles
mkdir ~/.config
mkdir ~/.config/nvim/
ln -s ~/.dotfiles/init.vim ~/.config/nvim/
#rm ~/.bashrc
#ln -s ~/.dotfiles/.bashrc ~/.bashrc
#source ~/.bashrc

#download packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim-linux64


#install python additionals
sudo apt install python3
sudo apt install python3-pip
sudo apt install virtualenv
