#!/bin/bash
COMMAND="screen -S deployment /home/christopher.brossman/uber-clone/app/prod_deploy.sh"
gcloud compute ssh "$INSTANCE_NAME" \
    --zone "us-west4-a" \
    --project "$PROJECT_ID" \
    --command "$COMMAND"