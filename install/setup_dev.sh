#!/bin/bash

# install common
source ~/.dotfiles/install/setup_common.sh

echo ""
echo ""
echo "###############################################"
echo "####### Setting up dev environment ############"
echo "###############################################"
echo ""
echo ""

# install apps
source ~/.dotfiles/install/apps/postgres_dev.sh

# add ssh config
# echo "Adding SSH config"
touch ~/.ssh/config
echo "Host production" >> ~/.ssh/config
echo "  Hostname 102.130.115.69" >> ~/.ssh/config
echo "  User clifton" >> ~/.ssh/config
echo "  Port 22" >> ~/.ssh/config
echo "" >> ~/.ssh/config

echo "Host staging" >> ~/.ssh/config
echo "  Hostname 102.130.123.209" >> ~/.ssh/config
echo "  User clifton" >> ~/.ssh/config
echo "  Port 22" >> ~/.ssh/config
echo "" >> ~/.ssh/config

