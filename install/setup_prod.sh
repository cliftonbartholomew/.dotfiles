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
source ~/.dotfiles/install/apps/nginx.sh # web server
source ~/.dotfiles/install/apps/daphne.sh # asgi server
source ~/.dotfiles/install/apps/postgres_prod.sh # production db

# hardening
source ~/.dotfiles/install/security/fail2ban.sh # do this first (prevents brute force attacks)
source ~/.dotfiles/install/security/unattended_upgrades.sh # automatic security updates
source ~/.dotfiles/install/security/ufw.sh # do this last (blocks ssh)
source ~/.dotfiles/install/security/harden_ssh.sh
