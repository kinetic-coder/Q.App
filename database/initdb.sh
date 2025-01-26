#!/bin/sh

# Create the database
# psql -U $POSTGRES_USER -d postgres -c "CREATE DATABASE $POSTGRES_DB"

# Create tables and populate data (if needed)
# psql -U $POSTGRES_USER -d $POSTGRES_DB -f create_tables.sql

# Grant privileges (if needed)
# psql -U $POSTGRES_USER -d $POSTGRES_DB -c "GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_USER"