#!/bin/bash

docker login -u rmortale

export REPO=rmortale/docker-plugin-example
export COMMIT=$(git log -1 --format=%h)
export TAG=latest
docker build -f Dockerfile -t $REPO:$COMMIT .
docker tag $REPO:$COMMIT $REPO:$TAG
docker push $REPO
