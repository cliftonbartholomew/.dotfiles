# install common
source ~/.dotfiles/install/setup_common.sh

# install apps
source ~/.dotfiles/install/apps/nginx.sh
source ~/.dotfiles/install/apps/daphne.sh
source ~/.dotfiles/install/apps/postgres_prod.sh
source ~/.dotfiles/install/apps/ufw.sh # do this last (blocks ssh)
