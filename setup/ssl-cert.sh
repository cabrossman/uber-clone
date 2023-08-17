#This day https://jurajmajerik.com/blog/using-https/
#https://snapcraft.io/docs/installing-snap-on-debian
# log into server first


sudo apt update
sudo apt install snapd
sudo snap install core

#test it works sudo snap install hello-world

#https://certbot.eff.org/instructions?ws=other&os=ubuntufocal
sudo apt-get remove certbot

sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

sudo certbot certonly --standalone
# above sets up but since I dont have DNS host I can continue

sudo certbot renew --dry-run

#Confirm that Certbot worked
#To confirm that your site is set up properly, visit https://yourwebsite.com/ in your browser and look for the lock icon in the URL bar.