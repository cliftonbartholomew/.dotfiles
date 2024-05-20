echo ""
echo ""
echo "###############################################"
echo "####### Installing postgres ###################"
echo "###############################################"
echo ""
echo ""
yes | sudo apt install postgresql postgresql-contrib
sudo service postgresql start

echo "Enter the postgres username: "
read postgres_username
echo "Enter the postgres password: "
read postgres_password
sudo -u postgres psql -c "CREATE USER $postgres_username WITH PASSWORD '$postgres_password';"

