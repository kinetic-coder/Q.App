# Dockerfile
# Use the official PostgreSQL image from the Docker Hub
FROM mysql:latest

LABEL name="q-database-image"

# Set environment variables
ENV MYSQL_DB=QApp

# Copy the init script

COPY initdb.sh /docker-entrypoint-initdb.d/
COPY create-database.sql /docker-entrypoint-initdb.d/
COPY create-tables.sql /docker-entrypoint-initdb.d/
COPY create-procedures.sql /docker-entrypoint-initdb.d/
COPY setup-test-data.sql /docker-entrypoint-initdb.d/

# Set the entrypoint to the custom init script
# ENTRYPOINT ["sh", "/docker-entrypoint-initdb.d/initdb.sh"]