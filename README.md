# q.app
Quarter master application used to store information about kit in the stores.

## Overview ##
### Database ###
PostGreSQL

To start this up locally, make sure that Docker is installed first.

Once Docker has been installed, type the command *docker-compose up -d* which will:

1. Download the PostgreSQL image.
1. Start a new container with the PostgreSQL database engine running on port 5432.

Run the following to install python library to connect to PostgreSQL:

$ pip install -U pip
$ pip install psycopg2-binary
$ pip install flask

Next, run initiate_local_database.py located in the database folder. This will connect to PostgreSQL and setup a new database called Q.

