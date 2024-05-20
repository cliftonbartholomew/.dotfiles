echo ""
echo ""
echo "###############################################"
echo "####### Installing postgres ###################"
echo "###############################################"
echo ""
echo ""
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql #start on boot

echo "Enter the postgres username: "
read postgres_username
echo "Enter the postgres password: "
read postgres_password
sudo -u postgres psql -c "CREATE USER $postgres_username WITH PASSWORD '$postgres_password';"

