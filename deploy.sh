#!/bin/bash

echo "Stopping existing container if it exists..."

docker stop devops-build-container 2>/dev/null
docker rm devops-build-container 2>/dev/null

echo "Starting new container..."

docker run -d \
  --name devops-build-container \
  -p 80:80 \
  devops-build:v1

echo "Deployment completed successfully."
