#!/bin/bash

COMMAND="screen -S deployment /home/christopher.brossman/uber-clone/app/prod_deploy.sh"
COMMAND="screen -dmS deployment && screen -S deployment -X stuff 'bash /home/christopher.brossman/uber-clone/app/prod_deploy.sh'"
COMMAND="screen -dmS deployment bash -c '/home/christopher.brossman/uber-clone/app/prod_deploy.sh && bash'"


gcloud compute ssh $INSTANCE_NAME \
    --zone $ZONE \
    --project $PROJECT_ID \
    --command $COMMAND
