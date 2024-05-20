#update apt
sudo apt update
sudo apt-get update
sudo apt-get upgrade

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
~/.dotfiles/install/apps/utils.sh # must be first
~/.dotfiles/install/apps/neovim.sh
~/.dotfiles/install/apps/python.sh
~/.dotfiles/install/apps/nodejs.sh

# all distros require venv
mkdir ~/.venv
