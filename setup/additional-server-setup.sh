##################
# INSTALL GO
##################

#remove old version and install this version
source .env


cd /usr/local/
sudo wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
#export PATH=$PATH:/usr/local/go/bin


### ADDITIONAL MANUAL STEP ONE - add to path
#GCP has some functionality to automatically create the path variable
#I've modified the config in /etc/profile -> sudo nano /etc/profile
# to add this line PATH=$PATH:/usr/local/go/bin before the export PATH


##################
# Add secure paths for opening port 80 - possibly optional
##################
#go here -> $ sudo visudo
#add this to end of "Defaults secure_path" -> :/usr/local/go/bin it allows 
#sudo command has its own $PATH, which is defined in the sudo config. 
#Not positive if this step is necessary

##################
# Add ENV Var to server
##################
#sudo nano /etc/environment
#...
#export SERVER_ENV="PROD"


##################
# Install Git
##################
sudo apt install git-all
##NOTE!! -- after install git it also installs apache which starts running a webserver
## which conflicts with the go process. Below are some commands to stop Apache and prevent it from starting
sudo systemctl stop apache2
sudo systemctl disable apache2
