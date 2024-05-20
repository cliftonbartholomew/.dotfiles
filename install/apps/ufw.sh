echo ""
echo ""
echo "###############################################"
echo "####### Installing firewall ###################"
echo "###############################################"
echo ""
echo ""
yes | sudo apt install ufw
sudo ufw allow ssh #allow ssh from anywhere
sudo ufw allow 'Nginx Full'
sudo ufw enable
