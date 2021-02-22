# fro finding images 
az vm image list -p "Canonical" -all
az vm image list -p "Microsoft" -all

#key generation for ssh

ssh-keygen -t rsa -b 2048 -f authorize_key

#for connecting to ssh
chmod 400 ~/.ssh/authorize_key
ssh -i ~/.ssh/authorize_key username@public_IP_VM

#install the nginx on vm
sudo apt-get install nginx

...now hit the public ip in browser you will able to view nginx web page