#!/bin/bash

IMAGE_NAME=qr-share
DOCKER_USER=zjor
TAG=1.1.1
CONTAINER_IMAGE=${DOCKER_USER}/${IMAGE_NAME}:${TAG}

docker build -t ${IMAGE_NAME} .
docker tag ${IMAGE_NAME} ${CONTAINER_IMAGE}

echo "Tagged image: ${CONTAINER_IMAGE}"