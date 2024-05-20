echo ""
echo ""
echo "###############################################"
echo "####### Installing nginx ######################"
echo "###############################################"
echo ""
echo ""
echo ""

# stop and disable apache
sudo systemctl stop apache2
sudo systemctl disable apache2

# install nginx
yes | sudo apt install nginx
sudo systemctl start nginx
sudo systemctl enable nginx #start on boot

# certbot allows ssl certificate automation
yes | sudo apt install certbot python3-certbot-nginx

# remove default sites
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default
sudo rm /var/www/html/*

