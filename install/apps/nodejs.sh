#!/bin/bash

echo ""
echo ""
echo "###############################################"
echo "####### Installing nodejs #####################"
echo "###############################################"
echo ""
echo ""
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
yes | sudo apt-get install -y nodejs
