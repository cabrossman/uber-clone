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

##################
# Install Docker on server - https://docs.docker.com/engine/install/debian/
##################
sudo dpkg --configure -a
sudo apt update
# remove conflicting packages
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

#Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

#Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

#Use the following command to set up the repository:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

#finally install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


###################
# Install NPM
###################
sudo apt update
sudo apt install nodejs
sudo apt install npm

### eventually when you get here
# ~/uber-clone/app/simulation
# npm install