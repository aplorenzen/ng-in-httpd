#!/bin/bash

# TODO: Update the script so that it takes care of all the failure scenarios, and informs and helps the user

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

# Version key/value should be on his own line
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[ ",]//g')

# echo $PACKAGE_VERSION

PROJECT_NAME=$(cat package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[ ",]//g')

# echo $PROJECT_NAME

REGISTRY_URL=$(cat package.json \
  | grep docker-registry \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[ \/",]//g')

REGISTRY_NAMESPACE=$(cat package.json \
  | grep docker-namespace \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[ \/",]//g')

if [ -n "$1" ]; then
  ENVIRONMENT=$1;
fi

if [ -n "$REGISTRY_URL" ]; then
  # Registry suppled, composing complete qualified image tag
  IMAGE_NAME="$REGISTRY_URL/$REGISTRY_NAMESPACE/$PROJECT_NAME:$PACKAGE_VERSION-$BRANCH_NAME"
else
  # Registry not supplied, assuming hub.docker.com
  IMAGE_NAME="$REGISTRY_NAMESPACE/$PROJECT_NAME:$PACKAGE_VERSION-$BRANCH_NAME"
fi

if [ -n "$ENVIRONMENT" ]; then
  IMAGE_NAME="$IMAGE_NAME-$ENVIRONMENT";
fi

printf "$IMAGE_NAME"
