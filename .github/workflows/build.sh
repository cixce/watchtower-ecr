#!/bin/bash

set -x
DOCKER_TOKEN=$1

DOCKER_IMAGE_NAME="watchtower-ecr"
DOCKER_IMAGE_TAG=latest

DOCKER_IMAGE_NAME=$(echo ghcr.io/${GITHUB_REPOSITORY}/${DOCKER_IMAGE_NAME} | tr '[:upper:]' '[:lower:]')
DOCKER_IMAGE_NAME_WITH_TAG=$(echo ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} | tr '[:upper:]' '[:lower:]')

docker login -u publisher -p ${DOCKER_TOKEN} ghcr.io
docker build -t $DOCKER_IMAGE_NAME_WITH_TAG -f Dockerfile  .
docker push $DOCKER_IMAGE_NAME_WITH_TAG
