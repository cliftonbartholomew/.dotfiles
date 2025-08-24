#!/bin/bash

echo ""
echo ""
echo "###############################################"
echo "####### Installing fail2ban ###################"
echo "###############################################"
echo ""
echo ""
sudo apt install -y fail2ban
sudo systemctl enable fail2ban

