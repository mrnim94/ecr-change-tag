#!/usr/bin/env bash

# Check for the correct number of arguments
if (( $# < 3 )); then
  echo "Wrong number of arguments. Usage: $0 ECR_REPO_NAME TAG_TO_FIND TAG_TO_ADD [AWS_PROFILE] [AWS_REGION]"
  exit 1
fi

# Parse the arguments
repo_name=$1
existing_tag=$2
new_tag=$3
profile=$4
region=$5

# If a profile is provided, format it correctly
[[ ! -z "$profile" ]] && profile="--profile ${profile}"
[[ ! -z "$region" ]] && region="--region ${region}"

# Fetch the existing image manifest
manifest=$(aws ecr batch-get-image ${profile} ${region} \
                    --repository-name $repo_name \
                    --image-ids imageTag=$existing_tag \
                    --query 'images[].imageManifest' \
                    --output text)

# Add the new tag to the image
aws ecr put-image ${profile} ${region} \
                  --repository-name $repo_name \
                  --image-tag $new_tag \
                  --image-manifest "${manifest}"