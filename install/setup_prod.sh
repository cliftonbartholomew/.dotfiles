#!/bin/bash

# install common
source ~/.dotfiles/install/setup_common.sh

echo ""
echo ""
echo "###############################################"
echo "####### Setting up prod environment ###########"
echo "###############################################"
echo ""
echo ""
# install apps
source ~/.dotfiles/install/apps/nginx.sh
source ~/.dotfiles/install/apps/daphne.sh
source ~/.dotfiles/install/apps/postgres_prod.sh
source ~/.dotfiles/install/apps/ufw.sh # do this last (blocks ssh)
