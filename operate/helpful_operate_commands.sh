source .env

gcloud compute instances start $INSTANCE_NAME --zone=$ZONE #start
gcloud compute ssh $INSTANCE_NAME --zone $ZONE --project $PROJECT_ID #ssh
gcloud compute instances stop $INSTANCE_NAME --zone=$ZONE #stop

#build services
git pull #get latest branch
sudo docker build --tag app . #build docker filer
sudo docker compose down #stop containers
sudo docker compose up -d #start containers
sudo docker image prune -f #cleanup


### COPY FILES
#gcloud compute scp [LOCAL_FILE_PATH] [INSTANCE_NAME]:[REMOTE_FILE_PATH]
#gcloud compute scp --recurse $LOCAL_FILE_PATH/app/ $INSTANCE_NAME:~ --zone $ZONE

### START APP - Intermediate before docker ###
#sudo go run app/main.go &
#version below passes ENV VARS to sudo
#cd $HOME/uber-clone/app
#sudo go clean -cache
#sudo -E go run main.go &
# This actually starts 3 processes
#...
#2200302 pts/1    00:00:00 sudo
#2200303 pts/1    00:00:00 go
#2200330 pts/1    00:00:00 main
#...

#need to kill main
#ps aux | grep '[g]o'
#sudo pkill main

