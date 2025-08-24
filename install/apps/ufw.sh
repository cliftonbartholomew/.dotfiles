#!/bin/bash

echo ""
echo ""
echo "###############################################"
echo "####### Installing firewall ###################"
echo "###############################################"
echo ""
echo ""
yes | sudo apt install ufw

# allow ssh and web
sudo ufw allow ssh
sudo ufw allow 'Nginx Full'

# Set sane defaults
sudo ufw default deny incoming
sudo ufw default allow outgoing

# enable logging
sudo ufw logging on

# enable firewall
sudo ufw enable
