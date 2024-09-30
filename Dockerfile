# Dockerfile
FROM mysql:latest

# Set environment variables for root password, database name, and user credentials
ENV MYSQL_ROOT_PASSWORD=your_root_password
ENV MYSQL_DATABASE=your_database_name
ENV MYSQL_USER=your_database_user
ENV MYSQL_PASSWORD=your_database_password

# Copy the SQL file to the container
COPY ./database/createdatabase.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port 
EXPOSE 3306

