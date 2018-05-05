#!/bin/bash

# TODO: Update the script so that it takes care of all the failure scenarios, and informs and helps the user

# Grab the git branch name
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD \
  | sed $'s/\r//')

# Version key/value should be on its own line, cleaning the string
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[ ",]//g' \
  | sed $'s/\r//')

# Get the module name from the package.json, and clean the string
PROJECT_NAME=$(cat package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[ ",]//g' \
  | sed $'s/\r//')

# Get the registry url from the package.json if specified, and clean the string
REGISTRY_URL=$(cat package.json \
  | grep docker-registry \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[ \/",]//g' \
  | sed $'s/\r//')

# Get the docker namespace from the package.json, and clean the string
# TODO: Fail is not specified?
REGISTRY_NAMESPACE=$(cat package.json \
  | grep docker-namespace \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[ \/",]//g' \
  | sed $'s/\r//')

# Optinally, an environment can be passed to the script, that will be appended to the image name
if [ -n "$1" ]; then
  ENVIRONMENT=$1;
fi

if [ -n "$REGISTRY_URL" ]; then
  # Registry suppled, composing complete qualified image tag
  IMAGE_NAME="$REGISTRY_URL/$REGISTRY_NAMESPACE/$PROJECT_NAME:$PACKAGE_VERSION-$BRANCH_NAME"
else
  # Registry not supplied, assuming hub.docker.com
  IMAGE_NAME="${REGISTRY_NAMESPACE}/${PROJECT_NAME}:${PACKAGE_VERSION}-${BRANCH_NAME}"
fi

if [ -n "$ENVIRONMENT" ]; then
  IMAGE_NAME="$IMAGE_NAME-$ENVIRONMENT";
fi

printf $IMAGE_NAME
