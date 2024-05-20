#update apt
sudo apt update
sudo apt-get update
sudo apt-get upgrade

#install some utils
sudo apt install curl # for downloading stuff
sudo apt install ripgrep # telescope dependency
sudo apt install fd-find # telescope dependency
sudo apt install zip # for zipping files
sudo apt install luarocks # lua package manager
sudo apt install cmake # dependency for luaformatter

#setup git config
git config --global user.email "cliftonbartholomew@gmail.com"
git config --global user.name "cliftonbartholomew"
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
git config --global pull.rebase true

#install neovim
curl -L -O  https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
sudo tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo mv nvim-linux64/ /bin/

#symlink all the dotfiles
mkdir ~/.config
ln -s ~/.dotfiles/nvim ~/.config
rm ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bash_profile

#install python additionals
sudo apt install python3
sudo apt install python3-pip
sudo apt install python3-venv

#download packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
