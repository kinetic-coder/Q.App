#!/bin/bash

# stop the container with the name of q-database-container
docker stop q-database-container 2>/dev/null || true

# delete container called q-database-container
docker rm q-database-container 2>/dev/null || true

# remove image that has a name of q-database-image
docker rmi q-database-image 2>/dev/null || true
