#update apt
sudo apt update
sudo apt-get update
sudo apt-get upgrade

#install some utils
echo ""
echo ""
echo "###############################################"
echo "####### Installing some basic utilities #######"
echo "###############################################"
echo ""
echo ""
sudo apt install curl # for downloading stuff
sudo apt install ripgrep # telescope dependency
sudo apt install fd-find # telescope dependency
sudo apt install zip # for zipping files
sudo apt install luarocks # lua package manager
sudo apt install cmake # dependency for luaformatter

#setup git config
echo ""
echo ""
echo "###############################################"
echo "####### Setting up git config #################"
echo "###############################################"
echo ""
echo ""
git config --global user.email "cliftonbartholomew@gmail.com"
git config --global user.name "cliftonbartholomew"
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
git config --global pull.rebase true

#install neovim
echo ""
echo ""
echo "###############################################"
echo "####### Installing neovim #####################"
echo "###############################################"
echo ""
echo ""
curl -L -O  https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
sudo tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo mv nvim-linux64/ /bin/

#symlink all the dotfiles
echo ""
echo ""
echo "###############################################"
echo "####### Symlinking dotfiles ###################"
echo "###############################################"
echo ""
echo ""
mkdir ~/.config
ln -s ~/.dotfiles/nvim ~/.config
rm ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bash_profile

#install python environmet
echo ""
echo ""
echo "###############################################"
echo "####### Installing python environment #########"
echo "###############################################"
echo ""
echo ""
sudo apt install python3
sudo apt install python3-pip
sudo apt install python3-venv

echo ""
echo ""
echo "###############################################"
echo "####### Installing nodejs #####################"
echo "###############################################"
echo ""
echo ""
#install nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
