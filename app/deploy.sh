#!/bin/bash

#build
cd frontend
npm run build
cd ..

#push to git
git add .
git commit -m "build"
git push

#deploy to prod
gcloud compute ssh $INSTANCE_NAME \
    --zone $ZONE \
    --project $PROJECT_ID \
    --command "bash \$HOME/uber-clone/app/prod_deploy.sh"
