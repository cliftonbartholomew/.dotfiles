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

