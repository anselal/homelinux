#!/bin/bash
# This scripts creates a mirror of a given Github repository
# It is possible to use this scripts with other services as well
# Before you run the script make sure that the target repository exists

# Usage: ./git-mirror.sh <full path to github repository>
# Example: ./git-mirror.sh https://github.com/anselal/homelinux

usage="Usage: $0 <full path to github repository>"
example="Example: $0 https://github.com/anselal/homelinux"


if [ $# -eq 0 ]
    then
        echo -e $usage
        echo -e
        echo -e $example
        exit 0
fi

GITHUB_PROJECTS="/home/tasos/Projects/github/anselal"
GITHUB_USER="anselal"
ARG=$1
REPO_USER=`echo $1 | cut -d'/' -f4`
REPO=`echo $1 | cut -d'/' -f5`

cd $GITHUB_PROJECTS && \
git clone --bare $1 && \
cd $REPO.git && \
# Git push via ssh
# Easy for scripting if you have set up ssh keys so no password is needed
git push --mirror git@github.com:$GITHUB_USER/$REPO
# Git push via https
#git push --mirror https://github.com/$GITHUB_USER/$REPO
