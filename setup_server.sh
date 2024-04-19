#install firewall
sudo apt install ufw
sudo systemctl start ufw
sudo systemctl enable ufw
sudo ufw allow ssh #allow ssh from anywhere

#stop apache
sudo systemctl stop apache2
sudo systemctl disable apache2

#install nginx
sudo apt install nginx
sudo systemctl start nginx 
sudo systemctl enable nginx #start on boot
sudo ufw allow 'Nginx Full'

#install certbot
sudo apt install certbot python3-certbot-nginx

#install postgres
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql 
sudo systemctl enable postgresql #start on boot

#setup postgres user
echo "Enter the postgres username: "
read postgres_username
echo "Enter the postgres password: "
read postgres_password
sudo -u postgres psql -c "CREATE USER $postgres_username WITH PASSWORD '$postgres_password';"

#install daphne
sudo apt install python3-daphne

#remove nginx default site and html files
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default 
sudo rm /var/www/html/* 

#create venv folder
mkdir ~/.venv
