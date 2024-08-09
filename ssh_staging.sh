# input username
read -p "Enter username: " username
ssh -i ~/.ssh/id_rsa $username@102.130.123.209
