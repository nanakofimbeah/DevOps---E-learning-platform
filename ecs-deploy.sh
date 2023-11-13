#!/bin/bash

# Usage: ./ecs-deploy.sh -c <cluster> -n <service> -i <new-image> -p <profile> -r <region>

# Default values
CLUSTER=""
SERVICE=""
NEW_IMAGE=""
PROFILE=""
REGION=""

# Parse arguments
while getopts ":c:n:i:p:r:" opt; do
  case $opt in
    c)
      CLUSTER="$OPTARG"
      ;;
    n)
      SERVICE="$OPTARG"
      ;;
    i)
      NEW_IMAGE="$OPTARG"
      ;;
    p)
      PROFILE="$OPTARG"
      ;;
    r)
      REGION="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Check if required parameters are provided
if [ -z "$CLUSTER" ] || [ -z "$SERVICE" ] || [ -z "$NEW_IMAGE" ] || [ -z "$PROFILE" ] || [ -z "$REGION" ]; then
  echo "Usage: ./ecs-deploy.sh -c <cluster> -n <service> -i <new-image> -p <profile> -r <region>"
  exit 1
fi

# Authenticate with AWS
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set default.region "$REGION"

# Retrieve the current task definition
CURRENT_TASK_DEF_ARN=$(aws ecs describe-services --cluster "$CLUSTER" --services "$SERVICE" --profile "$PROFILE" --region "$REGION" | jq -r .services[0].taskDefinition)

# Create a new task definition based on the current task definition
NEW_TASK_DEF=$(aws ecs describe-task-definition --task-definition "$CURRENT_TASK_DEF_ARN" --profile "$PROFILE" --region "$REGION" | jq --arg newImage "$NEW_IMAGE" '.taskDefinition | .containerDefinitions[0].image = $newImage | .volumes = [] | del(.taskDefinitionArn) | del(.revision)')

# Register the new task definition
NEW_TASK_DEF_ARN=$(aws ecs register-task-definition --cli-input-json "$NEW_TASK_DEF" --profile "$PROFILE" --region "$REGION" | jq -r .taskDefinition.taskDefinitionArn)

# Update the service to use the new task definition
aws ecs update-service --cluster "$CLUSTER" --service "$SERVICE" --task-definition "$NEW_TASK_DEF_ARN" --profile "$PROFILE" --region "$REGION"

# Wait for the service to stabilize (you may need to adjust this based on your service's configuration)
echo "Waiting for the service to stabilize..."
aws ecs wait services-stable --cluster "$CLUSTER" --services "$SERVICE" --profile "$PROFILE" --region "$REGION"

echo "Deployment to ECS service $SERVICE on cluster $CLUSTER completed."
