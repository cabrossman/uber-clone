#!/bin/bash
gcloud compute ssh $INSTANCE_NAME \
    --zone $ZONE \
    --project $PROJECT_ID \
    --command "bash \$HOME/uber-clone/app/prod_deploy.sh"
