##################
# INSTALL GO
##################

#remove old version and install this version
source ../.env
gcloud compute ssh --zone "us-west4-a" "$INSTANCE_NAME" --project "$PROJECT_ID" #SSH


cd /usr/local/
sudo wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
#export PATH=$PATH:/usr/local/go/bin


### ADDITIONAL MANUAL STEP ONE - add to path
#GCP has some functionality to automatically create the path variable
#I've modified the config in /etc/profile -> sudo nano profile
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


