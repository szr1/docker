#!/bin/sh

# check number of parameters
if [ $# -lt 2 ]; then
  echo 1>&2 "Not enough arguments."
  echo 1>&2 "Usage: builder.sh <github-repo> <docker-hub-repo>"
  exit 2
fi

# git clone https://github.com/$1.git
github=$1

# extract the last part as the sub-directory
repo=$(basename "$github")

# docker container tag as 2nd parameter
tag=$2

# clean old directory
if [ -d "$repo" ]; then
   echo "found directory $repo. Deleting ..."
   rm -Rf $repo;
fi

# fetch repo
echo "cloning repo $1"
git clone https://github.com/$1.git

# build docker
echo "building docker image ..."
docker build -t $tag $repo

# login to docker hub
echo "login to docker hub"
docker login --username $DOCKER_USER --password $DOCKER_PWD

# publish on docker hub
echo "pushing image ..."
docker push $tag

exit 0