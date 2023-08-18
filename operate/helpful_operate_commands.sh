source .env

### SSH
gcloud compute ssh $INSTANCE_NAME --zone $ZONE --project $PROJECT_ID

### COPY FILES
#gcloud compute scp [LOCAL_FILE_PATH] [INSTANCE_NAME]:[REMOTE_FILE_PATH]
gcloud compute scp --recurse $LOCAL_FILE_PATH/app/ $INSTANCE_NAME:~ --zone $ZONE


#GET Data
curl http://$PUBLIC_IP:80/data


### START & STOP SERVER
#start
gcloud compute instances start $INSTANCE_NAME --zone=$ZONE
#stop
gcloud compute instances stop $INSTANCE_NAME --zone=$ZONE


### START APP
#sudo go run app/main.go &
#version below passes ENV VARS to sudo
cd $HOME/uber-clone/app
sudo -E go run main.go &


# This actually starts 3 processes
#...
#2200302 pts/1    00:00:00 sudo
#2200303 pts/1    00:00:00 go
#2200330 pts/1    00:00:00 main
#...

#need to kill main
sudo kill 2200330