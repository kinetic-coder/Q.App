# Dockerfile
FROM mysql:latest

# Set environment variables for root password, database name, and user credentials
ENV $(cat .env | xargs)

# Copy the SQL file to the container
# COPY ./database/createdatabase.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port 
EXPOSE 3306

