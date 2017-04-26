#!/bin/bash

# Initiate user and database
APP_DB_NAME=goodaki
APP_DB_USER=goodaki
APP_DB_PASS=goodaki

echo "!!!!!!!!!!!!!!!!!!!!!!!"

psql --username "$POSTGRES_USER" <<EOF
-- Create the database user:
CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';

-- Create the database:
CREATE DATABASE $APP_DB_NAME WITH OWNER=$APP_DB_USER
                                    LC_COLLATE='en_US.utf8'
                                    LC_CTYPE='en_US.utf8'
                                    ENCODING='UTF8'
                                    TEMPLATE=template0;
EOF

# Import all SQL files
for file in /sql/*.sql; do
    PGPASSWORD=$APP_DB_PASS psql --username $APP_DB_USER -f "$file"
    echo "$file"
done
