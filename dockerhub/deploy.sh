#!/bin/bash
set -e

if [[ -n $1 ]]; then
    TAG_VERSION=$1
else
    echo "No tag version specified"
    exit 1
fi

if [[ -n $2 ]]; then
    DISTRO=$2
else
    echo "No distribution specified"
    exit 1
fi

DOCKERHUB_REPO=idealista/zookeeper:${TAG_VERSION}

cd dockerhub
docker build . -f $DISTRO/Dockerfile -t ${DOCKERHUB_REPO}-test
pipenv run ansible-playbook -i inventory provision_docker_image.yml

# echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

# docker commit docker-test-openjdk ${DOCKERHUB_REPO}-openjdk
# docker push ${DOCKERHUB_REPO}-openjdk

# docker commit docker-test-oraclejdk ${DOCKERHUB_REPO}-oraclejdk
# docker push ${DOCKERHUB_REPO}-oraclejdk

# docker logout
