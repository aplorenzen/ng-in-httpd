#!/bin/bash

# TODO: Get the registry name (docker.neoprime.it)
# TODO: Get the namespace name in the registry (neo)
# TODO: Find a way to get the envionrment of the target build, and pass it to this script

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

# echo $BRANCH_NAME

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

IMAGE_NAME="$REGISTRY_URL/$REGISTRY_NAMESPACE/$PROJECT_NAME:$PACKAGE_VERSION-$BRANCH_NAME"

if [ -n "$ENVIRONMENT" ]; then
  IMAGE_NAME="$IMAGE_NAME-$ENVIRONMENT";
fi

printf "$IMAGE_NAME"
