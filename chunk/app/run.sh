#!/bin/bash

# Database credential
APP_DB_NAME=goodaki
APP_DB_USER=goodaki
APP_DB_PASS=goodaki

# Test database connection (preventing premature ending of container)
false
while [[ $? -ne 0 ]]; do
    python3 <<EOF
# TODO
# testing mongodb until connection is established
exit(0)
EOF
    if [[ $? -ne 0 ]]; then
        echo "Database connection failed..."
        echo "Retrying..."
        sleep 5
        false
    fi
done

# Trigger initial setup for app
if [[ ! -f "/app.setup" ]]; then
    echo "Trigger initial setup"
    ./setup.sh
    touch /app.setup
fi

# Launch the application in development environment
if [[ $ENV_SETTING == "development" ]]; then
    echo "Launching application"
    exec python3 ./main.py
fi
