#!/bin/bash

#docker volume create --name maven-repo

docker run -it --rm --name my-maven-project \
    -v maven-repo:/root/.m2 \
    -v "$(pwd)":/usr/src/mymaven \
    -w /usr/src/mymaven maven:3.5.4-jdk-8 \
    mvn clean install

# - docker login -u $DOCKER_USER -p $DOCKER_PASS
#     - export REPO=rmortale/wildfly-mysql
#     - export TAG=`if [ "$TRAVIS_BRANCH" == "master" ]; then echo "latest"; else echo $TRAVIS_BRANCH ; fi`
#     - docker build -f Dockerfile -t $REPO:$COMMIT .
#     - docker tag $REPO:$COMMIT $REPO:$TAG
#     - docker tag $REPO:$COMMIT $REPO:travis-$TRAVIS_BUILD_NUMBER
#     - docker push $REPO
