#!/bin/bash

# Extract name and version from package.json
PROJECT_NAME=$(jq -r '.name' package.json)
PROJECT_VERSION=$(jq -r '.version' package.json)

# Build the Docker image with the extracted values
docker build --build-arg PROJECT_NAME=${PROJECT_NAME} -t ${PROJECT_NAME}:${PROJECT_VERSION} -f nginx.dockerfile .
