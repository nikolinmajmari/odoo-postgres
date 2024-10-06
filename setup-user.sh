#!/bin/bash

# Define the PostgreSQL user
POSTGRES_USER=${POSTGRES_USER:-postgres}

# Check if the PostgreSQL user exists; if not, create it
if id "$POSTGRES_USER" &>/dev/null; then
    echo "User $POSTGRES_USER already exists."
else
    echo "Creating user $POSTGRES_USER."
    useradd -m -g postgres "$POSTGRES_USER"
fi
