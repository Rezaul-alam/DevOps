#!/bin/bash

# Define container name and image name
CONTAINER_NAME="stage-backend"
IMAGE_NAME="stage-backend"

# Stop and remove the running container
echo "Stopping and removing the container..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# Remove the existing Docker image
echo "Removing existing image..."
docker rmi $IMAGE_NAME

# Pull the latest changes from Git
echo "Pulling latest changes from Git..."
git branch
git checkout deployment-stage
git pull

# Build a new Docker image
echo "Building new Docker image..."
docker build -t $IMAGE_NAME .

# Run the container with the new image
echo "Running the container..."
docker run -d --restart always --name $CONTAINER_NAME -p 45001:82450 $IMAGE_NAME
echo "Script executed successfully!"
