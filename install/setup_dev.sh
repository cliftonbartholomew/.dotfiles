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
