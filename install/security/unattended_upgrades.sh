#!/bin/bash

echo ""
echo ""
echo "###############################################"
echo "####### Installing unattended updates #########"
echo "###############################################"
echo ""
echo ""
sudo apt install unattended-upgrades apt-listchanges -y
sudo systemctl enable --now unattended-upgrades


