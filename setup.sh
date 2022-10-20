#update apt
sudo apt update
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install software-properties-common #gets add-apt-repository and other utils

#install some utils
sudo apt install git
sudo apt install curl

#setup get user
git config --global user.email "cliftonbartholomew@gmail.com"
git config --global user.name "cliftonbartholomew"

#install java and java source (source enables javadocs)
sudo apt install default-jre
sudo apt install default-jdk
sudo apt install openjdk-11-source

#install neovim
curl -L -O https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
sudo tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo mv nvim-linux64/ /bin/

#symlink all the dotfiles
mkdir ~/.config
mkdir ~/.config/nvim/
ln -s ~/.dotfiles/init.vim ~/.config/nvim/

#install vimplug and the plugins
sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"

#install telescope dependencies
sudo apt-get install ripgrep
sudo apt install fd-find

#install coc dependencies
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

#install java lsp in coc
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
echo '{"dependencies":{}}'> package.json
npm install coc-java --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

#install cc dependency for treesitter
sudo apt-get install build-essential

#install neovim package
sudo npm install -g neovim

#install maven
sudo apt install maven

#add users
useradd clifton
usermod -aG sudo clifton
