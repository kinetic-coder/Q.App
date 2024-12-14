# Stop and remove any existing container with the name my-postgres-container
docker stop q-database-container 2>/dev/null || true
docker rm q-database-container 2>/dev/null || true

# Run a new container with PostgreSQL user ID and password
docker run -d --name q-database-container -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=ChangeMeAtDeploymentTime \
    q-database-image