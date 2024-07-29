#!/bin/bash

echo ""
echo ""
echo "###############################################"
echo "####### Installing Copilot#####################"
echo "###############################################"
echo ""
echo ""
yes | sudo apt install gh
sudo gh auth login
sudo gh extension install github/gh-copilot
