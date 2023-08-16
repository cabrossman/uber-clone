source ../.env #get ENV VARs

gcloud compute ssh --zone "us-west4-a" "$INSTANCE_NAME" --project "$PROJECT_ID" #SSH
