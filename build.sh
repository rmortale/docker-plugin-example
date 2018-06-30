#!/bin/bash

#docker volume create --name maven-repo

docker run -it --rm --name my-maven-project \
    -u 1000 \
    -v maven-repo:/root/.m2 \
    -v "$(pwd)":/usr/src/mymaven \
    -w /usr/src/mymaven maven:3.5.4-jdk-8 \
    mvn clean install

