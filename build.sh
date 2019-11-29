#!/bin/bash

# Get date
date=$(date +"%Y-%m-%d")

# Get a list of projects to build
dockerfiles="dockerfiles"

# Log into docker
docker login -u $D_USERNAME -p $D_PASSWORD

# Build projects
for p in $(ls $dockerfiles); do

    echo ""
    echo "Building $p..."
    echo ""

    # Build image
    docker build -t $D_USERNAME/$p:$date -f "$dockerfiles/$p/Dockerfile" "$dockerfiles/$p"

    # Create 'latest' tag
    docker tag $D_USERNAME/$p:$date $D_USERNAME/$p:latest

    # Push images to docker
    docker push $D_USERNAME/$p:$date
    docker push $D_USERNAME/$p:latest

done

docker logout
