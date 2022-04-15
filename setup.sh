#update apt
sudo apt update
sudo apt-get update
sudo apt-get upgrade

#setup get user
git config --global user.email "cliftonbartholomew@gmail.com"
git config --global user.name "cliftonbartholomew"

#install java and java source (source enables javadocs)
sudo apt install default-jre
sudo apt install default-jdk
sudo apt install openjdk-11-source

#install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

#symlink all the dotfiles
rm -rf ~/.bashrc
mkdir ~/.config
mkdir ~/.config/nvim/
ln -s ~/.dotfiles/init.vim ~/.config/nvim/
ln -s ~/.dotfiles/.bashrc ~/.bashrc
source ~/.bashrc

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

#install maven
sudo apt install maven

