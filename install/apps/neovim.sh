#!/bin/bash

echo ""
echo ""
echo "###############################################"
echo "####### Installing neovim #####################"
echo "###############################################"
echo ""
echo ""
curl -L -O  https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
sudo tar xzvf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64/ /bin/

