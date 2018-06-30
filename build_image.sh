#!/bin/bash

bsDockerFile=target/Dockerrun.aws.json
template=Dockerrun.aws.json.template
replaceTag=cnttag

docker login -u rmortale

export REPO=rmortale/docker-plugin-example
export COMMIT=$(git log -1 --format=%h)
export TAG=latest
docker build -f Dockerfile -t $REPO:$COMMIT .
docker tag $REPO:$COMMIT $REPO:$TAG
docker push $REPO

sed -e "s/$replaceTag/$REPO:$COMMIT/ig" $template > $bsDockerFile
zip generated/dockerrun-$COMMIT.zip $bsDockerFile
