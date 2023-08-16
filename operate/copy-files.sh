source ../.env
#gcloud compute scp [LOCAL_FILE_PATH] [INSTANCE_NAME]:[REMOTE_FILE_PATH]
gcloud compute scp --recurse $LOCAL_FILE_PATH $INSTANCE_NAME:~